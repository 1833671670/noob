<?php
namespace app\index\controller;

use think\Controller;
use think\facade\Session;
use think\Db;
class Index extends Controller
{
    public function index()
    {
        if(Session::has('username')){
            return $this->fetch();
        }else{
            return redirect('index/login');
        }
    }

    public function login(){
        return $this->fetch();
    }

    public function checklogin(){
      
        $param = input('post.');
        
        $res = Db::name('member')->where([
            ['member','=',$param['username']],
            ['password','=',md5($param['password'])]
        ])->find();
        if(!empty($res)){
            Session::set('username',$param['username']);
            $this->redirect('index/index');
        }else{
            echo "<script>alert('登录失败');history.back(-1)</script>";
        }
      
    }
}