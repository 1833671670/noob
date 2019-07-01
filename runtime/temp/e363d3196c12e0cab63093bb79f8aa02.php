<?php /*a:1:{s:73:"E:\sjx\PHPTutorial\WWW\tp5.1demo\application\admin\view\system\admin.html";i:1552372252;}*/ ?>

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
            <h5>管理员列表</h5>
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
							<th>账号</th>
							<th>角色</th>
							<th>手机</th>
							<th>邮箱</th>
							<th>状态</th>
							<th>最后登录</th>
							<th>添加时间</th>
                        </thead>
                         <tbody>
                         	<?php if(is_array($info) || $info instanceof \think\Collection || $info instanceof \think\Paginator): $i = 0; $__LIST__ = $info;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                         	<tr rel="<?php echo htmlentities($vo['admin_id']); ?>">
                         		<td>
	                                 <input type="checkbox" class="i-checks" value="<?php echo htmlentities($vo['admin_id']); ?>">
								 </td>
                                 <td><?php echo htmlentities($vo['admin_id']); ?></td>
                                 <td><?php echo htmlentities($vo['admin_name']); ?></td>
                                 <td><?php if(isset($vo['name'])): ?><?php echo htmlentities($vo['name']); else: ?>该角色已删除<?php endif; ?></td>
                                 <td><?php echo htmlentities($vo['mobile']); ?></td>
                                 <td><?php echo htmlentities($vo['email']); ?></td>
                                 <td>
	                                <?php if($vo['status'] == 0): ?>
	                                <span class="label">禁用</span>
	                                <?php else: ?>
			                        <span class="label label-primary">启用</span>
			                        <?php endif; ?>
                                 </td>
                                 <td><?php if($vo['lastlogintime'] > 0): ?><?php echo htmlentities(date('Y-m-d H:i',!is_numeric($vo['lastlogintime'])? strtotime($vo['lastlogintime']) : $vo['lastlogintime'])); ?>[<?php echo htmlentities($vo['lastloginip']); ?>]<?php endif; ?></td>
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
<!-- 
<span class="label label-info">label-info</span>
<span class="label label-success">label-success</span>
<span class="label label-warning">label-warning</span>
<span class="label label-danger">label-danger</span>
 -->
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
	layer_show("添加","<?php echo url('system/admin_add'); ?>",800,500);
}

function edit(){
	var id = getid();
	if(id>0){
		layer_show("编辑","<?php echo url('system/admin_add'); ?>?id="+id,800,500);
		
	}else{
		layer_alert('请选择目标');	
	}
}

/*
 *1 绿勾 
 *2 红叉
 *3 黄问
 *4 灰锁
 *5 红哭脸
 *6 绿笑脸
 *7 黄感叹
 */

function del(){
	var ids = getids();
	if(ids != ''){
		parent.layer.confirm('确认要删除吗？',{icon: 3, title:'警告'},function(index){
			$.getJSON("<?php echo url('system/admin_del'); ?>",{'ids':ids},function(res){
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

function isok(){
 	admin_examine(1);
}

function isno(){
	admin_examine(0);
}

function admin_examine(flag){
	var ids = getids();
 	if(ids != ''){
 		parent.layer.confirm('确认要操作吗？',{icon: 3, title:'警告'},function(index){
 			$.ajax({
 				type: 'POST',
 				url: "<?php echo url('system/admin_examine'); ?>?flag="+flag+"&ids="+ids,
 				dataType: 'json',
				success: function(res){
					if(res.code == 1){
						warn(res.msg,'success','selfrefresh');
					}else{
						warn(res.msg,'error');
					}
				},
				error: function(XmlHttpRequest, textStatus, errorThrown){
					 warn('网络失败，请刷新页面后重试');
				}
 			});		
 		});
 	}else{
 		layer_alert('请选择目标');	
 	}
}
</script>
</body>
</html>