<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
					添加班级 <small>控制面板</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> 班级管理中心</a></li>
					<li class="active">添加班级</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">${request.Info}</h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body table-responsive">
								<table id="example1" class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>姓名</th>
											<th>密码</th>
											<th>班级</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${request.studentList}" var="student">
											<tr>
												<td>${student.name}</td>
												<td>${student.password}</td>
												<td>${request.className}</td>
											</tr>
										</c:forEach>
									</tbody>
									<tfoot>
										<tr>
											<th>姓名</th>
											<th>密码</th>
											<th>班级</th>
										</tr>
									</tfoot>
								</table>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->
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

