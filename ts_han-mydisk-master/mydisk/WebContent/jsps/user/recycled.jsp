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

    <title>回收站</title>

<link href="<c:url value='/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
<link href="<c:url value='/jsps/css/body.css'/>" rel="stylesheet">
<link href="<c:url value='/css/dashboard.css'/>" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="<c:url value='/css/starter-template.css'/>" rel="stylesheet">

  </head>

  <body>
    <div class="container-fluid">
      <div class="row" class="back-admin-top-large-window-li">
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">
            <span class="glyphicon glyphicon-file" aria-hidden="true"></span>&nbsp;
            回收站
          </h1>
          <div class="table-responsive">
            <form method="post" action="act.jsp">
		  	<input type="hidden" name="m" value="30" />
		    <button type="submit" class="btn btn-default" data-toggle="modal" >
              <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>&nbsp;
              清空回收站
            </button>
            </form>
            <table class="table table-striped">
			  <thead>
			    <th>#</th>
				<th>资源名称</th>
				<th>删除时间</th>
				<th>恢复资源</th>
				<th>删除资源</th>
              </thead>
              <tbody>
                
                <tr>
                  <td>1</td>
                  <td>111</td>
                  <td>2018-11-22 13:33:22</td>
				  <td>
				  <form method="post" action="act.jsp">
		  		  <input type="hidden" name="m" value="32" />
		  		  <input type="hidden" name="resourceid" value="1" />
				  <button type="submit" class="btn btn-default" data-toggle="modal" >
                    <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>&nbsp;
                    恢复
                  </button>
				  </form>
				  </td>
                  <td>
                  <form method="post" action="act.jsp">
		  		  <input type="hidden" name="m" value="31" />
		  		  <input type="hidden" name="resourceid" value="1" />
                  <button type="submit" class="btn btn-default" data-toggle="modal" >
                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>&nbsp;
                    删除
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

  </body>
</html>
    