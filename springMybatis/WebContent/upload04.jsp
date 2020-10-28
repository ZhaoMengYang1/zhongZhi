<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>

<body>
<script src="webupload/js/jquery-1.10.2.min.js" ></script>
<h2>文件夹上传04</h2>
<form class="form-horizontal" role="form" id="fileUploadForm" action="uploadFolder" name="fileUploadForm" method="post" enctype="multipart/form-data">
			  <div class="form-group">
			    <input id="fileFolder" name="fileFolder" type="file" webkitdirectory><span id="msg" style="color:#F00"></span>
			  </div>
			  <button type="button" class="btn btn-primary" id="subButton" οnclick="commit()">Submit</button>
			  <input type="submit" value="submit提交" />
			</form>
			<br/><br/>									  
<form class="form-horizontal" id="fileUploadForm" action="uploadFolder02" name="fileUploadForm" method="post" enctype="multipart/form-data">
    <div class="form-group">
    	<input type="text" name="number1"/><br/>
        <input id="ctrl" name="uploadFile" type="file" webkitdirectory directory multiple>
    </div>
    <button type="button" class="btn btn-primary" id="subButton" οnclick="commit()">button</button>
    <input type="submit" value="submit提交" />
</form>			
			<br/><br/>
			<b>UserServlet</b>
<form class="form-horizontal" id="fileUploadForm" action="UserServlet" name="fileUploadForm" method="post" enctype="multipart/form-data">
    <div class="form-group">
    	<input type="text" name="number1"/><br/>
        <input id="ctrl" name="uploadFile" type="file" webkitdirectory directory multiple>
    </div>
    <button type="button" class="btn btn-primary" id="subButton" οnclick="commit()">button</button>
    <input type="submit" value="submit提交" />
</form>			
			<br/><br/>	
			
			
			
			<h3>@webServlet(urlPattern="")跳转</h3>		
	<form class="form-signin" target="_top"
			action="<c:url value='/UserServlet'/>" method="post" id="loginForm">
			
			<input type="text" /><br/>
			<input type = "submit" value="submit提交" />
			
			</form>		
			
			
			
			
			
			
			
<a href="DataUpload">DataUpload</a>
<br/>
<a href="uploadFolder">uploadFolder</a>
<p>点击消失</p>
</body>
<script>
//页面提示信息
var	msg;
//文件数量限制
var filesCount=2000;
//文件夹大小限制 2000M
var filesSize=2147483648;
//实际的文件数量
var actual_filesCount=0;
//实际的文件夹大小
var actual_filesSize=0;
 $(document).ready(function(){
	 $("p").click(function(){
		 $(this).hide();
		 
	 });
 });


 
</script>
</body>
</html>






