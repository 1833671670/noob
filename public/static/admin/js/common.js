function writeObj(obj){ 
	 var description = ""; 
	 for(var i in obj)
	 { 
		 var property=obj[i]; 
		 description += i+" = "+property+"\n"; 
	 } 
	 alert(description); 
} 




/*弹出层*/
/*
	参数解释：
	title	标题
	url		请求的url
	id		需要操作的数据id
	w		弹出层宽度（缺省调默认值）
	h		弹出层高度（缺省调默认值）
*/
function layer_show(title,url,w,h){
	if (title == null || title == '') {
		title=false;
	};
	if (url == null || url == '') {
		url="404.html";
	};
	if (w == null || w == '') {
		w=800;
	};
	if (h == null || h == '') {
		h=($(window).height() - 50);
	};
	parent.layer.open({
		type: 2,
		area: [w+'px', h +'px'],
		fix: false, //不固定
		maxmin: true,
		shade:0.4,
		title: title,
		content: url
	});
}
/*关闭弹出框口*/
function layer_close(){
	layer.close(layer.index);
}

function p_layer_close(){
	var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
	parent.layer.close(index); //再执行关闭   
}

/**
 * 警告
 */
function warn(str,status,url=''){
    if(status == 'success'){
    	parent.layer.msg(str, {
		   icon:1,
		   time: 1500, //2秒关闭（如果不配置，默认是3秒）
		   shade: 0.1
		 }, function(){
		   //do something
			 if(url != ''){
				 if(url == 'selfrefresh'){
					 //layer.close(layer.confirm_index);
					 window.location.reload();
				 }else if(url == 'closerefresh'){
					 //关闭弹出层，并且刷新当前列表，添加或者修改某记录
					 p_layer_close();
					 var m = parent.document.getElementById("m").value;
					 parent.document.getElementById('iframe'+m).contentWindow.location.reload(true);
				 }else if(url == 'fullcloserefresh'){
					 //关闭弹出层，并且刷新当前列表，添加或者修改某记录
					 p_layer_close();
					 var m = parent.parent.document.getElementById("m").value;
					 parent.parent.document.getElementById('iframe'+m).contentWindow.location.reload(true);
				 }else if(url == 'close'){
					 p_layer_close();
				 }else if(url == 'donothing'){
					 
				 }else{
					 window.location.href = url;
			     }
		     }else{
				 //直接关闭弹出层
				 //layer_close();
		    	 layer.close(layer.index);
		     }
		 }); 
	   
   }
   else if(status == 'error'){
	   
	   layer.msg(str, {
		   icon:2,
		   time: 1500, //2秒关闭（如果不配置，默认是3秒）
		   shade: 0.1
		 }, function(){
		   //do something
		 });
   }else{
	   layer.msg(str, {
		   time: 1500, //2秒关闭（如果不配置，默认是3秒）
		   //icon:1,
		 }, function(){
		   //do something
		 });
   }
}

//弹出层提示
function layer_alert(msg){
	parent.layer.alert(msg);
}

//操作成功后一定时间后刷新页面
function goback(){
	var index = parent.layer.getFrameIndex(window.name);
	parent.location.reload()
	parent.layer.close(index);
}

//关闭弹出层
$(".btn_close").click(function(){
	p_layer_close();
})

//ajax提交数据时加载动画
$(document)
	.ajaxStart(function(){
			index = parent.layer.load(1, {
				   shade: [0.2,'#000'], //0.1透明度的白色背景
				});
	})
	.ajaxStop(function(){
			parent.layer.close(index);
	});

//ajax提交前
$.ajaxSetup({
    beforeSend: function (xhr) {
    	var token = $('input[name="__token__"]').val();
    	//alert(token);
        xhr.setRequestHeader("TOKEN", token);
    }
});



//选择当前数据时有阴影效果
$(function(){
	/*
	$(".i-checks").iCheck({
		checkboxClass:"icheckbox_square-green",
		radioClass:"iradio_square-green",
	})
	*/
	$('tbody tr').click(function(){
		if(!$(this).hasClass('nosel')){
			$(this).addClass('selected').siblings().removeClass('selected');
		}
	})
})


//获取选中的id值（单个）
function getid() {
	var id = '';
	$('.table tbody tr').each(function (i) {		
		var obj = $('.table tbody .selected');
		if(obj.text() != ''){
			id = $(obj).attr('rel');
		}
	})
	return id;
}

//获取选中的id值（多个）
function getids() {
	var ids = '';
	$('input[name="check"]:checked').not(":disabled").each(function () {		
		ids += $(this).val()+',';
	})
	ids = ids.substring(0,ids.length-1);
	return ids;
}


//全选  
$('.top_check').on('ifChecked', function(event){  
    $('input').iCheck('check');  
});  

//反选  
$('.top_check').on('ifUnchecked', function(event){
    $('input').iCheck('uncheck');  
});  

//复制
function copyUrl(obj) {
    try {
        var inputs = $('#store-domain');
        inputs[0].select(); // 选择对象
        document.execCommand("Copy"); // 执行浏览器复制命令
        layer.msg("复制成功!");
    } catch (e) {
        console.log(e);
    }
}



function getJsonLength(jsonData){
	var jsonLength = 0;
	for(var item in jsonData){
		jsonLength++;
	}
	return jsonLength;
}
