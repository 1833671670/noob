<?php
namespace app\admin\model;
use think\Db;
use think\Model;
class FreightTemplate extends Model
{
    protected $pk = 'template_id';
    protected static function init()
    {
        
    }
    public function freightConfig()
    {
        return $this->hasMany('FreightConfig', 'template_id', 'template_id');
    }

    public function getTypeDescAttr($value, $data)
    {
        $type = ['0'=>'重量','1'=>'件数','2'=>'体积'];
        return $type[$data['type']];
    }

    public function getUnitDescAttr($value, $data)
    {
        if($data['type'] == 0){
            return '件';
        }else if($data['type'] == 1){
            return '克';
        }else{
            return '立方米';
        }
    }
}
