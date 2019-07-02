<?php
namespace app\admin\controller;
use think\Controller;
use think\Db;
use app\admin\model\Art;
class Infor extends Base{
    public function initialize() {
        parent::initialize();
    }
    
    function art(){
        $where = [];
        $pageParam    = ['query' =>[]];
        if($this->request->param('range')){
            $range = explode(' - ',$this->request->param('range'));
            $pageParam['query']['range'] = $this->request->param('range');
            $start = strtotime($range[0].' 00:00:00');
            $end = strtotime($range[1].' 23:59:59');
        
            $where[] = ['addtime','between', "$start,$end"];
        }
        
        if($this->request->param('keywords')){
            $keywords = $pageParam['query']['keywords'] = $this->request->param('keywords');
            $where[] = ['title','like', "%$keywords%"];
            
            $pageParam['query']['keywords'] = $keywords;
        }
        
        if($this->request->param('type_id')){
            $type_id = $pageParam['query']['type_id'] = $this->request->param('type_id');
            $where[] = ['type_id','eq', $type_id];
        }
//         exit();
        $this->assign("search",$pageParam['query']);
        $info = Db::name('art')->where($where)->order("id desc")->paginate(11,false,$pageParam);
        //echo Db::name('admin_act_log')->getLastSql();
        //展示该模块的方法
        $this->assign('info',$info);
        
        return $this->fetch();
    }
    
    function art_add(){
        $id = intval(input('param.id'));
        $admin = Db::name('admin')->order('admin_id asc')->select();
        $this->assign('admin',$admin);
        if($id>0){
            
            $info = Db::name('art')->where('id',$id)->find();
            $this->assign("info",$info);
        }

        return $this->fetch();
    }
    
    function art_ok(){
        if(request()->isAjax()){
            $id = intval(input('post.id'));
           
            $param = input('post.');
            
            $param['addtime'] = time();
            
            if($id>0) { //修改
                
                $result = Db::name('art')->where('id',$id)->update($param);
                $log = "修改文章【".$id."】";
            }else {
                
                unset($param['id']);
                $result = Db::name('art')->insertGetId($param);
                $log = "添加文章【".$result."】";
            }
            
            if($result !== false){
                $this->SaveAdminLog($log);
                $this->success('操作成功');
            }else {
                $this->error('操作失败');
            }
        }
    }
    
    //删除文章
    function art_del(){
        if(request()->isAjax()){
            $ids = input('get.ids');
            $conditions = "id in ($ids)";
           
            $result = Db::name('art')->where($conditions)->delete();
            if($result !== false){
                $this->SaveAdminLog("删除文章【".$ids."】");
                $this->success('删除成功');
            }else{
                $this->error('操作失败');
            }
        }
    }
    
    
    //对新闻资讯的开启关闭操作
    function art_act()
    {
        if(request()->isAjax()){
            $ids = input('param.ids');
            $flag = input('param.flag');
            $arr['is_ok'] = $flag;
            $info = $flag == 1 ? '审核' : '屏蔽';
            
            $conditions = "id in ($ids)";
            $result = Db::name('art')->where($conditions)->update($arr);
            if($result !== false){
                $this->SaveAdminLog($info."文章【".$ids."】");
                $this->success($info.'成功');
            }else{
                $this->error('操作失败');
            }
        }
    }

    function member(){
        $where = [];
        $pageParam    = ['query' =>[]];
        if($this->request->param('range')){
            $range = explode(' - ',$this->request->param('range'));
            $pageParam['query']['range'] = $this->request->param('range');
            $start = strtotime($range[0].' 00:00:00');
            $end = strtotime($range[1].' 23:59:59');
        
            $where[] = ['addtime','between', "$start,$end"];
        }
        if($this->request->param('keywords')){
            $keywords = $pageParam['query']['keywords'] = $this->request->param('keywords');
            $where[] = ['title','like', "%$keywords%"];
            
            $pageParam['query']['keywords'] = $keywords;
        }
        
        $this->assign("search",$pageParam['query']);
        $info = Db::name('member')->where($where)->order("id desc")->paginate(11,false,$pageParam);
        //echo Db::name('admin_act_log')->getLastSql();
        //展示该模块的方法
        $this->assign('info',$info);
        return $this->fetch();
    }
    
    function member_add(){
        $id = intval(input('param.id'));
      
        if($id>0){
            $info = Db::name('member')->where('id',$id)->find();
            $this->assign("info",$info);
        }

        return $this->fetch();
    }
    
    function member_ok(){
        if(request()->isAjax()){
            $id = intval(input('post.id'));
            $param = input('post.');
            $param['password'] = md5($param['password']);
            $param['addtime'] = time();
            unset($param['file']);
            
            if($id>0) { //修改
                $result = Db::name('member')->where('id',$id)->update($param);
                $log = "修改用户【".$id."】";
            }else {
                unset($param['id']);
                $result = Db::name('member')->insertGetId($param);
                $log = "添加用户【".$result."】";
            }
            
            if($result !== false){
                $this->SaveAdminLog($log);
                $this->success('操作成功');
            }else {
                $this->error('操作失败');
            }
        }
    }
    
    //删除用户
    function member_del(){
        if(request()->isAjax()){
            $ids = input('get.ids');
            $conditions = "id in ($ids)";
            $result = Db::name('member')->where($conditions)->delete();
            if($result !== false){
                $this->SaveAdminLog("删除文章【".$ids."】");
                $this->success('删除成功');
            }else{
                $this->error('操作失败');
            }
        }
    }
    

    
    
}