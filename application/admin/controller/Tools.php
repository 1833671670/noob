<?php
namespace app\admin\controller;
use think\Controller;
use think\Db;
use app\admin\validate\FreightTemplate as FreightTemplateValidate;
use app\admin\model\FreightTemplate;
class Tools extends Base{
    public function initialize() {
        parent::initialize();
    }
    
    //运费模板
    function freight(){
        $f_ty = [0=>'重量',1=>'件数',2=>'体积'];
        $info = Db::name('freight_template')->order("template_id desc")->select();
        //展示该模块的方法
        foreach($info as $k => $v){
            $info[$k]['config'] = Db::name('freight_config')->where('template_id',$v['template_id'])->select();
            foreach ($info[$k]['config'] as $key => $val){
                $info[$k]['config'][$key]['region'] = Db::name('freight_region')->where('template_id',$v['template_id'])->where('config_id',$val['config_id'])->column('region_id');
                $info[$k]['config'][$key]['name'] = '';
                foreach($info[$k]['config'][$key]['region'] as $kk => $vv){
                    $info[$k]['config'][$key]['name'] .= $this->getRegionName($vv).',';
                }
            }
            $info[$k]['ty'] = $f_ty[$v['type']];
        }
        $this->assign('info',$info);
        return $this->fetch();
    }
    
    //添加运费模板
    function freight_template_add(){
        $area = Db::name('region')->where('region_parent_id',1)->column('region_name','region_id');
        $this->assign('area',$area);
        
        $id = intval(input('param.id'));
        if($id > 0){
            $info = Db::name('freight_template')->where('template_id',$id)->find();
            //展示该模块的方法
            $info['config'] = Db::name('freight_config')->where('template_id',$id)->select();
            $area_ids = '';
            foreach ($info['config'] as $k => $v){
                $info['config'][$k]['region'] = Db::name('freight_region')->where('template_id',$id)->where('config_id',$v['config_id'])->column('region_id');
                $info['config'][$k]['name'] = '';
                $info['config'][$k]['area_ids'] = '';
                foreach($info['config'][$k]['region'] as $key => $val){
                    $info['config'][$k]['name'] .= $this->getRegionName($val).',';
                    $info['config'][$k]['area_ids'] .= $val.',';
                    $area_ids .= $val.',';
                }
            }
            $this->assign('info',$info);
            $this->assign('area_ids',$area_ids);
            //p($area_ids);
        }
        return $this->fetch();
    }
    
    //保存运费模板
    public function freight_template_ok(){
        $template_id = input('template_id/d');
        $template_name = input('template_name/s');
        $type = input('type/d');
        $price_type = input('price_type/d');
        //$config_list = input('config_list/a', []);
        $data = input('post.');
        
        $area_ids = input('post.area_ids/a');
        $config_id = input('post.config_id/a');
        $first_unit = input('post.first_unit/a');
        $first_money = input('post.first_money/a');
        $continue_unit = input('post.continue_unit/a');
        $continue_money = input('post.continue_money/a');
        $config_list = [];
        foreach($area_ids as $k => $v){
            $config_list[$k]['area_ids'] = trim($v,',');
            $config_list[$k]['config_id'] = $config_id[$k];
            $config_list[$k]['first_unit'] = $first_unit[$k];
            $config_list[$k]['first_money'] = $first_money[$k];
            $config_list[$k]['continue_unit'] = $continue_unit[$k];
            $config_list[$k]['continue_money'] = $continue_money[$k];
        }
        
        $arr['template_id'] = $template_id;
        $arr['template_name'] = $template_name;
        $arr['type'] = $type;
        $arr['config_list'] = $config_list;
        
        $freightTemplateValidate = new FreightTemplateValidate;
        if (!$freightTemplateValidate->batch()->check($arr)) {
            //p($freightTemplateValidate->getError());
            $err_msg = $freightTemplateValidate->getError();
            $err = array_shift($err_msg);
            $this->error($err);
        }
        if (empty($template_id)) {
            //添加模板
            $freightTemplate = new FreightTemplate();
        } else {
            //更新模板
            $freightTemplate = FreightTemplate::get(['template_id' => $template_id]);
        }
        $ft_arr['template_name'] = $template_name;
        $ft_arr['type'] = $type;
        $ft_arr['price_type'] = $price_type;
        
        $freightTemplate->save($ft_arr);
        
        if (empty($template_id)) {
            //添加模板
            $template_id = $freightTemplate->template_id;
        }
        
        $config_list_count = count($config_list);
        $config_id_arr = Db::name('freight_config')->where(['template_id' => $template_id])->column('config_id');
        $update_config_id_arr = [];
        if ($config_list_count > 0) {
            for ($i = 0; $i < $config_list_count; $i++) {
                $freight_config_data = [
                    'first_unit' => $config_list[$i]['first_unit'],
                    'first_money' => $config_list[$i]['first_money'],
                    'continue_unit' => $config_list[$i]['continue_unit'],
                    'continue_money' => $config_list[$i]['continue_money'],
                    'template_id' => $template_id,
                ];
                if (empty($config_list[$i]['config_id'])) {
                    //新增配送区域
                    $config_id = Db::name('freight_config')->insertGetId($freight_config_data);
                    if(!empty($config_list[$i]['area_ids'])){
                        $area_id_arr = explode(',', $config_list[$i]['area_ids']);
                        if ($config_id !== false) {
                            foreach ($area_id_arr as $areaKey => $areaVal) {
                                Db::name('freight_region')->insert(['template_id'=>$freightTemplate['template_id'],'config_id' => $config_id, 'region_id' => $areaVal]);
                            }
                        }
                    }
                } else {
                    //更新配送区域
                    array_push($update_config_id_arr, $config_list[$i]['config_id']);
                    $config_result = Db::name('freight_config')->where(['config_id' => $config_list[$i]['config_id']])->update($freight_config_data);
                    if ($config_result !== false) {
                        Db::name('freight_region')->where(['config_id' => $config_list[$i]['config_id']])->delete();
                        if(!empty($config_list[$i]['area_ids'])){
                            $area_id_arr = explode(',', $config_list[$i]['area_ids']);
                            foreach ($area_id_arr as $areaKey => $areaVal) {
                                Db::name('freight_region')->insert(['template_id'=>$freightTemplate['template_id'],'config_id' => $config_list[$i]['config_id'], 'region_id' => $areaVal]);
                            }
                        }
                    }
                }
            }
        }
        $delete_config_id_arr = array_diff($config_id_arr, $update_config_id_arr);
        if (count($delete_config_id_arr) > 0) {
            $s1= Db::name('freight_region')->where('config_id','IN',$delete_config_id_arr)->delete();
            $s2 = Db::name('freight_config')->where('config_id','IN', $delete_config_id_arr)->delete();
        }
        $this->checkFreightTemplate($template_id);
        $this->success('操作成功');
    }
    
    //检查该模板，若下面没有配送区域，则删除该模板
    private function checkFreightTemplate($template_id){
        $freight_config = Db::name('freight_config')->where(['template_id' => $template_id])->find();
        if (empty($freight_config)) {
            Db::name('freight_template')->where('template_id', $template_id)->delete();
        }
    }
    
    //删除模板
    function freight_template_del(){
        $template_id = intval(input('param.id'));
        $flag = input('flag');
        if (empty($template_id)) {
            $this->error('参数错误');
        }
        if ($flag != 'confirm') {
            $goods_count = Db::name('goods')->where(['template_id' => $template_id])->count();
            if ($goods_count > 0) {
                $this->warn('已有' . $goods_count . '种商品使用该运费模板，确定删除该模板吗？继续删除将把使用该运费模板的商品设置成包邮。');
            }
        }
        Db::name('goods')->where(['template_id' => $template_id])->update(['template_id' => 0, 'is_free_shipping' => 1]);
        Db::name('freight_region')->where(['template_id' => $template_id])->delete();
        Db::name('freight_config')->where(['template_id' => $template_id])->delete();
        $delete = Db::name('freight_template')->where(['template_id' => $template_id])->delete();
        if ($delete !== false) {
            $this->success('删除成功');
        } else {
            $this->error('删除失败');
        }
    }
    
    //根据id返回区域
    function getRegionName($region_id){
        $name = Db::name('region')->where('region_id',$region_id)->value('region_name');
        return $name;
    }
    
    //地区列表
    function region(){
        $parent_id = intval(input('param.parent_id'));
        $info = Db::name('region')->where('pid',$parent_id)->select();
        $p_info = Db::name('region')->where('id',$parent_id)->find();
        $this->assign('p_info',$p_info);
        $this->assign('info',$info);
        $this->assign('parent_id',$parent_id);
        //p($p_info);
        return $this->fetch();
    }
    
    //添加地区
    function region_add(){
        $id = intval(input('param.id'));
        $parent_id = intval(input('param.parent_id'));
        if($id>0){
            $info = Db::name('region')->where('id',$id)->find();
            $this->assign("info",$info);
        }
        if($parent_id>0){
            $p_info = Db::name('region')->where('id',$parent_id)->find();
            $this->assign("p_info",$p_info);
        }
        
        return $this->fetch();
    }
    
    //添加地区操作
    function region_ok(){
        if(request()->isAjax()){
            $id = intval(input('post.id'));
            $arr['region_name'] = input('post.region_name');
            
            $arr['pid'] = intval(input('post.pid'));
            $p_level = Db::name('region')->where('id',$arr['pid'])->value('level');
            $arr['level'] = $p_level+1;
            if($id>0) {
                $arr['edittime'] = time();
                $result = Db::name('region')->where('id',$id)->update($arr);
                $log = "修改地区【".$id."】";
            }else {
                $arr['addtime'] = time();
                $result = Db::name('region')->insertGetId($arr);
                $log = "添加地区【".$result."】";
            }
    
            if($result !== false){
                $this->SaveAdminLog($log);
                $this->success('操作成功');
            }else {
                $this->error('操作失败');
            }
        }
    }
    
    //删除地区（及其下级）
    function region_del(){
        if(request()->isAjax()){
            $ids = input('get.ids');
            $conditions = "id in ($ids)";
            $result = Db::name('region')->where($conditions)->delete();
            if($result !== false){
                $this->SaveAdminLog("删除地区【".$ids."】");
                $this->success('删除成功');
            }else{
                $this->error('操作失败');
            }
        }
    }
}