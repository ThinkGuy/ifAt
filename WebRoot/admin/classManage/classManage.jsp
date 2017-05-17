<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../admin.jsp"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body class="skin-blue">
	<div class="row-offcanvas row-offcanvas-left">
		<!-- Right side column. Contains the navbar and content of the page -->
		<aside class="right-side">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					班级管理中心 <small>控制面板</small>
				</h1>
				<ol class="breadcrumb">
					<li class="active"><a href="#"><i class="fa fa-dashboard"></i>
							班级管理中心</a></li>
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
											<th>班级名</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${request.classList}" var="c">
											<tr>
												<td>${c.name}</td>
												<td><button class="btn btn-info btn-sm"
														onclick="window.location.href='<%=basePath%>Admin/AdminBasicOperation_deleteClass.action?cid=${c.id}'">删除</button>
													<button class="btn btn-info btn-sm"
														onclick="window.location.href='<%=basePath%>Admin/AdminBasicOperation_searchStudentsByClass.action?cid=${c.id}'">查看学生</button>
													<button class="btn btn-info btn-sm"
														onclick="window.location.href='<%=basePath%>Admin/AdminBasicOperation_displayOfferQuestionnaire.action?cid=${c.id}'">绑定试卷</button>
												</td>
											</tr>
										</c:forEach>
									</tbody>
									<tfoot>
										<tr>
											<th>班级名</th>
											<th>操作</th>
										</tr>
									</tfoot>
								</table>
							</div>
						</div>
					</div>
				</div>
			</section>
		</aside>
	</div>
</body>
</html>
