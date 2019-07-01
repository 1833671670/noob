<?php /*a:1:{s:74:"E:\sjx\PHPTutorial\WWW\tp5.1demo\application\admin\view\mall\spec_add.html";i:1537319574;}*/ ?>
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
							action="<?php echo url('mall/spec_ok'); ?>">
							<div class="form-group">
								<label class="col-sm-3 control-label">名称：</label>
								<div class="input-group col-sm-7">
									<input type="text" class="form-control" id="name" name="name" value='<?php if(!(empty($info['name']) || (($info['name'] instanceof \think\Collection || $info['name'] instanceof \think\Paginator ) && $info['name']->isEmpty()))): ?><?php echo htmlentities($info['name']); endif; ?>'
										required="" aria-required="true">
								</div>
							</div>
							<?php if(isset($item)): if(is_array($item) || $item instanceof \think\Collection || $item instanceof \think\Paginator): $i = 0; $__LIST__ = $item;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
							<div class="form-group spec_divs">
								<label class="col-sm-3 control-label">值：</label>
								<div class="input-group col-sm-5 pull-left" >
									<input type="text" class="form-control" id="values" value="<?php echo htmlentities($vo); ?>" name="values[]" required="" aria-required="true">
								</div>
								<div class="input-group col-sm-2">
									<button type="button" class="btn btn-outline btn-danger pull-right spec_del" ><i class="fa fa-trash-o"></i> 删除</button>
								</div>
							</div>
							<?php endforeach; endif; else: echo "" ;endif; else: ?>
							<div class="form-group spec_divs">
								<label class="col-sm-3 control-label">值：</label>
								<div class="input-group col-sm-5 pull-left" >
									<input type="text" class="form-control" id="values" name="values[]" required="" aria-required="true">
								</div>
								<div class="input-group col-sm-2">
									<button type="button" class="btn btn-outline btn-danger pull-right spec_del" ><i class="fa fa-trash-o"></i> 删除</button>
								</div>
							</div>
							<?php endif; ?>
							<div class="form-group add_spec_div" style="display:block;">
                                <div class="col-sm-offset-3 col-sm-8">
                                	<button type="button" class="btn btn-outline btn-default add_spec">+ 添加规格值</button>
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
    <script src="/static/admin/plugins/layer/layer.js"></script>
    <script src="/static/admin/plugins/layui/layui.js"></script>
	<script src="/static/admin/js/common.js"></script>
	<script type="text/javascript">
	$(function(){

		var html = "<div class='form-group spec_divs'><label class='col-sm-3 control-label'>值：</label><div class='input-group col-sm-5 pull-left' ><input type='text' class='form-control' id='values' name='values[]' ></div><div class='input-group col-sm-2'><button type='button' class='btn btn-outline btn-danger pull-right spec_del' ><i class='fa fa-trash-o'></i> 删除</button></div></div>";
		//克隆规格值输入框
		$(".add_spec").click(function(){
			//alert($('.spec_div').prop("outerHTML"));
			$('.add_spec_div').before(html);
		})
		
		//删除当前规格值
		$('body').on('click', '.spec_del', function() { 
			$(this).parents('.spec_divs').remove();
		})
		
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
            if(res.code == 1){
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
