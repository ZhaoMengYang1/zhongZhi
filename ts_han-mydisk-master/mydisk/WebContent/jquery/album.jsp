<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>









<!DOCTYPE html>
<html lang=>
  <head>
    <meta name="renderer" content="webkit">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>HomeDisk - 专辑管理</title>

    <!-- Bootstrap core CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="css/01.css" rel="stylesheet">
	<link href="css/dashboard.css" rel="stylesheet">
	
    <!-- Custom styles for this template -->
    <link href="css/starter-template.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.min.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
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
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li>
              <a href="overview.jsp">
              <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>&nbsp;
              概览
              </a>
            </li>
            <li>
              <a href="pwd.jsp">
              <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>&nbsp;
              密码管理
              </a>
            </li>
            <li class="active">
              <a href="album.jsp">
              <span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>&nbsp;
              专辑管理<span class="sr-only">(current)</span>
              </a>
            </li>
            <li>
              <a href="resource.jsp">
              <span class="glyphicon glyphicon-file" aria-hidden="true"></span>&nbsp;
              资源管理
              </a>
            </li>
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">
            <span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>&nbsp;
            专辑管理
          </h1>
          <div class="table-responsive">
		    <button type="button" class="btn btn-default" data-toggle="modal" data-target="#addAlbum">
		      <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;
		      新建专辑
		    </button>
            &nbsp;
            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#searchDialog">
              <span class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;
              查询
            </button>
            <table class="table table-striped">
              <thead>
			    <th>#</th>
				<th>专辑名称</th>
				<th>父专辑</th>
				<th>修改</th>
				<th>隐私设定</th>
				<th>删除</th>
              </thead>
              <tbody>
                
                <tr>
                  <td id="album-id-1">1</td>
                  <td id="album-name-1" class="text-style-2">123</td>
				  <td>
				    <input id="album-parent-1" type="hidden" value="video" />
				    视频
				  </td>  
				  <td>
				    <button type="button" class="btn btn-default" 
				      onclick="updateAlbum(1)">
				      <span class="glyphicon glyphicon-erase" aria-hidden="true"></span>&nbsp;
				      修改
				    </button>
				  </td>
				  <td>
                    <form method="post" action="act.jsp">
		  		    <input type="hidden" name="m" value="18" />
		  		    <input type="hidden" name="albumid" value="1" />
		  		    <input type="hidden" name="p" value="1" />
		  		    
		  		    <input type="hidden" name="private" value="0" />
                    <button type="submit" class="btn btn-default" >
                      <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>&nbsp;
                      设为公开
                    </button>
                    
                    </form>
                  </td>
                  <td>
                    <form method="post" action="act.jsp">
		  		    <input type="hidden" name="m" value="17" />
		  		    <input type="hidden" name="albumid" value="1" />
		  		    <input type="hidden" name="p" value="1" />
                    <button type="submit" class="btn btn-default">
                      <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>&nbsp;
                      删除
                    </button>
                    </form>
                  </td>
                </tr>
                
              </tbody>
            </table>
            <div class="text-center">
			  <form id="turnPageWithPost" method="post" action="album.jsp">
<input type="hidden" id="postPage" name="p" value=""/>
<input type="hidden" name="parentname" value=""/>
<input type="hidden" name="albumname" value=""/>
<div class="btn-group" role="group" aria-label="...">
</div>
</form>

		    </div>
          </div>
        </div>
      </div>
    </div>
    
    
	<div class="modal fade" id="addAlbum" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-sm">
		<div class="modal-content">
		  <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<h4 class="modal-title" id="myModalLabel">专辑管理</h4>
		  </div>
		  <form method="post" action="act_album_up.jsp" enctype="multipart/form-data">
		  <div class="modal-body">
			  <input type="hidden" name="m" value="15" />
			  <div class="form-group">
				<label for="album">专辑名称</label>
				<input type="text" class="form-control" id="exampleInputEmail1" placeholder="" name="albumname">
			  </div>
			  <div class="form-group">
				<label for="album">父专辑</label>
				<select class="form-control" name="parentname">
					<option value="video">视频</option>
					<option value="audio">音频</option>
					<option value="image">图片</option>
					<option value="other">其他</option>
				</select>
			  </div>
			  <div class="form-group">
				<label for="album">专辑封面</label>
				<input type="file" name="imageurl" id="addcover" size="15">
				<p class="help-block">请选择图片作为专辑封面</p>
			  </div>
			
		  </div>
		  <div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">
			  <span class="glyphicon glyphicon-log-out" aria-hidden="true"></span>&nbsp;
			  关闭
			</button>
			<button type="submit" class="btn btn-default" >
              <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>&nbsp;
              提交
            </button>
		  </div>
		  </form>
		</div>
	  </div>
	</div>
	
	<div class="modal fade" id="updateAlbum" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-sm">
		<div class="modal-content">
		  <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<h4 class="modal-title" id="myModalLabel">专辑管理</h4>
		  </div>
		  <form method="post" action="act_album_up.jsp" enctype="multipart/form-data">
		  <div class="modal-body">
			  <input type="hidden" name="m" value="16" />
			  <input type="hidden" id="update-album-id" name="albumid" value="" />
			  <input type="hidden" name="p" value="1" />
			  <div class="form-group">
				<label for="album">专辑名称</label>
				<input type="text" class="form-control" id="update-album-name"  placeholder="" name="albumname">
			  </div>
			  <div class="form-group">
				<label for="album">父专辑</label>
				<select class="form-control" id="update-album-parent"  name="parentname">
					<option id="update-album-parent-video" value="video">视频</option>
					<option id="update-album-parent-audio" value="audio">音频</option>
					<option id="update-album-parent-image" value="image">图片</option>
					<option id="update-album-parent-other" value="other">其他</option>
				</select>
			  </div>
			  <div class="form-group text-style-1">
				<label for="album">专辑封面</label>
				<input type="file" id="album" name="imageurl" >
				<p class="help-block">如果您不打算修改图片，无需选择文件！</p>
			  </div>			
		  </div>
		  <div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">
			  <span class="glyphicon glyphicon-log-out" aria-hidden="true"></span>&nbsp;
			  关闭
			</button>
			<button type="submit" class="btn btn-default" >
              <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>&nbsp;
              提交
            </button>
		  </div>
		  </form>
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
	
	<div class="modal fade" id="searchDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-sm">
		<div class="modal-content">
		  <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<h4 class="modal-title" id="myModalLabel">查询条件</h4>
		  </div>
		  <form method="post" action="album.jsp">
		  <div class="modal-body" id="modal-notice">
			  <div class="form-group">
				<label for="album">专辑名称</label>
				<input type="text" class="form-control" id="update-album-name"  placeholder="" name="albumname">
			  </div>
			  <div class="form-group">
				<label for="album">父专辑</label>
				<select class="form-control" id="update-album-parent"  name="parentname">
				    <option id="update-album-parent-video" value="albumall">全部专辑</option>
					<option id="update-album-parent-video" value="video">视频</option>
					<option id="update-album-parent-audio" value="audio">音频</option>
					<option id="update-album-parent-image" value="image">图片</option>
					<option id="update-album-parent-other" value="other">其他</option>
				</select>
			  </div>
		  </div>
		  <div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">
			  <span class="glyphicon glyphicon-log-out" aria-hidden="true"></span>&nbsp;
			  关闭
			</button>
			<button type="submit" class="btn btn-default" >
              <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>&nbsp;
              提交
            </button>
		  </div>
		  </form>
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
    
    <script>
	//turn page
    var turn = function(url){
    	window.location.href=url;
    }
    var select = function(albumid,optionid){
    	var source = $('#album-parent-'+albumid).val();
    	var option = $('#'+optionid).val();
		if ( source == option ) {
			$('#update-album-parent').val(option);
		}
	}
	var updateAlbum = function(id){
		$('#update-album-id').val($('#album-id-'+id).html());
		$('#update-album-name').val($('#album-name-'+id).html());
		select(id,'update-album-parent-video');
		select(id,'update-album-parent-audio');
		select(id,'update-album-parent-image');
		select(id,'update-album-parent-other');		
		$('#updateAlbum').modal('show');
		//alert($('#album').width(100));
	}
    var post = function(page){
    	$("#postPage").val(page);
    	$("#turnPageWithPost").submit();
    }
	
    </script>
    
    

  </body>
</html>

