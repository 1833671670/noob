<?php
namespace app\admin\controller;
use think\Db;
use think\Config;
use think\Validate;
use think\captcha\Captcha;
use app\admin\model\Admin;
use app\admin\model\AdminRole;
use py\Random;
class Index extends Base{
    
    protected $_error = '';
    
    public function initialize() {
        parent::initialize();
    }
    
    //默认登录页面
    public function login(){
        $url = $this->request->get('url', 'index/index');
        if ($this->isLogin()) {
            $this->redirect('/admin/admin/index');
        }
        if (request()->isPost()) {
            $username = request()->post('username');
            $password = request()->post('password');
            //$keeplogin = $this->request->post('keeplogin');
            $token = $this->request->post('__token__');
            
            $rule = [
                'username'  => 'require|length:3,30|token',
                'password'  => 'require|length:3,30',
            ];
            $data = [
                'username'  => $username,
                'password'  => $password,
                '__token__' => $token,
            ];
            if (config('py.login_captcha')) {
                $rule['captcha'] = 'require|captcha';
                $data['captcha'] = request()->post('captcha');
            }
            $validate = new Validate($rule, [], ['username' => '用户名', 'password' => '密码', 'captcha' => '验证码']);
            $result = $validate->check($data);
            if (!$result) {
                $this->error($validate->getError(), $url, ['token' => $this->request->token()]);
            }
    
            $result = $this->checkAdminLogin($username, $password);   //登录验证
            if ($result === true) {
                $this->success('登录成功', $url, []);
            } else {
                $msg = $this->getError();
                $msg = $msg ? $msg : '用户名或密码不正确';
                $this->error($msg, $url, ['token' => $this->request->token()]);
            }
        }
    
        // 根据客户端的cookie,判断是否可以自动登录
        //         if ($this->autologin()) {
        //             $this->redirect($url);
        //         }
        return $this->fetch();
    }
    
    
    function index(){
        $this->view->engine->layout(true);
        return $this->fetch();
    }
    
    function showcount($tab){
        $info['a'] = db($tab)->count();
        $info['t'] = db($tab)->whereTime('addtime', 'today')->count();
        $info['y'] = db($tab)->whereTime('addtime', 'yesterday')->count();
        $info['w'] = db($tab)->whereTime('addtime', 'week')->count();
        $info['m'] = db($tab)->whereTime('addtime', 'month')->count();
        return $info;
    }
    
    //检测管理员登录
    function checkAdminLogin($username, $password){
        $admin = Admin::get(['admin_name' => $username]);
        
        if (!$admin) {
            $this->setError('用户名或密码不正确');
            return false;
        }
        if (config('py.login_failure_retry') && $admin->loginfailure >= config('py.login_failure_count') && time() - $admin->updatetime < 86400) {
            $this->setError('今日登录错误次数超过'.config('py.login_failure_count').'次，请明日再试');
            return false;
        }
        if ($admin->password != doEncrypt($password, $admin->salt)) {
            $admin->loginfailure++;
            $admin->save();
            $this->setError('密码不正确');
            return false;
        }
        //登录成功
        $admin->loginfailure = 0;
        $admin->logintime = time();
        $admin->loginip = request()->ip();
        $admin->lastlogintime = $admin->logintime;
        $admin->lastloginip = $admin->loginip;
        $admin->token = Random::uuid();
        $admin->save();
        $this->admin_info = $admin->toArray();
        $role_name = AdminRole::where('id',$this->admin_info['role_id'])->value('name');
        $this->admin_info['role_name'] = $role_name;
        session("admin", $this->admin_info);
        $this->admin_login_log();
        return true;
    }
    
    /**
     * 注销登录
     */
    public function logout(){
        $admin = Admin::get(intval(session('admin.admin_id')));
        if (!$admin) {
            $this->success('退出成功', 'index/login');
        }
        $admin->token = '';
        $admin->save();
        
        session('admin',null);
        $this->success('退出成功', 'index/login');
    }
    

    //清除缓存
    function clear_cache(){
        \think\facade\Cache::clear();
        $this->success('清除成功');
    }
    
    
    /**
     * 设置错误信息
     *
     * @param $error 错误信息
     * @return Auth
     */
    public function setError($error){
        $this->_error = $error;
        return $this;
    }
    
    /**
     * 获取错误信息
     * @return string
     */
    public function getError(){
        return $this->_error ? __($this->_error) : '';
    }
    
    
    
    public function welcome(){
        $mysql_version = Db::query('SELECT VERSION() as mysql_version');
        
        $admin_log = Db::name('admin_login_log')->alias('al')->field('al.log_ip,al.log_time,a.admin_name,a.role_id')->join('admin a', 'al.admin_id=a.admin_id')->order('al.log_id desc')->limit(8)->select();
        //echo Db::name('admin_act_log')->getLastSql();
        foreach($admin_log as $k => $v) {
            $admin_log[$k]['admin_role'] = Db::name('admin_role')->where('id','=',$v['role_id'])->value('name');
        }
        
        
        //当前管理员登录次数
        $log_nums = Db::name("admin_login_log")->where("admin_id",$this->admin_info['admin_id'])->count();
        $this->assign("admin_info",$this->admin_info);
        $this->assign("log_nums",$log_nums);
        $this->assign("admin_log",$admin_log);
        $this->assign("mysql_version",$mysql_version[0]['mysql_version']);
        return $this->fetch();
    }
    
    
    /*
    function welcome(){
        //当前管理员信息
        $admin_info = Db::name('admin')->field('last_login,last_ip')->join(PREFIX.'admin_role', PREFIX.'admin.role_id='.PREFIX.'admin_role.id','INNER')->where("admin_id=1")->find();
        //当前管理员登录次数
        $log_nums = Db::name("admin_login_log")->where("admin_id=1")->count();
        $this->assign("admin_info",$admin_info);
        $this->assign("log_nums",$log_nums);
    
    
        $count['art'] = $this->showcount('art');
        $count['adv'] = $this->showcount('adv');
        $count['admin'] = $this->showcount('admin');
    
        $info = Db::name('config')->where('id=1')->value('title');
        $this->assign('info',$info);
    
        $this->assign("count",$count);
        return $this->fetch();
    }
    */
}
