<?php /*a:1:{s:96:"D:\phpstudy\PHPTutorial\WWW\noob\sjx20190429\tp5.1demo\application\admin\view\infor\art_add.html";i:1562058226;}*/ ?>
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
							action="<?php echo url('infor/art_ok'); ?>">
							<div class="form-group">
								<label class="col-sm-3 control-label">负责人：</label>
								<div class="input-group col-sm-7">
									<select name="cont" id="cont">
										<?php if(is_array($admin) || $admin instanceof \think\Collection || $admin instanceof \think\Paginator): $i = 0; $__LIST__ = $admin;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
										<option value="<?php echo htmlentities($vo['admin_name']); ?>" <?php if(!(empty($info) || (($info instanceof \think\Collection || $info instanceof \think\Paginator ) && $info->isEmpty()))): if($info['cont'] == $vo['admin_name']): ?>selected<?php endif; endif; ?>><?php echo htmlentities($vo['admin_name']); ?></option>
										<?php endforeach; endif; else: echo "" ;endif; ?>
									</select>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label">发布人：</label>
								<div class="input-group col-sm-7">
									<input type="text" class="form-control" maxlength="16"  name="member" id="member" value="<?php if(!(empty($info) || (($info instanceof \think\Collection || $info instanceof \think\Paginator ) && $info->isEmpty()))): ?><?php echo htmlentities($info['member']); endif; ?>" required="" aria-required="true" >
								</div>
							</div>
							
                             <div class="form-group">
                                 <label class="col-sm-3 control-label">文章内容：</label>
                                 <div class="input-group col-sm-7">                                              
									<textarea name="message" id="message" style="overflow:hidden;resize: none;width: 100%;height: 60px;margin-bottom: 20px;"><?php if(!(empty($info) || (($info instanceof \think\Collection || $info instanceof \think\Paginator ) && $info->isEmpty()))): ?><?php echo htmlentities($info['message']); endif; ?></textarea>
                                 </div>
                             </div>
							
							
							
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
	<script src="/static/admin/plugins/ueditor/ueditor.config.js"></script>
	<script src="/static/admin/plugins/ueditor/ueditor.all.js"></script>
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
            if( '' == $.trim($('#cont').val())){
                warn('请输入负责人')
                return false;
            }
            if( '' == $.trim($('#member').val())){
                warn('请填写发布人')
                return false;
            }
            if( '' == $.trim($('#message').val())){
                warn('请输入内容')
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
