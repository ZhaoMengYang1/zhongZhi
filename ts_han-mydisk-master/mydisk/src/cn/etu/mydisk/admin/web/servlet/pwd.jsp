<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta name="renderer" content="webkit">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>HomeDisk - 资源管理</title>

<link href="<c:url value='/bootstrap/css/bootstrap.min.css'/>"
	rel="stylesheet">

<link href="<c:url value='/jsps/css/body.css'/>" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="<c:url value='/css/starter-template.css'/>" rel="stylesheet">
<link href="<c:url value='/jsps/css/user/pwd.css'/>" rel="stylesheet">

<script src="<c:url value='/js/ie-emulation-modes-warning.js'/>"></script>



</head>

<body>

	<div class="container-fluid">
		<div class="row" class="back-user-top-large-window-li">
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="table-responsive">
					<h1 class="page-header">
						<span class="glyphicon glyphicon-cog" aria-hidden="true"></span>&nbsp;
						修改密码
					</h1>
					<div class="container">

		<form class="form-signin" target="_top"
			action="<c:url value='/UserServlet'/>" method="post" id="loginForm">
			<input type="hidden" name="method" value="login" />
			<table>
				<tr>
					<td width="100"></td>
					<td><label class="error" id="msg">121</label></td>
				</tr>
				<tr>
					<td width="70" align="right"><h4>原密码:&nbsp;&nbsp;</h4></td>
					<td><label class="sr-only" for="inputUserName">密码</label> <input
						name="username" class="form-control" type="text" name="uname"
						required="" value="${form.uname }" /></td>
				</tr>
				<tr>
					<td height="20">&nbsp;</td>
					<td><label id="loginnameError" class="error">用户名错误</label></td>
				</tr>
				<tr>
					<td align="right"><h4>新密码:&nbsp;&nbsp;</h4></td>
					<td><label class="sr-only" for="inputPassword"> 密码 </label> <input
						class="form-control" type="password" name="password" required=""
						value="${form.password }" /></td>
				</tr>
				<tr>
					<td height="20">&nbsp;</td>
					<td><label id="loginpassError" class="error">密码错误</label></td>
				</tr>
				
				<tr>
					<td align="right"><h4>确认密码:&nbsp;&nbsp;</h4></td>
					<td><label class="sr-only" for="inputPassword"> 密码 </label> <input
						class="form-control" type="password" name="password" required=""
						value="${form.password }" /></td>
				</tr>
				<tr>
					<td height="20">&nbsp;</td>
					<td><label id="loginpassError" class="error">密码错误</label></td>
				</tr>

				<tr>
					<td>&nbsp;</td>
					<td align="left">
						<button width="100" class="btn btn-default" type="reset">
							重置</button>
						<button width="100" class="btn btn-default" type="submit">
							提交</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
				</div>
			</div>
		</div>
	</div>







</body>
</html>
