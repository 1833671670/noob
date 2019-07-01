<?php
namespace app\admin\validate;
use think\Validate;
class Test extends Validate
{
    // 验证规则
     protected $rule =   [
        'name'  => 'require|max:25',
        'pass'   => 'number|between:1,120',
    ];
    //错误信息
      protected $message  =   [
        'name.require' => '名称必须',
        'name.max'     => '名称最多不能超过25个字符',
        'pass.number'   => '年龄必须是数字',
        'pass.between'  => '年龄只能在1-120之间',
    ];
    
}