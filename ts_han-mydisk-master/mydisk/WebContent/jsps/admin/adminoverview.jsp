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

    <title>概览</title>

<link href="<c:url value='/bootstrap/css/bootstrap.min.css'/>"
	rel="stylesheet">

<link href="<c:url value='/jsps/css/body.css'/>" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="<c:url value='/css/starter-template.css'/>" rel="stylesheet">

<script src="<c:url value='/js/ie-emulation-modes-warning.js'/>"></script>

  </head>

  <body>

    <div class="container-fluid">
      <div class="row" class="back-admin-top-large-window-li">
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">
            <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>&nbsp;
            概览
          </h1>
          <div class="table-responsive">
            <table class="table table-striped">
              <tbody>
                <tr>
                  <td><h5>用户数</h5></td>
                  <td><input type="text" class="form-control" value="${userCount}" readonly /></td>
                </tr>
				<tr>
                  <td><h5>文件总数（个）</h5></td>
                  <td><input type="text" class="form-control" value="${fileCount }" readonly /></td>
                </tr>
				<tr>
                  <td><h5>回收站文件总数（个）</h5></td>
                  <td><input type="text" class="form-control" value="${recycledCount }" readonly /></td>
                </tr>
				<tr>
                  <td><h5>文件总大小</h5></td>
                  <td><input type="text" class="form-control" value="${allFileSize}" readonly /></td>
                </tr>
				<tr>
                  <td><h5>回收站总大小</h5></td>
                  <td><input type="text" class="form-control" value="${recycledTotalSize }" readonly /></td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>