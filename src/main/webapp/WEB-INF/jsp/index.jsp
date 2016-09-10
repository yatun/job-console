<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<link rel="icon" type="image/x-icon" href="${ctx}/static/images/favicon.ico">
<link rel="shortcut icon" type="image/x-icon" href="${ctx}/static/images/favicon.ico">

<c:set var="version_css" value="20160909" scope="application"></c:set>
<c:set var="version_js" value="20160909" scope="application"></c:set>

<title>定时任务控制台</title>

<link href="${ctx}/static/bootstrap/css/bootstrap.css?${version_css}" rel="stylesheet">
<link href="${ctx}/static/bootstrap/css/dashboard.css?${version_css}" rel="stylesheet">

<script src="${ctx}/static/bootstrap/js/ie-emulation-modes-warning.js?${version_js}"></script>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body>

	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
				<span class="sr-only">定时任务系统</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">定时任务系统</a>
		</div>
	</div>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-2 col-md-1 sidebar">
				<ul class="nav nav-sidebar">
					<li class="active"><a href="${ctx }/index">控制台</a></li>
					<li><a href="${ctx }/add">新增</a></li>
				</ul>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-11 col-md-offset-1 main">
				<div class="row">
					<div class="col-md-8">
						<form class="form-inline" role="form" action="${ctx }/index">
							<div class="form-group">
								<label class="sr-only" for="triggerName">Trigger 名称</label> <input type="text" class="form-control" id="triggerName" placeholder="Trigger 名称">
							</div>
							<div class="form-group">
								<label class="sr-only" for="triggerGroup">Trigger 分组</label> <input type="text" class="form-control" id="triggerGroup" placeholder="Trigger 分组">
							</div>
							<button type="submit" class="btn btn-info">查询</button>
						</form>
					</div>
				</div>
				<br />
				<div class="table-responsive">
					<table class="table table-striped table-hover">
						<thead>
							<tr class="info">
								<th>Trigger 名称</th>
								<th>Trigger 分组</th>
								<th>下次执行时间</th>
								<th>上次执行时间</th>
								<th>优先级</th>
								<th>Trigger 状态</th>
								<th>Trigger 类型</th>
								<th>开始时间</th>
								<th>结束时间</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="t" items="${list }">
								<tr>
									<td>${t.display_name}</td>
									<td>${t.trigger_group}</td>
									<td>${t.next_fire_time}</td>
									<td>${t.prev_fire_time}</td>
									<td>${t.priority}</td>
									<td>${t.statu}</td>
									<td>${t.trigger_type}</td>
									<td>${t.start_time}</td>
									<td>${t.end_time}</td>
									<td>
										<button type="button" class="btn btn-info btn-xs" id="pause" data-name="${t.trigger_name}" data-group="${t.trigger_group}">暂停</button>
										<button type="button" class="btn btn-info btn-xs" id="resume" data-name="${t.trigger_name}" data-group="${t.trigger_group}">恢复</button>
										<button type="button" class="btn btn-info btn-xs" id="remove" data-name="${t.trigger_name}" data-group="${t.trigger_group}">删除</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="${ctx}/static/jquery/jquery-1.12.4.min.js?${version_js}"></script>
	<script src="${ctx}/static/bootstrap/js/bootstrap.min.js?${version_js}"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="${ctx}/static/bootstrap/js/ie10-viewport-bug-workaround.js?${version_js}"></script>
	<script type="text/javascript">
    var _ctx = "${ctx}";
    var currentPage = "console";
  </script>
	<script src="${ctx}/static/js/job.js?${version_js}"></script>


</body>
</html>
