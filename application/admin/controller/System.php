<?php
namespace app\admin\controller;
use think\Db;
use app\admin\model\Module;
use app\admin\model\Admin;
use app\admin\validate\Admin as AdminValidate;
use py\Random;
use py\Myjson;
class System extends Base{
    
    public function initialize() {
        parent::initialize();
    }
    
    //管理员列表
    function admin(){
        $info = Db::name('admin')->alias('a')->field('a.admin_id,a.admin_name,a.mobile,a.email,a.status,a.addtime,a.lastlogintime,a.lastloginip,ar.name')->leftjoin('admin_role ar','a.role_id=ar.id')->select();
        $this->assign('info',$info);
        return $this->fetch();
    }
    
    
    //添加管理员
    function admin_add(){
        $id = intval(input('param.id'));
        if($id > 0){
            $info = Db::name("admin")->where("admin_id",$id)->field('admin_id,role_id,mobile,email,status,admin_name')->find();
            $this->assign("info",$info);
        }
        $role = Db::name("admin_role")->select();
        $this->assign("role",$role);
    
        return $this->fetch();
    }
    
    
    //添加管理员操作
    function admin_ok()
    {
        if(request()->isAjax()) {
            $admin_id = intval(input('post.id'));
            $param = input('post.');

            $param['status'] = intval(input('post.status'));
    
            $validate = new AdminValidate;
            
            if($admin_id>0 && !empty($param)){
                //修改
                if(empty($param['password'])){  //密码为空则不修改
                    unset($param['password']);
                    unset($param['salt']);
                }else{  
                    $param['salt'] = Random::alnum();  //不为空则同时修改
                    $param['password'] = doEncrypt($param['password'],$param['salt']);
                }
                
                if (!$validate->scene('edit')->check($param)) {
                    $this->error($validate->getError());
                }else{
                    $result = Db::name('admin')->where('admin_id',$admin_id)->update($param);
                }
                $log = '编辑管理员【'.$admin_id.'】';
            }else{
                //添加
                $param['salt'] = Random::alnum();
                $param['password'] = doEncrypt($param['password'],$param['salt']);
                $param['addtime'] = time();
                
                if (!$validate->scene('add')->check($param)) {
                    $this->error($validate->getError());
                }else{
                    $result = Db::name('admin')->insertGetId($param);
                }
                $log = '添加管理员【'.$result.'】';
            }
            if ($result !== false){
                $this->SaveAdminLog($log);
                $this->success($log.'操作成功');
            }else{
                $this->error('操作失败');
            }
        }
    }
    
    //删除管理员操作
    function admin_del(){
        if(request()->isAjax()) {
            $ids = input('param.ids');
            $conditions = "admin_id in ($ids) and admin_id != 1";
            $result = Db::name("admin")->where($conditions)->delete();
            
            if($result !== false){
                $this->SaveAdminLog("删除管理员【".$ids."】");
                $this->success('操作成功');
            }else{
                $this->error('操作失败');
            }
        }
    }
    
    //审核屏蔽管理员
    function admin_examine(){
        if(request()->isAjax()){
            $ids = input('param.ids');
            $flag = input('param.flag');
            $arr['status'] = $flag;
            $info = $flag == 1 ? '审核' : '屏蔽';
            $result = Db::name('admin')->where('admin_id','in',$ids)->update($arr);

            if($result !== false){
                $this->SaveAdminLog($info."管理员【".$ids."】");
                $this->success('操作成功');
            }else{
                $this->error('操作失败');
            }
        }
    }
    
    
    //角色列表
    function role(){
        $info = Db::name('admin_role')->select();
        $this->assign('info',$info);
        return $this->fetch();
    }
    
    
    //角色添加
    function role_add()
    {
        $id = intval(input('param.id'));
        if($id>0){
            $info = Db::name("admin_role")->where("id",$id)->field('id,name,desc')->find();
            $this->assign("info",$info);
        }
        return $this->fetch();
    }
    
    
    //角色添加操作
    function role_ok()
    {
        if(request()->isAjax()) {
            $id = intval(input('post.id'));
            $param = input('post.');
            if($id>0) {
                $result = Db::name('admin_role')->where('id',$id)->update($param);
                $log = "修改角色【".$id."】";
            }else {
                $param['addtime'] = time();
                unset($param['id']);
                $result = Db::name('admin_role')->insertGetId($param);
                $log = "添加角色【".$result."】";
            }
    
            if($result !== false){
                $this->SaveAdminLog($log);
                $this->success('操作成功');
            }else{
                $this->error('操作失败');
            }
        }
    }
    
    //角色删除操作
    function role_del() {
        if(request()->isAjax()) {
            $ids = input('param.ids');
            $result = Db::name("admin_role")->where('id','in',$ids)->where('id','neq',1)->delete();
            if($result !== false){
                $this->SaveAdminLog("删除角色【".$ids."】");
                $this->success('操作成功');
            }else{
                $this->error('操作失败');
            }
        }
    }
    /*
     * 模块列表
     */
    function module(){
        $module = new Module;
        $info = $module->getmoduletree();
        $this->assign('info',$info);
        return $this->fetch();
    }
    
    /*
     * 添加/编辑模块页面
     */
    function module_add(){
        $id = intval(input('param.id'));
        $module = new Module;
        if($id>0){
            $info = $module::get($id);
            $this->assign("info",$info);
        }
        $tree = $module->module_loop();
        $this->assign('tree',$tree);
        return $this->fetch();
    }
    
    /*
     * 添加/编辑模块操作
     */
    function module_ok()
    {
        if(request()->isAjax()){
            $param = input('post.');
            $result = $this->validate($param,'Module');
            if (true !== $result) {
                //验证失败 输出错误信息
                $this->error($result);
            }
            $id = intval($param['id']);
            $module = new Module;
            $code = $param['pid'] == 0 ? '0-' : $module->module_top($param['pid']);
            
            if($id>0){         //编辑
                if($id == $param['pid']) {
                    $this->error('上级模块不能是模块本身');
                }else{
                    $info = $module->where('id',$id)->field('code')->find();
                    $param['code'] = '-'.$code.$id.'-';
                    
                    preg_match_all('/-'.$id.'-/', $param['code'], $other);
                    if(count($other[0]) > 1) {
                        $this->error('上级模块级别不够');
                    }
                    //本身修改code
                    $flag = $module->allowField(true)->save($param,['id'=>$id]);
                    if($flag !== false){
                        if($info['code'] != $param['code']) {	//跨栏目
                            $new_code = preg_replace('/^-0/', '', $param['code']);
                            $module->module_across($new_code, $id);
                        }
                        $this->SaveAdminLog("修改模块【".$id."】");
                        $this->success('修改成功');
                    }else {
                        $this->error('编辑失败');
                    }
                }
            }else{   
                //新增
                $flag = $module->insertModule($param);
                if($flag['code'] == 200){
                    $m['code'] = '-'.$code.$flag['data'].'-';
                    
                    $module->allowField(['code'])->save($m,['id'=>$flag['data']]);   //修改code
                    //Db::name('module')->getLastSql();
                    //$this->LogsSaveFile('添加模块《'.$id.'》');
                    $this->SaveAdminLog("添加模块【".$flag['data']."】");
                    $this->success('添加成功');
                }else {
                    //新增失败
                    $this->error($flag['msg']);
                }
            }
        }
    }
    
    //删除模块
    function module_del(){
        $id = intval(input('param.id'));
        //$res = Db::name("module")->where("code like '%-".$id."-%'")->delete();
        $module = new Module;
        $result = $module::where('code','like',"%-".$id."-%")->delete();
        if($result !== false){
            $this->SaveAdminLog("删除模块【".$id."】");
            $this->success('删除成功');
        }else{
            $this->error('删除失败');
        }
    }
    
    
    //编辑模块的按钮
    function set_button(){
        $id = intval(input('param.id'));
        $arr = Db::name('button')->field('id,name,img')->order('sortnum desc, id asc')->select();
        $info = Db::name('module')->where('id',$id)->find();
        $button = explode(',', $info['button']);
        
        $this->assign('info',$info);
        $this->assign('button',$button);
        $this->assign('arr',$arr);
        return $this->fetch();
    }
    
    //编辑按钮成功操作
    function set_button_ok(){
        if(request()->isAjax()){
            $id = intval(input('post.id'));
            $item = trim(input('post.item'),',');
            $module = new Module;
            $result = $module->save(['button'=>$item],['id'=>$id]);
            
            if($result !== false){
                $this->SaveAdminLog("分配模块按钮【".$id."】");
                $this->success('分配成功');
            }else {
                $this->error('操作失败');
            }
        }
    }
    
    
    //操作按钮列表
    function button(){
        $info = Db::name('button')->select();
        $this->assign('info',$info);
        return $this->fetch();
    }
    
    
    //添加操作按钮
    function button_add(){
        $id = intval(input('param.id'));
        if($id>0){
            $info = Db::name("button")->where('id',$id)->find();
            $this->assign("info",$info);
        }
        return $this->fetch();
    }
    
    //编辑按钮操作
    function button_ok() {
        if(request()->isAjax()) {
            $id = intval($this->request->param('id'));
            $param = input('post.');
            if($id>0) {
                $result = Db::name('button')->where('id',$id)->update($param);
                $log = "修改按钮【".$id."】";
            }else {
                unset($param['id']);
                $result = Db::name('button')->insertGetId($param);
                $log = "添加按钮【".$result."】";
            }
    
            if($result !== false){
                $this->SaveAdminLog($log);
                $this->success('添加成功');
            }else{
                $this->error('添加失败');
            }
        }
    }
    
    //删除按钮操作
    function button_del() {
        if(request()->isAjax()) {
            $ids = input('param.ids');
            $res = Db::name('button')->where('id','in',$ids)->delete();
            if($res !== false){
                $this->SaveAdminLog("删除按钮【".$ids."】");
                $this->success('删除成功');
            }else{
                $this->error('添加失败');
            }
        }
    }
    
    //模块权限分配
    function module_prev() {
    
        $id = intval(input('param.id'));
        if($id>0)
        {
            $info = Db::name("admin_role")->where("id",$id)->field('id,name,module')->find();
            //当前角色拥有的全部权限的模块
            $moduleArr = explode(',', $info['module']);
            //系统所有的模块
            $arr = Db::name("module")->field('id, name, pid')->order('sortnum desc, id asc')->select();
            
            foreach($arr as $key => $val){
                $json[$key]['id'] = $val['id'];
                $json[$key]['pId'] = $val['pid'];
                $json[$key]['name'] = $val['name'];
                $json[$key]['open'] = 'true';
                if(in_array($val['id'], $moduleArr))
                    $json[$key]['checked'] = 'true';
            }
            $myjson = new \py\Myjson;
            $json = $myjson->encode($json);
            
            $this->assign('info',$info);
            $this->assign('arr',$json);
            return $this->fetch();
        }
    }
    
    
    //分配模块权限
    function module_prev_ok() {
        if(request()->isAjax()) {
            $id = intval(input('post.id'));
            $arr['module'] = input('post.module_str');
            $result = Db::name("admin_role")->where("id",$id)->update($arr);
            
            if($result !== false) {
                $this->SaveAdminLog("为角色【".$id."】分配模块权限");
                $this->success('分配成功');
            }else{
                $this->error('分配失败');
            }
        }
    }
    
    
    //模块对应的按钮
    function button_prev($id){
        $id = intval(input('param.id'));
        $info = Db::name('admin_role')->where('id',$id)->find();
        if(empty($info['module'])) {
            return '您还没有分配模块权限';
        }
        $where = 'id IN ('.$info['module'].')';
        //系统所有模块
        $arr = Db::name('module')->where($where)->field('id, name, pid, button')->order('sortnum desc, id asc')->select();
        foreach($arr as $key => $val) {
            $json[$key]['id'] = $val['id'];
            $json[$key]['pId'] = $val['pid'];
            $json[$key]['name'] = $val['name'];
            $json[$key]['open'] = 'true';
            $json[$key]['click'] = "showButton('".$val['id']."')";
        }
        $myjson = new \py\Myjson;
		$module = $myjson->encode($json);
		//当前角色具有权限的模块及按钮
        $button = unserialize($info['button']);
        $all = [];
        foreach($arr as $key => $val) {
            if(!$val['button'])
                continue;
            $conditions = "id in (".$val['button'].")";
            $list = Db::name('button')->where($conditions)->order('sortnum desc, id asc')->select();
            
            if(!empty($list)) {
                foreach($list as $v){
                    $v['module'] = $val['id'];
                    $all[] = $v;
                }
            }
        }
        $this->assign('all',$all);
        $this->assign('module',$module);
        $this->assign('info',$info);
        $this->assign('button',$button);
        if($all){
            $flag = $all[0]['id'];
        }else{
            $flag = '';
        }
        $this->assign('flag',$flag);
        return $this->fetch();
    }
    
    
    //展示该模块的操作按钮
    function show_button() {
        $id = intval(input('param.id'));
        $info = Db::name('module')->where('id',$id)->find();
        $arr = explode(',', $info['button']);
        $myjson = new \py\Myjson;
		$json = $myjson->encode($arr);
        return $json;
    }
    
    //操作角色模块的按钮权限
    function button_prev_ok() {
        if(request()->isAjax()) {
            $id = intval(input('post.id'));
            $items = trim(input('post.item'), ',');
            $buttonArr = explode(',', $items);
            
            foreach($buttonArr as $key => $val) {
                $list = explode('-', $val);
                $button[$list[0]][] = $list[1];
            }
            $arr['button'] = serialize($button);
            $result = Db::name('admin_role')->where('id',$id)->update($arr);
            if($result !== false){
                $this->SaveAdminLog("为角色【".$id."】编辑按钮权限");
                $this->success('分配成功');
            }else{
                $this->error('分配失败');
            }
        }
    }
    
    
    //日志列表
    function logs()
    {
        $where = [];
        $pageParam    = ['query' =>[]];
        if($this->request->param('range')){
            $range = explode(' - ',$this->request->param('range'));
            $pageParam['query']['range'] = $this->request->param('range');
            $start = strtotime($range[0].' 00:00:00');
            $end = strtotime($range[1].' 23:59:59');
        
            $where[] = ['al.addtime','between', "$start,$end"];
        }
        
        if($this->request->param('keywords')){
            $keywords = $pageParam['query']['keywords'] = $this->request->param('keywords');
            $where[] = ['info','like', "%$keywords%"];
            
            $pageParam['query']['keywords'] = $keywords;
        }
        $this->assign("search",$pageParam['query']);
        $info = Db::name('admin_log')->alias('al')->field('al.id,al.addtime,al.info,al.ip,a.admin_name')->where($where)->join('admin a', 'al.admin_id=a.admin_id')->order("id desc")->paginate(11,false,$pageParam);
        //echo Db::name('admin_act_log')->getLastSql();
        //展示该模块的方法
        $this->assign('info',$info);
        return $this->fetch();
    }
    
}