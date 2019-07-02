<?php /*a:1:{s:94:"D:\phpstudy\PHPTutorial\WWW\noob\sjx20190429\tp5.1demo\application\index\view\index\index.html";i:1562060799;}*/ ?>
<html>
    <title>任务发布</title>
    <style>
        body {
            height: 100%;width: 100%;
            background: url('/static/admin/img/banner2.jpg');
            background-size:cover;
        }
        .pagination {float:right;}

        .pagination li {display: inline-block;margin-right: -1px;padding: 5px;border: 1px solid #e2e2e2;min-width: 20px;text-align: center;}

        .pagination li.active {background: #009688;color: #fff;border: 1px solid #009688;}

        .pagination li a {display: block;text-align: center;}
       
    </style>
    <body>
        <div style="text-align: center;">
            <span style="font-size:32px;">任务列表</span>
        </div>
        <?php if(is_array($info) || $info instanceof \think\Collection || $info instanceof \think\Paginator): $i = 0; $__LIST__ = $info;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
        <div style="margin-top:10px;border:1px solid #ccc;">
            <div>
                <span style="color: burlywood">发布人姓名：<?php echo htmlentities($vo['member']); ?></span>
            </div>
            <div style="color: cornflowerblue">
               内容：<?php echo htmlentities($vo['message']); ?>
            </div>
            <div>发布时间：<?php echo htmlentities(date('Y-m-d H:i:s',!is_numeric($vo['addtime'])? strtotime($vo['addtime']) : $vo['addtime'])); ?></div>
        </div>
        <?php endforeach; endif; else: echo "" ;endif; ?>
        <?php echo $info; ?>
        <div style="text-align: center;margin-top: 20px;">
            <div style="float: left;margin-top: 20px;">
                负责人：<select name="cont" id="cont">
                    <?php if(is_array($admin) || $admin instanceof \think\Collection || $admin instanceof \think\Paginator): $i = 0; $__LIST__ = $admin;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vi): $mod = ($i % 2 );++$i;?>
                    <option value="<?php echo htmlentities($vi['admin_name']); ?>"><?php echo htmlentities($vi['admin_name']); ?></option>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                </select>
            </div>
            
            <textarea name="message" id="message" style="overflow:hidden;resize: none;width: 100%;height: 60px;margin-bottom: 20px;"></textarea>
            <span id="btn" style="border:1px solid #ccc;font-size: 20px;background-color: lightgoldenrodyellow;">提交</span>
        </div>
    </body>
    <script src="/static/admin/js/jquery.min.js"></script>
    <script src="/static/admin/plugins/layer/layer.js"></script>
	<script src="/static/admin/plugins/laydate/laydate.js"></script>
    <script>
        $('#btn').click(function(){
            var cont = $('#cont').val();
            
            var message = $('#message').val();
            if(''== cont){
                alert('负责人不能为空');
                return false;
            }
            if('' == message){
                alert('内容不能为空');
                return false;
            }
    
            $.ajax({
                type:"POST",
                url:"<?php echo url('index/message'); ?>",
                data:{message:message,cont:cont},
                success:function(res){
                   if(res.code == 1){
                       alert(res.msg);
                       location.reload();
                   }else{
                    alert(res.msg);
                   }
                }
            })
        });
    </script>
</html>