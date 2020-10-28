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

    <title>HomeDisk - 数据备份</title>

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
            
            <li>
            <p class="navbar-text navbar-right">
            <label>
            <span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;
            admin，欢迎回来！&nbsp;&nbsp;&nbsp;&nbsp;
            </label>
            </p>
            </li>
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
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li>
              <a href="adminoverview.jsp">
              <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>&nbsp;
              概览
              </a>
            </li>
			<li>
			  <a href="adminpwd.jsp">
			  <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>&nbsp;
			  密码管理<span class="sr-only">(current)</span>
			  </a>
			</li>
			 
            <li>
              <a href="adminusersmgr.jsp">
              <span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;
              用户管理
              </a>
            </li>
            <li>
              <a href="admindelfile.jsp">
              <span class="glyphicon glyphicon-file" aria-hidden="true"></span>&nbsp;
              资源管理              
              </a>
            </li>
            <li class="active">
              <a href="backupdatabase.jsp">
              <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>&nbsp;
              数据备份<span class="sr-only">(current)</span>              
              </a>
            </li>
          </ul>         
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">
            <span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>&nbsp;
            数据备份
          </h1>
          <div class="table-responsive">
            <form  method="post" action="act.jsp">
            <input type="hidden" name="m" value="43" />
		    <button type="submit" class="btn btn-default">
		      <span class="glyphicon glyphicon-floppy-saved" aria-hidden="true"></span>&nbsp;
		      备份当前数据
		    </button>
		    </form>
            <table class="table table-striped">
              <thead>
			    <th>#</th>
				<th>文件名</th>
				<th>备份日期</th>
				<th>恢复数据</th>
				<th>下载备份</th>
				<th>删除备份</th>
              </thead>
              <tbody>
                
                <tr>
                  <td>1</td>
                  <td>1544199262834.sql</td>
                  <td>2018-12-08</td>
				  <td>
				   <form  method="post" action="act.jsp">
		            <input type="hidden" name="m" value="45" />
		            <input type="hidden" name="filename" value="1544199262834.sql" />
				    <button type="submit" class="btn btn-default">
				      <span class="glyphicon glyphicon-floppy-open" aria-hidden="true"></span>&nbsp;
				      恢复数据
				    </button>
		    	   </form>
				  </td>  
				  <td>
				   <form  method="post" action="act_backup_down.jsp">
		            <input type="hidden" name="m" value="46" />
		            <input type="hidden" name="filename" value="1544199262834.sql" />
				    <button type="submit" class="btn btn-default">
				      <span class="glyphicon glyphicon-floppy-save" aria-hidden="true"></span>&nbsp;
				      下载备份
				    </button>
		    	   </form>
				  </td>
                  <td>
                    <form method="post" action="act.jsp">
		  		    <input type="hidden" name="m" value="44" />
		  		    <input type="hidden" name="filename" value="1544199262834.sql" />
                    <button type="submit" class="btn btn-default">
                      <span class="glyphicon glyphicon-floppy-remove" aria-hidden="true"></span>&nbsp;
                      删除备份
                    </button>
                    </form>
                  </td>
                </tr>
                
              </tbody>
            </table>
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
    
    <script>
	//turn page
    var turn = function(url){
    	window.location.href=url;
    }
    </script>
    
    

  </body>
</html>
    