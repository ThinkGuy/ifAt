<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/bootstrap.jsp"%>

<!DOCTYPE html>
<html lang="en">

<head>

</head>

<body id="page-top" class="index">

	<!-- Navigation -->
	<nav id="mainNav"
		class="navbar navbar-default navbar-fixed-top navbar-custom">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header page-scroll">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> Menu <i
						class="fa fa-bars"></i>
				</button>
				<a class="navbar-brand" href="#page-top">if-at</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li class="hidden"><a href="#page-top"></a></li>
					<li class="page-scroll"><a
						href="<%=basePath%>admin/basicOperation/login.jsp">管理员登录</a></li>
					<li class="page-scroll"><a
						href="<%=basePath%>student/basicOperation/login.jsp">学生登录</a></li>
					<li class="page-scroll"><a href="#contact">联系我</a></li>
					<li class="page-scroll"><a href="#about">关于我</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>

	<!-- Header -->
	<header>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<img class="img-responsive" src="<%=basePath%>img/profile.png"
						alt="">
					<div class="intro-text">
						<span class="name">if-at</span>
						<hr class="star-light">
						<span class="skills">Class Fun</span>
					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- Contact Section -->
	<section id="contact">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2>联系我</h2>
					<hr class="star-primary">
				</div>
			</div>
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19. -->
					<!-- The form should work on most web servers, but if the form is not working you may need to configure your web server differently. -->
					<form name="sentMessage" id="contactForm" novalidate>
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<label>Name</label> <input type="text" class="form-control"
									placeholder="姓名" id="name" required
									data-validation-required-message="Please enter your name.">
								<p class="help-block text-danger"></p>
							</div>
						</div>
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<label>Email Address</label> <input type="email"
									class="form-control" placeholder="邮件地址" id="email" required
									data-validation-required-message="Please enter your email address.">
								<p class="help-block text-danger"></p>
							</div>
						</div>
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<label>Phone Number</label> <input type="tel"
									class="form-control" placeholder="电话号" id="phone" required
									data-validation-required-message="Please enter your phone number.">
								<p class="help-block text-danger"></p>
							</div>
						</div>
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<label>Message</label>
								<textarea rows="5" class="form-control" placeholder="反馈信息"
									id="message" required
									data-validation-required-message="Please enter a message."></textarea>
								<p class="help-block text-danger"></p>
							</div>
						</div>
						<br>
						<div id="success"></div>
						<div class="row">
							<div class="form-group col-xs-12">
								<button type="submit" class="btn btn-success btn-lg">Send</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>


	<!-- About Section -->
	<section class="success" id="about">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2>关于我</h2>
					<hr class="star-light">
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-lg-offset-2">
					<p>最近，在国外课堂现在流行一种即时反馈评估测试方法，它就是IfAt。If-at在学生答对的情况下提供鼓励，在答错的情况下会提供纠错反馈。IfAt最大的特色是当学生回答错误时，会让该学生继续回答此题，直到答案正确。IfAt并不只是测试，而且也具备传授知识的功能。</p>
				</div>
				<div class="col-lg-4">
					<p>IfAt一个革命性的新型测试系统，它改变了传统的多项选择题测试学生互动学习的模式。IfAt在线版相比于纸质版测试系统反馈更加及时，节约成本。同时利用if-at方法具备的优点，希望采用该系统的学生在课堂上能与老师重复互动，开心地学到知识。</p>
				</div>
				<div class="col-lg-8 col-lg-offset-2 text-center">
					<a href="https://github.com/ThinkGuy/ifAt/archive/master.zip"
						class="btn btn-lg btn-outline"> <i class="fa fa-download"></i>
						Download IfAt
					</a>
				</div>
			</div>
		</div>
	</section>

	<!-- Footer -->
	<footer class="text-center">
		<div class="footer-above">
			<div class="container">
				<div class="row">
					<div class="footer-col col-md-4">
						<h3>Location</h3>
						<p>
							Shenyang City, China <br>Northeastern University
						</p>
					</div>
					<div class="footer-col col-md-4">
						<h3>Around the Web</h3>
						<ul class="list-inline">
							<li><a href="#" class="btn-social btn-outline"><i
									class="fa fa-fw fa-facebook"></i></a></li>
							<li><a href="#" class="btn-social btn-outline"><i
									class="fa fa-fw fa-google-plus"></i></a></li>
							<li><a href="#" class="btn-social btn-outline"><i
									class="fa fa-fw fa-twitter"></i></a></li>
							<li><a href="#" class="btn-social btn-outline"><i
									class="fa fa-fw fa-linkedin"></i></a></li>
							<li><a href="#" class="btn-social btn-outline"><i
									class="fa fa-fw fa-dribbble"></i></a></li>
						</ul>
					</div>
					<div class="footer-col col-md-4">
						<h3>About IfAt</h3>
						<p>
							A classroom funny online test system.<a
								href="https://github.com/ThinkGuy/ifAt">if-at</a>.
						</p>
					</div>
				</div>
			</div>
		</div>
		<div class="footer-below">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">Copyright &copy; Your Website 2017</div>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>
