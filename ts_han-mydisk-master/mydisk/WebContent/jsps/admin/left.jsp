<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>left</title>
    <base target="body"/>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">

<!-- Bootstrap core CSS -->
<link href="<c:url value='/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
<link href="<c:url value='/jsps/css/left.css'/>" rel="stylesheet">


</head>
  
<body>  

<ul class="nav navbar-nav">
					<li><a class="ft2" href="<c:url value='/admin/AdminServlet?method=overView'/>" target="body"><span
							class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>&nbsp;概览</a></li>
					<li><a class="ft2" href="<c:url value='/jsps/admin/pwd.jsp'/>" target="body"><span 
						class="glyphicon glyphicon-cog" aria-hidden="true"></span>&nbsp;修改密码</a></li>
					<li><a class="ft2" href="<c:url value='/admin/UserServlet?method=findAll'/>" target="body"><span 
						class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;用户管理</a></li>
					<li><a class="ft2" href="javascript:void(0);" target="_top" onclick="goview()"><span
						class="glyphicon glyphicon-trash" aria-hidden="true"></span>&nbsp;磁盘使用情况</a></li>
					
				</ul>


</body>
</html>
