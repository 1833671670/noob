<?php /*a:1:{s:100:"D:\phpstudy\PHPTutorial\WWW\noob\sjx20190429\tp5.1demo\application\admin\view\system\module_add.html";i:1535624913;}*/ ?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>添加</title>
<link rel="shortcut icon" href="favicon.ico">
<link href="/static/admin/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="/static/admin/css/font-awesome.min.css?v=4.4.0"
	rel="stylesheet">
<link href="/static/admin/css/animate.min.css" rel="stylesheet">
<link href="/static/admin/css/style.min.css?v=4.1.0" rel="stylesheet">
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="float-e-margins">
					<div class="ibox-content">
						<form class="form-horizontal m-t" id="commentForm" method="post"
							action="<?php echo url('system/module_ok'); ?>">
							<div class="form-group">
								<label class="col-sm-3 control-label">名称：</label>
								<div class="input-group col-sm-7">
									<input id="name" type="text" class="form-control" id="name" name="name" value='<?php if(!(empty($info['name']) || (($info['name'] instanceof \think\Collection || $info['name'] instanceof \think\Paginator ) && $info['name']->isEmpty()))): ?><?php echo htmlentities($info['name']); endif; ?>'
										required="" aria-required="true">
										 <!-- <span class="help-block m-b-none">说明文字</span>  -->
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">上级栏目：</label>
								<div class="input-group col-sm-7">
									<select class="form-control" name="pid" required="" aria-required="true">
								        <option value="0">顶级分类</option>
										<?php if(is_array($tree) || $tree instanceof \think\Collection || $tree instanceof \think\Paginator): $i = 0; $__LIST__ = $tree;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
										<option <?php if(isset($info)): if($vo['id'] == $info['pid']): ?>selected<?php endif; endif; ?> value="<?php echo htmlentities($vo['id']); ?>"><?php echo str_repeat('　',$vo['level']); ?><?php echo htmlentities($vo['name']); ?></option>
										<?php endforeach; endif; else: echo "" ;endif; ?>
								    </select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">图标：</label>
								<div class="input-group col-sm-7">
									<input class="form-control" name="icon" value='<?php if(!(empty($info['icon']) || (($info['icon'] instanceof \think\Collection || $info['icon'] instanceof \think\Paginator ) && $info['icon']->isEmpty()))): ?><?php echo htmlentities($info['icon']); endif; ?>' >
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">类型：</label>
								<div class="input-group col-sm-7">
									<select class="form-control" name="target" >
								        <option <?php if(isset($info)): if($info['target'] == 1): ?>selected<?php endif; endif; ?> value="1">导航</option>
								        <option <?php if(isset($info)): if($info['target'] == 2): ?>selected<?php endif; endif; ?> value="2">菜单</option>
								        <option <?php if(isset($info)): if($info['target'] == 3): ?>selected<?php endif; endif; ?> value="3">方法</option>
								    </select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">地址：</label>
								<div class="input-group col-sm-7">
									<input class="form-control" name="url" value='<?php if(!(empty($info['url']) || (($info['url'] instanceof \think\Collection || $info['url'] instanceof \think\Paginator ) && $info['url']->isEmpty()))): ?><?php echo htmlentities($info['url']); endif; ?>' >
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">排序：</label>
								<div class="input-group col-sm-7">
									<input class="form-control" name="sortnum" value='<?php if(!(empty($info['sortnum']) || (($info['sortnum'] instanceof \think\Collection || $info['sortnum'] instanceof \think\Paginator ) && $info['sortnum']->isEmpty()))): ?><?php echo htmlentities($info['sortnum']); endif; ?>' >
								</div>
							</div>
							
							<input type="hidden" name="id" value="<?php if(isset($info['id'])): ?><?php echo htmlentities($info['id']); endif; ?>" />
							
							<div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-12 col-sm-offset-3">
									<button type="submit" class="btn btn-primary btn_save"><i class="fa fa-save"></i> 保存</button>
                        			<button type="button" class="btn btn-danger btn_close"><i class="fa fa-close"></i> 关闭</button>       
                                </div>
                            </div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="/static/admin/js/jquery.min.js"></script>
	<script src="/static/admin/js/bootstrap.min.js"></script>
	<script src="/static/admin/js/content.min.js?v=1.0.0"></script>
	<script src="/static/admin/js/jquery.form.js"></script>
	<script src="/static/admin/js/contabs.js"></script>
	<script src="/static/admin/plugins/validate/jquery.validate.min.js"></script>
    <script src="/static/admin/plugins/validate/messages_zh.min.js"></script>
    <script src="/static/admin/js/demo/form-validate-demo.min.js"></script>
    <script src="/static/admin/plugins/layer/layer.js"></script>
	<script src="/static/admin/js/common.js"></script>
	<script type="text/javascript">
	$(function(){
		
        $('#commentForm').ajaxForm({
            beforeSubmit: checkForm, 
            success: complete, 
            dataType: 'json'
        });
        
        function checkForm(){
            if( '' == $.trim($('#name').val())){
                warn('请输入名称')
                return false;
            }
            $('.btn_save').attr('disabled',true).addClass('disabled').text('提交中...');
        }

        function complete(res){
        	//本窗口的父级iframe
        	//var m = parent.document.getElementById("m").value;
        	//parent.document.getElementById("iframe"+m).contentWindow.location.href = 'http://www.baidu.com';
        	//return;
        	//window.location.href='/admin/system/module';
        	//document.getElementById('iframe9').contentWindow.location.reload(true);
        	//document.getElementById('iframe9').src='http://www.baidu.com';
        	//document.frames('iframe9').location.reload()
        	//$("#iframe9").window.location.reload();
        	//writeObj($("#iframe9").window)
        	//writeObj(document.getElementById('iframe9').window)
        	//layer.close(index);
        	//parent.location.reload(true);
        	//parent.location.href = '/admin/system/module';
            if(res.code == 1){
            	/*
                layer.msg(data.msg, {icon: 6,time:1500,shade: 0.1}, function(index){
                    layer.close(index);
                    window.location.href="/admin/article/index.html";
                });
            	
				 layer.msg(res.msg, {icon: 6,time:1500,shade: 0.1}, function(index){
					 layer_close(index);
	                    window.location.href="/admin/system/module.html";
	                    window.location.href="http://www.baidu.com";
	                });*/
                warn(res.msg,'success','closerefresh');
            }else{
                warn(res.msg,'error')
                $('.btn_save').attr('disabled',false).removeClass('disabled').text('保存');
            }
        }
     
    });
	</script>
</body>
</html>
