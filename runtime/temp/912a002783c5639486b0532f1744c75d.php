<?php /*a:1:{s:101:"D:\phpstudy\PHPTutorial\WWW\noob\sjx20190429\tp5.1demo\application\admin\view\system\button_prev.html";i:1535629652;}*/ ?>
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
<link rel="stylesheet" href="/static/admin/plugins/ztree/css/ztree.css" type="text/css">
<script src="/static/admin/js/jquery.min.js"></script>
<script type="text/javascript" src="/static/admin/plugins/ztree/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="/static/admin/plugins/ztree/js/jquery.ztree.excheck-3.5.js"></script>
</head>

<script>
showButton(<?php echo htmlentities($flag); ?>);

var setting = {    
	data:{
		simpleData:{
			enable:true
		}
	},
};
var zNodes = <?php echo $module; ?>;
$(document).ready(function(){
	$.fn.zTree.init($("#moduleTree"), setting, zNodes);
});
function onClick(e,treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("moduleTree");
	zTree.expandNode(treeNode);
}

function showButton(id) {
	$.ajax({
	 type: "POST",
	 url: "<?php echo url('system/show_button'); ?>",
	 data: {id:id},
	 async: false,
	 success: function(res) {
		var obj = eval("("+res+")");
		var divObj = $("#div_toolbar").children();
		divObj.each(function (i) {
			$(this).css('display', 'none');
			for(j = 0; j < obj.length; j++) {
				var thisId = 'button'+id+'-'+obj[j];
				if($(this).attr('id') == thisId)
				$("#"+thisId).css('display', 'inline-block');
			}
		})
	 }
 })
}
</script>

<style>
.yc{display:none;padding:10px 0 0 10px;}
</style>

<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="float-e-margins">
					<div class="ibox-content">
						<form class="form-horizontal m-t" id="commentForm" method="post"
							action="<?php echo url('system/button_prev_ok'); ?>">
							
							<div class="zTreeDemoBackground pull-left">
								<ul id="moduleTree" class="ztree" style="width:250px;"></ul>
							</div>
						    
						    <div class="bd" style="width:310px; float:right; height:360px; margin-top: 10px;border:1px solid #617775;">
							  <div class="cl pd-5 mt-20 right">
							    <span class="l" id="div_toolbar">
							    	<?php if(is_array($all) || $all instanceof \think\Collection || $all instanceof \think\Paginator): $i = 0; $__LIST__ = $all;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
						    		<p class="yc" id="button<?php echo htmlentities($vo['module'].'-'.$vo['id']); ?>" >
						    			<a href="javascript:;" id="btn<?php echo htmlentities($vo['module']); ?>" class="btn btn-outline <?php if(isset($button[$vo['module']]) && in_array($vo['id'], $button[$vo['module']])){ echo ' btn-primary'; }else{ echo 'btn-default'; } ?>"><input type="hidden" value="<?php echo htmlentities($vo['module'].'-'.$vo['id']); ?>" /><i class="icon-plus"></i> <?php echo htmlentities($vo['name']); ?></a>
									</p>
							    	<?php endforeach; endif; else: echo "" ;endif; ?>
							    </span>
							  </div>
							</div>
						    
						    <input type="hidden" name="item" id="item" />
						    <input type="hidden" name="id" value="<?php echo htmlentities($info['id']); ?>" />
						    
							<div class="clearfix"></div>
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
		    if($(this).hasClass('btn-primary'))
		    {
		    	$(this).removeClass('btn-primary').addClass('btn-default');
		    }
		    else
		    {
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
        
        function modifySubmitData()
        {
        	var item = "";
        	$('#div_toolbar p').find(".btn-primary").each(function () {
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
