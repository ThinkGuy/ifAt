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
<!-- Main Stylesheet -->
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
						<a class="navbar-brand" href="../index.jsp">if-at</a>
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
					<div class="col-md-3 text-center">
						<img src="<%=basePath%>img/portfolio/5.jpg"
							class="img-responsive animated fadeInLeft"
							alt="Time is happiness">
					</div>
					<div class="col-md-8 text-center welcome-section">
						<br>
						<h2 class="animated fadeInDown">欢迎使用if-at</h2>
						<br>
						<p class="animated fadeInRight">还有30分钟</p>
						<br> <a href="#services"
							class="button-grey animated fadeInUp">开始答题</a>
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
									name="r${status.count}" class="flat-red" /> <strong>&nbsp;${question.a}</strong>
								</label><br> <label>&nbsp;&nbsp;&nbsp;&nbsp;<input
									type="radio" name="r${status.count}" class="flat-red" /> <strong>&nbsp;${question.b}</strong>
								</label><br> <label>&nbsp;&nbsp;&nbsp;&nbsp;<input
									type="radio" name="r${status.count}" class="flat-red" /> <strong>&nbsp;${question.c}</strong>
								</label><br> <label>&nbsp;&nbsp;&nbsp;&nbsp;<input
									type="radio" name="r${status.count}" class="flat-red" /> <strong>&nbsp;${question.d}</strong>
								</label><br>
							</div>
						</div>
						<!-- /.box-body -->
						<div class="box-footer">if-at答题结果分析，提示</div>
					</div>
					<!-- /.box -->
				</c:forEach>
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
							<li><a href="#"><i class="fa fa-facebook"></i> Facebook</a></li>
							<li><a href="#"><i class="fa fa-twitter"></i> Twitter</a></li>
							<li><a href="#"><i class="fa fa-youtube"></i> Youtube</a></li>
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

	<!-- Google Map -->

</body>
</html>