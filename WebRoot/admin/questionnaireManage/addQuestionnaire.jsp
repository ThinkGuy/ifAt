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
					生成试卷 <small>控制面板</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="<%=basePath%>admin/admin.jsp"><i
							class="fa fa-dashboard"></i> 管理员主页</a></li>
					<li class="active">生成试卷</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">

				<div class="row clearfix">
					<div class="col-md-4 col-md-offset-4 column">
						<form
							action="<%=basePath%>/Admin/QuestionnaireOperation_addQuestionnaire.action"
							id="form" method="post">
							<center>
								<h3>生成试卷</h3>
							</center>
							<hr class="star-primary">
							<div class="form-group">
								<label for="Password">试卷名:</label> <input class="form-control"
									id="name" type="text" name="name" />
							</div>
							<!-- textarea -->
							<div class="form-group">
								<label>试卷Json</label>
								<textarea class="form-control" rows="3" placeholder="Enter ..."
									name="questionnaire" id="questionnaire"></textarea>
							</div>
							<div class="form-group">
								<label>试卷Json格式</label>
								<textarea class="form-control" rows="3" placeholder="{{'Title':'title1','A':'a1','B':'b1','C':'c1','D':'d1','Answer':'A'},
					           					{'Title':'title2', 'A':'a2','B':'b2','C':'c2','D':'d2','Answer':'B'},
					        					......}"
									disabled></textarea>
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
