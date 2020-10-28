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
<h2>上传</h2>
<form class="form-horizontal" id="fileUploadForm" action="uploadFolder" name="fileUploadForm" method="post" enctype="multipart/form-data">
    <div class="form-group">
    	<input type="text" name="number1"/><br/>
        <input id="ctrl" name="uploadFile" type="file" webkitdirectory />
    </div>
    <button type="button" class="btn btn-primary" id="subButton" οnclick="commit()">button</button>
    <input type="submit" value="submit提交" />
</form>
<br/><br/>

<a href="DataUpload">DataUpload</a>
<br/>
<a href="uploadFolder">uploadFolder</a>
<script>
    /*
     *实现1
     */

   //页面提示信息
     var    msg;
     //文件数量限制
     var filesCount=2000;
     //文件夹大小限制 2000M
     var filesSize=2147483648;
     //实际的文件数量
     var actual_filesCount=0;
     //实际的文件夹大小
     var actual_filesSize=0;
      
     function commit(){
         //判断是否选中文件夹
         var file=$("#fileFolder").val();
         if(file==''){
             $("#msg").text('请选择要上传的文件夹');
             return;
         }
         
      
         
         $("#fileUploadForm").submit();
      
     }
    
     document.getElementById('fileFolder').onchange = function(e) {
    
         //判断是否选中文件
         var file=$("#fileFolder").val();
         if(file!=''){
             $("#msg").text('');
         }
         var files = e.target.files; // FileList
         //文件数量
         actual_filesCount = files.length;
         if(actual_filesCount > filesCount){
             $("#msg").text("文件过多，单次最多可上传"+filesCount+"个文件");
             return;
         }
         for (var i = 0, f; f = files[i]; ++i){
             actual_filesSize += f.size;
             if(actual_filesSize > filesSize){
                 $("#msg").text("单次文件夹上传不能超过"+filesSize+"M");
                 return;
             }
         }
     };




    /*
     * 实现 2
     */



</script>
</body>
</html>






