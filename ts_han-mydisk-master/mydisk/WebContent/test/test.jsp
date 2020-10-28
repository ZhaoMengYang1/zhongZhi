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

<title>资源管理</title>

<link href="<c:url value='/bootstrap/css/bootstrap.min.css'/>"
	rel="stylesheet">

<link href="<c:url value='/jsps/css/body.css'/>" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="<c:url value='/css/starter-template.css'/>" rel="stylesheet">

<script src="<c:url value='/js/ie-emulation-modes-warning.js'/>"></script>

<script src="<c:url value='/jquery/jquery-1.12.4.js'/>"></script>
<script type="text/javascript">
//添加
$(document).on("click", "#add", function() {
	var str_tr = "<tr>" + $(this).parents("tr").html() + "</tr>";
	//js 替换字符串样式
	str_tr = str_tr.replace(/\+/, '-');
	var new_str_tr = str_tr.replace(/add/, 'del');
	$(this).parents("tr").after(new_str_tr);
})
//删除
$(document).on("click", "#del", function() {
	$(this).parents("tr").remove();
})
//文件上传
$("#but").click(function() {
					var formData = new FormData($("#uploadForm")[0]);
					$
							.ajax({
								url : 'http://localhost/demo/selfWork_MVC/easymvc/app/Views/Index/upload.php',
								type : 'POST',
								data : formData,
								async : false,
								cache : false,
								contentType : false,
								processData : false,
								success : function(returndata) {
									alert(returndata);
								},
								error : function(returndata) {
									alert(returndata);
								}
							});
				})

</script>

</head>
<body>


	<form id="uploadForm" action="" method="post"
		enctype="multipart/form-data">
		<h1>多文件--上传</h1>
		<table>
			<tr>
				<td>上传文件： <input type="file" name="file[]" id="file"
					multiple="multiple" /><a href="javascript:void(0);" id="add">[+]</a></td>
			</tr>
			<tr>
				<td><input type="button" value="上传" id="but" /></td>
			</tr>
		</table>
	</form>
</body>
</html>