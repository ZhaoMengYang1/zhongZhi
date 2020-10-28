<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta name="renderer" content="webkit">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>文件列表</title>

<link href="<c:url value='/bootstrap/css/bootstrap.min.css'/>"
	rel="stylesheet">

<link href="<c:url value='/jsps/css/body.css'/>" rel="stylesheet">
<link href="<c:url value='/jsps/pager/pager.css'/>" rel="stylesheet">

<script src="<c:url value='/jquery/jquery-1.12.4.js'/>"></script>
<script src="<c:url value='/jquery/jquery.form.js'/>"></script>
<script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>


<script type="text/javascript">
	window.onload = function() {

		$("form").ajaxForm(function() {
			alert("操作成功！");
			location.reload(true);
		});

		$(function() {
			//给全选的复选框添加事件
			$("#selectAll").click(function() {
				// this 全选的复选框
				var flag = this.checked;//获取全选的复选框状态
				//获取name=checkboxBtn的复选框 遍历输出复选框
				$("input[name=checkboxBtn]").each(function() {
					this.checked = flag;
				});
				/*
				3. 让批量删除按钮与全选同步
				 */
				setDelAll(flag);
			});

			//给name=checkboxBtn的复选框绑定单击事件
			$("input[name=checkboxBtn]").click(function() {
				//获取选中复选框长度
				var select = $("input[name=checkboxBtn]:checked").length;
				//所有复选框的长度
				var all = $("input[name=checkboxBtn]").length;
				if (select == all) {//全都选中了
					$("#selectAll").get(0).checked = true;//全选
					setDelAll(true);
				} else if (select == 0) {//全都没选中
					$("#selectAll").get(0).checked = false;//取消全选
					setDelAll(false);
				} else {//部分选中
					$("#selectAll").get(0).checked = false;//取消全选
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
							// 3. 指定location为UserServlet，参数method=batchDelete，参数fids=数组的toString()
							var fidArray = new Array();
							$("input[name=checkboxBtn]:checked").each(
									function() {
										fidArray.push($(this).val());//把复选框的值添加到数组中
									});
							var flag = confirm("确定要删除选中的文件吗？");
							if (flag) {
								$.ajax({
											type : "get",
											url : "<c:url value='/FileServlet?method=batchDelete&fids='/>"
													+ fidArray
													+ "&time="
													+ new Date().getTime(),
											success : function(data) {
												alert("删除成功");
												location.reload(true);
											}
										});
							}
						});
		/*
		 * 批量恢复
		 */
		$("#recoverAll").click(function batchDelete() {

							// 1. 获取所有被选中条目的复选框
							// 2. 创建一数组，把所有被选中的复选框的值添加到数组中
							// 3. 指定location为UserServlet，参数method=batchDelete，参数fids=数组的toString()
							var fidArray = new Array();
							$("input[name=checkboxBtn]:checked").each(
									function() {
										fidArray.push($(this).val());//把复选框的值添加到数组中
									});
							var flag = confirm("确定要恢复选中的文件吗？");
							if (flag) {
								$.ajax({
											type : "get",
											url : "<c:url value='/FileServlet?method=batchRecover&fids='/>"
													+ fidArray
													+ "&time="
													+ new Date().getTime(),
											success : function(data) {
												alert("恢复成功");
												location.reload(true);
											}
										});
							}
						});
		/*
		 * 新建文件夹
		 */
		$("#newFolder").click(function batchDelete() {

							}
						});

	}
	/*
	 * 设置批量按钮样式
	 */
	function setDelAll(bool) {
		if (bool) {
			//设置按钮为可用
			$(".batch").attr('disabled', false);
		} else {
			//设置按钮为不可用
			$(".batch").attr('disabled', true);
		}

	}
</script>

<script type="text/javascript">

function validate_required(field,alerttxt)
{
with (field)
  {
  if (value==null||value=="")
    {$('#modal-notice').html(alerttxt);
    $('#notice').modal('show');
    return false}
  else {return true}
  }
}

function validate_form(thisform)
{
with (thisform)
  {
  if (validate_required(fname,"文件夹名称不能为空!")==false)
    {fname.focus();return false}
  }
}
</script>
</head>

<body>

	<div class="container-fluid">
		<div class="row" class="back-user-top-large-window-li">
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="table-responsive">
					
							<div class="page-header">
								<button type="button" class="btn btn-default"
									id="upload-resource"
									onclick="window.location.href='jsps/user/upload.jsp?parent=${currentFile.fid}'">
									<span class="glyphicon glyphicon-open" aria-hidden="true"></span>&nbsp;
									上传文件
								</button>
								&nbsp;
								<button type="button" class="btn btn-default"
									id="newFolder" data-toggle="modal" data-target="#myModal">
									<span class="glyphicon glyphicon-folder-open"
										aria-hidden="true"></span>&nbsp; 新建文件夹
								</button>
								&nbsp;
								<button type="button" class="btn btn-default batch"
									data-toggle="modal" disabled="disabled" id="delAll"
									data-target="#searchDialog">
									<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>&nbsp;
									批量删除
								</button>
							</div>
					
				</div>
			</div>
		</div>
	</div>
	
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-sm">
		<div class="modal-content">
		  <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<h4 class="modal-title" id="myModalLabel">新建文件夹</h4>
		  </div>
		  <form method="post" action="act.jsp" onsubmit="return validate_form(this)">
		  <input type="hidden" name="m" value="25" />
		  <div class="modal-body">
			<div class="form-group">
				<label for="exampleInputEmail1">文件夹名称</label>
				<input type="text" class="form-control" id="exampleInputEmail1" placeholder="" name="fname">
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




	<div style="float: left; width: 100%; text-align: center;">
		<hr />
		<br />
		<%@include file="/jsps/pager/pager.jsp"%>
	</div>

</body>
</html>
