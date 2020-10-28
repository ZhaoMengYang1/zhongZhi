<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>登录</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="content-type" content="text/html;charset=utf-8">

<link href="<c:url value='/bootstrap/css/bootstrap.min.css'/>"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/user/login.css'/>">

<script type="text/javascript">
	//跳出框架显示该页面
	if (window != top)
		top.location.href = location.href;
</script>
</head>

<body>
	<div class="container">

		<form class="form-signin" target="_top"
			action="<c:url value='/UserServlet'/>" method="post" id="loginForm">
			<input type="hidden" name="method" value="login" />
			<h2 class="form-signin-heading">请登录</h2>
			<table>
				<tr>
					<td width="70"></td>
					<td><label class="error" id="msg">${msg }</label></td>
				</tr>
				<tr>
					<td width="70"><h4>用户名</h4></td>
					<td><label class="sr-only" for="inputUserName">用户名</label> <input
						name="uname" class="form-control" type="text"
						required="" value="${form.uname }" /></td>
				</tr>
				<tr>
					<td height="20">&nbsp;</td>
					<td><label id="loginnameError" class="error">${form.errors.uname }</label></td>
				</tr>
				<tr>
					<td><h4>密&nbsp;&nbsp;&nbsp;&nbsp;码</h4></td>
					<td><label class="sr-only" for="inputPassword"> 密码 </label> <input
						class="form-control" type="password" name="password" required=""
						value="${form.password }" /></td>
				</tr>
				<tr>
					<td height="20">&nbsp;</td>
					<td><label id="loginpassError" class="error">${form.errors.password }</label></td>
				</tr>

				<tr>
					<td>&nbsp;</td>
					<td align="left">
						<button class="btn btn-lg btn-primary btn-block" type="submit">
							登录</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
