<?php /*a:1:{s:60:"E:\PHPTutorial\WWW\k\application\index\view\index\login.html";i:1561981329;}*/ ?>
﻿<html>
<!DOCTYPE html>
<html lang="en" class="no-js">

    <head>

        <meta charset="utf-8">
        <title>登录</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- CSS -->
        <link rel="stylesheet" href="/static/index/assets/css/reset.css">
        <link rel="stylesheet" href="/static/index/assets/css/supersized.css">
        <link rel="stylesheet" href="/static/index/assets/css/style.css">

        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="assets/js/html5.js"></script>
        <![endif]-->
    </head>

    <body>
      
        <div class="page-container">
            <h1>登录</h1>
            <form action="<?php echo url('index/checklogin'); ?>" method="post">
                <input type="text" name="username" class="username" placeholder="请输入您的用户名！">
                <input type="password" name="password" class="password" placeholder="请输入您的用户密码！">
                <button type="submit" class="submit_button">登录</button>
            </form>
           
        </div>
       
        <!-- Javascript -->
        <script src="/static/index/assets/js/jquery-1.8.2.min.js" ></script>
        <script src="/static/index/assets/js/supersized.3.2.7.min.js" ></script>
        <script src="/static/index/assets/js/supersized-init.js" ></script>
        <script src="/static/index/assets/js/scripts.js" ></script>

    </body>

</html>

