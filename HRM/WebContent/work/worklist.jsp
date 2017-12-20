<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, java.text.*, com.tie.department.model.DepartmentDto, com.tie.work.model.WorkDto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link rel="stylesheet" type="text/css" media="screen"
	href="${root }/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="${root }/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="${root }/css/smartadmin-production-plugins.min.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="${root }/css/smartadmin-production.min.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="${root }/css/smartadmin-skins.min.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="${root }/css/smartadmin-rtl.min.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="${root }/css/demo.min.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="${root }/css/ion_assist9.css">
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
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	function workUpdateForm(data) {
		document.location.href = "${root}/work?act=workUpdateForm&workSeq="+ data;
	}
	function workInsert(empId) {
		document.location.href = "${root}/work?act=workInsertForm";
	}
	function workDelete(workSeq, empId) {
		document.location.href = "${root}/work?act=workDelete&workSeq=" + workSeq + "&empId=" + empId;
	}
</script>

</head>
<body>
<div id="content" style="opacity: 1;">
		<style>
.ui-jqgrid .ui-jqgrid-view input {
	display: block;
	box-sizing: border-box;
	width: 100%;
	height: 32px;
	padding: 5px 10px;
	outline: 0px none;
	border-width: 1px;
	border-style: solid;
	border-radius: 0px;
	background: #FFF none repeat scroll 0% 0%;
	font: 13px/16px "Open Sans", Helvetica, Arial, sans-serif;
	color: #404040;
	-moz-appearance: none;
	text-align: right;
}
</style>
	<div id="content" style="opacity: 1;">
		<section id="widget-grid">
		<div class="row">
			<article
				class="col-xs-12 col-sm-12 col-md-12 col-lg-12 sortable-grid ui-sortable">
			<div class="jarviswidget" id="hr_job_description_my"
				data-widget-sortable="false" data-widget-editbutton="false"
				data-widget-colorbutton="false" data-widget-togglebutton="false"
				data-widget-deletebutton="false" role="widget">
				<header role="heading">
				<h2><span class="widget-icon"> <i class="fa fa-briefcase"></i></span>나의 업무명세표</h2>
				<span class="jarviswidget-loader"> <i
					class="fa fa-refresh fa-spin"></i>
				</span> </header>
				<div role="content">
					<div class="widget-body no-padding">
						<div id="jobListResult">
							<div class="dataTables_wrapper form-inline no-footer">
								<div class="table-responsive">
									<table id="mainTable"
										class="table table-striped table-bordered table-hover dataTable ">
										<thead class="table-head">
											<tr>
												<th class="sorting">해당년도</th>
												<th>부서</th>
												<th>평가자</th>
												<th class="sorting">작성일</th>
												<th class="sorting">상태</th>
												<th></th>
											</tr>
										</thead>
										<tbody class="table-tbody">
											<%
												Map<String, List<Object>> map = (Map<String, List<Object>>) request.getAttribute("workList");
												WorkDto workDto = null;
												DepartmentDto departmetnDto = null;

												for (int i = 0; i < map.get("workDto").size(); i++) {
													workDto = (WorkDto) map.get("workDto").get(i);
													departmetnDto = (DepartmentDto) map.get("departmentDto").get(i);
											%>
											<tr>
												<td><%=workDto.getWorkYear()%></td>
												<td><font color="red"><%=departmetnDto.getDeptName()%></font></td>
												<td><%=workDto.getWorkAssessor()%></td>
												<td><%=workDto.getWorkDate()%></td>
												<td><%=workDto.getWorkStatus()%></td>
												<td><a class="btn btn-info  btn-xs" onclick="workUpdateForm(<%=workDto.getWorkSeq()%>)">수정</a> <a class="btn btn-danger  btn-xs" onclick="workDelete(<%=workDto.getWorkSeq()%>,<%=workDto.getWorkSeq()%>)">삭제</a> </td></tr>
											<%
												}
											%>
										</tbody>
									</table>
								</div>
								<div class="dt-toolbar-footer">
									<div class="col-sm-4">
										<div id="dt_basic_info" class="dataTables_info">Total :
											${totalCount}</div>
									</div>
									<div class="col-sm-4 text-center">
										<c:set var="pageCount"
											value="${totalCount / pageSize + ( totalCount % pageSize == 0 ? 0 : 1)}" />
										<c:set var="startPage"
											value="${pageGroupSize*(numPageGroup-1)+1}" />
										<c:set var="endPage" value="${startPage + pageGroupSize-1}" />

										<c:if test="${endPage > pageCount}">
											<c:set var="endPage" value="${pageCount}" />
										</c:if>

<%-- 
										<c:if test="${numPageGroup > 1}">
											<a href="${root}/user?act=workList&currentPage=1">[첫페이지]</a>

											<a href="${root}/user?act=workList&currentPage=${(numPageGroup-2)*pageGroupSize+1 }">[이전]</a>
										</c:if>

 --%>
										<ul class="pagination pagination-sm">
											<c:if test="${numPageGroup > 1}">
												<li class="prev abled" data="0"><a
													href="${root}/work?act=workList&currentPage=${(numPageGroup-2)*pageGroupSize+1 }"><i class="fa fa-angle-left"></i></a>
												</li>
											</c:if>
											
											
											<c:forEach var="i" begin="${startPage}" end="${endPage}">
												<c:if test="${currentPage == i}">
													<li class="active"><a href="${root}/work?act=workList&currentPage=${i}">
															${i}&nbsp; </a></li>
												</c:if>
												<c:if test="${currentPage != i}">
													<li class="inactive"><a
														href="${root}/work?act=workList&currentPage=${i}">
															${i}&nbsp; </a></li>
												</c:if>
											</c:forEach>
											
											
											<c:if test="${numPageGroup < pageGroupCount}">
											<li class="next abled" data="2"><a
												href="${root}/work?act=workList&currentPage=${numPageGroup*pageGroupSize+1}"><i class="fa fa-angle-right"></i></a>
											</li>
											</c:if>
										</ul>


										<%-- <c:forEach var="i" begin="${startPage}" end="${endPage}">
										
											<a href="${root}/user?act=workList&currentPage=${i}">[ <font color="#000000" > <c:if test="${currentPage == i}">
													<font color="#ff002a"></font>
												</c:if> ${i} </font>]
											</a>
									
										</c:forEach> --%>
<%-- 
										<c:if test="${numPageGroup < pageGroupCount}">
											
												<a href="${root}/user?act=workList&currentPage=${numPageGroup*pageGroupSize+1}">[다음]</a>
												<a href="${root}/user?act=workList&currentPage=${finalPage}">[마지막페이지]</a>
											
										</c:if> --%>
									</div>
									<div id="buttonSet" class="col-sm-4 text-right">
										<a class="btn btn-info btn-sm" onclick="workInsert()">등록</a>
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
	</div>
</body>
</html>