<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../admin.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        </head>
    <body class="skin-blue">
        <!-- header logo: style can be found in header.less -->
        
        <div class="row-offcanvas row-offcanvas-left">
            <!-- Right side column. Contains the navbar and content of the page -->
		<aside class="right-side">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					管理员密码修改 <small>控制面板</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="<%=basePath%>admin/admin.jsp"><i
							class="fa fa-dashboard"></i> 管理员主页</a></li>
					<li class="active">修改密码</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">

				<div class="row clearfix">
					<div class="col-md-4 col-md-offset-4 column">
						<form
							action="<%=basePath%>/Admin/AdminBasicOperation_changePassword.action"
							id="form" method="post">
							<center>
								<h3>管理员密码修改</h3>
							</center>
							<hr class="star-primary">
							<div class="form-group">
								<label for="Password">新密码:</label> <input class="form-control"
									id="chPassword" type="password" name="chPassword" />
							</div>
							<div class="form-group">
								<label for="Password">确认密码:</label> <input class="form-control"
									id="chPassword" type="password" name="confirmPassword" />
							</div>
							<div class="row clearfix">
								<div class="col-md-12 column">${request.info}</div>
								</br>
							</div>
							<button class="btn btn-lg btn-primary btn-block" type="submit">提交</button>
						</form>
					</div>
				</div>

			</section>
			<!-- /.content -->
		</aside>
		<!-- /.right-side -->
	</div>
	<!-- ./wrapper -->
    </body>
</html>
