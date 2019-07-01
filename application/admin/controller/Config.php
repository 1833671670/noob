<?php
namespace app\admin\controller;
use think\Controller;
use think\Db;
class Config extends Base{
    public function initialize() {
        parent::initialize();
    }
    
    function site(){
        $config = Db::name('config')->where('id',1)->find();
        $this->assign('config',$config);
        return $this->fetch();
    }
    
    function site_ok(){
        if(request()->isAjax()){
            $param = input('post.');
            $result = Db::name('config')->where('id',1)->update($param);
            if($result !== false){
                $this->success('保存成功');
            }else {
                $this->error('保存失败');
            }
        }
    }
    
    function links(){
        return $this->fetch();
    }
    
    function message(){
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
        $info = Db::name('message')->where($where)->order("id desc")->paginate(11,false,$pageParam);
        //echo Db::name('admin_act_log')->getLastSql();
        //展示该模块的方法
        $this->assign('info',$info);
        return $this->fetch();
    }
    
    function send_log(){
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
        $info = Db::name('send_log')->where($where)->order("id desc")->paginate(11,false,$pageParam);
        //echo Db::name('admin_act_log')->getLastSql();
        //展示该模块的方法
        $this->assign('info',$info);
        return $this->fetch();
    }
    
}