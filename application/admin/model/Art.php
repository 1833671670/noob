<?php
namespace app\admin\model;

use think\Model;
use think\Db;
class Art extends Model
{
    // 确定链接表名
    protected $table = 'tp_art';
    /**
     * 根据搜索条件获取角色列表信息
     * @param $where
     * @param $offset
     * @param $limit
     */
    function art_type_top($pid, $str = '') {
        $father = Db::name('art_type')->where('id='.$pid)->field('id, pid')->find();
        if($father) {
            $str = $father['id'].'-'.$str;
            $str = $this->art_type_top($father['pid'], $str);
        }
        return $str;
    }
    

    function art_type_loop($id = 0, $level = 0, $falist = array())
    {
        $arr = Db::name('art_type')->where('pid='.$id)->order('sortnum desc, id asc')->select();
        if($arr) {
            foreach($arr as $val) {
                $val['level'] = $level;
                $falist[] = $val;
                $level++;
                $falist = $this->art_type_loop($val['id'], $level, $falist);
                $level--;
            }
        }
        return $falist;
    }
    
    function art_type_tree() {
        $arr = $this->art_type_loop();
        $str = "";
        foreach($arr as $key => $val) {
            $nextNum = Db::name('art_type')->where('pid',$val['id'])->count();
            $file = $nextNum > 0 ? 'folder' : 'file';
            if($val['pid'] == 0)
                $str .= "<tr class='text-c' data-tt-id='".$val['id']."' rel='".$val['id']."'><td class='text-l'><span class='$file'>".$val['name']."</span></td><td>".$val['id']."</td><td>".$val['code']."</td><td>".$val['sortnum']."</td></tr>";
            else {
                $code = trim($val['code'], '-');
                $father_code = substr($code, 0, strrpos($code, '-'));
                $str .= "<tr class='text-c' data-tt-id='".$code."' data-tt-parent-id='".$father_code."' rel='".$val['id']."'><td class='text-l'><span class='$file'>".$val['name']."</span></td><td>".$val['id']."</td><td>".$val['code']."</td><td>".$val['sortnum']."</td></tr>";
            }
        }
        return $str;
    }
    
    
    function art_type_across($new_code, $id) {
        $match = '-'.$id.'-';
        $list = Db::name('art_type')->where('id!='.$id." and code like '%".$match."%'")->select();
        foreach($list as $val) {
            $arr = explode($match, $val['code']);
            $tarr['code'] = $new_code.$arr[1];
            //$this->upd('art_type', $tarr, 'id='.$val['id']);
            Db::name('art_type')->where('id='.$val['id'])->update($tarr);
        }
    }
}