<?php /*a:1:{s:75:"E:\sjx\PHPTutorial\WWW\tp5.1demo\application\admin\view\mall\brand_add.html";i:1536634032;}*/ ?>
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
						<form class="form-horizontal m-t layui-form" id="commentForm" method="post"
							action="<?php echo url('mall/brand_ok'); ?>">
							<div class="form-group">
								<label class="col-sm-3 control-label">名称：</label>
								<div class="input-group col-sm-7">
									<input type="text" class="form-control" id="name" name="name" value='<?php if(!(empty($info['name']) || (($info['name'] instanceof \think\Collection || $info['name'] instanceof \think\Paginator ) && $info['name']->isEmpty()))): ?><?php echo htmlentities($info['name']); endif; ?>'
										required="" aria-required="true">
								</div>
							</div>
							
							<div class="form-group layui-form-item">
								<label class="col-sm-3 control-label">类别选择：</label>
								<div class="input-group col-sm-2 pull-left">
								     <select id="cate_id" name="cate_id" lay-filter="showNextBrand" lay-verify="required" required="" aria-required="true">
								        <option value=""></option>
								        <?php if(is_array($goods_cate) || $goods_cate instanceof \think\Collection || $goods_cate instanceof \think\Paginator): $i = 0; $__LIST__ = $goods_cate;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
								        <option <?php if(isset($info)): if($vo['id'] == $info['cate_id']): ?>selected<?php endif; endif; ?> value="<?php echo htmlentities($vo['id']); ?>" ><?php echo htmlentities($vo['name']); ?></option>
								        <?php endforeach; endif; else: echo "" ;endif; ?>
								     </select>
								</div>
								<div class="input-group col-sm-2 pull-left seldiv">
								     <select class="next_brand" id="next_cate_id" name="next_cate_id" lay-verify="required" required="" aria-required="true">
								        <option value=""></option>
								     </select>
								</div>
							</div>

                             <div class="form-group">
                                 <label class="col-sm-3 control-label">logo：</label>
                                 <div class="input-group col-sm-7">    
                                 	<div class="img_div">           
                                 		<img id="img_data" class="oneimg" <?php if(!(empty($info['path']) || (($info['path'] instanceof \think\Collection || $info['path'] instanceof \think\Paginator ) && $info['path']->isEmpty()))): ?>src="<?php echo htmlentities($info['path']); ?>"<?php else: ?>src="/static/admin/img/default.jpg"<?php endif; ?> />                          
                                    	<span class="delbtn">x</span>
                                    </div>
                                    <button type="button" class="layui-btn" id="uploadbtn">
	  									<i class="layui-icon">&#xe67c;</i>上传图片
						 			</button>
						 			<input type="hidden" name="path" id="img_path" <?php if(!(empty($info) || (($info instanceof \think\Collection || $info instanceof \think\Paginator ) && $info->isEmpty()))): ?>value="<?php echo htmlentities($info['path']); ?>"<?php endif; ?> />
                                 </div>
                             </div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label">排序：</label>
								<div class="input-group col-sm-7">
									<input id="keywords" class="form-control" name="sortnum" value='<?php if(!(empty($info['sortnum']) || (($info['sortnum'] instanceof \think\Collection || $info['sortnum'] instanceof \think\Paginator ) && $info['sortnum']->isEmpty()))): ?><?php echo htmlentities($info['sortnum']); endif; ?>' >
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
	
	layui.use('form', function(){
		  var form = layui.form;
		  form.on('select(showNextBrand)', function(data){
			  var val = data.value;
			  showNextBrand(val);
			});
		});
		
		function showNextBrand(val,post){
			if(val != ''){
				$.ajax({
					type: 'post',
					dataType:'json',
					data: {id:val,post:post},
					url: "<?php echo url('mall/showNextBrand'); ?>",
					success: function(res){
						if(res.code == 1){
							$(".next_brand").html(res.data);
							layui.form.render('select');
						}else{
							warn(res.msg);
						}
					},
			        error: function(XmlHttpRequest, textStatus, errorThrown){
						warn('网络错误，请稍后再试！');
					}
				});
			}else{
				$(".next_brand").html('<option value="">=请选择=</option>');
			}
		}
	
	$(function(){
		
		var path = "<?php if(isset($info)): ?><?php echo htmlentities($info['path']); endif; ?>";
		if(path){
			$("#uploadbtn").hide();
    	    $(".delbtn").show();
		}
		
		var cate_id = "<?php if(!(empty($info) || (($info instanceof \think\Collection || $info instanceof \think\Paginator ) && $info->isEmpty()))): ?><?php echo htmlentities($info['cate_id']); endif; ?>";
		var next_cate_id = "<?php if(!(empty($info) || (($info instanceof \think\Collection || $info instanceof \think\Paginator ) && $info->isEmpty()))): ?><?php echo htmlentities($info['next_cate_id']); endif; ?>";
		if(cate_id > 0 && next_cate_id > 0){
			showNextBrand(cate_id,next_cate_id);
		}
		
        $('#commentForm').ajaxForm({
            beforeSubmit: checkForm, 
            success: complete, 
            dataType: 'json'
        });
        
    	$(".i-checks").iCheck({
    		checkboxClass:"icheckbox_square-green",
    		radioClass:"iradio_square-green",
    		})
        
        function checkForm(){
            if( '' == $.trim($('#name').val())){
                warn('请输入名称')
                return false;
            }
            if( '' == $.trim($('#cate_id').val())){
                warn('请选择类别')
                return false;
            }
            if( '' == $.trim($('#next_cate_id').val())){
                warn('请选择二级类别')
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
	

	layui.use('upload', function(){
		  var upload = layui.upload;
		   
		  //执行实例
		  var uploadInst = upload.render({
		    elem: '#uploadbtn' //绑定元素
		    ,url: '<?php echo url("upload/uploadimg"); ?>' //上传接口
		    ,data:{'type':'brand'}
		    ,accept:'images'
		    ,done: function(res, index, upload){
		      //上传完毕回调
		      if(res.code == 1){
		    	   $("#uploadbtn").hide();
		    	  
		    	   $("#img_data").attr('src',res.data);
		    	   $(".delbtn").show();
		    	   
		    	   $("#img_path").val(res.data);
		      } else {
		    	  warn(res.msg,'error');
		      }
		    }
		    ,error: function(index, upload){
		      //请求异常回调
		      warn('上传失败');
		    }
		  });
		});	
	
	
	$(".delbtn").click(function(){
		var path = $(this).prev().attr('src');
		var obj = this;
		$.ajax({
			type: "POST",
			url: '<?php echo url("upload/delimg"); ?>',
			data: {path:path,type:'brand'},
			async: false,
			success: function(res) {
				
				$(obj).prev().attr('src','/static/admin/img/default.jpg');
				$("#uploadbtn").show();
				$(obj).hide();
				
				$("#img_path").val('');
			}
		})
		
	})
	</script>
</body>
</html>
