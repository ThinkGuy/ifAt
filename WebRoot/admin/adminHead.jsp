<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IfAt</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<!-- bootstrap 3.0.2 -->
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<!-- font Awesome -->
<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet"
	type="text/css" />
<!-- Ionicons -->
<link href="<%=basePath%>css/ionicons.min.css" rel="stylesheet"
	type="text/css" />
<!-- Morris chart -->
<link href="<%=basePath%>css/morris/morris.css" rel="stylesheet"
	type="text/css" />
<!-- jvectormap -->
<link href="<%=basePath%>css/jvectormap/jquery-jvectormap-1.2.2.css"
	rel="stylesheet" type="text/css" />
<!-- fullCalendar -->
<link href="<%=basePath%>css/fullcalendar/fullcalendar.css"
	rel="stylesheet" type="text/css" />
<!-- Daterange picker -->
<link href="<%=basePath%>css/daterangepicker/daterangepicker-bs3.css"
	rel="stylesheet" type="text/css" />
<!-- bootstrap wysihtml5 - text editor -->
<link
	href="<%=basePath%>css/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css"
	rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="<%=basePath%>css/AdminLTE.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>css/datatables/dataTables.bootstrap.css"
	rel="stylesheet" type="text/css" />
</head>
<body class="skin-blue">


<!-- jQuery 2.0.2 -->
<script src="<%=basePath%>js/jquery.min.js"></script>
<script src="<%=basePath%>js/plugins/datatables/jquery.dataTables.js"
	type="text/javascript"></script>
<script src="<%=basePath%>js/plugins/datatables/dataTables.bootstrap.js"
	type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		$("#example1").dataTable();
	});
</script>
<!-- jQuery UI 1.10.3 -->
<script src="<%=basePath%>js/jquery-ui-1.10.3.min.js"
	type="text/javascript"></script>
<!-- Bootstrap -->
<script src="<%=basePath%>js/bootstrap.min.js" type="text/javascript"></script>
<!-- Morris.js charts -->
<script
	src="<%=basePath%>//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="<%=basePath%>js/plugins/morris/morris.min.js"
	type="text/javascript"></script>
<!-- Sparkline -->
<script src="<%=basePath%>js/plugins/sparkline/jquery.sparkline.min.js"
	type="text/javascript"></script>
<!-- jvectormap -->
<script
	src="<%=basePath%>js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"
	type="text/javascript"></script>
<script
	src="<%=basePath%>js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"
	type="text/javascript"></script>
<!-- fullCalendar -->
<script src="<%=basePath%>js/plugins/fullcalendar/fullcalendar.min.js"
	type="text/javascript"></script>
<!-- jQuery Knob Chart -->
<script src="<%=basePath%>js/plugins/jqueryKnob/jquery.knob.js"
	type="text/javascript"></script>
<!-- daterangepicker -->
<script src="<%=basePath%>js/plugins/daterangepicker/daterangepicker.js"
	type="text/javascript"></script>
<!-- Bootstrap WYSIHTML5 -->
<script
	src="<%=basePath%>js/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"
	type="text/javascript"></script>
<!-- iCheck -->
<script src="<%=basePath%>js/plugins/iCheck/icheck.min.js"
	type="text/javascript"></script>

<!-- AdminLTE App -->
<script src="<%=basePath%>js/AdminLTE/app.js" type="text/javascript"></script>

<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="<%=basePath%>js/AdminLTE/dashboard.js"
	type="text/javascript"></script>

</body>
</html>