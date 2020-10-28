<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html>
  <head>
    <meta name="renderer" content="webkit">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>HomeDisk - 后台管理</title>

<link href="<c:url value='/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
<link href="<c:url value='/css/01.css'/>" rel="stylesheet">
<link href="<c:url value='/css/dashboard.css'/>" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="<c:url value='/css/starter-template.css'/>" rel="stylesheet">

<script src="<c:url value='/js/ie-emulation-modes-warning.js'/>"></script>
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
            <li class="active">
              <a href="pwd.jsp">
              <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>&nbsp;
              密码管理<span class="sr-only">(current)</span>
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
            <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>&nbsp;
            密码管理
          </h1>
          <div class="table-responsive">
            <table class="table table-striped">
			  <thead>
			    <th>密码类型</th>
				<th>新密码</th>
				<th>再输入一遍密码</th>
				<th>操作</th>
              </thead>
              <tbody>
				<form method="post" action="act.jsp">
			    <input type="hidden" name="m" value="12" />
                <tr>
                  <td><h5>管理密码</h5></td>
                  <td><input type="password" class="form-control" value="" name="pwd1" /></td>
				  <td><input type="password" class="form-control" value="" name="pwd2" /></td>
				  <td>
				    <button type="submit" class="btn btn-default" data-toggle="modal" >
				    <span class="glyphicon glyphicon-erase" aria-hidden="true"></span>&nbsp;
				    修改
				    </button>
				  </td>
                </tr>
				</form>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>

	<!-- Modal -->
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
    <script src="<c:url value='/bootstrap/js/jquery.min.js'/>"></script>
    <script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="<c:url value='/bootstrap/js/ie10-viewport-bug-workaround.js'/>"></script>
	
  </body>
</html>

