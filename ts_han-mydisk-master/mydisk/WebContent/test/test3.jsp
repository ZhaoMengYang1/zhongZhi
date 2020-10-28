<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Checkbox的练习</title>
<style type="text/css">
*{margin:0px;padding:0px;}
table{width:100%;text-align:center;}    
</style>
<link href="<c:url value='/bootstrap/css/bootstrap.min.css'/>"
	rel="stylesheet">

<link href="<c:url value='/jsps/css/body.css'/>" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="<c:url value='/css/starter-template.css'/>" rel="stylesheet">
<script src="<c:url value='/jquery/jquery-1.12.4.js'/>"></script>
<script type="text/javascript">
    $(function(){
        //给全选的复选框添加事件
        $("#selectAll").click(function(){
            // this 全选的复选框
            var userids=this.checked;
            alert(userids);
            //获取name=box的复选框 遍历输出复选框
            $("input[name=checkboxBtn]").each(function(){
                this.checked=userids;
            });
        });
        
        //给name=box的复选框绑定单击事件
        $("input[name=checkboxBtn]").click(function(){
            //获取选中复选框长度
            var length=$("input[name=checkboxBtn]:checked").length;
            //未选中的长度
            var len=$("input[name=checkboxBtn]").length;
            if(length==len){
                $("#selectAll").get(0).checked=true;
            }else{
                $("#selectAll").get(0).checked=false;
            }
        });
    });
    
    
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

							<tr>
								<td><input value="$file id" type="checkbox"
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
									<form class="change_form" method="post"
										action="<c:url value='/UserServlet?method=lock'/>">
										<input type="hidden" name="m" value="34" /> <input
											type="hidden" name="userid" value="2" /> <input
											type="hidden" name="locked" value="0" />

										<button type="submit" class="btn btn-default sub_btn"
											data-toggle="modal">
											<span class="glyphicon glyphicon-lock" aria-hidden="true"></span>&nbsp;
											锁定
										</button>
										<button type="button" class="btn btn-default sub_btn" data-toggle="modal" >
                    <span class="glyphicon glyphicon-sunglasses" aria-hidden="true"></span>&nbsp;
                    解除锁定
                  </button>

									</form>
								</td>
								<td>
									<form class="change_form" method="post"
										action="<c:url value='/admin/UserServlet'/>">
										<input type="hidden" name="method" value="delete" /> <input
											type="hidden" name="uid" value="${user.uid }" />
										<button type="submit" class="btn btn-default sub_btn"
											data-toggle="modal">
											<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>&nbsp;
											删除用户
										</button>
									</form>
								</td>
							</tr>
							<tr>
								<td><input value="$file id" type="checkbox"
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
									<form class="change_form" method="post"
										action="<c:url value='/UserServlet?method=lock'/>">
										<input type="hidden" name="m" value="34" /> <input
											type="hidden" name="userid" value="2" /> <input
											type="hidden" name="locked" value="0" />

										<button type="submit" class="btn btn-default sub_btn"
											data-toggle="modal">
											<span class="glyphicon glyphicon-lock" aria-hidden="true"></span>&nbsp;
											锁定
										</button>
										<button type="button" class="btn btn-default sub_btn" data-toggle="modal" >
                    <span class="glyphicon glyphicon-sunglasses" aria-hidden="true"></span>&nbsp;
                    解除锁定
                  </button>

									</form>
								</td>
								<td>
									<form class="change_form" method="post"
										action="<c:url value='/admin/UserServlet'/>">
										<input type="hidden" name="method" value="delete" /> <input
											type="hidden" name="uid" value="${user.uid }" />
										<button type="submit" class="btn btn-default sub_btn"
											data-toggle="modal">
											<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>&nbsp;
											删除用户
										</button>
									</form>
								</td>
							</tr>
							<tr>
								<td><input value="$file id" type="checkbox"
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
									<form class="change_form" method="post"
										action="<c:url value='/UserServlet?method=lock'/>">
										<input type="hidden" name="m" value="34" /> <input
											type="hidden" name="userid" value="2" /> <input
											type="hidden" name="locked" value="0" />

										<button type="submit" class="btn btn-default sub_btn"
											data-toggle="modal">
											<span class="glyphicon glyphicon-lock" aria-hidden="true"></span>&nbsp;
											锁定
										</button>
										<button type="button" class="btn btn-default sub_btn" data-toggle="modal" >
                    <span class="glyphicon glyphicon-sunglasses" aria-hidden="true"></span>&nbsp;
                    解除锁定
                  </button>

									</form>
								</td>
								<td>
									<form class="change_form" method="post"
										action="<c:url value='/admin/UserServlet'/>">
										<input type="hidden" name="method" value="delete" /> <input
											type="hidden" name="uid" value="${user.uid }" />
										<button type="submit" class="btn btn-default sub_btn"
											data-toggle="modal">
											<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>&nbsp;
											删除用户
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