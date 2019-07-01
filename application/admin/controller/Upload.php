<?php
namespace app\admin\controller;
use think\Controller;
use think\Db;
use PHPExcel_IOFactory;
use PHPExcel;

class Upload extends Base{
    public function initialize() {
        parent::initialize();
    }
    
    //上传图片接口（单张）
    function uploadimg(){
        if(request()->isAjax()){
            $file = $this->request->file('file');
            $type = request()->param('type');
            // 移动到框架应用根目录/public/uploads/ 目录下
            $info = $file->validate(['size'=>2097152,'ext'=>'jpg,png,gif'])->move(\Env::get('root_path') . 'public' . DS . 'uploads'.DS.$type);
            
            if($info){
                
                // 成功上传后 获取上传信息
                // 输出 42a79759f284b767dfcb2a0197904287.jpg
                $path = '/uploads/'.$type.'/'.$info->getSaveName();
                $this->success('上传成功','',$path);
            }else{
                // 上传失败获取错误信息
                $this->error($file->getError());
            }
        }
    }
    
    //上传多张图片
    function uploadmultimg(){
        $file = $this->request->file('file');
        $type = request()->param('type');
        // 移动到框架应用根目录/public/uploads/ 目录下
        $info = $file->validate(['size'=>2097152,'ext'=>'jpg,png,gif'])->move(\Env::get('root_path') . 'public' . DS . 'uploads'.DS.$type);
        if($info){
            // 成功上传后 获取上传信息
            // 输出 42a79759f284b767dfcb2a0197904287.jpg
            $path = '/uploads/'.$type.'/'.$info->getSaveName();
            $this->success('上传成功','',$path);
        }else{
            // 上传失败获取错误信息
            $this->error($file->getError());
        }
    }
    
    function delimg(){
        if(request()->isPost()){
            $path = $this->request->param('path');
            $path = iconv('utf-8', 'gbk', $path);
            $res = @unlink('.'.$path);
        }
        //同时把该记录的字段设置为空
        $type = $this->request->param('type');
        Db::name($type)->where("path='".iconv('gbk', 'utf-8', $path)."'")->update(array('path'=>''));
        $this->success('删除成功');
    }
    
    //异步删除图片
    function delgoodsimg(){
        if(request()->isPost()){
            $path = $this->request->param('path');
            $path = iconv('utf-8', 'gbk', $path);
            $res = @unlink('.'.$path);
        }
        //同时把该记录的字段设置为空
        $type = $this->request->param('type');
        Db::name($type)->where("path='".iconv('gbk', 'utf-8', $path)."'")->update(array('path'=>''));
        
        //删除商品图片表里的数据
        Db::name('goods_photo')->where("path='".iconv('gbk', 'utf-8', $path)."'")->delete();
        $this->success('删除成功');
    }
    
    
    //上传商品excel文件
    function goodsfile(){
        $file = $this->request->file('file');
        $type = request()->param('type');

        //文件名
        $name = iconv('utf-8','gbk',$file->getInfo()['name']);
        
        // 移动到框架应用根目录/public/uploads/ 目录下
        //$info = $file->validate(['size'=>2097152,'ext'=>'xlsx,xls'])->move(\Env::get('root_path') . 'public' . DS . 'uploads'.DS.$type);
        $info = $file->validate(['size'=>5000000,'ext'=>'xls,xlsx'])->move(\Env::get('root_path') . 'public' . DS . 'uploads'.DS.$type, date('YmdHi').'-'.$name);
        
        if($info){
            ///上传成功 获取上传文件信息
            $file_path_full = $info->getPathName();
            $getSaveName = iconv("GB2312","UTF-8",$info->getSaveName());
            $filepath = '/uploads/import/'.$getSaveName;
            
            $import = [
                'filename'=>$getSaveName,
                'filepath'=>$filepath,
                'seller_id'=>0,
                'addtime'=>time(),
            ];
            $res = Db::name('import')->insert($import);
            
            //导入操作
            $result = $this->insertExcel($file_path_full);
            if ($result > 0){
                return json(['code'=>200,'msg'=>'文件导入成功，共'.$result.'条记录']);
            }elseif($result == 'repeat'){
                return json(['code'=>400,'msg'=>'导入失败，重复数据']);
            }elseif($result == 'error'){
                return json(['code'=>400,'msg'=>'导入失败，表格格式有误']);
            }
            
            $this->success('上传成功','',$path);
        }else{
            // 上传失败获取错误信息
            $this->error($file->getError());
        }
    }
    
    //导入数据库操作
    function insertExcel($file_name){
        $objReader = \PHPExcel_IOFactory::createReader('Excel2007');
        if(!$objReader->canRead($file_name)){
            $objReader = \PHPExcel_IOFactory::createReader('Excel5');
        }
        $obj_PHPExcel = $objReader->load($file_name,$encode='utf-8'); //加载文件内容,编码utf-8
        
        //商品图片略去
        
        $excel_array=$obj_PHPExcel->getsheet(0)->toArray();   //转换为数组格式
        $row = array_shift($excel_array);  //删除第一个数组(标题);
        if($row[0] == '名称' && $row[1] == '编号' && $row[2] == '类别' && $row[3] == '单价' && $row[4] == '重量' && $row[5] == '单位' && $row[6] == '状态' && $row[7] == '库存' && $row[8] == '主图' && $row[9] == '详情'){
            foreach($excel_array as $k=>$v) {
                $goods_arr['name'] = $v[0];
                $goods_arr['number'] = $v[1];
                $goods_arr['category_id'] = $v[4];
                $goods_arr['price'] = $v[4];
                $goods_arr['addtime'] = time();
                $result = Db::name('goods')->insertGetId($goods_arr);
                if($result > 0){
                    $num++;
                    //更新pid
                    if(empty($order['parts_name'])){
                        $pid = 0;
                        $x = $result;
                        $recovery_price = 0;
                    } else {
                        
                    }
                }
                //$bc = Db::name('recovery')->where(['order_sn'=>['eq',$order['order_sn']]])->find();
                //if(empty($bc))
                //{
                //重复订单号则不再添加
                //Db::name('order')->insert($order);
                //$num++;
                //}
            }
            //$res = Db::name('order')->insertAll($order); //批量插入数据
            if($num > 0){
                return $num;
            }else if($num == 0){
                return 'repeat';
            }
        }else{
            return 'error';
        }
    }
}