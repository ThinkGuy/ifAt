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
					<div class="col-md-3 text-center">
						<img src="<%=basePath%>img/profile.png"
							class="img-responsive animated fadeInLeft"
							alt="Time is happiness">
					</div>
					<div class="col-md-8 text-center welcome-section">
						<br>
						<h2 class="animated fadeInDown">你的答题结果分析</h2>
						<br>
						<button class="animated fadeInUp btn btn-warning btn-lg"
							id="answer" onclick="window.location.href='<%=basePath%>Student/StudentBasicOperation_logout.action'">退出</button>
					</div>
				</div>
			</div>
		</div>

		<!-- FUN FACTS -->
		<div class="fluid-container animated flipInX" id="facts">
			<div class="row">
				<div class="col-md-12 text-right">
					<div class="section-header facts-header">
						<h3>答题结果分析</h3>
					</div>
				</div>
			</div>
			<div class="section-facts">
				<div class="row">
					<div class="col-md-3 col-sm-6 col-xs-12 col-lg-3 text-center">
						<div class="counter-item">
							<div class="counter-inner">
								<div class="counter-body">
									<h2 class="start-count" data-count="${request.firstRightNum}">0</h2>
									<h6>第一次答对数</h6>
									<div class="end-count"></div>
								</div>
							</div>
						</div>
					</div>
					<!-- .counter-item -->
					<div class="col-md-3 col-sm-6 col-xs-12 col-lg-3 text-center">
						<div class="counter-item">
							<div class="counter-inner">
								<div class="counter-body">
									<h2 class="start-count" data-count="${request.secondRightNum}">0</h2>
									<h6>第二次答对数</h6>
									<div class="end-count"></div>
								</div>
							</div>
						</div>
					</div>
					<!-- .counter-item -->
					<div class="col-md-3 col-sm-6 col-xs-12 col-lg-3 text-center">
						<div class="counter-item">
							<div class="counter-inner">
								<div class="counter-body">
									<h2 class="start-count" data-count="${request.thirdRightNum}">0</h2>
									<h6>第三次答对数</h6>
									<div class="end-count"></div>
								</div>
							</div>
						</div>
					</div>
					<!-- .counter-item -->
					<div class="col-md-3 col-sm-6 col-xs-12 col-lg-3 text-center">
						<div class="counter-item">
							<div class="counter-inner">
								<div class="counter-body">
									<h2 class="start-count" data-count="${request.fourthRightNum}">0</h2>
									<h6>第四次答对数</h6>
									<div class="end-count"></div>
								</div>
							</div>
						</div>
					</div>
					<!-- .counter-item -->
				</div>
				<div class="row">
					<div class="col-md-3 col-sm-6 col-xs-12 col-lg-6 text-center">
						<div class="counter-item">
							<div class="counter-inner">
								<div class="counter-body">
									<h2 class="start-count" data-count="${request.score}">0</h2>
									<h6>得分</h6>
									<div class="end-count"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-12 col-lg-6 text-center">
						<div class="counter-item">
							<div class="counter-inner">
								<div class="counter-body">
									<h2 class="start-count" data-count="${request.accuracy}">0</h2>
									<h6>准确率(%)</h6>
									<div class="end-count"></div>
								</div>
							</div>
						</div>
					</div>
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
</body>
</html>