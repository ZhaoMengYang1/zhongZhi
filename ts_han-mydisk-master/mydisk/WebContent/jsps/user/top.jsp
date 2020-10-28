<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>top</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<!-- Bootstrap core CSS -->
<link href="<c:url value='/bootstrap/css/bootstrap.min.css'/>"
	rel="stylesheet">

<script type="text/javascript">
	function goview() {
		var b = $
		{
			sessionScope.session_user.admin
		}
		if (b) {

			window.top.location = "<c:url value='/jsps/admin/adminoverview.jsp'/>";
		} else {

			window.top.location = "<c:url value='/jsps/user/overview.jsp'/>";
		}
	}

</script>



</head>


<nav class="navbar navbar-default navbar-fixed-top">
<div class="container-fluid">
	<div class="navbar-header">
		<a class="navbar-brand ft1" href="#"><span
			class="glyphicon glyphicon-home" aria-hidden="true"></span>&nbsp;MyDisk</a>
	</div>

	<!-- Collect the nav links, forms, and other content for toggling -->
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<form class="navbar-form navbar-right" role="search" method="post"
			action="<c:url value='/Search'/>">
			<input name="method" value="search" type="hidden">
			<div class="col-lg-12">
				<div class="input-group">
					<input type="text" name="query_key_word" class="form-control"
						placeholder="请输入关键字..."> <span class="input-group-btn">
						<button class="btn btn-default" type="submit">
							<span class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;查询
						</button>
					</span>
				</div>
				<!-- /input-group -->
				<c:if test="${not empty sessionScope.session_user}">
					<label>&nbsp; <span class="glyphicon glyphicon-user"
						aria-hidden="true"></span>&nbsp;
						${sessionScope.session_user.uname}，欢迎回来！&nbsp;
					</label>
				</c:if>


				<a class="ft2" target="_top"
					href="<c:url value='/UserServlet?method=logout'/>"> <span
					class="glyphicon glyphicon-log-out" aria-hidden="true"></span>&nbsp;退出
				</a> <a class="ft2" target="_top" href="<c:url value='/help.jsp'/>">
					<span class="glyphicon glyphicon-log-out" aria-hidden="true"></span>&nbsp;帮助
				</a>
			</div>
			<!-- /.col-lg-12 -->
		</form>

	</div>
	<!-- /.navbar-collapse -->
</div>
</nav>
</head>