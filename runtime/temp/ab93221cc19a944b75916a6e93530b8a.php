<?php /*a:1:{s:100:"D:\phpstudy\PHPTutorial\WWW\noob\sjx20190429\tp5.1demo\application\admin\view\system\set_button.html";i:1537322248;}*/ ?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>分配按钮</title>
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
							action="<?php echo url('system/set_button_ok'); ?>">
							<div class="btn_box">
								<?php if(is_array($arr) || $arr instanceof \think\Collection || $arr instanceof \think\Paginator): $i = 0; $__LIST__ = $arr;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
								<button type="button" class="btn btn-outline <?php if(in_array($vo['id'],$button)){ echo ' btn-primary'; }else{ echo ' btn-default'; } ?>"><input type="hidden" value="<?php echo htmlentities($vo['id']); ?>" /><?php echo htmlentities($vo['name']); ?></button>
								<?php endforeach; endif; else: echo "" ;endif; ?>
							</div>
							
							<input type="hidden" name="id" value="<?php if(!(empty($info['id']) || (($info['id'] instanceof \think\Collection || $info['id'] instanceof \think\Paginator ) && $info['id']->isEmpty()))): ?><?php echo htmlentities($info['id']); endif; ?>" />
							
							<div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-12 col-sm-offset-3">
									<button type="submit" class="btn btn-primary btn_save"><i class="fa fa-save"></i> 保存</button>
                        			<button type="button" class="btn btn-danger btn_close"><i class="fa fa-close"></i> 关闭</button>       
                                </div>
                            </div>
                            
                            <input type="hidden" id="item" name="item" value="<?php echo htmlentities($info['button']); ?>"/>
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
		
		$('.btn-outline').on('click',function(){
		    if($(this).hasClass('btn-primary')){
		    	$(this).removeClass('btn-primary').addClass('btn-default');
		    }else{
		    	$(this).removeClass('btn-default').addClass('btn-primary');
		    }
		})
     
		 $('#commentForm').ajaxForm({
	            beforeSubmit: checkForm,
	            beforeSerialize: modifySubmitData,  //提交到Action时，可以自己对某些值进行处理。
	            success: complete, 
	            dataType: 'json'
	        });
	        
	        function checkForm(){
	        	
	            $('.btn_save').attr('disabled',true).addClass('disabled').text('提交中...');
	        }
	        
	        function modifySubmitData(){
	        	var item = "";
				$('.btn_box .btn-primary').each(function () {
					item += $(this).find('input').val() + ",";
				});
	        	$("#item").val(item);
	        }
	        
	        function complete(res){
	            if(res.code == 1){
	                warn(res.msg,'success','close');
	            }else{
	                warn(res.msg,'error')
	                $('.btn_save').attr('disabled',false).removeClass('disabled').text('保存');
	            }
	        }
		
    });
	</script>
</body>
</html>
