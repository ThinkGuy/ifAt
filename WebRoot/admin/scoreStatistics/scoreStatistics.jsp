<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- bootstrap 3.0.2 -->
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<!-- font Awesome -->
<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet"
	type="text/css" />
<!-- Ionicons -->
<link href="<%=basePath%>css/ionicons.min.css" rel="stylesheet"
	type="text/css" />
<!-- Theme style -->
<link href="<%=basePath%>css/AdminLTE.css" rel="stylesheet"
	type="text/css" />

<title>ifAt统计功能</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
</head>
<body class="skin-blue">
	<!-- header logo: style can be found in header.less -->
	<header class="header">
		<a href="<%=basePath%>index.jsp" class="logo"> <!-- Add the class icon to your logo image or logo icon to add the margining -->
			IF-At
		</a>
		<!-- Header Navbar: style can be found in header.less -->
		<nav class="navbar navbar-static-top" role="navigation">
			<!-- Sidebar toggle button-->
			<a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas"
				role="button"> <span class="sr-only">Toggle navigation</span> <span
				class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>
			</a>
			<div class="navbar-right">
				<ul class="nav navbar-nav">
					<!-- User Account: style can be found in dropdown.less -->
					<li class="dropdown user user-menu"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"> <i
							class="glyphicon glyphicon-user"></i> <span>${session.adminName}
								<i class="caret"></i>
						</span>
					</a>
						<ul class="dropdown-menu">
							<!-- User image -->
							<li class="user-header bg-light-blue"><img
								src="<%=basePath%>img/avatar3.png" class="img-circle"
								alt="User Image" />
								<p>
									${session.adminName} - Web Developer <small>Member
										since Nov. 2012</small>
								</p></li>
							<!-- Menu Body -->
							<li class="user-body">
								<div class="col-xs-4 text-center">
									<a href="#">Followers</a>
								</div>
								<div class="col-xs-4 text-center">
									<a href="#">Sales</a>
								</div>
								<div class="col-xs-4 text-center">
									<a href="#">Friends</a>
								</div>
							</li>
							<!-- Menu Footer-->
							<li class="user-footer">
								<div class="pull-left">
									<a href="#" class="btn btn-default btn-flat">Profile</a>
								</div>
								<div class="pull-right">
									<a href="<%=basePath%>Admin/AdminBasicOperation_logout.action"
										class="btn btn-default btn-flat">Logout</a>
								</div>
							</li>
						</ul></li>
				</ul>
			</div>
		</nav>
	</header>
	<div class="row-offcanvas row-offcanvas-left">
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="left-side sidebar-offcanvas">
			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">
				<!-- Sidebar user panel -->
				<div class="user-panel">
					<div class="pull-left image">
						<img src="<%=basePath%>img/avatar3.png" class="img-circle"
							alt="User Image" />
					</div>
					<div class="pull-left info">
						<p>Hello, ${session.adminName}</p>

						<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
					</div>
				</div>
				<!-- search form -->
				<form action="#" method="get" class="sidebar-form">
					<div class="input-group">
						<input type="text" name="q" class="form-control"
							placeholder="Search..." /> <span class="input-group-btn">
							<button type='submit' name='seach' id='search-btn'
								class="btn btn-flat">
								<i class="fa fa-search"></i>
							</button>
						</span>
					</div>
				</form>
				<!-- /.search form -->
				<!-- sidebar menu: : style can be found in sidebar.less -->
				<ul class="sidebar-menu">
					<li class="active"><a href="#"> <i class="fa fa-dashboard"></i>
							<span>个人信息</span>
					</a></li>
					<li><a
						href="<%=basePath%>admin/basicOperation/changePassword.jsp"> <i
							class="fa fa-th"></i> <span>密码修改</span> <small
							class="badge pull-right bg-green">new</small>
					</a></li>
					<li><a
						href="<%=basePath%>Admin/AdminBasicOperation_displayStudents.action">
							<i class="fa fa-calendar"></i> <span>学生管理</span>
					</a></li>
					<li class="treeview"><a href="#"> <i class="fa fa-laptop"></i>
							<span>试卷管理</span> <i class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li><a
								href="<%=basePath%>/Admin/QuestionnaireOperation_displayQuestionnaires.action"><i
									class="fa fa-angle-double-right"></i> 试卷管理中心</a></li>
							<li><a
								href="<%=basePath%>admin/questionnaireManage/addQuestionnaire.jsp"><i
									class="fa fa-angle-double-right"></i> 生成试卷</a></li>
						</ul></li>
					<li class="treeview"><a href="#"> <i class="fa fa-edit"></i>
							<span>班级管理</span> <i class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li><a
								href="<%=basePath%>Admin/AdminBasicOperation_displayClasses.action"><i
									class="fa fa-angle-double-right"></i> 班级管理中心</a></li>
							<li><a href="<%=basePath%>admin/classManage/addClass.jsp"><i
									class="fa fa-angle-double-right"></i> 添加班级</a></li>
						</ul></li>
					<li><a
						href="<%=basePath%>Admin/AdminBasicOperation_injectServer.action">
							<i class="fa fa-calendar"></i> <span>成绩统计</span>
					</a></li>
				</ul>
			</section>
			<!-- /.sidebar -->
		</aside>
	</div>


	<div class="row-offcanvas row-offcanvas-left">
		<!-- Right side column. Contains the navbar and content of the page -->
		<aside class="right-side">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					成绩统计 <small>控制面板</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> 管理员主页</a></li>
					<li class="active">成绩统计</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-sm-9 ">
						<h4 class="page-header">
							<small>统计该班级的题目准确率以及学生成绩。</small>
						</h4>
					</div>
					<div class="col-sm-3 search-form">
						<div class="text-right">
							<div class="input-group">
								<input type="text" id="searchContent"
									class="form-control input-sm" placeholder="班级">
								<div class="input-group-btn">
									<button type="submit" id="seach" name="q"
										class="btn btn-sm btn-primary" onclick="sendMessage(this)">
										<i class="fa fa-search"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<!-- Line chart -->
						<div class="box box-primary">
							<div class="box-header">
								<i class="fa fa-bar-chart-o"></i>
								<h3 class="box-title">单题准确率统计(单位：%)</h3>
							</div>
							<div class="box-body">
								<div id="line-chart" style="height: 300px;"></div>
							</div>
							<!-- /.box-body-->
						</div>
						<!-- /.box -->
					</div>
				</div>

				<div class="row">
					<div class="col-md-12">
						<!-- Bar chart -->
						<div class="box box-primary">
							<div class="box-header">
								<i class="fa fa-bar-chart-o"></i>
								<h3 class="box-title">学生成绩统计(单位：分数)</h3>
							</div>
							<div class="box-body">
								<div id="bar-chart" style="height: 300px;"></div>
							</div>
							<!-- /.box-body-->
						</div>
						<!-- /.box -->
					</div>
				</div>
			</section>
		</aside>
	</div>

	<!-- jQuery 2.0.2 -->
	<script src="<%=basePath%>js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="<%=basePath%>js/bootstrap.min.js" type="text/javascript"></script>
	<!-- AdminLTE App -->
	<script src="<%=basePath%>js/AdminLTE/app.js" type="text/javascript"></script>

	<!-- FLOT CHARTS -->
	<script src="<%=basePath%>js/plugins/flot/jquery.flot.min.js"
		type="text/javascript"></script>
	<!-- FLOT RESIZE PLUGIN - allows the chart to redraw when the window is resized -->
	<script src="<%=basePath%>js/plugins/flot/jquery.flot.resize.min.js"
		type="text/javascript"></script>
	<!-- FLOT PIE PLUGIN - also used to draw donut charts -->
	<script src="<%=basePath%>js/plugins/flot/jquery.flot.pie.min.js"
		type="text/javascript"></script>
	<!-- FLOT CATEGORIES PLUGIN - Used to draw bar charts -->
	<script
		src="<%=basePath%>js/plugins/flot/jquery.flot.categories.min.js"
		type="text/javascript"></script>

	<!-- Page script -->
	<script type="text/javascript">
		var webSocket = null;
		var flag = true;//全局标记位，标记浏览器是否支持websocket
		$(function(event) {
			if (!window.WebSocket) {
				$("body").append("<h1>你的浏览器不支持WebSocket</h1>");
				flag = false;
				return;
			}
			startConnect(event);
		});

		function startConnect(event) {
			if (flag == false) {
				return;
			}
			var url = "ws://192.168.199.234:8080/ifAt/ws/websocket/admin";
			webSocket = new WebSocket(url);

			webSocket.onerror = function(event) {
				onError(event)
			};
			webSocket.onopen = function(event) {
				onOpen(event)
			};
			webSocket.onmessage = function(event) {
				onMessage(event)
			};

		}
		function onMessage(event) {
			var content = event.data;
			if (content.match("班级不存在")) {
				alert("班级不存在");
			} else {
				var line = new Array();
				var bar = new Array();
				var s = content.split("|");
				content = s[0].substring(1, s[0].length-1);
				var array = content.split(",");
				for (var i=0; i<array.length; i++) {
					line[i] = new Array();
					line[i][0] = parseInt(array[i].split("=")[0]);
					line[i][1] = parseInt(array[i].split("=")[1]);
				}
				
				content = s[1].substring(1, s[1].length-1);
				var array = content.split(",");
				for (var i=0; i<array.length; i++) {
					bar[i] = new Array();
					bar[i][0] = array[i].split("=")[0];
					bar[i][1] = parseInt(array[i].split("=")[1]);
				}
				
				scoreStatistics(line, bar);
			}
		}
		function onOpen(event) {
			
		}
		function onError(event) {
			$(".infos").append("<li class='red'>连接服务器发生错误</li>");
		}
		function sendMessage(obj) {
			var msg = $("#searchContent").val();
			
			var reg = new RegExp("^[0-9]*$");
			if (!reg.test(msg)) {
				alert("请输入数字!");
				return;
			}
			
			if (msg != undefined && msg != "") {
				webSocket.send(msg);//向服务器发送消息
			}
		}

		function scoreStatistics(line, bar) {

			/*
			 * LINE CHART
			 * ----------
			 */
			//LINE randomly generated data
			
			var line_data1 = {
				data : line,
				color : "#3c8dbc"
			};
			$.plot("#line-chart", [ line_data1 ], {
				grid : {
					hoverable : true,
					borderColor : "#f3f3f3",
					borderWidth : 1,
					tickColor : "#f3f3f3"
				},
				series : {
					shadowSize : 0,
					lines : {
						show : true
					},
					points : {
						show : true
					}
				},
				lines : {
					fill : false,
					color : [ "#3c8dbc", "#f56954" ]
				},
				yaxis : {
					show : true,
				},
				xaxis : {
					show : true
				}
			});
			//Initialize tooltip on hover
			$("<div class='tooltip-inner' id='line-chart-tooltip'></div>").css(
					{
						position : "absolute",
						display : "none",
						opacity : 0.8
					}).appendTo("body");
			$("#line-chart")
					.bind(
							"plothover",
							function(event, pos, item) {

								if (item) {
									var x = item.datapoint[0].toFixed(2), y = item.datapoint[1]
											.toFixed(2);

									$("#line-chart-tooltip").html(
											item.series.label + " of " + x
													+ " = " + y).css({
										top : item.pageY + 5,
										left : item.pageX + 5
									}).fadeIn(200);
								} else {
									$("#line-chart-tooltip").hide();
								}

							});
			/* END LINE CHART */

			/*
			 * BAR CHART
			 * ---------                 
			 */

			var bar_data = {
				data : bar,
				color : "#3c8dbc"
			};
			$.plot("#bar-chart", [ bar_data ], {
				grid : {
					borderWidth : 1,
					borderColor : "#f3f3f3",
					tickColor : "#f3f3f3"
				},
				series : {
					bars : {
						show : true,
						barWidth : 0.5,
						align : "center"
					}
				},
				xaxis : {
					mode : "categories",
					tickLength : 0
				}
			});
			/* END BAR CHART */
		};
	</script>
</body>

</html>
