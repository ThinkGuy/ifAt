<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="adminHead.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link href="<%=basePath%>css/datatables/dataTables.bootstrap.css"
	rel="stylesheet" type="text/css" />
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
							<li><a href="#"><i class="fa fa-angle-double-right"></i>
									生成试卷</a></li>
							<li><a href="#"><i class="fa fa-angle-double-right"></i>
									删除试卷</a></li>
							<li><a href="#"><i class="fa fa-angle-double-right"></i>
									修改试卷</a></li>
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
					<li class="treeview"><a href="#"> <i class="fa fa-table"></i>
							<span>成绩管理</span> <i class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li><a href="#"><i class="fa fa-angle-double-right"></i>
									成绩录入</a></li>
							<li><a href="#"><i class="fa fa-angle-double-right"></i>
									成绩修改</a></li>
						</ul></li>
					<li><a href="#"> <i class="fa fa-calendar"></i> <span>课程安排</span>
							<small class="badge pull-right bg-red">3</small>
					</a></li>
				</ul>
			</section>
			<!-- /.sidebar -->
		</aside>
</body>
</html>