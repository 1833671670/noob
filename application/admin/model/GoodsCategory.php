<?php
namespace app\admin\model;

use think\Model;
use think\Db;
class GoodsCategory extends Model
{
    // 确定链接表名
    protected $table = 'tp_goods_category';
    /**
     * 根据搜索条件获取角色列表信息
     * @param $where
     * @param $offset
     * @param $limit
     */
    function goods_category_top($pid, $str = '') {
        $father = Db::name('goods_category')->where('id',$pid)->field('id, pid')->find();
        if($father) {
            $str = $father['id'].'-'.$str;
            $str = $this->goods_category_top($father['pid'], $str);
        }
        return $str;
    }
    

    function goods_category_loop($id = 0, $level = 0, $falist = array())
    {
        $arr = Db::name('goods_category')->where('pid',$id)->order('sortnum desc, id asc')->select();
        if($arr) {
            foreach($arr as $val) {
                $val['level'] = $level;
                $falist[] = $val;
                $level++;
                $falist = $this->goods_category_loop($val['id'], $level, $falist);
                $level--;
            }
        }
        return $falist;
    }
    
    function goods_category_tree() {
        $arr = $this->goods_category_loop();
        $str = "";
        foreach($arr as $key => $val) {
            $nextNum = Db::name('goods_category')->where('pid',$val['id'])->count();
            $file = $nextNum > 0 ? 'folder' : 'file';
            $recomment_ty = ['0'=>'否','1'=>'是'];
            $recomment_cs = ['0'=>'','1'=>' label-primary'];
            
            if($val['pid'] == 0){
                $str .= "<tr class='text-c' data-tt-id='".$val['id']."' rel='".$val['id']."'><td class='text-l'><span class='$file'>".$val['name']."</span></td><td>".$val['id']."</td><td>".$val['code']."</td>";
                if($val['path']){
                    $str .= "<td><a class='fancybox' href=".$val['path']." ><img src=".$val['path']." class='img' /></a></td>";            
                }else{
                    $str .= "<td>/</td>";
                }
                $str .= "<td><span class='label".$recomment_cs[$val['is_recommend']]."' style='padding:3px 8px'>".$recomment_ty[$val['is_recommend']]."</span></td><td>".$val['sortnum']."</td><td>".date('Y-m-d H:i',$val['addtime'])."</td></tr>";
            }else {
                $code = trim($val['code'], '-');
                $father_code = substr($code, 0, strrpos($code, '-'));
                $str .= "<tr class='text-c' data-tt-id='".$code."' data-tt-parent-id='".$father_code."' rel='".$val['id']."'><td class='text-l'><span class='$file'>".$val['name']."</span></td><td>".$val['id']."</td><td>".$val['code']."</td>";
                if($val['path']){
                    $str .= "<td><a class='fancybox' href=".$val['path']." ><img src=".$val['path']." class='img' /></a></td>";
                }else{
                    $str .= "<td>/</td>";
                }
                $str .= "<td><span class='label".$recomment_cs[$val['is_recommend']]."' style='padding:3px 8px'>".$recomment_ty[$val['is_recommend']]."</span></td><td>".$val['sortnum']."</td><td>".date('Y-m-d H:i',$val['addtime'])."</td></tr>";
            }
        }
        return $str;
    }
    
    
    function goods_category_across($new_code, $id) {
        $match = '-'.$id.'-';
        $list = Db::name('goods_category')->where('id!='.$id." and code like '%".$match."%'")->select();
        foreach($list as $val) {
            $arr = explode($match, $val['code']);
            $tarr['code'] = $new_code.$arr[1];
            //$this->upd('art_type', $tarr, 'id='.$val['id']);
            Db::name('goods_category')->where('id',$val['id'])->update($tarr);
        }
    }
}