<?php /*a:1:{s:96:"D:\phpstudy\PHPTutorial\WWW\noob\sjx20190429\tp5.1demo\application\admin\view\index\welcome.html";i:1537008258;}*/ ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>主页</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link rel="shortcut icon" href="./favicon.ico"> 
    <link href="/static/admin/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="/static/admin/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <!-- Morris -->
    <link href="/static/admin/css/plugins/morris/morris-0.4.3.min.css" rel="stylesheet">
    <!-- Gritter -->
    <link href="/static/admin/plugins/gritter/jquery.gritter.css" rel="stylesheet">
    <link href="/static/admin/css/animate.min.css" rel="stylesheet">
    <link href="/static/admin/css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content">
        <div class="row">
            <div class="col-sm-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                    
                        <!-- <span class="label label-success pull-right">月</span>  -->
                        <h5>商品总数</h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins">285</h1>
                        <!-- <div class="stat-percent font-bold text-success"> <i class="fa fa-bolt"></i>
                        </div>
                        <small></small>  -->
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <!-- <span class="label label-info pull-right"></span>  -->
                        <h5>会员数</h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins">1250</h1>
                        <!-- <div class="stat-percent font-bold text-info"> <i class="fa fa-level-up"></i>
                        </div>
                        <small></small>  -->
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <!-- <span class="label label-primary pull-right">  </span> -->
                        <h5>订单数</h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins">2560</h1>
                        <!-- <div class="stat-percent font-bold text-navy"> <i class="fa fa-level-up"></i>
                        </div>
                        <small> </small>  -->
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <!-- <span class="label label-danger pull-right">最近一个月</span>  -->
                        <h5>资讯总数</h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins">125</h1>
                        <!-- <div class="stat-percent font-bold text-danger"> <i class="fa fa-level-down"></i>
                        </div>
                        <small></small>  -->
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <div class="widget navy-bg">
                    <h2>当前管理员：<?php echo htmlentities($admin_info['admin_name']); ?></h2>
                    <ul class="list-unstyled m-t-md">
                        <li>
                            <span class="fa fa-envelope m-r-xs"></span>
                            <label>登录次数:</label>
                            <?php echo htmlentities($log_nums); ?>次
                        </li>
                        <li>
                            <span class="fa fa-home m-r-xs"></span>
                            <label>上次登录时间:</label>
                            <?php echo htmlentities(date('Y-m-d H:i',!is_numeric($admin_info['lastlogintime'])? strtotime($admin_info['lastlogintime']) : $admin_info['lastlogintime'])); ?>　　<?php echo htmlentities($admin_info['lastloginip']); ?>
                        </li>
                    </ul>
                </div>
             </div>
             <div class="col-sm-6">
                <div>
                    <table class="table">
                        <tbody>
                            <tr>
                                <td>
                                    <button type="button" class="btn btn-danger m-r-sm">12</button>
                                    规格
                                </td>
                                <td>
                                    <button type="button" class="btn btn-primary m-r-sm">28</button>
                                    文章
                                </td>
                                <td>
                                    <button type="button" class="btn btn-info m-r-sm">15</button>
                                    模型
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <button type="button" class="btn btn-info m-r-sm">20</button>
                                    属性
                                </td>
                                <td>
                                    <button type="button" class="btn btn-success m-r-sm">40</button>
                                    分类
                                </td>
                                <td>
                                    <button type="button" class="btn btn-danger m-r-sm">30</button>
                                    评论
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <button type="button" class="btn btn-warning m-r-sm">20</button>
                                    留言
                                </td>
                                <td>
                                    <button type="button" class="btn btn-default m-r-sm">40</button>
                                    广告
                                </td>
                                <td>
                                    <button type="button" class="btn btn-warning m-r-sm">30</button>
                                    管理员
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
             </div>
        </div>


        <div class="row">
            <div class="col-sm-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>服务器信息</h5>
                    </div>
                    <div class="ibox-content">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>属性</th>
                                    <th>值</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>服务器操作系统</td>
                                    <td><?php echo htmlentities(PHP_OS); ?></td>
                                </tr>
                                <tr>
                                    <td>当前框架版本</td>
                                    <td><?php echo htmlentities(app()->version()); ?></td>
                                </tr>
                                <tr>
                                    <td>PHP运行方式</td>
                                    <td><?php echo php_sapi_name(); ?></td>
                                </tr>
                                <tr>
                                    <td>服务器域名/IP</td>
                                    <td><?php echo htmlentities(app('request')->server('SERVER_NAME')); ?>/<?php echo gethostbyname(app('request')->server('SERVER_NAME')); ?></td>
                                </tr>
                               
                                <tr>
                                    <td>服务器环境</td>
                                    <td><?php echo htmlentities(app('request')->server('SERVER_SOFTWARE')); ?></td>
                                </tr>
                                <tr>
                                    <td>上传附件限制</td>
                                    <td><?php echo ini_get('upload_max_filesize'); ?></td>
                                </tr>
                                <tr>
                                    <td>执行时间限制</td>
                                    <td><?php echo ini_get('max_execution_time').'秒'; ?></td>
                                </tr>
                                <tr>
                                    <td>PHP 版本</td>
                                    <td><?php echo htmlentities(PHP_VERSION); ?></td>
                                </tr>
                                <tr>
                                    <td>Mysql 版本</td>
                                    <td><?php echo htmlentities($mysql_version); ?></td>
                                </tr>
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>

            <div class="col-sm-6">
				<div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>管理员登录记录</h5>
                    </div>
                    <div class="ibox-content">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>管理员</th>
                                    <th>角色</th>
                                    <th>ip</th>
                                    <th>时间</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<?php if(is_array($admin_log) || $admin_log instanceof \think\Collection || $admin_log instanceof \think\Paginator): $i = 0; $__LIST__ = $admin_log;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                                <tr>
                                    <td><?php echo htmlentities($vo['admin_name']); ?></td>
                                    <td><?php echo htmlentities($vo['admin_role']); ?></td>
                                    <td><?php echo htmlentities($vo['log_ip']); ?></td>
                                    <td><?php echo htmlentities(date('Y-m-d H:i',!is_numeric($vo['log_time'])? strtotime($vo['log_time']) : $vo['log_time'])); ?></td>
                                </tr>
                                <?php endforeach; endif; else: echo "" ;endif; ?>
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="/static/admin/js/jquery.min.js?v=2.1.4"></script>
    <script src="/static/admin/js/bootstrap.min.js?v=3.3.5"></script>
    <!-- 
    <script src="/static/admin/plugins/flot/jquery.flot.js"></script>
    <script src="/static/admin/plugins/flot/jquery.flot.tooltip.min.js"></script>
    <script src="/static/admin/plugins/flot/jquery.flot.spline.js"></script>
    <script src="/static/admin/plugins/flot/jquery.flot.resize.js"></script>
    <script src="/static/admin/plugins/flot/jquery.flot.pie.js"></script>
    <script src="/static/admin/plugins/flot/jquery.flot.symbol.js"></script>
     -->
    <script src="/static/admin/plugins/peity/jquery.peity.min.js"></script>
    <script src="/static/admin/js/demo/peity-demo.min.js"></script>
    <script src="/static/admin/js/content.min.js?v=1.0.0"></script>
    <script src="/static/admin/plugins/jquery-ui/jquery-ui.min.js"></script>
    <script src="/static/admin/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
    <script src="/static/admin/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
    <script src="/static/admin/plugins/easypiechart/jquery.easypiechart.js"></script>
    <script src="/static/admin/plugins/sparkline/jquery.sparkline.min.js"></script>
    <script src="/static/admin/js/demo/sparkline-demo.min.js"></script>
    <!-- 
    <script>
        $(document).ready(function(){$(".chart").easyPieChart({barColor:"#f8ac59",scaleLength:5,lineWidth:4,size:80});$(".chart2").easyPieChart({barColor:"#1c84c6",scaleLength:5,lineWidth:4,size:80});var data2=[[gd(2012,1,1),7],[gd(2012,1,2),6],[gd(2012,1,3),4],[gd(2012,1,4),8],[gd(2012,1,5),9],[gd(2012,1,6),7],[gd(2012,1,7),5],[gd(2012,1,8),4],[gd(2012,1,9),7],[gd(2012,1,10),8],[gd(2012,1,11),9],[gd(2012,1,12),6],[gd(2012,1,13),4],[gd(2012,1,14),5],[gd(2012,1,15),11],[gd(2012,1,16),8],[gd(2012,1,17),8],[gd(2012,1,18),11],[gd(2012,1,19),11],[gd(2012,1,20),6],[gd(2012,1,21),6],[gd(2012,1,22),8],[gd(2012,1,23),11],[gd(2012,1,24),13],[gd(2012,1,25),7],[gd(2012,1,26),9],[gd(2012,1,27),9],[gd(2012,1,28),8],[gd(2012,1,29),5],[gd(2012,1,30),8],[gd(2012,1,31),25]];var data3=[[gd(2012,1,1),800],[gd(2012,1,2),500],[gd(2012,1,3),600],[gd(2012,1,4),700],[gd(2012,1,5),500],[gd(2012,1,6),456],[gd(2012,1,7),800],[gd(2012,1,8),589],[gd(2012,1,9),467],[gd(2012,1,10),876],[gd(2012,1,11),689],[gd(2012,1,12),700],[gd(2012,1,13),500],[gd(2012,1,14),600],[gd(2012,1,15),700],[gd(2012,1,16),786],[gd(2012,1,17),345],[gd(2012,1,18),888],[gd(2012,1,19),888],[gd(2012,1,20),888],[gd(2012,1,21),987],[gd(2012,1,22),444],[gd(2012,1,23),999],[gd(2012,1,24),567],[gd(2012,1,25),786],[gd(2012,1,26),666],[gd(2012,1,27),888],[gd(2012,1,28),900],[gd(2012,1,29),178],[gd(2012,1,30),555],[gd(2012,1,31),993]];var dataset=[{label:"订单数",data:data3,color:"#1ab394",bars:{show:true,align:"center",barWidth:24*60*60*600,lineWidth:0}},{label:"付款数",data:data2,yaxis:2,color:"#464f88",lines:{lineWidth:1,show:true,fill:true,fillColor:{colors:[{opacity:0.2},{opacity:0.2}]}},splines:{show:false,tension:0.6,lineWidth:1,fill:0.1},}];var options={xaxis:{mode:"time",tickSize:[3,"day"],tickLength:0,axisLabel:"Date",axisLabelUseCanvas:true,axisLabelFontSizePixels:12,axisLabelFontFamily:"Arial",axisLabelPadding:10,color:"#838383"},yaxes:[{position:"left",max:1070,color:"#838383",axisLabelUseCanvas:true,axisLabelFontSizePixels:12,axisLabelFontFamily:"Arial",axisLabelPadding:3},{position:"right",clolor:"#838383",axisLabelUseCanvas:true,axisLabelFontSizePixels:12,axisLabelFontFamily:" Arial",axisLabelPadding:67}],legend:{noColumns:1,labelBoxBorderColor:"#000000",position:"nw"},grid:{hoverable:false,borderWidth:0,color:"#838383"}};function gd(year,month,day){return new Date(year,month-1,day).getTime()}var previousPoint=null,previousLabel=null;$.plot($("#flot-dashboard-chart"),dataset,options);var mapData={"US":298,"SA":200,"DE":220,"FR":540,"CN":120,"AU":760,"BR":550,"IN":200,"GB":120,};$("#world-map").vectorMap({map:"world_mill_en",backgroundColor:"transparent",regionStyle:{initial:{fill:"#e4e4e4","fill-opacity":0.9,stroke:"none","stroke-width":0,"stroke-opacity":0}},series:{regions:[{values:mapData,scale:["#1ab394","#22d6b1"],normalizeFunction:"polynomial"}]},})});
    </script>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
     -->
</body>

</html>