<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}">
</c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>경력사항</title>
<head>
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>인사발령</title>
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


<!-- ==================================모달 링크========================================= -->
<!--  	<script src="http://code.jquery.com/jquery-latest.min.js"></script> 
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script>
	<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script> -->
<!-- ==================================모달 링크========================================= -->

<link rel="stylesheet" href="${root}/css/style.css" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- ====================== 모달 ==================-->
<script src="${root }/js/bootstrap.min.js"></script>
<!-- =============================================-->

<script type="text/javascript">
var delSeq = null;
var updateSeq = null;

function careerDelete(seq) {
	$('#deleteModal').on('show.bs.modal', function (event) { // myModal 윈도우가 오픈할때 아래의 옵션을 적용
        var modal = $(this);
        delSeq = seq;
   })
   $('#deleteModal').modal();
}

function deleteModal(careerSeq,empId) {
	document.location.href = "${root}/career?act=delete&careerSeq=" + delSeq+"&empId="+empId;
}

function careerUpdate(seq,startDate,endDate,careerLocation,careerPosition,careerDuty,careerContents) {
	$('#updateModal').on('show.bs.modal', function (event) { // myModal 윈도우가 오픈할때 아래의 옵션을 적용
        var modal = $(this);
        modal.find('#startDate').val(startDate);
        modal.find('#endDate').val(endDate);
        modal.find('#careerLocation').val(careerLocation); 
        modal.find('#careerPosition').val(careerPosition); 
        modal.find('#careerDuty').val(careerDuty); 
        modal.find('#careerContents').val(careerContents); 
        modal.find('#updateSeq').val(seq);
   })
   $('#updateModal').modal();
}

function careerUp(empId) {
		document.updateform.action = "${root}/career?empId="+empId;
		document.updateform.submit();
}

function carrerInsert(empId) {
	$('#insertModal').on('show.bs.modal', function (event) { // myModal 윈도우가 오픈할때 아래의 옵션을 적용
        var modal = $(this);
        modal.find('#insertSeq').val(empId);
   	})
   $('#insertModal').modal();
}

function carrerIn() {
	document.insertform.action = "${root}/career";
	document.insertform.submit();
}
</script>
</head>
<body>

	<div id="content" style="opacity: 1;">
		<section id="widget-grid">
		<div class="row">
			<article
				class="col-xs-12 col-sm-12 col-md-12 col-lg-12 sortable-grid ui-sortable">
			<div class="jarviswidget" id="employeeListResult_jarviswidget"
				data-widget-sortable="false" data-widget-editbutton="false"
				data-widget-colorbutton="false" data-widget-togglebutton="false"
				data-widget-deletebutton="false" role="widget">
				<header role="heading">
				<div class="jarviswidget-ctrls" role="menu"></div>
				<h2>
					<span class="widget-icon"> <i class="fa fa-table"></i>
					</span> 경력 사항
				</h2>
				<ul class="nav nav-tabs pull-right">
					<li><a href="${root}/user?act=employeesmodify&empId=${empId}"><i class="fa fa-fw fa-lg fa-user"></i>
							기본정보</a></li>

					<li class="active"><a href="career?act=careerlist&empId=${modfiyInfo.empId}"><i
							class="fa fa-fw fa-lg fa-building"></i> 경력사항(입사전)</a></li>
					<li><a href="${root}/license?act=licenseList"><i class="fa fa-fw fa-lg fa-book"></i> 자격&amp;면허</a></li>
					<!-- <li><a href=""><i class="fa fa-fw fa-lg fa-archive"></i>
							상벌사항</a></li> -->
					<!-- <li><a href=""><i class="fa fa-fw fa-lg fa-archive"></i>
							인사발령</a></li>
					<li><a href=""><i class="fa fa-fw fa-lg fa-wrench"></i>
							업무명세표</a></li>
					<li><a href=""><i class="fa fa-fw fa-lg fa-money"></i> 연봉</a> -->
					</li>
				</ul>

				<span class="jarviswidget-loader"> <i
					class="fa fa-refresh fa-spin"></i>
				</span> </header>
				<div role="content">
					<div class="widget-body no-padding">
						<div id="employeeListResult">
							<div class="dataTables_wrapper form-inline no-footer">

								<div class="table-responsive">
									<table id="mainTable"
										class="table table-striped table-bordered table-hover dataTable ">
										<thead class="table-head">
											<tr>
												<th>근무기간</th>
												<th>근무처</th>
												<th>직급</th>
												<th>담당업무</th>
												<th>업무내역</th>
												<th></th>
											</tr>
										</thead>
										<c:if test="${careerList.size() != 0}">
											<c:forEach var="careerList" items="${careerList}">
												<tr>
													<td width="350">${careerList.careerPeriod1}~
														${careerList.careerPeriod2}</td>
													<td>${careerList.careerLocation}</td>
													<td>${careerList.careerPosition}</td>
													<td>${careerList.careerDuty}</td>
													<td width="800">${careerList.careerContents}</td>
													<td><a class="btn btn-info  btn-xs" id="btnupdate"
														onclick="javascript:careerUpdate('${careerList.careerId}','${careerList.careerPeriod1}','${careerList.careerPeriod2}','${careerList.careerLocation}','${careerList.careerPosition}','${careerList.careerDuty}','${careerList.careerContents}');">수정</a>
														<%-- <jsp:include page="licenseUpdateInfoModal.jsp"></jsp:include>  --%>
														<a class="btn btn-danger  btn-xs" id="btndelete"
														onclick="javascript:careerDelete('${careerList.careerId}');">삭제</a>

														<%-- <input type="button" class="btn btn-info   btn-sm" value="수정" id="btnupdate" onclick="javascript:employeesupdate('${employeeslist.empId}');" />&nbsp;&nbsp;
				<input type="button" class="btn btn-danger  btn-xs" value="삭제" id="btndelete" onclick="javascript:employeesdelete('${employeeslist.empId}');" /> --%>

													</td>

												</tr>
											</c:forEach>
										</c:if>
									</table>
								</div>
								<div class="dt-toolbar-footer">
									<div class="col-sm-4">
										<div id="dt_basic_info" class="dataTables_info">Total :
											${total}</div>
									</div>
									<div class="col-sm-4 text-center">
										<div class="dataTables_paginate paging_bootstrap_full">
											<ul class="pagination pagination-sm">

												<c:choose>
													<c:when test="${totalCount%listNum == 0}">
														<c:forEach var="page" begin="1"
															end="${totalCount/listNum}">
															<a href="${root}/user?act=employeeslist&pg=${page}">${page}</a>&nbsp;&nbsp;
														</c:forEach>
													</c:when>
													<c:otherwise>
														<c:forEach var="page" begin="1"
															end="${totalCount/listNum + 1}">
															<a href="${root}/user?act=employeeslist&pg=${page}">${page}</a>&nbsp;&nbsp;
														</c:forEach>
													</c:otherwise>
												</c:choose>

											</ul>
										</div>
									</div>
									<div id="buttonSet" class="col-sm-4 text-right">
										<a href="javascript:carrerInsert('${empId}')" id="" name="" class="btn btn-info btn-sm" > 등록</a>
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
		<div id="details-info-card" class="popover arrow-box-right"
			style="display: none;"></div>

	</div>

	<!-- ========================== 삭제 모달 ========================== -->
	<div id="deleteModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">확인요청</h4>
				</div>
				<div class="modal-body">
					<h3>삭제하시겠습니까?</h3>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary"
						onclick="javascript:deleteModal('delSeq','${empId}');">확인</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- ========================== 수정 모달 ========================== -->
	<div id="updateModal" class="modal fade" role="dialog">

		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title">경력사항 수정</h4>
				</div>
				<div class="modal-body" style="max-height: 800px;">
					<div class="widget-body">
						<!-- ************************************* -->
						<form name="updateform" class="smart-form" method="post" action="">
							<input type="hidden" name="act" id="act" value="update">
				
							<input type="hidden" name="updateSeq" id="updateSeq" value="">
							<input id="employeeId" name="employeeId" type="hidden"
								value="00000000"> <input id="id" name="id" type="hidden"
								value="583be87c45cebabb1ef1c720">
							<fieldset>
								<div class="row">
									<section class="col col-6"> <label class="label">근무기간</label>
									<label class="input col col-6" style="padding: 0px;"> <i
										class="icon-prepend fa fa-calendar"></i> <input id="startDate"
										name="startDate" type="text" value="">
									</label> <label class="input col col-6" style="padding: 0px;">
										<i class="icon-prepend fa fa-calendar"></i> <input
										id="endDate" name="endDate" type="text" value="">
									</label> </section>
									<section class="col col-6"> <label class="label">근무처</label>
									<label class="input"> <i
										class="icon-prepend fa fa-building"></i> <input
										id="careerLocation" name="careerLocation" type="text" value="">
									</label> </section>
								</div>
								<div class="row">
									<section class="col col-6"> <label class="label">직급</label>
									<label class="input"> <i
										class="icon-prepend fa fa-bookmark"></i> <input
										id="careerPosition" name="careerPosition" type="text" value="">
									</label> </section>
									<section class="col col-6"> <label class="label">담당업무</label>
									<label class="input"> <i class="icon-prepend fa fa-tag"></i>
										<input id="careerDuty" name="careerDuty" type="text" value="">
									</label> </section>
								</div>
								<section> <label class="label">업무내역</label> <label
									class="textarea"> <i class="icon-append fa fa-comment"></i>
									<textarea id="careerContents" name="careerContents" rows="5"
										value=""></textarea>
								</label> </section>
							</fieldset>
						</form>
					</div>
					<link rel="stylesheet"
						href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
					<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
					<script type="text/javascript">
				            $(function() {
				      		  $( "#startDate" ).datepicker({
				      		    dateFormat: 'yy-mm-dd',
				      		    prevText: '<',
				      		    nextText: '>',
				      		    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
				      		    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
				      		    dayNames: ['일','월','화','수','목','금','토'],
				      		    dayNamesShort: ['일','월','화','수','목','금','토'],
				      		    dayNamesMin: ['일','월','화','수','목','금','토'],
				      		    showMonthAfterYear: true,
				      		    changeMonth: true,
				      		    changeYear: true,
				      		  });
				      		});
				            
				            $(function() {
					      		  $( "#endDate" ).datepicker({
					      		    dateFormat: 'yy-mm-dd',
					      		    prevText: '<',
					      		    nextText: '>',
					      		    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
					      		    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
					      		    dayNames: ['일','월','화','수','목','금','토'],
					      		    dayNamesShort: ['일','월','화','수','목','금','토'],
					      		    dayNamesMin: ['일','월','화','수','목','금','토'],
					      		    showMonthAfterYear: true,
					      		    changeMonth: true,
					      		    changeYear: true,
					      		  });
					      		});
            			</script>
					<div class="modal-footer">
						<a class="btn btn-info btn-sm" onclick="javascript:careerUp('${empId}');">저장</a>
						<a class="btn btn-danger btn-sm" data-dismiss="modal">닫기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
		
<!-- ============================================================ -->

<!-- ========================== 등록 모달 ========================== -->
<div id="insertModal" class="modal fade" role="dialog">

	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h4 class="modal-title">경력사항 수정</h4>
			</div>
			<div class="modal-body" style="max-height: 800px;">
				<div class="widget-body">
					<!-- ************************************* -->
					<form name="insertform" class="smart-form" method="post" action="">
						<input type="hidden" name="act" id="act" value="insert">
						
						<input type="hidden" name="insertSeq" id="insertSeq" value="">
						<input id="employeeId" name="employeeId" type="hidden"
							value="00000000"> <input id="id" name="id" type="hidden"
							value="583be87c45cebabb1ef1c720">
						<fieldset>
							<div class="row">
								<section class="col col-6"> <label class="label">근무기간</label>
								<label class="input col col-6" style="padding: 0px;"> <i
									class="icon-prepend fa fa-calendar"></i> 
									<input id="startDate1" name="startDate1" type="text">
								</label> <label class="input col col-6" style="padding: 0px;">
									<i class="icon-prepend fa fa-calendar"></i> 
									<input id="endDate1" name="endDate1" type="text">
								</label> </section>
								<section class="col col-6"> <label class="label">근무처</label>
								<label class="input"> <i
									class="icon-prepend fa fa-building"></i> <input
									id="careerLocation1" name="careerLocation1" type="text" value="">
								</label> </section>
							</div>
							<div class="row">
								<section class="col col-6"> <label class="label">직급</label>
								<label class="input"> <i
									class="icon-prepend fa fa-bookmark"></i> <input
									id="careerPosition1" name="careerPosition1" type="text" value="">
								</label> </section>
								<section class="col col-6"> <label class="label">담당업무</label>
								<label class="input"> <i class="icon-prepend fa fa-tag"></i>
									<input id="careerDuty1" name="careerDuty1" type="text" value="">
								</label> </section>
							</div>
							<section> <label class="label">업무내역</label> <label
								class="textarea"> <i class="icon-append fa fa-comment"></i>
								<textarea id="careerContents1" name="careerContents1" rows="5"
									value=""></textarea>
							</label> </section>
						</fieldset>
					</form>
				</div>
				<link rel="stylesheet"
					href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
				<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
				<script type="text/javascript">
			            $(function() {
			      		  $( "#startDate1" ).datepicker({
			      		    dateFormat: 'yy-mm-dd',
			      		    prevText: '<',
			      		    nextText: '>',
			      		    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			      		    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			      		    dayNames: ['일','월','화','수','목','금','토'],
			      		    dayNamesShort: ['일','월','화','수','목','금','토'],
			      		    dayNamesMin: ['일','월','화','수','목','금','토'],
			      		    showMonthAfterYear: true,
			      		    changeMonth: true,
			      		    changeYear: true,
			      		  });
			      		});
			            
			            $(function() {
				      		  $( "#endDate1" ).datepicker({
				      		    dateFormat: 'yy-mm-dd',
				      		    prevText: '<',
				      		    nextText: '>',
				      		    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
				      		    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
				      		    dayNames: ['일','월','화','수','목','금','토'],
				      		    dayNamesShort: ['일','월','화','수','목','금','토'],
				      		    dayNamesMin: ['일','월','화','수','목','금','토'],
				      		    showMonthAfterYear: true,
				      		    changeMonth: true,
				      		    changeYear: true,
				      		  });
				      		});
           			</script>
				<div class="modal-footer">
					<a class="btn btn-info btn-sm" onclick="javascript:carrerIn();">저장</a>
					<a class="btn btn-danger btn-sm" data-dismiss="modal">닫기</a>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>