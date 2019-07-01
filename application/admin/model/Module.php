<?php
// +----------------------------------------------------------------------
// +----------------------------------------------------------------------
// | Copyright (c) 2016~2022 http://baiyf.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// +----------------------------------------------------------------------
namespace app\admin\model;

use think\Model;
use think\Db;
class Module extends Model
{
    // 确定链接表名
    protected $table = 'tp_module';
    /**
     * 根据搜索条件获取角色列表信息
     * @param $where
     * @param $offset
     * @param $limit
     */
    public function getRoleByWhere($where, $offset, $limit)
    {

        return $this->where($where)->limit($offset, $limit)->order('id desc')->select();
    }

    /**
     * 根据搜索条件获取所有的角色数量
     * @param $where
     */
    public function getAllRole($where)
    {
        return $this->where($where)->count();
    }

    /**
     * 插入模块信息
     * @param $param
     */
    public function insertModule($param)
    {
        try{
            $result =  $this->save($param);
            if(false === $result){
                // 添加失败 输出错误信息
                return msg(400, $this->getError());
            }else{
                //返回自增主键
                return msg(200, '', $this->id);
            }
        }catch(PDOException $e){

            return msg(400, $e->getMessage());
        }
    }
    
    
    function getmoduletree()
    {
        $arr = $this->module_loop();
        $str = "";
        foreach($arr as $key => $val) {
            $nextNum = $this->where('pid',$val['id'])->count();
    
            $file = $nextNum > 0 ? 'folder' : 'file';
            if($val['pid'] == 0)
                $str .= "<tr class='gradeX text-c' data-tt-id='".$val['id']."' rel='".$val['id']."'><td class='text-l'><span class='$file'>".$val['name']."</span></td><td>".$val['id']."</td><td>".$val['code']."</td><td>".$val['target']."</td><td>".$val['url']."</td><td>".$val['sortnum']."</td><input type='hidden' value=".$val['id']." /></tr>";
            //$str .= "<tr class='text-c'><td><input type='checkbox' value='".$val['id']."'></td><td>".$val['id']."</td><td><b>".$val['name']."</b></td><td>".$val['url']."</td><td>".$val['code']."</td><td>".$val['sortnum']."</td></tr>";
            else {
                $code = trim($val['code'], '-');
    
                $father_code = substr($code, 0, strrpos($code, '-'));
                $str .= "<tr class='gradeX text-c' data-tt-id='".$code."' data-tt-parent-id='".$father_code."' rel='".$val['id']."'><td class='text-l'><span class='$file'>".$val['name']."</span></td><td>".$val['id']."</td><td>".$val['code']."</td><td>".$val['target']."</td><td>".$val['url']."</td><td>".$val['sortnum']."</td><input type='hidden' value=".$val['id']." /></tr>";
                //$str .= "<tr class='text-c'><td><input type='checkbox' value='".$val['id']."'></td><td>".$val['id']."</td><td>".$gnums.$val['name']."</td><td>".$val['url']."</td><td>".$val['code']."</td><td>".$val['sortnum']."</td></tr>";
            }
        }
        return $str;
    }
    
    
    function module_loop($id = 0, $level = 0, $falist = array())
    {
        //$this->r_db->cache_on();
        //$arr = $this->findAll('module', 'pid='.$id, '*', 'sortnum desc, id asc');
        $arr = $this->where('pid', $id)->order('sortnum desc, id asc')->select();
        if($arr) {
            foreach($arr as $val) {
                $val['level'] = $level;
                $falist[] = $val;
                $level++;
                $falist = $this->module_loop($val['id'], $level, $falist);
                $level--;
            }
        }
        //$this->r_db->cache_off();
        return $falist;
    }

    function module_top($pid, $str = '') {
        $father = $this->where('id',$pid)->field('id, pid')->find();
        if($father) {
            $str = $father['id'].'-'.$str;
            $str = $this->module_top($father['pid'], $str);
        }
        return $str;
    }
    
    
    function module_across($new_code, $id) {
        $match = '-'.$id.'-';
        //$map['id'] = ['neq',$id];
        //$map['code'] = ['like',"%".$match."%"];
        $list = $this->where('id','neq',$id)->where('code','like',"%".$match."%")->select();
        foreach($list as $val) {
            $arr = explode($match, $val['code']);
            $tarr['code'] = $new_code.$arr[1];
            //$this->save($tarr,['id'=>$val['id']]);
            Db::name('module')->where('id',$val['id'])->update($tarr);
        }
    }
    
    
    /**
     * 编辑角色信息
     * @param $param
     */
    public function editRole($param)
    {
        try{

            $result = $this->validate('RoleValidate')->save($param, ['id' => $param['id']]);

            if(false === $result){
                // 验证失败 输出错误信息
                return msg(-1, '', $this->getError());
            }else{

                return msg(1, url('role/index'), '编辑角色成功');
            }
        }catch(PDOException $e){
            return msg(-2, '', $e->getMessage());
        }
    }

    /**
     * 根据角色id获取角色信息
     * @param $id
     */
    public function getOneRole($id)
    {
        return $this->where('id', $id)->find();
    }

    /**
     * 删除角色
     * @param $id
     */
    public function delRole($id)
    {
        try{

            $this->where('id', $id)->delete();
            return msg(1, '', '删除角色成功');

        }catch(PDOException $e){
            return msg(-1, '', $e->getMessage());
        }
    }

    // 获取所有的角色信息
    public function getRole()
    {
        return $this->select();
    }

    // 获取角色的权限节点
    public function getRuleById($id)
    {
        $res = $this->field('rule')->where('id', $id)->find();

        return $res['rule'];
    }

    /**
     * 分配权限
     * @param $param
     */
    public function editAccess($param)
    {
        try{
            $this->save($param, ['id' => $param['id']]);
            return msg(1, '', '分配权限成功');

        }catch(PDOException $e){
            return msg(-1, '', $e->getMessage());
        }
    }

    /**
     * 获取角色信息
     * @param $id
     */
    public function getRoleInfo($id)
    {
        $result = $this->where('id', $id)->find()->toArray();
        // 超级管理员权限是 *
        if(empty($result['rule'])){
            $result['action'] = '';
            return $result;
        }else if('*' == $result['rule']){
            $where = '';
        }else{
            $where = 'id in(' . $result['rule'] . ')';
        }

        // 查询权限节点
        $nodeModel = new NodeModel();
        $res = $nodeModel->getActions($where);

        foreach($res as $key=>$vo){

            if('#' != $vo['action_name']){
                $result['action'][] = $vo['control_name'] . '/' . $vo['action_name'];
            }
        }

        return $result;
    }
}