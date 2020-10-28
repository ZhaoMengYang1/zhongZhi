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


<script src="<c:url value='/jquery/jquery-1.12.4.js'/>"></script>
<script src="<c:url value='/jquery/jquery.form.js'/>"></script>


<script type="text/javascript">
 window.onload = function() {
			$("form.change_form").ajaxForm(function(date) {
				alert(date);
			});
	} 
</script>
</head>
<body>
	<form class="change_form" action="<c:url value='/TestServlet2'/>" method="post">
		<input type="hidden" name="method" value="resetPassword" /> <input
			type="hidden" name="uid" value="1234567" />
		<button type="submit" class="btn btn-default sub_btn"
			data-toggle="modal">
			<span class="glyphicon glyphicon-alert" aria-hidden="true"></span>&nbsp;
			重置密码为“1”
		</button>

	</form>



</body>
</html>