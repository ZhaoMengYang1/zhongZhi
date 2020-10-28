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
					<li><a class="ft2" href="<c:url value='/FileServlet?method=loadAll&fid=${sessionScope.session_user.home.fid }'/>" target="body"><span
							class="glyphicon glyphicon-list" aria-hidden="true"></span>&nbsp;全部文件</a></li>
					<li><a class="ft2" href="<c:url value='/FileServlet?method=loadDoc'/>" target="body"><span
							class="glyphicon glyphicon-file" aria-hidden="true"></span>&nbsp;文档</a></li>
					<li><a class="ft2" href="<c:url value='/FileServlet?method=loadImg'/>" target="body"><span
							class="glyphicon glyphicon-picture" aria-hidden="true"></span>&nbsp;图片</a></li>
					<li><a class="ft2" href="<c:url value='/FileServlet?method=loadVedio'/>" target="body"><span
							class="glyphicon glyphicon-film" aria-hidden="true"></span>&nbsp;视频</a></li>
					<li><a class="ft2" href="<c:url value='/FileServlet?method=loadMusic'/>" target="body"><span
							class="glyphicon glyphicon-music" aria-hidden="true"></span>&nbsp;音频</a></li>
					<li><a class="ft2" href="<c:url value='/FileServlet?method=loadOther'/>" target="body"><span 
							class="glyphicon glyphicon-hdd" aria-hidden="true"></span>&nbsp;其他</a></li>
					<li><a class="ft2" href="<c:url value='/FileServlet?method=loadRecycled'/>" target="body"><span
						class="glyphicon glyphicon-trash" aria-hidden="true"></span>&nbsp;回收站</a></li>
					<li><a class="ft2" href="<c:url value='/jsps/user/pwd.jsp'/>" target="body"><span 
						class="glyphicon glyphicon-cog" aria-hidden="true"></span>&nbsp;修改密码</a></li>
				</ul>


</body>
</html>
