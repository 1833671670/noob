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
            $info = Db::name('art')->paginate('1');
            $this->assign('info',$info);
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

    public function message(){
        $data['content'] = input('param.message');
        $data['member'] = Session::get('username');
        $data['cont'] = input('param.cont');
        $data['addtime'] = time();
        $res = Db::name('art')->insertGetId($data);
        if($res){
            return ['code'=>1,'msg'=>'提交成功'];
        }else{
            return ['code'=>2,'msg'=>'提交失败'];
        }
    }
}