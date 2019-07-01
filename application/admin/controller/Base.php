<?php
namespace app\admin\controller;
use think\Controller;
use think\Db;
use think\Facade\Request;
use app\admin\model\AdminLog;
use app\admin\model\Admin;
class Base extends Controller{
    /**
     * 无需登录的方法,同时也就不需要鉴权了
     */
    protected $noNeedLogin = ['login'];
    
    /**
     * 无需鉴权的方法,但需要登录
    */
    protected $noNeedRight = ['index', 'logout'];
    
    //默认未登录
    protected $logined = false;
    
    //管理员信息
    protected $admin_info = [];
    
    //function __construct() 
    //{
        //header("Cache-control: private");  // history.back返回后输入框值丢失问题 参考文章 http://www.tp-shop.cn/article_id_1465.html  http://blog.csdn.net/qinchaoguang123456/article/details/29852881
    //}
    
    /*
     * 初始化操作
     */
    public function initialize() {
        //halt(session('admin'));
        $config = Db::name('config')->where('id',1)->find();
        $this->assign('config',$config);
        
        $module_name = request()->module();
        $controller_name = request()->controller();
        $action_name = request()->action();
        
        if (!$this->match($this->noNeedLogin)) {
            
            //检测是否登录
            if (!$this->isLogin()) {
                $url = session('referer');
                $url = $url ? $url : request()->url();
                $this->redirect('admin/index/login');
            }
            
            // 判断是否需要验证权限
            if (!$this->match($this->noNeedRight)) {
                // 判断控制器和方法判断是否有对应权限
                $path = str_replace('.', '/', $controller_name) . '/' . $action_name;
                /*
                if (!$this->checkAuth($path)) {
                    $this->error('没有操作权限', '');
                }
                */
            }
        }

        //监测是否是禁止ip
        if(!$this->checkIp()){
            return '没有权限';
        }
        
        $priv = $this->getPriv();  //检查管理员菜单操作权限
        $this->assign('priv',$priv);
        
        $this->assign('admin_info',$this->admin_info);
        //过滤不需要登陆的行为
//     	if(session('admin_id') > 0 ){
//     		$priv = $this->get_priv();//检查管理员菜单操作权限
//     		$this->assign('priv',$priv);
//     	}else{
//     		$this->redirect('/Admin/admin/login');
//     	}
        $top = $this->getTop();
        $this->assign('top',$top);
    }
    
    
    function getTop(){
        $role_id = session('admin.role_id');
        //获取当前角色的权限模块
        $role_module = Db::name('admin_role')->field('module')->where('id',$role_id)->find();
      
        if($role_module['module']){
            $top = Db::name('module')->where("pid=0 and id in (".$role_module['module'].")")->field('id,name,icon')->order('sortnum desc, id asc')->select();
            foreach($top as $k => $v){
                $res = Db::name('module')->where("pid=".$v['id']." and id in (".$role_module['module'].")")->field('id,name,icon')->order('sortnum desc, id asc')->select();
                foreach($res as $kk => $vv){
                    $ress = Db::name('module')->where("pid=".$vv['id']." and id in (".$role_module['module'].")")->field('id,name,url')->order('sortnum desc, id asc')->select();
                    $res[$kk]['next'] = $ress;
                }
                $top[$k]['left'] = $res;
            }
            return $top;
        }else{
            return [];
        }
    }
    
    
    /**
     * 检测当前控制器和方法是否匹配传递的数组
     * @param array $arr 需要验证权限的数组
     */
    public function match($arr = []) {
        $arr = is_array($arr) ? $arr : explode(',', $arr);
        if (!$arr) {
            return FALSE;
        }
        $arr = array_map('strtolower', $arr);
        // 是否存在
        if (in_array(strtolower(request()->action()), $arr) || in_array('*', $arr)) {
            return TRUE;
        }
        // 没找到匹配
        return FALSE;
    }
    
    
    //检测是否是禁止ip
    function checkIp(){
        
        $forbid_ip = Db::name('config')->where('id',1)->value('forbid_ip');
        if($forbid_ip){
            $now_ip = request()->ip();
            $ip_arr = explode("#",$forbid_ip);
            
            if(!in_array($now_ip,$ip_arr)){
                return true;
            }
            return false;
        }
        return true;
    }
    
    /**
     * 检测是否登录
     */
    public function isLogin(){
        //session('admin',null);
        if ($this->logined) {
            return true;
        }
        $admin = session('admin');
        if (!$admin) {
            return false;
        }
        $this->admin_info = $admin;
        
        //判断是否同一时间同一账号只能在一个地方登录
        if (config('py.login_unique')) {
            $my = Db::name('admin')->where('admin_id',$admin['admin_id'])->find();
            if (!$my || $my['token'] != $admin['token']) {
                return false;
            }
        }
        $this->logined = true;
        return true;
    }
    
    //检测当前账号是否有操作权限
    function checkAuth($path){
        
    }

    //检测权限
    function getPriv(){
        $action_name = request()->action();
        $controller_name = request()->controller();
        $url = strtolower('/'.$controller_name.'/'.$action_name);
        $module = Db::name('module')->where("url='$url'")->find();
        $role_id = session('admin.role_id');
        $role = Db::name('admin_role')->where('id',$role_id)->field('button')->find();
        $arr = unserialize($role['button']);
        if(!empty($arr[$module['id']]) ) {
            $conditions = 'id in ('.implode(',', $arr[$module['id']]).')';
            $button = Db::name('button')->where($conditions)->order('sortnum desc,id asc')->select();
            return $button;
        }
    }
    
    
    //管理员操作记录
    function SaveAdminLog($info){
        $AdminLog = new AdminLog;
        $arr = array(
            'admin_id'=>session('admin.admin_id'),
            'info'=>$info,
            'ip'=>request()->ip(),
            'addtime'=>time()
        );
        $AdminLog->save($arr);
    }
    
    //管理员登录日志
    function admin_login_log(){
        $arr = array(
            'admin_id'=>session('admin.admin_id'),
            'log_info'=>'后台登录',
            'log_ip'=>request()->ip(),
            'log_time'=>time()
        );
        Db::name("admin_login_log")->insert($arr);
    }
}
