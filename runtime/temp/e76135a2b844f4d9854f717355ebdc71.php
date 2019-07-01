<?php /*a:1:{s:94:"D:\phpstudy\PHPTutorial\WWW\noob\sjx20190429\tp5.1demo\application\admin\view\system\role.html";i:1535625143;}*/ ?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <link href="/static/admin/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
	<link href="/static/admin/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
	<!-- Data Tables -->
	<link href="/static/admin/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
	<link href="/static/admin/css/base.css" rel="stylesheet">
	<link href="/static/admin/css/animate.min.css" rel="stylesheet">
	<link href="/static/admin/css/style.min.css?v=4.0.0" rel="stylesheet">
	<link href="/static/admin/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="/static/admin/css/base.css" rel="stylesheet">
</head>
<body class="gray-bg">

<div class="wrapper wrapper-content animated fadeInRight">
    <!-- Panel Other -->
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>角色列表</h5>
        </div>
        <div class="ibox-content">
            <div class="row">
                <div  class="col-sm-9 m-b-xs">
            	<?php if(!(empty($priv) || (($priv instanceof \think\Collection || $priv instanceof \think\Paginator ) && $priv->isEmpty()))): if(is_array($priv) || $priv instanceof \think\Collection || $priv instanceof \think\Paginator): $i = 0; $__LIST__ = $priv;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                <a onclick="<?php echo htmlentities($vo['event']); ?>">
                	<button class="btn <?php echo htmlentities($vo['img']); ?>" type="button">
                	<i class="fa <?php echo htmlentities($vo['icon']); ?>"></i>
                	<?php echo htmlentities($vo['name']); ?>
                	</button>
                </a>
                <?php endforeach; endif; else: echo "" ;endif; else: ?>
                <span class="simple_tag">没有可操作选项</span>
                <?php endif; ?>
                </div>                                            
            </div>
            <div class="hr-line-dashed"></div>
            <!--搜索框结束-->
            <div class="example-wrap">
                <div class="example">
                    <table id="cusTable" class="table table-bordered tablelist table-hover">
                        <thead>
							<th>
                                <input type="checkbox" class="i-checks top_check" name="top_check">
							</th>
							<th>ID</th>
							<th>名称</th>
							<th>描述</th>
							<th>时间</th>
                        </thead>
                         <tbody>
                         	<?php if(is_array($info) || $info instanceof \think\Collection || $info instanceof \think\Paginator): $i = 0; $__LIST__ = $info;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                         	<tr rel="<?php echo htmlentities($vo['id']); ?>">
                         		<td>
	                                 <input type="checkbox" class="i-checks" <?php if($vo['id'] == 1): ?>disabled<?php else: ?>name="check"<?php endif; ?> value="<?php echo htmlentities($vo['id']); ?>">
								 </td>
                                 <td><?php echo htmlentities($vo['id']); ?></td>
                                 <td><?php echo htmlentities($vo['name']); ?></td>
                                 <td><?php echo htmlentities($vo['desc']); ?></td>
                                 <td><?php if($vo['addtime'] > 0): ?><?php echo htmlentities(date("Y-m-d H:i",!is_numeric($vo['addtime'])? strtotime($vo['addtime']) : $vo['addtime'])); endif; ?></td>
                             </tr>
                             <?php endforeach; endif; else: echo "" ;endif; ?>
                         </tbody>
                    </table>
                </div>
            </div>
            <!-- End Example Pagination -->
        </div>
    </div>
</div>
<!-- End Panel Other -->
</div>

	<script src="/static/admin/js/jquery.min.js"></script>
	<script src="/static/admin/js/bootstrap.min.js?v=3.3.5"></script>
	<script src="/static/admin/js/content.min.js?v=1.0.0"></script>
	<script src="/static/admin/plugins/layer/layer.js"></script>
	<script src="/static/admin/plugins/iCheck/icheck.min.js"></script>
	<script src="/static/admin/js/common.js"></script>
<script>

$(document).ready(function(){
	$(".i-checks").iCheck({
		checkboxClass:"icheckbox_square-green",
		radioClass:"iradio_square-green",
		})
});

//全选  
$('.top_check').on('ifChecked', function(event){  
    $('input').iCheck('check');  
});  
//反选  
$('.top_check').on('ifUnchecked', function(event){  
    $('input').iCheck('uncheck');  
});  

function add(){
	layer_show("添加","<?php echo url('system/role_add'); ?>",800,350);
}

function edit(){
	var id = getid();
	if(id>0){
		layer_show("编辑","<?php echo url('system/role_add'); ?>?id="+id,800,350);
	}else{
		layer_alert('请选择目标');	
	}
}

function del(){
	var ids = getids();
	if(ids != ''){
		parent.layer.confirm('确认要删除吗？',{icon: 3, title:'警告'},function(index){
			$.getJSON("<?php echo url('system/role_del'); ?>",{'ids':ids},function(res){
				if(res.code == 1){
					warn(res.msg,'success','selfrefresh');
				}else{
					warn(res.msg,'error');
				}
			  });
		});
	}else{
		layer_alert('请选择目标');	
	}
}


//模块权限
function module_prev(){
	
	var id = getid();
	if(id>0){
		/*
		if(id == 1){
			layer_alert('超级管理员具有所有权限');
			return;
		}
		*/
		layer_show("编辑模块权限","<?php echo url('system/module_prev'); ?>?id="+id,600,600);
	}else{
		layer_alert('请选择目标');	
	}
}

//按钮权限
function button_prev(){
	
	var id = getid();
	if(id>0){
		/*
		if(id == 1){
			layer_alert('超级管理员具有所有权限');
			return;
		}
		*/
		layer_show("编辑按钮权限","<?php echo url('system/button_prev'); ?>?id="+id,700,600);
	}else{
		layer_alert('请选择目标');	
	}
}

</script>
</body>
</html>