<?php /*a:1:{s:75:"E:\sjx\PHPTutorial\WWW\tp5.1demo\application\admin\view\mall\goods_add.html";i:1537408141;}*/ ?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>添加</title>
<link rel="shortcut icon" href="favicon.ico">
<link href="/static/admin/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="/static/admin/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
<link href="/static/admin/css/plugins/steps/jquery.steps.css" rel="stylesheet">
<link href="/static/admin/css/animate.min.css" rel="stylesheet">
<link href="/static/admin/css/style.min.css?v=4.1.0" rel="stylesheet">
<link href="/static/admin/css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="/static/admin/plugins/layui/css/layui.css" rel="stylesheet">
<link href="/static/admin/css/base.css" rel="stylesheet">
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="float-e-margins">
					<div class="ibox-content">
						<form class="form-horizontal m-t layui-form" id="commentForm" method="post"
							action="<?php echo url('mall/goods_ok'); ?>">
							<div class="form-group">
								<label class="col-sm-3 control-label"><em>*</em>商品名称：</label>
								<div class="input-group col-sm-7">
									<input type="text" class="form-control" maxlength="16"  name="name" id="name" value="<?php if(!(empty($info) || (($info instanceof \think\Collection || $info instanceof \think\Paginator ) && $info->isEmpty()))): ?><?php echo htmlentities($info['name']); endif; ?>" required="" aria-required="true" >
								</div>
							</div>
							<div class="form-group layui-form-item">
								<label class="col-sm-3 control-label"><em>*</em>类别：</label>
								<div class="input-group col-sm-7 pull-left">
								     <select id="category_id" name="category_id" lay-filter="category_id"  lay-verify="category_id" required="" aria-required="true">
								        <option value=""></option>
										<?php if(is_array($tree) || $tree instanceof \think\Collection || $tree instanceof \think\Paginator): $i = 0; $__LIST__ = $tree;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
										<option <?php if(isset($info)): if($vo['id'] == $cate_id): ?>selected<?php endif; endif; ?> value="<?php echo htmlentities($vo['id']); ?>"><?php echo str_repeat('　',$vo['level']); ?><?php echo htmlentities($vo['name']); ?></option>
										<?php endforeach; endif; else: echo "" ;endif; ?>
								     </select>
								</div>
							</div>
							
							<div class="form-group layui-form-item">
								<label class="col-sm-3 control-label">品牌：</label>
								<div class="input-group col-sm-7 pull-left">
								     <select id="brand_id" name="brand_id" lay-filter="brand_id"  lay-verify="brand_id" required="" aria-required="true">
								        <option value=""></option>
										<?php if(is_array($brand) || $brand instanceof \think\Collection || $brand instanceof \think\Paginator): $i = 0; $__LIST__ = $brand;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
										<option <?php if(isset($info)): if($vo['id'] == $info['brand_id']): ?>selected<?php endif; endif; ?> value="<?php echo htmlentities($vo['id']); ?>"><?php echo htmlentities($vo['name']); ?></option>
										<?php endforeach; endif; else: echo "" ;endif; ?>
								     </select>
								</div>
							</div>
							
							<div class="form-group">
                                <label class="col-sm-3 control-label">计量单位：</label>
                                <div class="input-group col-sm-7">
                                    <input type="text" class="form-control" name="unit" id="unit" value="<?php if(!(empty($info) || (($info instanceof \think\Collection || $info instanceof \think\Paginator ) && $info->isEmpty()))): ?><?php echo htmlentities($info['unit']); endif; ?>" placeholder="件/双/千克/个..." >
                                </div>
                            </div> 
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label">重量：</label>
                                <div class="input-group col-sm-7">
                                    <input type="text" class="form-control" name="weight" id="weight" value="<?php if(!(empty($info) || (($info instanceof \think\Collection || $info instanceof \think\Paginator ) && $info->isEmpty()))): ?><?php echo htmlentities($info['weight']); endif; ?>" placeholder="kg" >
                                </div>
                            </div> 

                             <div class="form-group">
                                 <label class="col-sm-3 control-label"><em>*</em>商品图片：</label>
                                 <div class="input-group col-sm-7">
                                    <button type="button" class="layui-btn" id="uploadbtn" <?php if(isset($goods_photo)): if(count($goods_photo) > 4): ?>style="display:none;"<?php endif; endif; ?>>
	  									<i class="layui-icon">&#xe67c;</i>上传图片
						 			</button>
						 			<span class="help-block m-b-none">最多上传5张图片，每张大小限制2M内</span>
						 			<div class="pic-more">
								        <ul class="pic-more-upload-list" id="slide-pc-priview">
								        	<?php if(isset($goods_photo)): if(is_array($goods_photo) || $goods_photo instanceof \think\Collection || $goods_photo instanceof \think\Paginator): $i = 0; $__LIST__ = $goods_photo;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
								        	<li class="item_img<?php if($vo['path'] == $info["path"]): ?> active<?php endif; ?>">
								        		<div class="operate">
									        		<i class="toleft layui-icon"></i>
									        		<i class="toright layui-icon"></i>
									        		<i  class="closediv">x</i>
								        		</div>
								        		<img src="<?php echo htmlentities($vo['path']); ?>" class="img" >
								        		<input type="hidden" name="goods_photo[]" value="<?php echo htmlentities($vo['path']); ?>" />
								        	</li>
								        	<?php endforeach; endif; else: echo "" ;endif; endif; ?>
								        </ul>
								     </div>
                                 </div>
                             </div>
                             <input type="hidden" value="<?php if(isset($goods_photo)): ?><?php echo count($goods_photo); else: ?>0<?php endif; ?>" id="imgnum" />
                             <input type="hidden" name="path" id="path" value="<?php if(isset($info)): ?><?php echo htmlentities($info['path']); endif; ?>" />
                             
							<div class="form-group layui-form-item">
								<label class="col-sm-3 control-label">状态：</label>
								<div class="input-group col-sm-7">
                                    <div class="input-group col-sm-7 layui-input-block">
								      <input type="checkbox" name="status" lay-text="上架|下架" value="1" <?php if(!(empty($info) || (($info instanceof \think\Collection || $info instanceof \think\Paginator ) && $info->isEmpty()))): if($info['status'] == 1): ?>checked<?php endif; endif; ?> lay-skin="switch" lay-filter="switch" >
								    </div>
                                </div>
							</div>
							<div class="form-group">
                                <label class="col-sm-3 control-label">排序：</label>
                                <div class="input-group col-sm-7">
                                    <input type="number" class="form-control" name="sortnum" id="sortnum" value="<?php if(!(empty($info) || (($info instanceof \think\Collection || $info instanceof \think\Paginator ) && $info->isEmpty()))): ?><?php echo htmlentities($info['sortnum']); endif; ?>" placeholder="请输入排序数字，越小排列越靠前" >
                                </div>
                            </div> 
							
							<div class="form-group layui-form-item">
								<label class="col-sm-3 control-label"><em>*</em>药品分类：</label>
								<div class="input-group col-sm-7">
                                    <select id="type_id" name="type_id" lay-filter="type_id" lay-verify="type_id" required="" aria-required="true">
								        <option <?php if(isset($info)): if($info['type_id'] == 0): ?>selected<?php endif; endif; ?> value="0">非处方药</option>
								        <option <?php if(isset($info)): if($info['type_id'] == 1): ?>selected<?php endif; endif; ?> value="1">处方药</option>
								     </select>
                                </div>
							</div>
							<div class="form-group add_question_div">
                               <div class="col-sm-offset-3 col-sm-8">
                               		<button type="button" class="btn btn-w-m btn-info sel_question">☝ 选择问题</button>
                               		<button type="button" class="btn btn-w-m btn-success add_question">+ 添加问题</button>
                               </div>
                           </div>
							<div class='question_div'>
								<div class='sel_q'>
									<?php if(isset($goods_question)): if(is_array($goods_question) || $goods_question instanceof \think\Collection || $goods_question instanceof \think\Paginator): $i = 0; $__LIST__ = $goods_question;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
									<div class='form-group'><label class='col-sm-3 control-label'>问题：</label><div class='input-group col-sm-5 pull-left' ><input type='text' class='form-control' id='question' name='question[]' value='<?php echo htmlentities($vo['content']); ?>' ></div><div class='input-group col-sm-2 question_btn'><button type='button' class='btn btn-outline btn-danger pull-right question_del' ><i class='fa fa-trash-o'></i></button><button type='button' class='btn btn-outline btn-success pull-right down<?php if($i == count($goods_question)): ?> disabled<?php endif; ?>' ><i class='fa fa-arrow-down'></i></button><button type='button' class='btn btn-outline btn-primary pull-right up<?php if($i == 1): ?> disabled<?php endif; ?>' ><i class='fa fa-arrow-up'></i></button></div></div>
									<?php endforeach; endif; else: echo "" ;endif; endif; ?>
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							
							
							<div class="form-group layui-form-item">
								<label class="col-sm-3 control-label">启用规格：</label>
								<div class="input-group col-sm-7">
                                    <div class="input-group col-sm-7 layui-input-block">
								      <input type="checkbox" name="is_spec" id="is_spec" lay-text="开启|关闭" value="1" <?php if(!(empty($info) || (($info instanceof \think\Collection || $info instanceof \think\Paginator ) && $info->isEmpty()))): if($info['is_spec'] == 1): ?>checked<?php endif; endif; ?> lay-skin="switch" lay-filter="is_spec" >
								    </div>
                                </div>
							</div>
							<div class="no_spec" <?php if(isset($info)): if($info['is_spec'] == 1): ?>style='display:none'<?php endif; endif; ?> >
								<div class="form-group">
	                                <label class="col-sm-3 control-label">商品编码：</label>
	                                <div class="input-group col-sm-7">
	                                    <input type="text" class="form-control" name="goods_sn" id="goods_sn" value="<?php if(!(empty($info) || (($info instanceof \think\Collection || $info instanceof \think\Paginator ) && $info->isEmpty()))): ?><?php echo htmlentities($info['goods_sn']); endif; ?>" placeholder="商品编码" >
	                                </div>
	                            </div> 
	                            <div class="form-group">
	                                <label class="col-sm-3 control-label"><em>*</em>市场价：</label>
	                                <div class="input-group col-sm-7">
	                                    <input type="number" class="form-control" name="market_price" id="market_price" value="<?php if(!(empty($info) || (($info instanceof \think\Collection || $info instanceof \think\Paginator ) && $info->isEmpty()))): ?><?php echo htmlentities($info['market_price']); endif; ?>" placeholder="市场价" >
	                                </div>
	                            </div> 
	                            <div class="form-group">
	                                <label class="col-sm-3 control-label"><em>*</em>售价：</label>
	                                <div class="input-group col-sm-7">
	                                    <input type="number" class="form-control" name="sell_price" id="sell_price" value="<?php if(!(empty($info) || (($info instanceof \think\Collection || $info instanceof \think\Paginator ) && $info->isEmpty()))): ?><?php echo htmlentities($info['sell_price']); endif; ?>" placeholder="售价" >
	                                </div>
	                            </div> 
	                            <div class="form-group">
	                                <label class="col-sm-3 control-label">库存：</label>
	                                <div class="input-group col-sm-7">
	                                    <input type="number" class="form-control" name="stock" id="stock" value="<?php if(!(empty($info) || (($info instanceof \think\Collection || $info instanceof \think\Paginator ) && $info->isEmpty()))): ?><?php echo htmlentities($info['stock']); endif; ?>" placeholder="库存" >
	                                </div>
	                            </div> 
                            </div>
                            
                            <?php if(isset($have_spec)): if(is_array($have_spec) || $have_spec instanceof \think\Collection || $have_spec instanceof \think\Paginator): $i = 0; $__LIST__ = $have_spec;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
							<div class="form-group selspec">
								<label class="col-sm-3 control-label"><?php echo htmlentities($vo['name']); ?>：</label>
								<div class="input-group col-sm-7">
									<?php if(is_array($vo['arr']) || $vo['arr'] instanceof \think\Collection || $vo['arr'] instanceof \think\Paginator): $i = 0; $__LIST__ = $vo['arr'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vv): $mod = ($i % 2 );++$i;?>
									<a id="btn" class="btn btn-outline <?php if($vv['flag'] == 1): ?>btn-primary<?php else: ?>btn-default<?php endif; ?>" p_name="<?php echo htmlentities($vo['name']); ?>" spec_id="<?php echo htmlentities($vo['id']); ?>" item_id="<?php echo htmlentities($vv['id']); ?>" ><?php echo htmlentities($vv['name']); ?></a>
									<?php endforeach; endif; else: echo "" ;endif; ?>
									<button type="button" class="btn btn-outline btn-primary pull-right other_spec_item_btn" ><i class="fa fa-plus"></i></button><button type="button" class="btn btn-outline btn-danger pull-right spec_del" ><i class="fa fa-trash-o"></i></button>
								</div>
							</div>
							<?php endforeach; endif; else: echo "" ;endif; endif; ?>
                            <div class='spec_div' <?php if(isset($info)): if($info['is_spec'] == 1): ?>style='display:block'<?php endif; endif; ?>>
                            	<div class="form-group">
									<label class="col-sm-3 control-label"></label>
									<div class="input-group col-sm-7"  id="show_spec">
	                                </div>
								</div>
							</div>
							<div class="form-group spec_btn" <?php if(isset($info)): if($info['is_spec'] == 1): ?>style='display:block'<?php endif; endif; ?>>
                                <div class="col-sm-offset-3 col-sm-8">
                                	<button type="button" class="btn btn-w-m btn-info sel_spec">☝  选择规格项</button>
                                	<button type="button" class="btn btn-w-m btn-success add_spec">+ 添加规格项</button>
                                </div>
                            </div>
							<div class="hr-line-dashed"></div>
							
							<div class="form-group">
                                 <label class="col-sm-3 control-label">模型管理：</label>
                                 <div class="input-group col-sm-7">
                                    <select id="gm_id" name="gm_id" lay-filter="gm_id" lay-verify="gm_id" >
								        <option value=""></option>
								        <?php if(is_array($g_model) || $g_model instanceof \think\Collection || $g_model instanceof \think\Paginator): $i = 0; $__LIST__ = $g_model;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
								        <option <?php if(isset($info)): if($vo['id'] == $info['gm_id']): ?>selected<?php endif; endif; ?> value="<?php echo htmlentities($vo['id']); ?>"><?php echo htmlentities($vo['name']); ?></option>
								        <?php endforeach; endif; else: echo "" ;endif; ?>
								     </select>
                                 </div>
                             </div>
                             <div>
                            	  <div class="form-group model_div" <?php if(isset($info)): if($info['gm_id'] > 0): ?>style='display:block'<?php endif; endif; ?>>
									  <label class="col-sm-3 control-label"></label>
									  <div class="input-group col-sm-6">
					                        <table class="table table-bordered">
					                            <thead>
					                                <tr>
					                                    <th>属性名</th>
					                                    <th>属性值</th>
					                                </tr>
					                            </thead>
					                            <tbody class="model_tr_box">
					                            	 <?php if(isset($all_attr)): if(is_array($all_attr) || $all_attr instanceof \think\Collection || $all_attr instanceof \think\Paginator): $i = 0; $__LIST__ = $all_attr;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
					                            	 <tr><td><?php echo htmlentities($vo); ?></td><td><input class="form-control text-center" type="text" name="attr_<?php echo htmlentities($key); ?>[]" value="<?php if(in_array($key,$attr_arr)){ echo $goods_attr[$key]; }else{ echo ''; } ?>" /></td></tr>
					                            	 <?php endforeach; endif; else: echo "" ;endif; endif; ?>
					                            </tbody>
					                        </table>
							            </div>
								  </div>
								  <div class="form-group">
		                               <div class="col-sm-offset-3 col-sm-8">
		                               		<button type="button" class="btn btn-w-m btn-info add_model">☝  添加模型</button>
		                               		<button type="button" class="btn btn-w-m btn-success add_attr" <?php if(isset($info)): if($info['gm_id'] > 0): ?>style='display:inline-block'<?php endif; endif; ?>>+ 添加属性值</button>
		                               </div>
		                          </div>
							 </div>
                             
							
                            <div class="form-group">
                                 <label class="col-sm-3 control-label">商品详情：</label>
                                 <div class="input-group col-sm-7">                                              
                                      <script id="editor" name="content" style="height:500px;" type="text/plain" ><?php if(!(empty($info) || (($info instanceof \think\Collection || $info instanceof \think\Paginator ) && $info->isEmpty()))): ?><?php echo htmlspecialchars_decode($info['content']); endif; ?></script>
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
	<script src="/static/admin/plugins/staps/jquery.steps.min.js"></script>
	<script src="/static/admin/plugins/validate/jquery.validate.min.js"></script>
    <script src="/static/admin/plugins/validate/messages_zh.min.js"></script>
    <script src="/static/admin/js/demo/form-validate-demo.min.js"></script>
    <script src="/static/admin/plugins/layer/layer.js"></script>
    <script src="/static/admin/plugins/layui/layui.js"></script>
	<script src="/static/admin/plugins/ueditor/ueditor.config.js"></script>
	<script src="/static/admin/plugins/ueditor/ueditor.all.js"></script>
	<script type="text/javascript">
	
	$(function(){
		//默认加载出已选中规格的表格列表
		ajaxGetSpecInput();
	})
	
	//点击规格选项
	$('body').on("click", '.selspec a', function (e) {
		if($(this).hasClass('btn-default')){
		    $(this).removeClass('btn-default');
		    $(this).addClass('btn-primary');
	    }else{
		    $(this).removeClass('btn-primary');
		    $(this).addClass('btn-default');
	    }
	    ajaxGetSpecInput();	  
	})
	
	function ajaxGetSpecInput(){
		//var spec_arr = {1:[1,2]};// 用户选择的规格数组 	  
		//spec_arr[2] = [3,4]; 
		var spec_arr = {};// 用户选择的规格数组 	  	  
		// 选中了哪些属性	  
		$(".selspec a").each(function(){
		    if($(this).hasClass('btn-primary'))	{
				var spec_id = $(this).attr('spec_id');
				var item_id = $(this).attr('item_id');
				if(!spec_arr.hasOwnProperty(spec_id))
					spec_arr[spec_id] = [];
			    spec_arr[spec_id].push(item_id);
				//console.log(spec_arr);
			}		
		});
		ajaxGetSpecInput2(spec_arr); // 显示下面的输入框
	}
	
	
	/**
	* 根据用户选择的不同规格选项 
	* 返回 不同的输入框选项
	*/
	function ajaxGetSpecInput2(spec_arr) {
		var goods_id = $("input[name='id']").val();
	    $.ajax({
	        type: 'POST',
	        data: {spec_arr: spec_arr, goods_id: goods_id},
	        url: '<?php echo url("mall/ajaxGetSpecInput"); ?>',
	        success: function (res) {
	        	$("#show_spec").html('').append(res);
	            hbdyg();  // 合并单元格
	            /*
	            $("#spec_input_tab").find('tr').each(function (index, item) {
	                var price = $(this).find("input[name$='[price]']").val();
	                var store_count = $(this).find("input[name$='[store_count]']").val();
	                if(store_count == 0 && price == 0){
	                    $(this).find(".delete_item").trigger('click');
	                }
	            });
	            */
	        }
	    });
	}
	
		
	 // 合并单元格
	 function hbdyg() {
          var tab = document.getElementById("spec_input_tab"); //要合并的tableID
          var maxCol = 2, val, count, start;  //maxCol：合并单元格作用到多少列  
          if (tab != null) {
              for (var col = maxCol - 1; col >= 0; col--) {
                  count = 1;
                  val = "";
                  for (var i = 0; i < tab.rows.length; i++) {
                      if (val == tab.rows[i].cells[col].innerHTML) {
                          count++;
                      } else {
                          if (count > 1) { //合并
                              start = i - count;
                              tab.rows[start].cells[col].rowSpan = count;
                              for (var j = start + 1; j < i; j++) {
                                  tab.rows[j].cells[col].style.display = "none";
                              }
                              count = 1;
                          }
                          val = tab.rows[i].cells[col].innerHTML;
                      }
                  }
                  if (count > 1) { //合并，最后几行相同的情况下
                      start = i - count;
                      tab.rows[start].cells[col].rowSpan = count;
                      for (var j = start + 1; j < i; j++) {
                          tab.rows[j].cells[col].style.display = "none";
                      }
                  }
              }
          }
      }
	 
     $('body').on("click", '.delete_item', function (e) {
         if($(this).text() == '无效'){
             $(this).parent().parent().find('input').removeAttr('disabled');
             $(this).text('有效');
             $(this).removeClass('btn-default').addClass('btn-success');
         }else{
             $(this).text('无效');
             $(this).parent().parent().find('input').attr('disabled','disabled');
             $(this).removeClass('btn-success').addClass('btn-default');
         }
     })
	
	layui.use('form', function(){
	    var form = layui.form;
		//选择处方药出现问题
	    form.on('select(type_id)', function(data){
		    var val = data.value;
		    if(val == 1){
		    	$(".add_question_div").show();	//处方药
		    	$(".question_div").show();
		    }else{
		    	$(".add_question_div").hide();
		    	$(".question_div").hide();
		    }
		});
	    
	    //开启关闭规格
	    form.on('switch(is_spec)', function(data){
	    	var switchChecked = data.elem.checked;
			if(switchChecked==true){	//选中
				$('.no_spec').hide();
				$('.spec_btn').show();
				$('.spec_div').show();
				$('.selspec').show();
			}else{	//取消
				$('.spec_btn').hide();
				$('.no_spec').show();
				$('.spec_div').hide();
				$('.selspec').hide();
			}
	    });  
	    
	    //选择模型加载出对应模型
	    form.on('select(gm_id)', function(data){
			if(data.value > 0){	//选中
				showattr(data.value);
				$('.model_div').show();
			}else{	//取消
				$('.model_div').hide();
				$(".add_attr").hide();
			}
	    }); 
	});
	
	function showattr(gm_id){
		$.ajax({
			type: "POST",
			url: '<?php echo url("mall/showattr"); ?>',
			data: {gm_id:gm_id},
			async: false,
			success: function(res) {
				if(res.code == 1){
					//加载出该模型对应的属性值
					var attr = eval(res.data);
					var attr_html = '';
					for(var i=0;i<attr.length;i++){
						attr_html += '<tr><td>'+attr[i]['name']+'</td><td><input class="form-control text-center" type="text" name="attr_'+attr[i]['id']+'[]" /></td></tr>';
					}
					$(".model_tr_box").html(attr_html);
					
					//此时出现添加该模型的属性值按钮
					$(".add_attr").show();
				}
			}
		})
	}
	

	$(function(){
		
		var type_id = "<?php if(isset($info['type_id'])): ?><?php echo htmlentities($info['type_id']); endif; ?>";
		if(type_id > 0){
			$(".add_question_div").show();	//处方药
	    	$(".question_div").show();
		}
		
		$(".i-checks").iCheck({
			checkboxClass:"icheckbox_square-green",
			radioClass:"iradio_square-green",
		})
		
		//选择问题
        $(".sel_question").click(function(){
			//alert($('.spec_div').prop("outerHTML"));
			index = layer.open({
							title: '添加问题',
			       		    type: 1,
			       		 	scrollbar: false,
			       		    content: $('#question_div'), //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
			       		    area: ['800px', '400px']
			        	});
		})
        
		//关闭问题弹出层
		$(".question_close,.spec_close,.add_spec_close,.model_close,.attr_close,.add_attr_close").click(function(){
			//var index = parent.layer.getFrameIndex(window.name);
			layer_close();
		})
		
		//添加问题
		$(".add_question").click(function(){
			var add_question_html = "<div class='form-group'><label class='col-sm-3 control-label'>问题：</label><div class='input-group col-sm-5 pull-left' ><input type='text' class='form-control' id='question' name='question[]' value='' ></div><div class='input-group col-sm-2 question_btn'><button type='button' class='btn btn-outline btn-danger pull-right question_del' ><i class='fa fa-trash-o'></i></button><button type='button' class='btn btn-outline btn-success pull-right down' ><i class='fa fa-arrow-down'></i></button><button type='button' class='btn btn-outline btn-primary pull-right up' ><i class='fa fa-arrow-up'></i></button></div></div>";
			$('.sel_q').append(add_question_html);
			updownrule();
		})
		
		//保存选中的问题
		$(".question_save").click(function(){
			var html = '';
			var obj = $("#question_div").find('tbody tr');
			for(var i=0;i<obj.length;i++){
				if(obj.eq(i).find('div').hasClass('checked')){
					var q_id = obj.eq(i).attr('rel');
					var q_con = obj.eq(i).find('td.con').html();
					html += "<div class='form-group'><label class='col-sm-3 control-label'>问题：</label><div class='input-group col-sm-5 pull-left' ><input type='text' class='form-control' id='question' name='question[]' value='"+q_con+"' ></div><div class='input-group col-sm-2 question_btn'><button type='button' class='btn btn-outline btn-danger pull-right question_del' ><i class='fa fa-trash-o'></i></button><button type='button' class='btn btn-outline btn-success pull-right down' ><i class='fa fa-arrow-down'></i></button><button type='button' class='btn btn-outline btn-primary pull-right up' ><i class='fa fa-arrow-up'></i></button></div></div>";
				}
			}
			$('.sel_q').prepend(html);
			updownrule();
			layer.close(layer.index);
		})
		
		 //下移
		 $("body").on("click",".question_div .input-group .up",function(){
		     var btn_index = $(this).closest(".form-group").index();
		     if(btn_index >= 1){
		         $(this).closest(".form-group").insertBefore($(this).closest(".question_div").find(".form-group").eq(Number(btn_index)-1));
		     }
		     updownrule();
		 });
		//上移
		 $("body").on("click",".question_div .input-group .down",function(){
		     var btn_index = $(this).closest(".form-group").index();
		     $(this).closest(".form-group").insertAfter($(this).closest(".question_div").find(".form-group").eq(Number(btn_index)+1));
		     
		     updownrule();
		 });
		//上移下移出现的规则
		function updownrule(){
			var ud = $(".question_div .form-group");
			ud.eq(0).find('.input-group .up').addClass('disabled').parents('.form-group').siblings().find('.input-group .up').removeClass('disabled');
			ud.eq(ud.length-1).find('.input-group .down').addClass('disabled').parents('.form-group').siblings().find('.input-group .down').removeClass('disabled');
		}
		//删除当前问题
		$('body').on('click', '.question_del', function() { 
			$(this).parents('.form-group').remove();
			updownrule();
		})
		
		
		//弹出选择规格按钮
		$(".sel_spec").click(function(){
			var index = layer.open({
				title: '选择规格',
       		    type: 1,
       		 	scrollbar: false,
       		    content: $('#sel_spec_div'), //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
       		    area: ['800px', '250px']
        	});
		})

		
		//保存选中的规格
		$(".spec_save").click(function(){
			var sel_spec_id = $("#sel_spec_id").val();
			if(sel_spec_id == ''){
				alert('请选择规格选项');
			}else{
				var item = $("#sel_spec_id").find("option:selected").attr('id');
				var name = $("#sel_spec_id").find("option:selected").html();
				//当前选中规格下次不能再选择
				$("#sel_spec_id").find("option:selected").prop('disabled', true).addClass('nosel');
				$("#sel_spec_id").val('');
				
				var item_obj = JSON.parse(item);
				var spec_html = '<div class="form-group selspec"><label class="col-sm-3 control-label">'+name+'：</label><div class="input-group col-sm-7">';
				for(var i in item_obj){ 
					//item_id.push(i);
					//item_name.push(item_obj[i]);
					spec_html += '<a id="btn" class="btn btn-outline btn-default" p_name="'+name+'" spec_id="'+sel_spec_id+'" item_id="'+i+'" >'+item_obj[i]+'</a>';
				} 
				spec_html += '<button type="button" class="btn btn-outline btn-primary pull-right other_spec_item_btn" ><i class="fa fa-plus"></i></button><button type="button" class="btn btn-outline btn-danger pull-right spec_del" ><i class="fa fa-trash-o"></i></button></div></div>';
				$(".spec_div").prepend(spec_html);
				$(".spec_div").show();
				layer_close();
			}
		})
		
		
		//附加规格值
		$("body").on("click",".selspec .other_spec_item_btn",function(){
			var index = layer.open({
								title: '添加规格值',
				       		    type: 1,
				       		 	scrollbar: false,
				       		    content: $('#other_spec_item_div'), //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
				       		    area: ['800px', '250px']
				        	});
			other_spec = this;
		});
		
		//保存附加的规格值
		$(".other_spec_item_save").click(function(){
			var other_spec_item = $("#other_spec_item").val();
			if(other_spec_item == ''){
				alert('请输入规格值');
			}else{
				var p_name = $(other_spec).prev('a').attr('p_name');
				var sel_spec_id = $(other_spec).prev('a').attr('spec_id');
				//当前规格值加入该规格项
				$.ajax({
					type: "POST",
					url: '<?php echo url("mall/add_spec_item"); ?>',
					data: {spec_id:sel_spec_id,spec_item:other_spec_item},
					async: false,
					success: function(res) {
						if(res.code == 1){
							layer_close();
							//附加在当前规格项里
							$(other_spec).before('<a id="btn" class="btn btn-outline btn-default" p_name="'+p_name+'" spec_id="'+sel_spec_id+'" item_id="'+res.data+'" status="0" onclick="selectSpecItem(this)">'+other_spec_item+'</a>')
							$("#other_spec_item").val('');
						}else{
							alert(res.msg);
						}
					}
				})
				
			}
		})
		
		//删除选中的规格一项
		$("body").on("click",".selspec .spec_del",function(){
		     $(this).closest('.selspec').remove();
		     
		     //同时原弹出层规格可以选中
		     var sel_spec_id = $(this).parent().find('a').eq(0).attr('spec_id');
		     $("#sel_spec_id").find('.spec_flag'+sel_spec_id).removeClass('nosel').attr('disabled',false);
		     
		     //同时选中的规格类型也得删除
		     var td = $("#show_spec").find('td');
		     for(var i=0;i<td.length;i++){
		    	 if(td.eq(i).attr('spec_id') == sel_spec_id){
		    		 td.eq(i).parent('tr').remove();
		    	 }
		     }
		     ajaxGetSpecInput();
		});
		
		
		//添加规格项及规格值
		$(".add_spec").click(function(){
			var index = layer.open({
				title: '添加规格项',
       		    type: 1,
       		 	scrollbar: false,
       		    content: $('#add_spec_div'), //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
       		    area: ['800px', '450px']
        	});
		})
		
		
		//添加模型及属性
		$(".add_model").click(function(){
			var index = layer.open({
				title: '添加模型',
       		    type: 1,
       		 	scrollbar: false,
       		    content: $('#add_model_div'),
       		    area: ['800px', '350px']
        	});
			/*
			var attr_html = '';
			$('.model_tr_box').htm()
			*/
		})
		
		
		var ue = UE.getEditor('editor');
		ue.ready(function() {
		});
			
        $('#commentForm').ajaxForm({
            beforeSubmit: checkForm, 
            beforeSerialize: modifySubmitData,
            success: complete, 
            dataType: 'json'
        });
        
        function modifySubmitData(){
        	//修改选中的默认图片
            var default_path = $("#slide-pc-priview").find('li.active').find('img').attr('src');
            if(default_path){
            	$("#path").val(default_path) 
            }
        }
        
        function checkForm(){
            if( '' == $.trim($('#name').val())){
                warn('请输入名称')
                return false;
            }
            if( '' == $.trim($('#category_id').val())){
                warn('请选择类别')
                return false;
            }
			var img = $("#slide-pc-priview").find('li');
			if(img.length == 0){
				warn('请上传商品图片')
                return false;
			}
			
			var type_id = $("#type_id").val();
			if(type_id == 1){
				var q_arr = new Array();
				//处方药必须有问题
				$("input[name='question[]']").each(function(){
					if($(this).val()){
						q_arr.push($(this).val());
					}
		        })
		        if(q_arr.length == 0){
		        	warn('处方药必须有问题');
		        	return false;
		        }
			}
			
			if(!$('#is_spec').next().hasClass('layui-form-onswitch')){
				//未启用
				if(!($.trim($('#market_price').val())  > 0)){
					warn('请输入正确的市场价');
					return false;
				}
				if(!($.trim($('#sell_price').val()) > 0)){
					warn('请输入正确的售价');
					return false;
				}
				if(!($.trim($('#stock').val()) > 0)){
					warn('请输入正确的库存');
					return false;
				}
			}else{
				if($("#show_spec .sell_price").length == 0){
					warn('请添加规格');
					return false;
				}else{
					var i = 0;
					$("#show_spec .sell_price").each(function(index,el){
						if(typeof($(el).attr('disabled')) == 'undefined'){
							if($(this).val() == '' || $(this).val() <= 0){
								//warn('规格');
								var index= parseInt(index)+1;
								warn('第'+index+'行规格的商品销售价应大于0');
								i++;
								return false;
							}
						}
			        })
			        if(i>0){
			        	return false;
			        }
				}
			}
            /*
            if( '' == ue.getContent()){
                warn('请输入商品详情内容')
                return false;
            }
            */
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
	
	//上传图片
	layui.use('upload', function(){
		number = 5;
        var $ = layui.jquery;
        var upload = layui.upload;            
		upload.render({
		    elem: '#uploadbtn',
		    url: "<?php echo url('upload/uploadmultimg'); ?>",
		    size: 2048,
		    exts: 'jpg|png|jpeg',
		    multiple: true,
		    number: number,
		    data:{'type':'goods'},
		    before: function(obj) {
		    	//将每次选择的文件追加到文件队列
		    	files = obj.pushFile();
		    	obj.preview(function(index, file, result){
		    		delete files[index];
		    	});
		    	var len = getJsonLength(files);
	    	    var num = $('#imgnum').val();
	    	    total = parseInt(len)+parseInt(num);
	    	    if(total>5){
	    	    	warn('总共不能超过5张图片');
	    	    	return false;
	    	    }
		    },
		    done: function(res, index, upload) {
		        if(res.code == 0) {
		            warn(res.msg,'error');
		        }else{
		        	//$('#slide-pc-priview').append('<input type="hidden" name="pc_src[]" value="' + res.filepath + '" />');
			        $('#slide-pc-priview').append('<li class="item_img"><div class="operate"><i class="toleft layui-icon"></i><i class="toright layui-icon"></i><i  class="closediv">x</i></div><img src="' + res.data + '" class="img" ><input type="hidden" name="goods_photo[]" value="' + res.data + '" /></li>');
			        var nums = parseInt($('#imgnum').val())+1;
			        $('#imgnum').val(nums);
			        
			        if(nums > 4){
			        	$("#uploadbtn").hide();
			        }
			        delete files[index];
		        }
	    	}
		});
	});

	
//点击多图上传的X,删除当前的图片    
$("body").on("click",".closediv",function(){
    var path = $(this).parent().next('img').attr('src');
	var obj = this;
	$.ajax({
		type: "POST",
		url: '<?php echo url("upload/delgoodsimg"); ?>',
		data: {path:path,type:'goods'},
		async: false,
		success: function(res) {
			//$(obj).closest("li").remove();
			if(res.code == 1){
				warn('删除成功');
				$(obj).closest("li").remove();
				
				 var nums = parseInt($('#imgnum').val())-1;
			     $('#imgnum').val(nums);
			     
		         if(nums < 5){
		        	$("#uploadbtn").show();
		         }
			}
		}
	})
 });
 

//默认主图选择
$("body").on("click",".pic-more .item_img",function(){
	$(this).addClass('active').siblings('li').removeClass('active');
});
 
//多图上传点击<>左右移动图片
 $("body").on("click",".pic-more ul li .toleft",function(){
   var li_index=$(this).closest("li").index();
   if(li_index>=1){
     $(this).closest("li").insertBefore($(this).closest("ul").find("li").eq(Number(li_index)-1));
   }
 });
 $("body").on("click",".pic-more ul li .toright",function(){
   var li_index=$(this).closest("li").index();
   $(this).closest("li").insertAfter($(this).closest("ul").find("li").eq(Number(li_index)+1));
 });
 
 
var other_spec_html = "<div class='form-group other_spec_div'><label class='col-sm-3 control-label'>值：</label><div class='input-group col-sm-5 pull-left' ><input type='text' class='form-control' id='spec_values' name='spec_values[]' ></div><div class='input-group col-sm-2'><button type='button' class='btn btn-outline btn-danger pull-right other_spec_del' ><i class='fa fa-trash-o'></i> 删除</button></div></div>";
//克隆规格值输入框
$('body').on('click', '.other_add_spec', function() { 
	$('.other_add_spec_div').before(other_spec_html);
})

//删除当前规格值
$('body').on('click', '.other_spec_del', function() { 
	$(this).parents('.other_spec_div').remove();
})

//删除当前模型的属性值
$("body").on("click",".show_attr .del_attr",function(){
   $(this).closest("button").remove();
});


$(function(){
	$('#specForm').ajaxForm({
	    beforeSubmit: checkForms, 
	    success: completes, 
	    dataType: 'json'
	});
	
	function checkForms(){
	    if( '' == $.trim($('#spec_name').val())){
	        alert('请输入规格名称')
	        return false;
	    }
	    
	    var j=0;
	    $("#add_spec_div .other_spec_div input").each(function(index,el){
	    	if($(this).val() == ''){
				//var index= parseInt(index)+1;
				alert('请输入规格值');
				j++;
				return false;
			}
        })
        if(j>0){
        	return false;
        }
	    
	    //$('.btn_save').attr('disabled',true).addClass('disabled').text('提交中...');
	}
	
	function completes(res){
	    if(res.code == 1){
	        warn(res.msg,'success','donothing');
	        layer_close();
	        
	        var spec_htmls = '<div class="form-group selspec"><label class="col-sm-3 control-label">'+res.data.name+'：</label><div class="input-group col-sm-7">';
			for(var i in res.data.item){
				//item_id.push(i);
				//item_name.push(item_obj[i]);
				spec_htmls += '<a id="btn" class="btn btn-outline btn-default" p_name="'+res.data.name+'" spec_id="'+res.data.id+'" item_id="'+res.data.item[i]['id']+'" status="0" onclick="selectSpecItem(this)">'+res.data.item[i]['name']+'</a>';
			} 
			spec_htmls += '<button type="button" class="btn btn-outline btn-primary pull-right other_spec_item_btn" ><i class="fa fa-plus"></i></button><button type="button" class="btn btn-outline btn-danger pull-right spec_del" ><i class="fa fa-trash-o"></i></button></div></div>';
			$(".spec_div").prepend(spec_htmls);
			$(".spec_div").show();
			
			//$("input[name^='[price]']").val(item_price_fill);
			$("input[name='spec_name']").val('');
			$("input[name='spec_values[]']").val('');
	    }else{
	        warn(res.msg,'error')
	        $('.btn_save').attr('disabled',false).removeClass('disabled').text('保存');
	    }
	}
	
	$('#attrForm').ajaxForm({
        beforeSubmit: checkFormss, 
        success: completess, 
        dataType: 'json'
    });
    function checkFormss(formData){
        if( '' == $.trim($('#model_name').val())){
            alert('请输入模型名称');
            return false;
        }
        if($(".attr_div").find('button').length == 0){
        	alert('请输入属性值');
        	return false;
        }
        $('.btn_save').attr('disabled',true).addClass('disabled').text('提交中...');
    }
    function completess(res){
        if(res.code == 1){
        	warn(res.msg,'success','donothing');
	        layer_close();
	        
	        var model_html = '<option value="">请选择</option>';
	        $.each(res.data,function(key,value){
	        	model_html += '<option value="'+value.id+'">'+value.name+'</option>';
	        })
	        $('#gm_id').html(model_html)
	        layui.form.render('select');
	        //layui.form.render('select','gm_id');
            $("#model_name").val('');
            $(".attr_div").html('');
        }else{
            warn(res.msg,'error')
            $('.btn_save').attr('disabled',false).removeClass('disabled').text('保存');
        }
    }
	$(".save_value").click(function(){
		var val = $("#attr_value").val();
		if(val){
			//查找是否有过该属性
			var obj = $(".attr_div .show_attr");
			for(var i=0;i<obj.length;i++){
				var name = obj.eq(i).find('input').val();
				if(name == val){
					alert('同一模型不能添加重复属性');
					$("#value").focus();
					return ;
				}
			}
			var html = '<button type="button" class="btn btn-sm btn-white show_attr" >'+val+' <input type="hidden" name="attr_value[]" value='+val+' /><i class="del_attr fa fa-close"></i></button>';
			$(".attr_div").append(html);
			$("#attr_value").val('');
			$("#attr_value").focus();
			
		}else{
			alert('请输入属性名称');
		}
	})
});


//附加属性值
$("body").on("click",".add_attr",function(){
	var index = layer.open({
						title: '添加属性值',
		       		    type: 1,
		       		 	scrollbar: false,
		       		    content: $('#add_attr_div'), //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
		       		    area: ['800px', '250px']
		        	});
	add_attr = this;
});


//保存附加的属性值
function save_add_attr(obj){
	var add_attr_value = $('#add_attr_value').val();
	if(add_attr_value == ''){
		alert('请输入属性值');
	}else{
		var gm_id = $("#gm_id").val();
		$.ajax({
			type: "POST",
			url: '<?php echo url("mall/add_model_attr"); ?>',
			data: {attr_value:add_attr_value,gm_id:gm_id},
			async: false,
			success: function(res) {
				if(res.code == 1){
					layer_close();
					//附加在当前模型的属性值里面
					var add_attr_html = '<tr><td>'+add_attr_value+'</td><td><input class="form-control text-center" type="text" name="attr_'+res.data+'[]" /></td></tr>';
					$(".model_tr_box").append(add_attr_html);
					
					$('#add_attr_value').val('');
				}else{
					alert(res.msg);
				}
			}
		})
	}
}

</script>


</body>

<div id="question_div" style="display:none">
    <div class="ibox float-e-margins">
        <div class="ibox-content">
            <div class="example-wrap">
                <div class="example">
                    <table id="cusTable" class="table table-bordered tablelist table-hover">
                        <thead>
							<th>问题</th>
							<th>
                                <input type="checkbox" class="i-checks top_check" name="top_check">
							</th>
                        </thead>
                         <tbody>
                         	<?php if(is_array($question) || $question instanceof \think\Collection || $question instanceof \think\Paginator): $i = 0; $__LIST__ = $question;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                         	<tr rel="<?php echo htmlentities($vo['id']); ?>">
                                 <td class="con"><?php echo htmlentities($vo['content']); ?></td>
                                 <td>
	                                 <input type="checkbox" class="i-checks" name="check" value="<?php echo htmlentities($vo['id']); ?>">
								 </td>
                            </tr>
                            <?php endforeach; endif; else: echo "" ;endif; ?>
                         </tbody>
                    </table>
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                 <div class="col-sm-8 col-sm-offset-3">
					<button type="submit" class="btn btn-primary question_save"><i class="fa fa-save"></i> 确定</button>
               		<button type="button" class="btn btn-danger question_close"><i class="fa fa-close"></i> 关闭</button>       
                 </div>
            </div>
        </div>
    </div>
</div>


<div id="sel_spec_div" style="display:none">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row m-t">
			<div class="col-sm-10">
				<div class="form-group">
					<label class="col-sm-3 control-label">规格项：</label>
					<div class="input-group col-sm-7">
						<select class="form-control" name="sel_spec_id" id="sel_spec_id" required="" aria-required="true">
					        <option value="">请选择</option>
					        <?php if(is_array($spec) || $spec instanceof \think\Collection || $spec instanceof \think\Paginator): $i = 0; $__LIST__ = $spec;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
					        <option value="<?php echo htmlentities($vo['id']); ?>" <?php if(isset($info['goods_spec_ids'])): if(strpos($info['goods_spec_ids'],strval($vo['id']))!==false){ echo 'disabled'; } endif; ?> id="<?php echo htmlentities($vo['item']); ?>" class="spec_flag<?php echo htmlentities($vo['id']); if(isset($info['goods_spec_ids'])): if(strpos($info['goods_spec_ids'],strval($vo['id']))!==false){ echo ' nosel'; } endif; ?>"><?php echo htmlentities($vo['name']); ?></option>
					        <?php endforeach; endif; else: echo "" ;endif; ?>
					    </select>
					</div>
				</div>
				<div class="hr-line-dashed"></div>
                <div class="form-group">
                     <div class="col-sm-10 col-sm-offset-3">
					<button type="submit" class="btn btn-primary spec_save"><i class="fa fa-save"></i> 保存</button>
                     <button type="button" class="btn btn-danger spec_close"><i class="fa fa-close"></i> 关闭</button>       
                 </div>
                 </div>
			</div>
		</div>
	</div>
</div>


<div id="add_spec_div" style="display:none">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-10">
				<div class="float-e-margins">
					<form class="form-horizontal m-t" id="specForm" method="post"
						action="<?php echo url('mall/spec_ok'); ?>">
						<div class="form-group">
							<label class="col-sm-3 control-label">名称：</label>
							<div class="input-group col-sm-7">
								<input type="text" class="form-control" id="spec_name" name="spec_name" >
							</div>
						</div>
						<div class="form-group other_spec_div">
							<label class="col-sm-3 control-label">值：</label>
							<div class="input-group col-sm-5 pull-left" >
								<input type="text" class="form-control" id="spec_values" name="spec_values[]" >
							</div>
							<div class="input-group col-sm-2">
								<button type="button" class="btn btn-outline btn-danger pull-right other_spec_del" ><i class="fa fa-trash-o"></i> 删除</button>
							</div>
						</div>
						<div class="form-group other_add_spec_div" style="display:block;">
                             <div class="col-sm-offset-3 col-sm-8">
                               	<button type="button" class="btn btn-outline btn-default other_add_spec">+ 添加规格值</button>
                             </div>
                        </div>
                        <input type="hidden" name="flag" value="1" />
						<div class="hr-line-dashed"></div>
                           <div class="form-group">
                               <div class="col-sm-12 col-sm-offset-3">
								<button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> 保存</button>
                       			<button type="button" class="btn btn-danger add_spec_close"><i class="fa fa-close"></i> 关闭</button>       
                               </div>
                           </div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<div id="other_spec_item_div" style="display:none">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row m-t">
			<div class="col-sm-10">
				<div class="form-group">
		        	<div class="form-group">
                        <label class="col-sm-3 control-label">规格值：</label>
                        <div class="input-group col-sm-7">
                            <input type="text" class="form-control" id="other_spec_item" placeholder="规格值" >
                        </div>
                    </div> 
				</div>
				<div class="hr-line-dashed"></div>
                <div class="form-group">
                     <div class="col-sm-10 col-sm-offset-3">
					 <button type="submit" class="btn btn-primary other_spec_item_save"><i class="fa fa-save"></i> 保存</button>
                     <button type="button" class="btn btn-danger spec_close"><i class="fa fa-close"></i> 关闭</button>       
                 </div>
                 </div>
			</div>
		</div>
	</div>
</div>

<div id="add_model_div" style="display:none">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-10">
				<div class="float-e-margins">
					<form class="form-horizontal m-t" id="attrForm" method="post"
						action="<?php echo url('mall/goodsmodel_ok'); ?>">
						<div class="form-group">
							<label class="col-sm-3 control-label">模型名称：</label>
							<div class="input-group col-sm-7">
								<input type="text" class="form-control" id="model_name" name="model_name" >
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">属性：</label>
							<div class="input-group col-sm-5 pull-left" >
								<input type="text" class="form-control" id="attr_value" maxlength="20" >
							</div>
							<div class="input-group col-sm-2">
								<div class="pull-right" ><a class="save_value btn btn-success btn-rounded">保存</a></div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label"></label>
							<div class="input-group col-sm-7 attr_div">
							</div>
						</div>
                        <input type="hidden" name="flag" value="1" />
						<div class="hr-line-dashed"></div>
                           <div class="form-group">
                               <div class="col-sm-10 col-sm-offset-3">
								<button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> 保存</button>
                       			<button type="button" class="btn btn-danger model_close"><i class="fa fa-close"></i> 关闭</button>       
                               </div>
                           </div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>


<div id="add_attr_div" style="display:none">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row m-t">
			<div class="col-sm-10">
				<div class="form-group">
		        	<div class="form-group">
                        <label class="col-sm-3 control-label">属性值：</label>
                        <div class="input-group col-sm-7">
                            <input type="text" class="form-control" id="add_attr_value" placeholder="属性值" >
                        </div>
                    </div> 
				</div>
				<div class="hr-line-dashed"></div>
                <div class="form-group">
                     <div class="col-sm-10 col-sm-offset-3">
					 <button type="submit" onclick="save_add_attr()"  class="btn btn-primary add_attr_save"><i class="fa fa-save"></i> 保存</button>
                     <button type="button" class="btn btn-danger add_attr_close"><i class="fa fa-close"></i> 关闭</button>       
                 </div>
                 </div>
			</div>
		</div>
	</div>
</div>

<script src="/static/admin/plugins/iCheck/icheck.min.js"></script>
<script src="/static/admin/js/common.js"></script>
</html>