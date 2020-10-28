<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>









<!DOCTYPE html>
<html>
  <head>
    <meta name="renderer" content="webkit">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>HomeDisk - 上传资源</title>

    <!-- Bootstrap core CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="css/01.css" rel="stylesheet">
	<link href="css/dashboard.css" rel="stylesheet">
	
    <!-- Custom styles for this template -->
    <link href="css/starter-template.css" rel="stylesheet">

    <script src="js/ie-emulation-modes-warning.js"></script>

    
    <!--引入CSS-->
	<link rel="stylesheet" type="text/css" href="webuploader/webuploader.css">
  </head>
  <body>
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">HomeDisk</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            
            <li class="back-user-top-welcome">
            <p class="navbar-text navbar-right">
            <label>
            <span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;
            han，欢迎回来！&nbsp;&nbsp;&nbsp;&nbsp;
            </label>
            </p>
            </li>
            <!-- back-user-top-small-window-li -->
            <li class="back-user-top-small-window-li">
              <a href="overview.jsp">
              <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>&nbsp;
              概览<span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="back-user-top-small-window-li">
              <a href="pwd.jsp">
              <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>&nbsp;
              密码管理
              </a>
            </li>
            <li class="back-user-top-small-window-li">
              <a href="album.jsp">
              <span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>&nbsp;
              专辑管理
              </a>
            </li>
            <li class="back-user-top-small-window-li">
              <a href="resource.jsp">
              <span class="glyphicon glyphicon-file" aria-hidden="true"></span>&nbsp;
              资源管理
              </a>
            </li>
            <!-- back-user-top-small-window-li -->
            <li>
              <a href="index.jsp">
              <span class="glyphicon glyphicon-home" aria-hidden="true"></span>&nbsp;
              首页
              </a>
            </li>
            <li>
              <a href="help.jsp">
              <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>&nbsp;
              帮助
              </a>
            </li>
            <li>
              <a href="logout.jsp">
              <span class="glyphicon glyphicon-log-out" aria-hidden="true"></span>&nbsp;
              退出
              </a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row" class="back-user-top-large-window-li">
        
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">
            <span class="glyphicon glyphicon-upload" aria-hidden="true"></span>&nbsp;
            上传资源
          </h1>
          <div class="table-responsive">
             <form method="post" action="act.jsp">
				  <input type="hidden" name="m" value="38" />
				  <div class="form-group col-xs-7">
					<label for="resource">父专辑</label>
					<select class="form-control" id="album-parent">
						<option id="update-album-parent-video" value="video">视频</option>
						<option id="update-album-parent-audio" value="audio">音频</option>
						<option id="update-album-parent-image" value="image">图片</option>
						<option id="update-album-parent-other" value="other">其他</option>
					</select>
				  </div>
				  <div class="form-group col-xs-7">
					<label for="resource">子专辑</label>
					<select class="form-control" id="album-child"  name="albumid">
					</select>
				  </div>
				  <div class="form-group col-xs-7">
					<label for="resource">备注</label>
					<input type="text" class="form-control" placeholder="" name="resource_remark">
				  </div>
				  <div class="form-group col-xs-7">
					<label for="resource">选择资源</label>
					<p class="help-block">支持资源的批量上传，可多选！上传后请点击保存按钮！</p>
					<div>
					    <button type="button" class="btn btn-default" id="selectButton" >
			              <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&nbsp;
			              选择文件
			            </button>
					    &nbsp;&nbsp;
					    <button type="button" class="btn btn-default" id="uploadButton" >
			              <span class="glyphicon glyphicon-open" aria-hidden="true"></span>&nbsp;
			              上传
			            </button>
			            <table class="table table-striped" >
			              <thead>
							<th>资源名称</th>
							<th>文件大小</th>
							<th>上传进度</th>
			              </thead>
			              <tbody id="processContainer" style="display:none;">
			                <tr>
			                  <td width="400">{FileName}</td>
			                  <td width="100">{FileSize}</td>
			                  <td width="200">{UploadPercentage}</td>
			                </tr>
			              </tbody>  
			            </table>	
					</div>	
				  </div>
				  <div class="modal-footer col-xs-7">
					<button type="submit" class="btn btn-default" >
			          <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>&nbsp;
			          保存
			        </button>
				  </div>	
			  </form>
          </div>
        </div>
      </div>
    </div>
	
	<div class="modal fade" id="notice" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-sm">
		<div class="modal-content">
		  <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<h4 class="modal-title" id="myModalLabel">通知</h4>
		  </div>
		  <div class="modal-body" id="modal-notice">
		  </div>
		  <div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">
			  <span class="glyphicon glyphicon-log-out" aria-hidden="true"></span>&nbsp;
			  关闭
			</button>
		  </div>
		</div>
	  </div>
	</div>
	
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="bootstrap/js/jquery.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="bootstrap/js/ie10-viewport-bug-workaround.js"></script>
	<script type="text/javascript" src="html5upload/upload.js"></script>
	
    <script>	
	//get parent to switch children
	$("#album-parent").bind("change", function() { 
		//alert($(this).val()); 
		if ( $(this).val() == "video" ) {
			newAlbumChildren(albumObj.video);
		} else if ( $(this).val() == "audio" ) {
			newAlbumChildren(albumObj.audio);
		} else if ( $(this).val() == "image" ) {
			newAlbumChildren(albumObj.image);
		} else if ( $(this).val() == "other" ) {
			newAlbumChildren(albumObj.other);
		} else {
			$("#album-child").empty();
		}
	}); 

	//将JSON转换为JavaScript对象
	var albumObj = {"video":[{"id":"2","name":"456"},{"id":"1","name":"123"}]};
	
	//分类联动
	var newAlbumChildren = function(album){
		$("#album-child").empty();
		$(album).each(function(index) { 
	        var val = album[index]; 
	        var option = $("<option>").val(val.id).text(val.name);
		    $("#album-child").append(option);
		});
	}
	
	//预设子分类
	newAlbumChildren(albumObj.video);
	
	var initUploader = function () {
	    $ling.html5Upload.config = {
	        selectButtonId: "selectButton",
	        uploadButtonId: "uploadButton",
	        fileProgressContainerId: "processContainer",
	        url: "act_resource_up.jsp",
	        //url: "resupact.jsp",
	        //fileTypes: "|.jpg|.jpeg|.png|",
	        fileSize: 10000 * 1024 * 1024,
	        //回调可以调用三个参数 总数,成功数和失败数,如果不需要可以不传
	        //callback: function (allCount, successCount, failCount) { alert(allCount + "/" + successCount + "/" + failCount); }
	    };
	    $ling.html5Upload.init();
	};
	
	initUploader();
    </script>
    
  </body>
</html>

