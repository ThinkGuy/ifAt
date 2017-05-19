<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en-US">
<head>

<meta name="viewport"
	content="width=device-width, initial-scale=1, minimal-ui">
<meta charset="utf-8">
<title>Modest - Free Web Template</title>
<!-- Theme style -->
<link href="<%=basePath%>css/AdminLTE.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>css/iCheck/all.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet" href="<%=basePath%>css/animate.css">
<link rel="stylesheet" href="<%=basePath%>css/font-awesome.min.css">
<link rel="stylesheet" href="<%=basePath%>css/templatemo-style.css">

<!-- jQuery -->
<script src="<%=basePath%>js/jquery-1.11.0.min.js"></script>
<script src="<%=basePath%>js/jquery-migrate-1.2.1.min.js"></script>
</head>
<body>
	<!-- HEADER -->
	<div class="fluid-container">
		<header class="site-header">
			<div class="navbar-default navbar-fixed-top">
				<div class="fluid-container">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse" data-target=".navbar-collapse">
							<i class="fa fa-bars"></i>
						</button>
						<a class="navbar-brand"
							onclick="window.location.href='<%=basePath%>index.jsp'">if-at</a>
					</div>
					<div class="navbar-collapse collapse">
						<ul class="nav navbar-nav navbar-right">
							<li><a class="link-service" href="#services">答题</a></li>
						</ul>
					</div>
				</div>
			</div>
		</header>
		<!-- .site-header -->
	</div>
	<!-- .fluid-container -->

	<!-- WELCOME TEXT -->
	<div class="main-content">
		<div class="fluid-container">
			<div class="section-welcome">
			<div class="row">
			<div class="digits col-md-12 col-sm-offset-4"></div></div>
				<div class="row">
					<div class="col-md-12 text-center welcome-section">
						<br>
						<h2 class="animated fadeInDown">${session.studentName},欢迎你使用if-at</h2>
						<br>
						<br>
						<button class="animated fadeInUp btn btn-warning btn-lg" id="answer"
							onclick="startAnswer()">开始答题</button>
					</div>
				</div>
			</div>
		</div>

		<div class="fluid-container">
			<div class="section-services" id="services">

				<c:forEach items="${request.questionList}" var="question"
					varStatus="status">

					<!-- iCheck -->
					<div class="box box-success">
						<div class="box-header">
							<h3 class="box-title">&nbsp;&nbsp;${status.count}.&nbsp;${question.title}&nbsp;？
							</h3>

						</div>
						<div class="box-body">
							<!-- Minimal style -->

							<!-- radio -->
							<div class="form-group">
								<label>&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio"
									name="r${status.count}" id="r${status.count}a" class="flat-red"
									value="${status.count}a" /> <a style='color:black'
									id="a${status.count}a"><strong>&nbsp;${question.a}</strong></a>
								</label><br> <label>&nbsp;&nbsp;&nbsp;&nbsp;<input
									type="radio" name="r${status.count}" id=r${status.count}b
									class="flat-red" value="${status.count}b" /> <a
									style='color:black' id="a${status.count}b"><strong>&nbsp;${question.b}</strong></a>
								</label><br> <label>&nbsp;&nbsp;&nbsp;&nbsp;<input
									type="radio" name="r${status.count}" id=r${status.count}c
									class="flat-red" value="${status.count}c" /> <a
									style='color:black' id="a${status.count}c"><strong>&nbsp;${question.c}</strong></a>
								</label><br> <label>&nbsp;&nbsp;&nbsp;&nbsp;<input
									type="radio" name="r${status.count}" id=r${status.count}d
									class="flat-red" value="${status.count}d" /> <a
									style='color:black' id="a${status.count}d"><strong>&nbsp;${question.d}</strong></a>
								</label><br> &nbsp;&nbsp;&nbsp;
								<button class="q btn btn-info btn-sm" disabled="disabled"
									onclick="sendMessage(this)" id="q${status.count}">确定</button>
							</div>
						</div>
						<!-- /.box-body -->
						<div class="box-footer" id="footer${status.count}">
							<Strong>if-at答题结果分析:</Strong>
						</div>
					</div>
					<!-- /.box -->
				</c:forEach>
				<div class="row">
					<div class="col-md-6 col-sm-0 col-xs-12 col-lg-12 text-center">
						<button class="animated btn btn-warning btn-lg" id="submit" disabled="disabled"
							onclick="countScore()">提交</button>
					</div>
					<!-- .counter-item -->
				</div>
			</div>
		</div>
		
		<!-- FOOTER -->
		<div class="fluid-container">
			<footer class="site-footer">
				<a href="#" class="back-to-top"> <i class="fa fa-angle-up"></i>
				</a>
				<div class="row">
					<div class="col-md-6 col-sm-6 col-xs-12 padding-left-0">
						<p class="copyright">
							Copyright &copy; 2017 Author Name | Liu Xinwei <a
								href="http://www.cssmoban.com/" target="_blank" title="模板之家"><br>if-at</a>
							- Collect from <a href="http://www.cssmoban.com/" title="网页模板"
								target="_blank">if-at</a>
						</p>
					</div>
					<div class="col-md-6 col-sm-6 col-xs-12 padding-right-0">
						<ul class="social">
							<li><a href="#"><i class="fa fa-weibo"></i> 微博</a></li>
							<li><a href="#"><i class="fa fa-facebook"></i> Facebook</a></li>
						</ul>
					</div>
				</div>
			</footer>
		</div>
	</div>

	<!-- Plugins -->
	<script src="<%=basePath%>js/bootstrap.js"></script>
	<script src="<%=basePath%>js/plugins.js"></script>
	<script src="<%=basePath%>js/custom.js"></script>
	<!-- iCheck -->
	<script src="<%=basePath%>js/plugins/iCheck/icheck.min.js"
		type="text/javascript"></script>
	<!-- Page script -->
	
	<script type="text/javascript">
		$(function() {
			//iCheck for checkbox and radio inputs
			$('input[type="checkbox"].minimal, input[type="radio"].minimal')
					.iCheck({
						checkboxClass : 'icheckbox_minimal',
						radioClass : 'iradio_minimal'
					});
			//Red color scheme for iCheck
			$(
					'input[type="checkbox"].minimal-red, input[type="radio"].minimal-red')
					.iCheck({
						checkboxClass : 'icheckbox_minimal-red',
						radioClass : 'iradio_minimal-red'
					});
			//Flat red color scheme for iCheck
			$('input[type="checkbox"].flat-red, input[type="radio"].flat-red')
					.iCheck({
						checkboxClass : 'icheckbox_flat-red',
						radioClass : 'iradio_flat-red'
					});
		});
	</script>
	<!-- 倒计时时钟 -->
	<script src="<%=basePath%>js/endTime/jquery.countdown.js"></script>
	<script type="text/javascript">
		var webSocket = null;
		var flag = true;//全局标记位，标记浏览器是否支持websocket
		$(function() {
			if (!window.WebSocket) {
				$("body").append("<h1>你的浏览器不支持WebSocket</h1>");
				flag = false;
				return;
			}

		});
		
		function endTime(){
		var times = 1000*60*15; //倒计时。
		var endTimes=new Date();
   		endTimes.setTime(new Date().getTime() + times);//设置倒计时15分钟。
      	
        $(".digits").countdown({
          image: "<%=basePath%>img/digits.png",
          format: "mm:ss",
          endTime: endTimes
        });
        
        setTimeout('countScore()', times); //到点自动提交试卷。
      }
		
		function fresh(event) {
			startConnect(event)
 		};
 		//每3分钟刷新一次
 		var freshTool = window.setInterval("fresh()",180000);
	
		function startAnswer(event) {
			endTime();
			startConnect(event);
		}

		function startConnect(event) {
			if (flag == false) {
				return;
			}
			var url = "ws://192.168.199.234:8080/ifAt/ws/websocket";
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
			var array = content.split(" ");
			var tag = array[0].substring(0, array[0].length -1);
			var aid = "a" + array[0];
			var rid = "r" + array[0];
			var footer = "footer" + tag;
			content = array[1];
			if (content.match("答案错误")) {
				$("#" + rid).prop("checked", false);
				$("#" + rid).prop("disabled", true);
				$("#" + aid).prop("style", "color:red");
				$("#" + footer).append(
						"</br><a style='color:red'> <Strong>&nbsp;" + content
								+ "</Strong></a>");
			} else {
				$("#q" + tag).prop("disabled", true);
				$("#" + aid).prop("style", "color:blue");
				$("#" + footer).append(
						"</br><font color='blue'> <Strong>&nbsp;" + content
								+ "</Strong></font>");
			}

		}
		function onOpen(event) {
			$("#answer").prop("disabled", true);
			$("#submit").prop("disabled", false);
			$(".q").prop("disabled", false);
		}
		function onError(event) {
			$(".infos").append("<li class='red'>连接服务器发生错误</li>");
		}
		function sendMessage(obj) {
			var end = obj.id;
			var rname = "r" + end.substring(1, end.length);
			var msg = $("input[name=" + rname + "][type='radio']:checked")
					.val();
			if (msg != undefined) {
				webSocket.send(msg);//向服务器发送消息
			}
		}
		function countScore(event) {
			//关闭刷新器。
			window.clearInterval(freshTool); 
			webSocket.onclose = function(event) {
			
			};
			self.location="<%=basePath%>Student/StudentBasicOperation_countScore.action";
		}
	</script>
</body>
</html>