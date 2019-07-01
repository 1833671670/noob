<?php /*a:1:{s:73:"E:\sjx\PHPTutorial\WWW\tppet\application\admin\view\system\admin_add.html";i:1552371740;}*/ ?>
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
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="float-e-margins">
					<div class="ibox-content">
						<form class="form-horizontal m-t" id="commentForm" method="post"
							action="<?php echo url('system/admin_ok'); ?>">
							<div class="form-group">
								<label class="col-sm-3 control-label">账号：</label>
								<div class="input-group col-sm-7">
									<input type="text" class="form-control" minlength="5" maxlength="16"  id="admin_name" name="admin_name" value='<?php if(!(empty($info) || (($info instanceof \think\Collection || $info instanceof \think\Paginator ) && $info->isEmpty()))): ?><?php echo htmlentities($info['admin_name']); endif; ?>'
										required="" aria-required="true">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">密码：</label>
								<div class="input-group col-sm-7">
									<?php if(!(empty($info) || (($info instanceof \think\Collection || $info instanceof \think\Paginator ) && $info->isEmpty()))): ?>
									<input type="password" class="form-control" name="password" id="password" minlength="6" minlength="16" >
										<span class="help-block m-b-none">不填写表示不修改</span>
									<?php else: ?>
									<input type="password" class="form-control" name="password" id="password" minlength="6" minlength="16"
										required="" aria-required="true">
									<?php endif; ?>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">角色：</label>
								<div class="input-group col-sm-7">
									<select class="form-control" name="role_id" id="role_id" required="" aria-required="true">
								        <option value="">=请选择=</option>
										<?php if(is_array($role) || $role instanceof \think\Collection || $role instanceof \think\Paginator): $i = 0; $__LIST__ = $role;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
										<option <?php if(isset($info)): if($vo['id'] == $info['role_id']): ?>selected<?php endif; endif; ?> value="<?php echo htmlentities($vo['id']); ?>"><?php echo htmlentities($vo['name']); ?></option>
										<?php endforeach; endif; else: echo "" ;endif; ?>
								    </select>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label">是否启用：</label>
								<div class="input-group col-sm-7">
									<div class="checkbox i-checks">
                                        <label>
                                            <input name="status" id="status" type="checkbox" value="1" <?php if(!(empty($info) || (($info instanceof \think\Collection || $info instanceof \think\Paginator ) && $info->isEmpty()))): if($info['status'] == 1): ?>checked<?php endif; else: ?>checked<?php endif; ?>> <i></i>
                                        </label>
                                    </div>
                                </div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label">手机：</label>
								<div class="input-group col-sm-7">
									<input type="text" class="form-control"  name="mobile" value='<?php if(!(empty($info) || (($info instanceof \think\Collection || $info instanceof \think\Paginator ) && $info->isEmpty()))): ?><?php echo htmlentities($info['mobile']); endif; ?>'>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">邮箱：</label>
								<div class="input-group col-sm-7">
									<input type="text" class="form-control" name="email" value='<?php if(!(empty($info) || (($info instanceof \think\Collection || $info instanceof \think\Paginator ) && $info->isEmpty()))): ?><?php echo htmlentities($info['email']); endif; ?>'>
								</div>
							</div>
							
							<?php if(!(empty($info) || (($info instanceof \think\Collection || $info instanceof \think\Paginator ) && $info->isEmpty()))): ?>
							<input type="hidden" name="id" value="<?php echo htmlentities($info['admin_id']); ?>" />
							<?php endif; ?>
							
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
    <script src="/static/admin/plugins/iCheck/icheck.min.js"></script>
	<script src="/static/admin/js/common.js"></script>
	<script type="text/javascript">
	$(function(){
		
		$(document).ready(function(){
			$(".i-checks").iCheck({
				checkboxClass:"icheckbox_square-green",
				radioClass:"iradio_square-green",
				})
		});
		
        $('#commentForm').ajaxForm({
            beforeSubmit: checkForm, 
            success: complete, 
            dataType: 'json'
        });
        
        function checkForm(){
            if( '' == $.trim($('#admin_name').val())){
                warn('请输入名称')
                return false;
            }
            //$('.btn_save').attr('disabled',true).addClass('disabled').text('提交中...');
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
