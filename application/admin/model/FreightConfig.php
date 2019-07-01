<?php
namespace app\admin\model;

use think\Db;
use think\Model;

class FreightConfig extends Model
{
    protected $pk = 'config_id';
    //自定义初始化
    protected static function init()
    {
        
    }

    public function freightRegion()
    {
        return $this->hasMany('FreightRegion', 'config_id', 'config_id');
    }

}
