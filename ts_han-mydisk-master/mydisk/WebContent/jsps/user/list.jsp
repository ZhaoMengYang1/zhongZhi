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
		//提交不需要进行校验的表单
		$("form.form1").ajaxForm(function(data) {
			if (data === "success") {
				alert("操作成功！");
				location.reload(true);
			}
		});
		//提交需要验证名称的表单（新建文件夹及修改文件名）	
		$("form.valiName").ajaxForm(function(data) {
			if (data === "success") {
				/* $('#modal-notice').html("操作成功！");
				$('#notice').modal('show'); */
				alert("操作成功！");
				location.reload(true);
			} else {
				//			$('#mkdirModal').modal('show');
				$('#modal-notice').html(data);
				$('#notice').modal('show');
			}
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
		$("#delAll")
				.click(
						function batchDelete() {

							// 1. 获取所有被选中条目的复选框
							// 2. 创建一数组，把所有被选中的复选框的值添加到数组中
							// 3. 调用ajax完成与服务器的通信
							var fidArray = new Array();
							$("input[name=checkboxBtn]:checked").each(
									function() {
										fidArray.push($(this).val());//把复选框的值添加到数组中
									});
							var flag = confirm("确定要删除选中的文件吗？");
							if (flag) {
								$
										.ajax({
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
		$("#recoverAll")
				.click(
						function batchDelete() {

							// 1. 获取所有被选中条目的复选框
							// 2. 创建一数组，把所有被选中的复选框的值添加到数组中
							// 3. 调用ajax完成与服务器的通信
							var fidArray = new Array();
							$("input[name=checkboxBtn]:checked").each(
									function() {
										fidArray.push($(this).val());//把复选框的值添加到数组中
									});
							var flag = confirm("确定要恢复选中的文件吗？");
							if (flag) {
								$
										.ajax({
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
		 * 从回收站批量彻底删除文件
		 */
		$("#cleanAll")
		.click(
				function batchDelete() {

					// 1. 获取所有被选中条目的复选框
					// 2. 创建一数组，把所有被选中的复选框的值添加到数组中
					// 3. 调用ajax完成与服务器的通信
					var fidArray = new Array();
					$("input[name=checkboxBtn]:checked").each(
							function() {
								fidArray.push($(this).val());//把复选框的值添加到数组中
							});
					var flag = confirm("确定要彻底删除选中的文件吗？删除后不可恢复！");
					if (flag) {
						$
								.ajax({
									type : "get",
									url : "<c:url value='/FileServlet?method=clean&fids='/>"
											+ fidArray
											+ "&time="
											+ new Date().getTime(),
									success : function(data) {
										alert("文件已被彻底删除！");
										location.reload(true);
									}
								});
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

	//验证文件名是否为空	
	function validate_required(field, alerttxt) {
		with (field) {
			if (value == null || value == "") {
				$('#modal-notice').html(alerttxt);
				$('#notice').modal('show');
				return false
			} else {
				return true
			}
		}
	}
	//表单提交前进行校验
	function validate_form(thisform) {
		with (thisform) {
			if (validate_required(fname, "文件夹名称不能为空!") == false) {
				fname.focus();
				return false
			}
		}
	}

	//删除前给出确认提示
	function submit_sure(thisform) {
		with (thisform) {
			if (method.value == "batchDelete") {

				var b = confirm("确定要删除该文件吗？");
				if (b) {
					return true;
				} else {
					return false;
				}
			}

			if (method.value == "clean") {

				var b = confirm("确定要彻底删除该文件吗？彻底删除后将不可恢复！");
				if (b) {
					return true;
				} else {
					return false;
				}
			}

		}
	}
</script>

</head>

<body>

	<div class="container-fluid">
		<div class="row" class="back-user-top-large-window-li">
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="table-responsive">
					<c:choose>
						<c:when test="${method eq 'loadAll' }">

							<div class="page-header">
								<button type="button" class="btn btn-default"
									id="upload-resource"
									onclick="window.location.href='jsps/user/upload.jsp?parent=${currentFile.fid}'">
									<span class="glyphicon glyphicon-open" aria-hidden="true"></span>&nbsp;
									上传文件
								</button>
								&nbsp;
								<button type="button" class="btn btn-default"
									data-toggle="modal" data-target="#mkdirModal">
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
						</c:when>
						<c:when test="${method eq 'loadRecycled' }">

							<div class="page-header">
								<button type="button" class="btn btn-default batch"
									id="recoverAll" data-toggle="modal" disabled="disabled"
									id="batchRecover" data-target="#searchDialog">
									<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>&nbsp;
									批量恢复
								</button>
								<button type="button" class="btn btn-default batch"
									id="cleanAll" data-toggle="modal" disabled="disabled"
									data-target="#searchDialog">
									<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>&nbsp;
									批量彻底删除
								</button>
							</div>
						</c:when>
						<c:otherwise>
							<div class="page-header">
								<button type="button" class="btn btn-default"
									id="upload-resource"
									onclick="window.location.href='jsps/user/upload.jsp?parent=${currentFile.fid}'">
									<span class="glyphicon glyphicon-open" aria-hidden="true"></span>&nbsp;
									上传文件
								</button>
								&nbsp;
								<button type="button" class="btn btn-default batch"
									data-toggle="modal" disabled="disabled" id="delAll"
									data-target="#searchDialog">
									<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>&nbsp;
									批量删除
								</button>
							</div>
						</c:otherwise>
					</c:choose>
					<div>
						<c:if test="${method eq 'loadAll' }">
							<c:choose>
								<c:when
									test="${currentFile.fid eq sessionScope.session_user.home.fid }">



									<h4 class="page-header">
										<span class="glyphicon glyphicon-list" aria-hidden="true"></span>&nbsp;
										全部文件
									</h4>
								</c:when>
								<c:otherwise>
									<a class="ft2"
										href="<c:url value='/FileServlet?method=loadAll&fid=${currentFile.parent.fid }'/>"
										target="body"><span class="glyphicon glyphicon-arrow-up"
										aria-hidden="true"></span>&nbsp;返回上一级<span
										class="glyphicon glyphicon-option-vertical" aria-hidden="true"></span></a>
									<a class="ft2"
										href="<c:url value='/FileServlet?method=loadAll&fid=${sessionScope.session_user.home.fid }'/>"
										target="body">&nbsp;全部文件<span
										class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></a>
									<c:if test="${!empty pathList }">
										<c:forEach items="${pathList }" var="path" begin="1">
											<a class="ft2"
												href="<c:url value='/FileServlet?method=loadAll&fid=${path.fid}'/>"
												target="body">&nbsp;${path.fname}<span
												class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></a>
										</c:forEach>
									</c:if>
									<span>${currentFile.fname }</span>
								</c:otherwise>
							</c:choose>
						</c:if>
						<c:if test="${method eq 'loadDoc' }">
							<h4 class="page-header">
								<span class="glyphicon glyphicon-file" aria-hidden="true"></span>&nbsp;
								全部文档
							</h4>

						</c:if>
						<c:if test="${method eq 'loadImg' }">
							<h4 class="page-header">
								<span class="glyphicon glyphicon-picture" aria-hidden="true"></span>&nbsp;
								全部图片
							</h4>
						</c:if>
						<c:if test="${method eq 'loadVedio' }">
							<h4 class="page-header">

								<span class="glyphicon glyphicon-film" aria-hidden="true"></span>&nbsp;
								全部视频
							</h4>
						</c:if>
						<c:if test="${method eq 'loadMusic' }">
							<h4 class="page-header">
								<span class="glyphicon glyphicon-music" aria-hidden="true"></span>&nbsp;
								全部音乐
							</h4>
						</c:if>
						<c:if test="${method eq 'loadOther' }">
							<h4 class="page-header">
								<span class="glyphicon glyphiglyphicon-hddcon-file"
									aria-hidden="true"></span>&nbsp; 其他文件
							</h4>
						</c:if>
						<c:if test="${method eq 'loadRecycled' }">
							<h4 class="page-header">
								<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>&nbsp;
								回收站
							</h4>
						</c:if>
					</div>
					<c:choose>
						<c:when test="${method eq 'loadRecycled' }">
							<table class="table table-striped">
								<thead>
									<th><input type="checkbox" id="selectAll" /><label
										for="selectAll">&nbsp;全选</label></th>
									<th>文件名</th>
									<th>大小</th>
									<th>删除日期</th>
									<th>恢复</th>
									<th>彻底删除</th>
								</thead>
								<tbody>
									<c:forEach items="${pb.beanList }" var="file">
										<tr>
											<!-- 转换文件大小显示 -->
											<c:choose>
												<c:when test="${file.folder}">
													<c:set var="size" value="" />
													<c:set var="unit" value="" />
												</c:when>
												<c:when test="${file.fileSize >= (1024 * 1024 * 1024) }">
													<c:set var="size"
														value="${file.fileSize /  (1024 * 1024 *1024)}" />
													<c:set var="unit" value="GB" />
												</c:when>
												<c:when test="${file.fileSize >= (1024 * 1024) }">
													<c:set var="size" value="${file.fileSize /  (1024 * 1024)}" />
													<c:set var="unit" value="MB" />
												</c:when>
												<c:otherwise>
													<c:set var="size" value="${file.fileSize / 1024}" />
													<c:set var="unit" value="KB" />
												</c:otherwise>
											</c:choose>

											<td><input value="${file.fid }" type="checkbox"
												name="checkboxBtn" /></td>

											<td class="text-style-2">${file.fname }</td>

											<td class="text-style-2" id="size"><fmt:formatNumber
													value="${size }" pattern="0.00" />${unit}</td>
											<td class="text-style-2"><fmt:formatDate
													value="${file.deltime }" type="both" /></td>
											<td>
												<form class="form1" action="<c:url value='/FileServlet'/>"
													method="post">
													<input type="hidden" name="method" value="batchRecover">
													<input type="hidden" name="fids" value="${file.fid }">
													<button type="submit" class="btn btn-default sub_btn"
														data-toggle="modal">
														<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>&nbsp;
														恢复
													</button>
												</form>
											</td>
											<td>
												<form class="form1" onsubmit="return submit_sure(this)"
													action="<c:url value='/FileServlet'/>" method="post">
													<input type="hidden" name="method" value="clean">
													<input type="hidden" name="fids" value="${file.fid }">
													<button type="submit" class="btn btn-default sub_btn"
														data-toggle="modal">
														<span class="glyphicon glyphicon-remove"
															aria-hidden="true"></span>&nbsp; 彻底删除
													</button>
												</form>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</c:when>
						<c:otherwise>
							<table class="table table-striped">
								<thead>
									<th><input type="checkbox" id="selectAll" /><label
										for="selectAll">&nbsp;全选</label></th>
									<th>文件名</th>
									<th>大小</th>
									<th>修改日期</th>
									<th>下载</th>
									<th>编辑</th>
									<th>删除</th>
								</thead>
								<tbody>
									<c:forEach items="${pb.beanList }" var="file">
										<tr>
											<!-- 转换文件大小显示 -->
											<c:choose>
												<c:when test="${file.folder}">
													<c:set var="size" value="" />
													<c:set var="unit" value="" />
												</c:when>
												<c:when test="${file.fileSize >= (1024 * 1024 * 1024) }">
													<c:set var="size"
														value="${file.fileSize /  (1024 * 1024 *1024)}" />
													<c:set var="unit" value="GB" />
												</c:when>
												<c:when test="${file.fileSize >= (1024 * 1024) }">
													<c:set var="size" value="${file.fileSize /  (1024 * 1024)}" />
													<c:set var="unit" value="MB" />
												</c:when>
												<c:otherwise>
													<c:set var="size" value="${file.fileSize / 1024}" />
													<c:set var="unit" value="KB" />
												</c:otherwise>
											</c:choose>

											<td><input value="${file.fid }" type="checkbox"
												name="checkboxBtn" /></td>
											<!-- 判断是否是文件夹,如果是文件夹，显示超链接，如果是文件，显示下载 -->
											<c:choose>
												<c:when test="${file.folder}">
													<td class="text-style-2"><a
														href="<c:url value='/FileServlet?method=loadAll&fid=${file.fid }'/>">${file.fname }</a></td>
													<td class="text-style-2" id="size"><fmt:formatNumber
															value="${size }" pattern="0.00" />${unit}</td>
													<td class="text-style-2"><fmt:formatDate
															value="${file.createtime }" type="both" /></td>
													<td>&nbsp</td>
												</c:when>
												<c:otherwise>
													<td class="text-style-2">${file.fname }</td>
													<td class="text-style-2" id="size"><fmt:formatNumber
															value="${size }" pattern="0.00" />${unit}</td>
													<td class="text-style-2"><fmt:formatDate
															value="${file.createtime }" type="both" /></td>
													<td>
														<button type="button" class="btn btn-default"
															id="download-resource"
															onclick="window.location.href='DownloadServlet?fid=${file.fid}'">
															<span class="glyphicon glyphicon-save" aria-hidden="true"></span>&nbsp;下载
														</button>
													<%-- <a href="<c:url value='/DownloadServlet?fid=${file.fid }'/>"> <span
															class="glyphicon glyphicon-save" aria-hidden="true"></span>&nbsp;下载
													</a> --%>
													</td>
												</c:otherwise>
											</c:choose>

											<td>
												<!-- Modal -->
												<div class="modal fade" id="${file.fid }" tabindex="-1"
													role="dialog" aria-labelledby="myModalLabel"
													aria-hidden="true">
													<div class="modal-dialog modal-sm">
														<div class="modal-content">
															<div class="modal-header">
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
																<h4 class="modal-title" id="myModalLabel">修改名称</h4>
															</div>
															<form class="valiName" method="post"
																action="<c:url value='/FileServlet'/>"
																onsubmit="return validate_form(this)">
																<input type="hidden" name="method" value="rename" /> <input
																	type="hidden" name="fid" value="${file.fid }" />
																<div class="modal-body">
																	<div class="form-group">
																		<label for="exampleInputEmail1">新名称</label> <input
																			type="text" class="form-control"
																			id="exampleInputEmail1" placeholder="" name="fname">
																	</div>
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-default"
																		data-dismiss="modal">
																		<span class="glyphicon glyphicon-log-out"
																			aria-hidden="true"></span>&nbsp; 关闭
																	</button>
																	<button type="submit" class="btn btn-default">
																		<span class="glyphicon glyphicon-ok"
																			aria-hidden="true"></span>&nbsp; 提交
																	</button>
																</div>
															</form>
														</div>
													</div>
												</div>
												<button type="button" class="btn btn-default" id="newFolder"
													data-toggle="modal" data-target="#${file.fid }">
													<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>&nbsp;
													修改名称
												</button>
											</td>
											<td><form class="form1"
													action="<c:url value='/FileServlet'/>" method="post"
													onsubmit="return submit_sure(this)">
													<input type="hidden" name="method" value="batchDelete">
													<input type="hidden" name="fids" value="${file.fid }">
													<button type="submit" class="btn btn-default sub_btn"
														data-toggle="">
														<span class="glyphicon glyphicon-remove"
															aria-hidden="true"></span>&nbsp; 删除
													</button>
												</form></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<!-- 创建新文件夹 -->
	<div class="modal fade" id="mkdirModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新建文件夹</h4>
				</div>
				<form method="post" action="<c:url value='/FileServlet'/>"
					class="valiName" onsubmit="return validate_form(this)">
					<input type="hidden" name="method" value="makeDir" /> <input
						type="hidden" name="fid" value="${currentFile.fid }" />
					<div class="modal-body">
						<div class="form-group">
							<label for="exampleInputEmail1">文件夹名称</label> <input type="text"
								class="form-control" id="exampleInputEmail1" placeholder=""
								name="fname">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">
							<span class="glyphicon glyphicon-log-out" aria-hidden="true"></span>&nbsp;
							关闭
						</button>
						<button type="submit" class="btn btn-default">
							<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>&nbsp;
							提交
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 提示消息 -->
	<div class="modal fade" id="notice" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">通知</h4>
				</div>
				<div class="modal-body" id="modal-notice"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class="glyphicon glyphicon-log-out" aria-hidden="true"></span>&nbsp;
						关闭
					</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 分页显示 -->
	<div style="float: left; width: 100%; text-align: center;">
		<hr />
		<br />
		<%@include file="/jsps/pager/pager.jsp"%>
	</div>

</body>
</html>
