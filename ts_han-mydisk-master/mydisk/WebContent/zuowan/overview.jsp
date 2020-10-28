<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


    <title>HomeDisk - 后台管理</title>

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
            <li class="active">
              <a href="overview.jsp">
              <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>&nbsp;
              概览<span class="sr-only">(current)</span>
              </a>
            </li>
            <li>
              <a href="pwd.jsp">
              <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>&nbsp;
              密码管理
              </a>
            </li>
            <li>
              <a href="album.jsp">
              <span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>&nbsp;
              专辑管理
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
            <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>&nbsp;
            概览
          </h1>
          <div class="table-responsive">
            <table class="table table-striped">
              <tbody>
                <tr>
                  <td><h5>用户名</h5></td>
                  <td><input type="text" class="form-control" value="han" readonly /></td>
                </tr>
                <tr>
                  <td><h5>上传资源</h5></td>
                  <td><input type="text" class="form-control" value="0" readonly /></td>
                </tr>
              </tbody>
            </table>
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
    //alert($(".container-fluid").width());
    </script>
  </body>
</html>
