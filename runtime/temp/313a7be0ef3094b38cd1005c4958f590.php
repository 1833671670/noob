<?php /*a:1:{s:80:"E:\sjx\PHPTutorial\WWW\tp5.1demo\application\admin\view\mall\goodsmodel_add.html";i:1536917735;}*/ ?>
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
<link href="/static/admin/css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="/static/admin/css/base.css" rel="stylesheet">
<link href="/static/admin/plugins/layui/css/layui.css" rel="stylesheet">
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="float-e-margins">
					<div class="ibox-content">
						<form class="form-horizontal m-t" id="commentForm" method="post"
							action="<?php echo url('mall/goodsmodel_ok'); ?>">
							<div class="form-group">
								<label class="col-sm-3 control-label">模型名称：</label>
								<div class="input-group col-sm-7">
									<input type="text" class="form-control" id="name" name="name" value='<?php if(!(empty($info['name']) || (($info['name'] instanceof \think\Collection || $info['name'] instanceof \think\Paginator ) && $info['name']->isEmpty()))): ?><?php echo htmlentities($info['name']); endif; ?>'
										required="" aria-required="true">
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label">属性：</label>
								<div class="input-group col-sm-5 pull-left" >
									<input type="text" class="form-control" id="value" maxlength="20" >
								</div>
								<div class="input-group col-sm-2">
									<div class="pull-right" ><a class="save_value btn btn-success btn-rounded">确定</a></div>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label"></label>
								<div class="input-group col-sm-7 attr_div">
									<?php if(!(empty($attr) || (($attr instanceof \think\Collection || $attr instanceof \think\Paginator ) && $attr->isEmpty()))): if(is_array($attr) || $attr instanceof \think\Collection || $attr instanceof \think\Paginator): $i = 0; $__LIST__ = $attr;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
									<button type="button" class="btn btn-sm btn-white show_attr" ><?php echo htmlentities($vo); ?> <input type="hidden" name="value[]" value='<?php echo htmlentities($vo); ?>' /><i class="del_attr fa fa-close"></i></button>
									<?php endforeach; endif; else: echo "" ;endif; endif; ?>
								</div>
							</div>
							
							<input type="hidden" name="id" value="<?php if(!(empty($info['id']) || (($info['id'] instanceof \think\Collection || $info['id'] instanceof \think\Paginator ) && $info['id']->isEmpty()))): ?><?php echo htmlentities($info['id']); endif; ?>" />
							
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
    <script src="/static/admin/plugins/iCheck/icheck.min.js"></script>
    <script src="/static/admin/plugins/layer/layer.js"></script>
    <script src="/static/admin/plugins/layui/layui.js"></script>
	<script src="/static/admin/js/common.js"></script>
	<script type="text/javascript">
	$(function(){
		
        $('#commentForm').ajaxForm({
            beforeSubmit: checkForm, 
            success: complete, 
            dataType: 'json'
        });
        
        function checkForm(formData){
            if( '' == $.trim($('#name').val())){
                warn('请输入名称')
                return false;
            }
            $('.btn_save').attr('disabled',true).addClass('disabled').text('提交中...');
            
            //var queryString = $.param(formData); //组装数据，插件会自动提交数据
            //alert(queryString); //类似 ： name=1&add=2  
            //return true; 
        }

        function complete(res){
            if(res.code == 1){
                warn(res.msg,'success','closerefresh');
            }else{
                warn(res.msg,'error')
                $('.btn_save').attr('disabled',false).removeClass('disabled').text('保存');
            }
        }
    });
	

	$(".save_value").click(function(){
		var val = $("#value").val();
		if(val){
			//查找是否有过该属性
			var obj = $(".attr_div .show_attr");
			for(var i=0;i<obj.length;i++){
				var name = obj.eq(i).find('input').val();
				if(name == val){
					warn('同一模型不能添加重复属性');
					$("#value").focus();
					return ;
				}
			}
			var html = '<button type="button" class="btn btn-sm btn-white show_attr" >'+val+' <input type="hidden" name="value[]" value='+val+' /><i class="del_attr fa fa-close"></i></button>';
			$(".attr_div").append(html);
			$("#value").val('');
			$("#value").focus();
			
		}else{
			warn('请输入属性名称');
		}
	})
	
	 $("body").on("click",".show_attr .del_attr",function(){
		 $(this).closest("button").remove();
	 });
	</script>
</body>
</html>
