<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta name="renderer" content="webkit">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>用户管理</title>
<link href="<c:url value='/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">

<link href="<c:url value='/jsps/css/body.css'/>" rel="stylesheet">
<link href="<c:url value='/jsps/pager/pager.css'/>" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="<c:url value='/css/starter-template.css'/>" rel="stylesheet">

<script src="<c:url value='/js/ie-emulation-modes-warning.js'/>"></script>

<script src="<c:url value='/jquery/jquery-1.12.4.js'/>"></script>
<script src="<c:url value='/jquery/jquery.form.js'/>"></script>


<script type="text/javascript">
window.onload = function(){
        $("form.change_form").ajaxForm(function () {
            alert("操作成功！");
            location.reload(true);
        });


	$(function() {
		//给全选的复选框添加事件
        $("#selectAll").click(function(){
            // this 全选的复选框
            var flag=this.checked;//获取全选的复选框状态
            //获取name=checkboxBtn的复选框 遍历输出复选框
            $("input[name=checkboxBtn]").each(function(){
                this.checked=flag;
            });
			/*
			3. 让批量删除按钮与全选同步
			 */
			 setDelAll(flag);
        });

		//给name=checkboxBtn的复选框绑定单击事件
	    $("input[name=checkboxBtn]").click(function(){
	        //获取选中复选框长度
	        var select=$("input[name=checkboxBtn]:checked").length;
	        //所有复选框的长度
	        var all=$("input[name=checkboxBtn]").length;
	        if(select == all) {//全都选中了
	            $("#selectAll").get(0).checked=true;//全选
	            setDelAll(true);
	        }else if (select == 0) {//全都没选中
	            $("#selectAll").get(0).checked=false;//取消全选
	            setDelAll(false);
	        }else {//部分选中
	        	$("#selectAll").get(0).checked=false;//取消全选
	        	setDelAll(true);
	        }
			});
	
		});
	

	/*
	 * 批量删除
	 */
	$("#delAll").click(function batchDelete() {

		// 1. 获取所有被选中条目的复选框
		// 2. 创建一数组，把所有被选中的复选框的值添加到数组中
		// 3. 指定location为UserServlet，参数method=batchDelete，参数uids=数组的toString()
		var uidArray = new Array();
		$("input[name=checkboxBtn]:checked").each(function() {
			uidArray.push($(this).val());//把复选框的值添加到数组中
		});
		location = "<c:url value='/admin/UserServlet?method=batchDelete&uids='/>"
				+ uidArray;
	});
}
	/*
	 * 设置批量删除按钮样式
	 */
	function setDelAll(bool) {
		if (bool) {
			//设置按钮为可用
			$("#delAll").attr('disabled',false);
		} else {
			//设置按钮为不可用
			$("#delAll").attr('disabled',true);
		}

	}


</script>


</head>

<body>

	<div class="container-fluid">
		<div class="row" class="back-user-top-large-window-li">
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="table-responsive">
					<h1 class="page-header">
						<span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;
						用户管理
					</h1>
					<div class="page-header">
						<a href="<c:url value='/jsps/admin/adduser.jsp'/>" target="body"><button type="button" class="btn btn-default" id="upload-resource">
							<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;
							添加用户
						</button></a>
						&nbsp;
						<button type="button" class="btn btn-default" data-toggle="modal" id="delAll" disabled="disabled"
							data-target="#searchDialog">
							<span class="glyphicon glyphicon-folder-minus" aria-hidden="true"></span>&nbsp;
							批量删除用户
						</button>
					</div>
					<table class="table table-striped">
						<thead>
							<th><input type="checkbox" id="selectAll" /><label
								for="selectAll">&nbsp;全选</label></th>
							<th>用户名</th>
							<th>重置密码</th>
							<th>锁定用户</th>
							<th>删除用户</th>

						</thead>
						<tbody>
<c:forEach items="${pb.beanList}" var="user">
							<tr>
								<td><input value="${user.uid }" type="checkbox"
									name="checkboxBtn" /></td>
								<td class="text-style-2">${user.uname}</td>
								<td class="text-style-2">
									<form class="change_form" method="post"
										action="<c:url value='/admin/UserServlet'/>">
										<input type="hidden" name="method" value="resetPassword" />
										<input type="hidden" name="uid" value="${user.uid }" />
										<button type="submit" class="btn btn-default sub_btn"
											data-toggle="modal">
											<span class="glyphicon glyphicon-alert" aria-hidden="true"></span>&nbsp;
											重置密码为“1”
										</button>
									</form>
								</td>
								<td class="text-style-2">
											<c:choose>
											<c:when test="${user.locked }">
												<form class="change_form" method="post"
													action="<c:url value='/admin/UserServlet'/>">
													<input type="hidden" name="method" value="lock" /> <input
														type="hidden" name="uid" value="${user.uid }" /> <input
														type="hidden" name="lock" value="0" />
													<button type="submit" class="btn btn-default sub_btn"
														data-toggle="modal">
														<span class="glyphicon glyphicon-sunglasses"
															aria-hidden="true"></span>&nbsp; 解除锁定
													</button>
												</form>
											</c:when>
											<c:otherwise>
												<form class="change_form" method="post"
													action="<c:url value='/admin/UserServlet'/>">
													<input type="hidden" name="method" value="lock" /> <input
														type="hidden" name="uid" value="${user.uid }" /> <input
														type="hidden" name="lock" value="1" />
													<button type="submit" class="btn btn-default sub_btn"
														data-toggle="modal">
														<span class="glyphicon glyphicon-sunglasses"
															aria-hidden="true"></span>&nbsp; 锁定
													</button>
												</form>
											</c:otherwise>
										</c:choose>
									</td>
								<td>
									<form class="change_form" method="post"
										action="<c:url value='/admin/UserServlet'/>">
										<input type="hidden" name="method" value="batchDelete" /> <input
											type="hidden" name="uids" value="${user.uid }" />
										<button type="submit" class="btn btn-default sub_btn"
											data-toggle="modal">
											<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>&nbsp;
											删除用户
										</button>
									</form>
								</td>
							</tr>
</c:forEach>


						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>


<div style="float:left; width: 100%; text-align: center;">
	<hr/>
	<br/>
	<%@include file="/jsps/pager/pager.jsp" %>
</div>




</body>
</html>
