<?php /*a:1:{s:74:"E:\sjx\PHPTutorial\WWW\tp5.1demo\application\admin\view\system\module.html";i:1535625052;}*/ ?>

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
	<link href="/static/admin/plugins/treetable/css/jquery.treetable.css" rel="stylesheet" type="text/css" />
	<link href="/static/admin/plugins/treetable/css/jquery.treetable.theme.default.css" rel="stylesheet" type="text/css" />
    <link href="/static/admin/css/base.css" rel="stylesheet">
</head>
<body class="gray-bg">

<div class="wrapper wrapper-content animated fadeInRight">
    <!-- Panel Other -->
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>模块列表</h5>
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
                        	<th>名称</th>
							<th>ID</th>
							<th>编号</th>
							<th>类型</th>
							<th>地址</th>
							<th>排序</th>
                        </thead>
                         <tbody>
                         <?php echo $info; ?> 
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
	<script src="/static/admin/plugins/treetable/js/jquery.treetable.js"></script>
	<script src="/static/admin/js/content.min.js?v=1.0.0"></script>
	<script src="/static/admin/plugins/layer/layer.js"></script>
	<script src="/static/admin/js/common.js"></script>
<script>

$(".tablelist").treetable({ expandable: true });
jQuery('.tablelist').treetable('expandAll');

function add(){
	layer_show("添加","<?php echo url('system/module_add'); ?>",800,500);
}

function edit(){
	var id = getid();
	if(id>0){
		layer_show("编辑","<?php echo url('system/module_add'); ?>?id="+id,800,500);
	}else{
		layer_alert('请选择目标');	
	}
}

function del(){
	var id = getid();
	if(id>0){
		parent.layer.confirm('确认要删除吗？',{icon: 3, title:'警告'},function(index){
			$.getJSON("<?php echo url('system/module_del'); ?>",{'id':id},function(res){
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


function set_button(){
	var id = getid();
	if(id>0){
		layer_show("分配按钮","<?php echo url('system/set_button'); ?>?id="+id,800,350);
	}else{
		layer_alert('请选择目标');	
	}
}


</script>
</body>
</html>