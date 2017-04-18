<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<link rel="stylesheet" href="<%=basePath%>css/q.css">
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
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
						<i class="fa fa-bars"></i>
					</button>
					<a class="navbar-brand" href="#">if-at</a>
				</div>
				<div class="navbar-collapse collapse">
					<ul class="nav navbar-nav navbar-right">
						<li><a class="link-service" href="#services">Services</a></li>
						
				</div>
				</div>
			</div>
		</header> <!-- .site-header -->
	</div> <!-- .fluid-container -->
	
	<!-- WELCOME TEXT -->
	<div class="main-content">
	<div class="fluid-container">
		<div class="section-welcome">
			<div class="row">
            	<div class="col-md-3 text-center">
					<img src="<%=basePath%>img/portfolio/5.jpg" class="img-responsive animated fadeInLeft" alt="Time is happiness">
				</div>
				<div class="col-md-8 text-center welcome-section">
                	<br>
					<h2 class="animated fadeInDown">欢迎使用if-at</h2>
					<br>
                    <p class="animated fadeInRight">还有10分钟</p>
				</div>
			</div>
		</div>
	</div>

	<div class="fluid-container">
		<div class="section-services" id="services">
		
			<div class="div_question" id="div1" >
				<div class="div_title_question_all">
					<div id="divTitle1" class="div_title_question" text-center>
						1.本次分享的主题你是否感兴趣？ <span class="req">&nbsp;*</span>
					</div>
					<div style="clear:both;"></div>
				</div>
				<div class="div_table_radio_question" id="divquestion1" text-center>
					<div class="div_table_clear_top"></div>
					<ul class="ulradiocheck">
						<li style="width:99%;"><a href="javascript:" class="jqRadio"
							rel="q1_1"></a> <input style="display:none;" name="q1" id="q1_1"
							value="1" type="radio"> <label for="q1_1">非常感兴趣</label></li>
						<li style="width:99%;"><a href="javascript:" class="jqRadio"
							rel="q1_2"></a> <input style="display:none;" name="q1" id="q1_2"
							value="2" type="radio"> <label for="q1_2">感兴趣</label></li>
						<li style="width:99%;"><a href="javascript:" class="jqRadio"
							rel="q1_3"></a> <input style="display:none;" name="q1" id="q1_3"
							value="3" type="radio"> <label for="q1_3">一般</label></li>
						<li style="width:99%;"><a href="javascript:" class="jqRadio"
							rel="q1_4"></a> <input style="display:none;" name="q1" id="q1_4"
							value="4" type="radio"> <label for="q1_4">不感兴趣</label></li>
						<li style="width:99%;"><a href="javascript:" class="jqRadio"
							rel="q1_5"></a> <input style="display:none;" name="q1" id="q1_5"
							value="5" type="radio"> <label for="q1_5">非常感兴趣</label></li>
						<div style="clear:both;"></div>
					</ul>
				</div>
			</div>
			
			<div class="div_question" id="div2">
                      <div class="div_title_question_all">
                        <div id="divTitle2" class="div_title_question">2.通过本次分享，你是否有收获？
                          <span class="req">&nbsp;*</span></div>
                        <div style="clear:both;"></div>
                      </div>
                      <div class="div_table_radio_question" id="divquestion2">
                        <div class="div_table_clear_top"></div>
                        <ul class="ulradiocheck">
                          <li style="width:99%;">
                            <a href="javascript:" class="jqRadio" rel="q2_1"></a>
                            <input style="display:none;" name="q2" id="q2_1" value="1" type="radio">
                            <label for="q2_1">收获非常大</label></li>
                          <li style="width:99%;">
                            <a href="javascript:" class="jqRadio" rel="q2_2"></a>
                            <input style="display:none;" name="q2" id="q2_2" value="2" type="radio">
                            <label for="q2_2">有收获</label></li>
                          <li style="width:99%;">
                            <a href="javascript:" class="jqRadio" rel="q2_3"></a>
                            <input style="display:none;" name="q2" id="q2_3" value="3" type="radio">
                            <label for="q2_3">一般</label></li>
                          <li style="width:99%;">
                            <a href="javascript:" class="jqRadio" rel="q2_4"></a>
                            <input style="display:none;" name="q2" id="q2_4" value="4" type="radio">
                            <label for="q2_4">收获很少</label></li>
                          <li style="width:99%;">
                            <a href="javascript:" class="jqRadio" rel="q2_5"></a>
                            <input style="display:none;" name="q2" id="q2_5" value="5" type="radio">
                            <label for="q2_5">一点都没有，简直浪费时间</label></li>
                          <div style="clear:both;"></div>
                        </ul>
                        <div style="clear:both;"></div>
                        <div class="div_table_clear_bottom"></div>
                      </div>
                      <div class="errorMessage"></div>
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

	<!-- Google Map -->

</body>
</html>