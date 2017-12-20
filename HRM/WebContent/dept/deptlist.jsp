<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ include file="/common/session_common.jsp" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>자유게시판</title>
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link rel="stylesheet" type="text/css" media="screen"
	href="${root}/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="${root}/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="${root}/css/smartadmin-production-plugins.min.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="${root}/css/smartadmin-production.min.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="${root}/css/smartadmin-skins.min.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="${root}/css/smartadmin-rtl.min.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="${root}/css/demo.min.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="${root}/css/ion_assist9.css">
<link href="https://demo.assist9.com/res/images/favicon.png" rel="icon"
	type="image/x-icon">
<link rel="stylesheet" type="text/css"
	href="${root}/css/ion_assist9_bbscomment.css">

<style type="text/css">
.jqstooltip {
	position: absolute;
	left: 0px;
	top: 0px;
	visibility: hidden;
	background: rgb(0, 0, 0) transparent;
	background-color: rgba(0, 0, 0, 0.6);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000,
		endColorstr=#99000000);
	-ms-filter:
		"progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";
	color: white;
	font: 10px arial, san serif;
	text-align: left;
	white-space: nowrap;
	padding: 5px;
	border: 1px solid white;
	z-index: 10000;
}

.jqsfield {
	color: white;
	font: 10px arial, san serif;
	text-align: left;
}

.modal-dialog.modal-80size {
  width: 80%;
  height: 80%;
  margin: 0;
  padding: 0;
}

.modal-content.modal-80size {
  height: auto;
  min-height: 80%;
}

.modal.modal-center {
  text-align: center;
}

@media screen and (min-width: 768px) {
  .modal.modal-center:before {
    display: inline-block;
  /*   vertical-align: middle; */
    vertical-align: top;
    content: " ";
    height: 100%;
  }
}

.modal-dialog.modal-center {
  display: inline-block;
  text-align: left;
  vertical-align: middle;
}

</style>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript">

function createModal(deptId, key){
	$.ajax({
	      type: "POST",
	      url: "${root}/aboard",
	      data: {act: key, deptId: deptId},
	      dataType: "json",
	      success: function(data) {
	    	 makeModal(data, key)
	      },
	      error: function(e) {
	         alert("에러발생 : " + e);
	      }
	});
}

function makeModal(data, key){
	if(data.boardInfo.length > 0){
		if(key == 'detail'){
			makeDetailModal(data)
		}else if(key == 'update'){
			makeUpdateModal(data)
		}	
	}
}

</script>
</head>
<body>
<jsp:include page="/login/logout.jsp"></jsp:include>
<section id="widget-grid">
<div class="row">
	<article
		class="col-xs-12 col-sm-12 col-md-12 col-lg-12 sortable-grid ui-sortable">
	<div class="jarviswidget"
		id="557e42f545ce496039c0d62bListResult_jarviswidget"
		data-widget-sortable="false" data-widget-editbutton="false"
		data-widget-colorbutton="false" data-widget-togglebutton="false"
		data-widget-deletebutton="false" role="widget">
		<header role="heading">
		
		<span class="widget-icon"> 
		</span>
		<h2>부서 관리</h2>
		<span class="jarviswidget-loader"><i
			class="fa fa-refresh fa-spin"></i></span></header>
		<div role="content">
			<div class="widget-body no-padding">
				<div id="557e42f545ce496039c0d62bListResult">
					<div class="dataTables_wrapper form-inline no-footer">
						<div class="dt-toolbar">
							<div>
								<div id="filterSet">
									<div class="dt_filter" style="width: 200px;">
										<!-- <div class="input-group">
											<input class="form-control" name="word" id="word"
												placeholder="제목 or 내용" type="text">
												<span class="input-group-addon findBtn" style="cursor: pointer;" onClick="javascript:boardsearch();">
												<i class="fa fa-search"></i></span>
										</div> -->
										
										<div class="smart-form">
											<label class="select"> 
											<select id="searchDept" name="searchDept" class="form-control"
												onchange="searchDept(this.value)">
													<c:if test="${selDept.size() != 0}">
														<c:forEach var="deptInfo" items="${selDept}">
															<option value="${deptInfo.deptId}">
																<c:if test="${deptInfo.highDept != '없음'}"> 
																	${deptInfo.highDept}>${deptInfo.deptName}</option>
																</c:if>
																<c:if test="${deptInfo.highDept == '없음'}"> 
																	${deptInfo.deptName}</option>
																</c:if>
														</c:forEach>
													</c:if>
											</select> <i></i>
											</label>
										</div>
									</div>
								</div>
							</div>
							
						</div>
						<div class="table-responsive">
							<table id="mainTable"
								class="table table-bordered table-striped table-hover dataTable smart-form has-tickbox">
								<thead class="table-head">
									<tr>
										<th>부서코드</th>
										<th>상위부서</th>
										<th>부서명</th>
										<th>부서장</th>
										<th></th>
									</tr>
								</thead>
								<tbody class="table-tbody">
									<c:if test="${deptList.size() != 0}">
										<c:forEach var="deptlist" items="${deptList}">
											<tr>
												<td align="right">${deptlist.deptId}&nbsp;&nbsp;&nbsp;&nbsp;</td>
												<td>
													<a data-toggle="modal" data-target="#DetailModal" onclick="javascript:createModal('${boardlist.bbsSeq}','detail');"> 
													${deptlist.highDept}
													</a>
												</td>
												<td>${deptlist.deptName}</td>
												<td>${deptlist.deptHead}</td>
												<%-- <td align="right">${boardlist.commentCount}&nbsp;&nbsp;&nbsp;&nbsp;</td>
												<td align="right">${boardlist.bbsVc}&nbsp;&nbsp;&nbsp;&nbsp;</td> --%>
												<td>
													<input type="button" value="수정" id="btnupdate"
													class="btn btn-info btn-xs"
													data-toggle="modal" data-target="#UpdateModal"
													onclick="javascript:createModal('${deptlist.deptId}','update');">&nbsp;&nbsp;
													<input type="button" value="삭제" id="btndelete"
													class="btn btn-danger btn-xs"
													data-toggle="modal" data-target="#deleteModal"
													onclick="javascript:createModal('${deptlist.deptId}','delete');">
												</td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div>
						<div class="dt-toolbar-footer">
							<div class="col-sm-4">
								<div id="dt_basic_info" class="dataTables_info">Total :
									${totalCount}</div>
							</div>
							<div class="col-sm-4 text-center">
								<div class="dataTables_paginate paging_bootstrap_full">
									<ul class="pagination pagination-sm">
										${navigator}
									</ul>
								</div>
							</div>
							<div id="buttonSet" class="col-sm-4 text-right">
								<input type="button" value="등록" class="btn btn-info btn-sm" 
								data-toggle="modal" data-target="#WriteModal">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</article>
</div>
</section>
<%-- <!-- 게시물등록 -->
<jsp:include page="/board/boardwrite.jsp" />
<!-- 게시물수정 -->
<jsp:include page="/board/boardupdate.jsp" /> --%>
</body>
</html>