<?php

namespace app\admin\validate;

use think\Validate;

class Admin extends Validate
{

    /**
     * 验证规则
     */
    protected $rule = [
        'admin_name' => 'require|max:10|unique:admin',
        'password' => 'require',
        'role_id' => 'require',
    ];

    /**
     * 提示消息
     */
    protected $message = [
    ];

    /**
     * 字段描述
     */
    protected $field = [
    ];

    /**
     * 验证场景
     */
    protected $scene = [
        'add'  => ['admin_name', 'password', 'role_id'],
        'edit' => ['admin_name', 'role_id'],
    ];

    public function __construct(array $rules = [], $message = [], $field = [])
    {
        $this->field = [
            'admin_name' => '账号',
            'password' => '密码',
            'role_id'    => '角色',
        ];
        parent::__construct($rules, $message, $field);
    }

}
