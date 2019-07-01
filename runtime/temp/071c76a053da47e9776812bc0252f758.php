<?php /*a:1:{s:68:"E:\sjx\PHPTutorial\WWW\tppet\application\admin\view\index\login.html";i:1542365062;}*/ ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo htmlentities($config['title']); ?> - 登录</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
  
    <link href="/static/admin/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="/static/admin/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="/static/admin/css/animate.min.css" rel="stylesheet">
    <link href="/static/admin/css/style.min.css?v=4.0.0" rel="stylesheet">
    <base target="_blank">
    <!--[if lt IE 8]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <script>if(window.top !== window.self){ window.top.location = window.location;}</script>
</head>
<body class="gray-bg">
    <div class="middle-box text-center loginscreen  animated fadeInDown">
        <div>
            <div>
                <h1 class="logo-name">PY+</h1>
            </div>
            <h3></h3>
            <form class="m-t" role="form" id="login_act" method="post" action="<?php echo url('index/login'); ?>">
                <div class="form-group">
                    <input type="input" id="username" name="username" maxlength="16" class="form-control" placeholder="用户名" >
                </div>
                <div class="form-group">
                    <input type="password" id="password" name="password" maxlength="16" class="form-control" placeholder="密码" >
                </div>
                <?php if(app('config')->get('py.login_captcha')): ?>
                <div class="input-group form-group">
                    <input type="text" name="captcha" id="captcha" class="form-control" placeholder="验证码" maxlength="4"/>
                    <span class="input-group-addon" style="padding:0;cursor:pointer;">
                        <img src="<?php echo captcha_src(); ?>" width="100" height="30" onclick="this.src='<?php echo captcha_src(); ?>?x='+Math.random();"/>
                    </span>
                </div>
                <?php endif; ?>
                <?php echo token(); ?>
                <button type="submit" class="btn btn-primary block full-width m-b">登 录</button>
            </form>
        </div>
    </div>
    <script src="/static/admin/js/jquery.min.js?v=2.1.4"></script>
    <script src="/static/admin/js/jquery.form.js"></script>
    <script src="/static/admin/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="/static/admin/plugins/layer/layer.js"></script>
    <script src="/static/admin/plugins/validate/jquery.validate.min.js"></script>
    <script src="/static/admin/plugins/validate/jquery.metadata.js"></script>
    <script src="/static/admin/js/common.js"></script>
    <script>
    $(function(){
        $('#login_act').ajaxForm({
            beforeSubmit: checkForm, // 此方法主要是提交前执行的方法，根据需要设置
            success: complete, // 这是提交后的方法
            dataType: 'json'
        });
        
        function checkForm(){
            if( '' == $.trim($('#username').val())){           
                warn('请输入登录用户名');
                return false;
            }
     
            if( '' == $.trim($('#password').val())){
            	warn('请输入登录密码');
                return false;
            }
            
            if( $(".form-group").hasClass('input-group')){
            	if($('#captcha').val().length < 4){
            		warn('请输入验证码');
                    return false;
            	}
            }
            /*
            if (0 == 0) {
                if( false == check_result){
                    lunhui.error('请拖动滑块到最右边');
                    return false;
                }
            }  
            */
            $('button').attr('disabled',true).addClass('disabled').text('登录中...');
        }

        function complete(res){
            if(res.code == 1){
                warn(res.msg,'success',res.url);
            }else{ 
            	warn(res.msg,'error');
            	$("input[name='__token__']").val(res.data.token);
                $('button').removeClass('disabled').text('登　录').attr('disabled',false);  
                return false;   
            }
        }
    });
    </script>
</body>
</html>