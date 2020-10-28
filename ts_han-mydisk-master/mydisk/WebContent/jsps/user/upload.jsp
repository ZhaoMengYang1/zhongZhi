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
<%-- <link href="<c:url value='/css/starter-template.css'/>" rel="stylesheet">

<script src="<c:url value='/js/ie-emulation-modes-warning.js'/>"></script> --%>

<script src="<c:url value='/jquery/jquery-1.12.4.js'/>"></script>
<script src="<c:url value='/js/upload.js'/>"></script>



</head>

<body>

	<div class="container-fluid">
		<div class="row" class="back-user-top-large-window-li">
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="table-responsive">
					<form method="post" action="act.jsp">
						<input type="hidden" name="m" value="38" />

						<div class="form-group col-xs-7">
							<label for="resource">选择资源</label>
							<p class="help-block">支持资源的批量上传，可多选！</p>
							<div>
								<button type="button" class="btn btn-default" id="selectButton">
									<span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&nbsp;
									选择文件
								</button>
								&nbsp;&nbsp;
								<button type="button" class="btn btn-default" id="uploadButton">
									<span class="glyphicon glyphicon-open" aria-hidden="true"></span>&nbsp;
									上传
								</button>
								<table class="table table-striped">
									<thead>
										<th>资源名称</th>
										<th>文件大小</th>
										<th>上传进度</th>
									</thead>
									<tbody id="processContainer" style="display: none;">
										<tr>
											<td width="400">{FileName}</td>
											<td width="100">{FileSize}</td>
											<td width="200">{UploadPercentage}</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	
    <script>	
	
	var initUploader = function () {
	    $han.html5Upload.config = {
	        selectButtonId: "selectButton",//选择文件夹按钮
	        uploadButtonId: "uploadButton",//上传文件按钮
	        parent:"${param.parent}",//当前文件夹的id
	        fileProgressContainerId: "processContainer",//显示文件列表的元素
	        url: "<c:url value='/UploadServlet'/>",//上传文件要访问的的url
	        //url: "resupact.jsp",
	        //fileTypes: "|.jpg|.jpeg|.png|",
	        fileSize: 10 * 1024 * 1024 * 1024,//上传文件的大小限制
	        //回调可以调用三个参数 总数,成功数和失败数,如果不需要可以不传
	        //callback: function (allCount, successCount, failCount) { alert(allCount + "/" + successCount + "/" + failCount); }
	    };
	    $han.html5Upload.init();
	};
	
	initUploader();
    </script>
  




</body>
</html>
