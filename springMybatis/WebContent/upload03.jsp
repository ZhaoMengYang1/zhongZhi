<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>

<body>
<!--<script src="webupload/js/jquery-1.10.2.min.js" ></script> -->
<h2>文件夹上传</h2>

<form action="DataUpload" method="post" enctype="multipart/form-data">
<input type="text" name="dbName" value="Database Name Here" id="dbName"/>
    <input type="file" id="ctrl" webkitdirectory directory multiple/>
    <input type="submit" />
</form>
<br/><br/>
<a href="DataUpload">DataUpload</a>
<br/>
<a href="uploadFolder">uploadFolder</a>
<script>


</script>
</body>
</html>






