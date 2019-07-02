<?php /*a:1:{s:99:"D:\phpstudy\PHPTutorial\WWW\noob\sjx20190429\tp5.1demo\application\admin\view\infor\member_add.html";i:1562057819;}*/ ?>
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
							action="<?php echo url('infor/member_ok'); ?>">
							<div class="form-group">
								<label class="col-sm-3 control-label">用户名：</label>
								<div class="input-group col-sm-4">
									<input type="text" class="form-control" maxlength="16"  name="member" id="member" value="<?php if(!(empty($info) || (($info instanceof \think\Collection || $info instanceof \think\Paginator ) && $info->isEmpty()))): ?><?php echo htmlentities($info['member']); endif; ?>" required="" aria-required="true" >
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">密码：</label>
								<div class="input-group col-sm-4">
									<input type="password" class="form-control" name="password" id="password" value="<?php if(!(empty($info) || (($info instanceof \think\Collection || $info instanceof \think\Paginator ) && $info->isEmpty()))): ?><?php echo htmlentities($info['password']); endif; ?>" required="" aria-required="true" >
								</div>
							</div>
							
							<input type="hidden" id="hid" value="<?php if(!(empty($info) || (($info instanceof \think\Collection || $info instanceof \think\Paginator ) && $info->isEmpty()))): ?><?php echo htmlentities($info['password']); endif; ?>" >     

							<input type="hidden" name="id" value="<?php if(!(empty($info) || (($info instanceof \think\Collection || $info instanceof \think\Paginator ) && $info->isEmpty()))): ?><?php echo htmlentities($info['id']); endif; ?>" />
							
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
    <script src="/static/admin/plugins/iCheck/icheck.min.js"></script>
	<script src="/static/admin/js/common.js"></script>
	<script type="text/javascript">
	$(function(){
		$(".i-checks").iCheck({
			checkboxClass:"icheckbox_square-green",
			radioClass:"iradio_square-green",
		})
			
        $('#commentForm').ajaxForm({
            beforeSubmit: checkForm, 
            success: complete, 
            dataType: 'json'
        });
        
        function checkForm(){
			var hid = $('#hid').val();
            if( '' == $.trim($('#member').val())){
                warn('请输入用户名')
                return false;
            }
            if( '' == $.trim($('#password').val())){
                warn('请输入密码')
                return false;
            }
			if(hid == $.trim($('#password').val())){
				warn('请修改密码')
				return false;
			}
            $('.btn_save').attr('disabled',true).addClass('disabled').text('提交中...');
        }

        function complete(res){
            if(res.code == 1){
                warn(res.msg,'success','fullcloserefresh');
            }else{
                warn(res.msg,'error')
                $('.btn_save').attr('disabled',false).removeClass('disabled').text('保存');
            }
        }
    });
	</script>
</body>
</html>
