<?php /*a:1:{s:75:"E:\sjx\PHPTutorial\WWW\tp5.1demo\application\admin\view\user\point_log.html";i:1537007076;}*/ ?>

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
	<link href="/static/admin/plugins/fancybox/jquery.fancybox.css" rel="stylesheet">
	<link href="/static/admin/css/animate.min.css" rel="stylesheet">
	<link href="/static/admin/css/style.min.css?v=4.0.0" rel="stylesheet">
	<link href="/static/admin/css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="/static/admin/plugins/layui/css/layui.css" rel="stylesheet">
 <link href="/static/admin/css/base.css" rel="stylesheet">
</head>
<body class="gray-bg">

<div class="wrapper wrapper-content animated fadeInRight">
    <!-- Panel Other -->
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>积分列表</h5>
        </div>
        <div class="ibox-content">
            <div class="row">
                <div  class="col-sm-5 m-b-xs">
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
                <div class="col-sm-7">                               
                	<form name="admin_list_sea" action="<?php echo url('seller/seller'); ?>" class="form-search form-inline" method="post" >
                        <div class="input-group">
                        	<div class="form-group">
                                <input type="text" placeholder="请选择时间范围" name="range" id="range" value="<?php if(!(empty($search["range"]) || (($search["range"] instanceof \think\Collection || $search["range"] instanceof \think\Paginator ) && $search["range"]->isEmpty()))): ?><?php echo htmlentities($search['range']); endif; ?>" class="form-control">
                            </div>
                            <div class="form-group">
                                <input type="text" placeholder="请输入查询关键字" name="keywords" value="<?php if(!(empty($search["keywords"]) || (($search["keywords"] instanceof \think\Collection || $search["keywords"] instanceof \think\Paginator ) && $search["keywords"]->isEmpty()))): ?><?php echo htmlentities($search['keywords']); endif; ?>" class="form-control">
                            </div>   
                            <span class="input-group-btn"> 
                                <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i> 搜索</button> 
                            </span>
                        </div>
                	</form>    
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
							<th>会员</th>
							<th>手机号</th>
							<th>操作前积分</th>
							<th>操作积分</th>
							<th>操作后积分</th>
							<th>方向</th>
							<th>操作时间</th>
                        </thead>
                         <tbody>
                         	<?php if(is_array($info) || $info instanceof \think\Collection || $info instanceof \think\Paginator): $i = 0; $__LIST__ = $info;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                         	<tr rel="<?php echo htmlentities($vo['id']); ?>" class="layui-form">
                         		<td>
	                                 <input type="checkbox" class="i-checks" name="check" value="<?php echo htmlentities($vo['id']); ?>">
								 </td>
                                 <td><?php echo htmlentities($vo['id']); ?></td>
                                 <td>王华</td>
                                 <td>15878451201</td>
                                 <td><?php echo htmlentities($vo['pre_point']); ?></td>
                                 <td><?php echo htmlentities($vo['act_point']); ?></td>
                                 <td><?php echo htmlentities($vo['end_point']); ?></td>
                                 <td><?php if($vo['type'] == 1): ?><span class="red">增加</span><?php else: ?><span class="green">减少</span><?php endif; ?></td>
                                 <td><?php echo htmlentities(date("Y-m-d H:i:s",!is_numeric($vo['addtime'])? strtotime($vo['addtime']) : $vo['addtime'])); ?></td>
                             </tr>
                             <?php endforeach; endif; else: echo "" ;endif; ?>
                         </tbody>
                    </table>
                    <?php echo $render; ?>
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
	<script src="/static/admin/plugins/laydate/laydate.js"></script>
	<script src="/static/admin/plugins/iCheck/icheck.min.js"></script>
	<script src="/static/admin/plugins/fancybox/jquery.fancybox.js"></script>
	<script src="/static/admin/js/common.js"></script>
	<script>
        $(document).ready(function(){$(".fancybox").fancybox({openEffect:"none",closeEffect:"none"})});
    </script>
<script>
laydate.render({
	  elem: '#range'
	  ,range: true
	});

$(function(){
	$(".i-checks").iCheck({
		checkboxClass:"icheckbox_square-green",
		radioClass:"iradio_square-green",
		})
})

function add(){
	var index = layer.open({
		type: 2,
		title: '添加门店',
		content: '<?php echo url("seller/seller_add"); ?>'
	});
	layer.full(index);
}

function edit(){
	var id = getid();
	if(id>0){
		var index = layer.open({
			type: 2,
			title: '编辑门店',
			content: '<?php echo url("seller/seller_add"); ?>?id='+id
		});
		layer.full(index);
	}else{
		layer_alert('请选择目标');	
	}
}

function del(){
	var ids = getids();
	if(ids != ''){
		parent.layer.confirm('确认要删除吗？',{icon: 3, title:'警告'},function(index){
			$.getJSON("<?php echo url('seller/seller_del'); ?>",{'ids':ids},function(res){
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
	seller_examine(1);
}

function isno(){
	seller_examine(0);
}

function seller_examine(flag){
	var ids = getids();
 	if(ids != ''){
 		parent.layer.confirm('确认要操作吗？',{icon: 3, title:'警告'},function(index){
 			$.ajax({
 				type: 'POST',
 				url: "<?php echo url('seller/seller_examine'); ?>?flag="+flag+"&ids="+ids,
 				dataType: 'json',
				success: function(res){
					if(res.code == 1){
						warn(res.msg,'success','selfrefresh');
					}else{
						warn(data.msg,'error');
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