<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, java.text.*, com.tie.department.model.DepartmentDto, com.tie.salary.model.SalaryDto,
	com.tie.basic.model.EmployeesDto, com.tie.jobs.model.JobsDto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>연봉 및 연차 관리</title>
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link rel="stylesheet" type="text/css" media="screen" href="${root }/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" media="screen" href="${root }/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" media="screen" href="${root }/css/smartadmin-production-plugins.min.css">
<link rel="stylesheet" type="text/css" media="screen" href="${root }/css/smartadmin-production.min.css">
<link rel="stylesheet" type="text/css" media="screen" href="${root }/css/smartadmin-skins.min.css">
<link rel="stylesheet" type="text/css" media="screen" href="${root }/css/smartadmin-rtl.min.css">
<link rel="stylesheet" type="text/css" media="screen" href="${root }/css/demo.min.css">
<link rel="stylesheet" type="text/css" media="screen" href="${root }/css/ion_assist9.css">
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
<!-- 부트스트랩 모달 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css"> -->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> -->
<script type="text/javascript">

function search(){
	var key = document.getElementById('key').options[document.getElementById('key').selectedIndex].text;
	var word = document.getElementById('word').value;

	document.location.href="${root}/salary?act=salaryList&key="+key +"&word="+word;
}

function salaryUpdateForm(id, name, money, incentive, bonus, basic, add){
	$('#salaryUpdate').on('show.bs.modal', function (event) {
		  var modal = $(this)
		  modal.find('#empId').val(id)
 		  modal.find('#empName').val(name)
 		  modal.find('#money').val(money)
 		  modal.find('#incentive').val(incentive)
 		  modal.find('#bonus').val(bonus)
 		  modal.find('#basic').val(basic)
 		  modal.find('#add').val(add)
 		  
	})
	
	$('#salaryUpdate').modal();
}

function salaryDeleteForm(id){
	$('#salaryDelete').on('show.bs.modal', function (event) {
		  var modal = $(this)
		  modal.find('#empId').val(id)		  
	})
	
	$('#salaryDelete').modal();
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
		<article
			class="col-xs-12 col-sm-12 col-md-12 col-lg-12 sortable-grid ui-sortable">
		<div class="jarviswidget" id="educationListResult_jarviswidget"
			data-widget-sortable="false" data-widget-editbutton="false"
			data-widget-colorbutton="false" data-widget-togglebutton="false"
			data-widget-deletebutton="false" role="widget">
			<header role="heading">

			<h2>
				<span class="widget-icon"> <i class="fa fa-table"></i></span> 연봉 및
				연차 관리
			</h2>
			<span class="jarviswidget-loader"><i
				class="fa fa-refresh fa-spin"></i></span></header>
			<div role="content">
				<div class="widget-body no-padding">
					<div id="educationListResult">
						<div class="dataTables_wrapper form-inline no-footer">
							<div class="dt-toolbar">
								<div>
									<div id="filterSet">
										<div class="dt_filter" style="width: 200px;">
											<div class="smart-form">
												<label class="select"><select id="key" name="key">
														<option value="이름" selected="selected">이름</option>
														<option value="부서">부서</option>
														<option value="직급">직급</option>
												</select><i></i></label>
											</div>
										</div>
										<div class="dt_filter" style="width: 200px;">
											<div class="input-group">
												<input class="form-control" id="word" name="word"
													type="text"> <span
													class="input-group-addon findBtn" style="cursor: pointer;"
													onclick="search()"> <i class="fa fa-search"></i>
												</span>
											</div>
										</div>
									</div>
								</div>
								<div class="dataTables_wrapper">
							<div class="table-responsive">
								<div class="ui-jqgrid ui-corner-all"
									id="gbox_salaryVacationGrid" dir="ltr" style="width: auto;">
									<div class="ui-widget-overlay jqgrid-overlay"
										id="lui_salaryVacationGrid"></div>
									<div class="loading ui-state-default ui-state-active"
										id="load_salaryVacationGrid" style="display: none;">조회중...</div>
									<div class="ui-jqgrid-view" id="gview_salaryVacationGrid"
										style="width: auto;">
										<div
											class="ui-jqgrid-titlebar ui-corner-top ui-helper-clearfix"
											style="display: none;">
											<a role="link" class="ui-jqgrid-titlebar-close HeaderButton"
												style="right: 0px;"><span
												class="ui-icon ui-icon-circle-triangle-n"></span></a> <span
												class="ui-jqgrid-title"></span>
										</div>
										<div class="ui-jqgrid-hdiv" style="">
											<div class="ui-jqgrid-hbox">
												<table
													class="ui-jqgrid-htable table table-bordered table-hover" role="grid"
													aria-labelledby="gbox_salaryVacationGrid" cellspacing="0"
													cellpadding="0" border="0">
													<thead>
														<tr class="ui-jqgrid-labels" role="rowheader">
															<th id="salaryVacationGrid_id" role="columnheader"
																class="" style="width: 64px;"><span
																class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
																style="cursor: col-resize;">&nbsp;</span>
																<div id="jqgh_salaryVacationGrid_id"
																	class="ui-jqgrid-sortable">
																	사원번호 <span class="s-ico" style=""> <span
																		sort="asc"
																		class="ui-grid-ico-sort ui-icon-asc ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span>
																		<span sort="desc"
																		class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span>
																	</span>
																</div></th>
															<th id="salaryVacationGrid_name" role="columnheader"
																class="" style="width: 64px;"><span
																class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
																style="cursor: col-resize;">&nbsp;</span>
																<div id="jqgh_salaryVacationGrid_name"
																	class="ui-jqgrid-sortable">
																	성명 <span class="s-ico" style="display: none"> <span
																		sort="asc"
																		class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span>
																		<span sort="desc"
																		class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span>
																	</span>
																</div></th>
															<th id="salaryVacationGrid_organizationNamePath"
																role="columnheader" class="" style="width: 119px;">
																<span class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
																style="cursor: col-resize;">&nbsp;</span>
																<div id="jqgh_salaryVacationGrid_organizationNamePath"
																	class="ui-jqgrid-sortable">
																	부서 <span class="s-ico" style="display: none"> <span
																		sort="asc"
																		class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span>
																		<span sort="desc"
																		class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span>
																	</span>
																</div>
															</th>
															<th id="salaryVacationGrid_rank" role="columnheader"
																class="" style="width: 80px;"><span
																class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
																style="cursor: col-resize;">&nbsp;</span>
																<div id="jqgh_salaryVacationGrid_rank"
																	class="ui-jqgrid-sortable">
																	직급 <span class="s-ico" style="display: none"> <span
																		sort="asc"
																		class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span>
																		<span sort="desc"
																		class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span>
																	</span>
																</div></th>
															<th id="salaryVacationGrid_salary" role="columnheader"
																class="" style="width: 119px;"><span
																class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
																style="cursor: col-resize;">&nbsp;</span>
																<div id="jqgh_salaryVacationGrid_salary"
																	class="ui-jqgrid-sortable">
																	연봉금액 <span class="s-ico" style="display: none">
																		<span sort="asc"
																		class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span>
																		<span sort="desc"
																		class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span>
																	</span>
																</div></th>
															<th id="salaryVacationGrid_incentive" role="columnheader"
																class="" style="width: 119px;"><span
																class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
																style="cursor: col-resize;">&nbsp;</span>
																<div id="jqgh_salaryVacationGrid_incentive"
																	class="ui-jqgrid-sortable">
																	인센티브 <span class="s-ico" style="display: none">
																		<span sort="asc"
																		class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span>
																		<span sort="desc"
																		class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span>
																	</span>
																</div></th>
															<th id="salaryVacationGrid_bonus" role="columnheader"
																class="" style="width: 119px;"><span
																class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
																style="cursor: col-resize;">&nbsp;</span>
																<div id="jqgh_salaryVacationGrid_bonus"
																	class="ui-jqgrid-sortable">
																	상여금 <span class="s-ico" style="display: none"> <span
																		sort="asc"
																		class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span>
																		<span sort="desc"
																		class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span>
																	</span>
																</div></th>
															<th id="salaryVacationGrid_salaryTotal"
																role="columnheader" class="" style="width: 119px;">
																<span class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
																style="cursor: col-resize;">&nbsp;</span>
																<div id="jqgh_salaryVacationGrid_salaryTotal"
																	class="ui-jqgrid-sortable">
																	연봉총액 <span class="s-ico" style="display: none">
																		<span sort="asc"
																		class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span>
																		<span sort="desc"
																		class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span>
																	</span>
																</div>
															</th>
															<th id="salaryVacationGrid_vacation" role="columnheader"
																class="" style="width: 71px;"><span
																class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
																style="cursor: col-resize;">&nbsp;</span>
																<div id="jqgh_salaryVacationGrid_vacation"
																	class="ui-jqgrid-sortable">
																	기본 연차 수 <span class="s-ico" style="display: none">
																		<span sort="asc"
																		class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span>
																		<span sort="desc"
																		class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span>
																	</span>
																</div></th>
															<th id="salaryVacationGrid_plusVacation"
																role="columnheader" class="" style="width: 71px;">
																<span class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
																style="cursor: col-resize;">&nbsp;</span>
																<div id="jqgh_salaryVacationGrid_plusVacation"
																	class="ui-jqgrid-sortable">
																	가산 연차 수 <span class="s-ico" style="display: none">
																		<span sort="asc"
																		class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span>
																		<span sort="desc"
																		class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span>
																	</span>
																</div>
															</th>
															<th id="salaryVacationGrid_plusVacation"
																role="columnheader" class="" style="width: 110px;">
																</th>


														</tr>
													</thead>
												</table>
											</div>
										</div>
										<div class="ui-jqgrid-bdiv" style="height: auto;">
											<div style="position: relative;">
												<div></div>
												<table id="salaryVacationGrid" tabindex="0" cellspacing="0"
													cellpadding="0" border="0" role="grid"
													aria-multiselectable="false"
													aria-labelledby="gbox_salaryVacationGrid"
													class="ui-jqgrid-btable table table-bordered table-striped">
													<tbody>
														<tr class="jqgfirstrow" role="row" style="height: auto">
															<td role="gridcell" style="height: 0px; width: 64px;"></td>
															<td role="gridcell" style="height: 0px; width: 64px;"></td>
															<td role="gridcell" style="height: 0px; width: 119px;"></td>
															<td role="gridcell" style="height: 0px; width: 80px;"></td>
															<td role="gridcell" style="height: 0px; width: 119px;"></td>
															<td role="gridcell" style="height: 0px; width: 119px;"></td>
															<td role="gridcell" style="height: 0px; width: 119px;"></td>
															<td role="gridcell" style="height: 0px; width: 119px;"></td>
															<td role="gridcell" style="height: 0px; width: 71px;"></td>
															<td role="gridcell" style="height: 0px; width: 71px;"></td>
															<td role="gridcell" style="height: 0px; width: 100px;"></td>
														</tr>
														<%

														Map<String, List<Object>> map = (Map<String, List<Object>>) request.getAttribute("salaryList");
														EmployeesDto employeesDto = new EmployeesDto();
														DepartmentDto departmentDto = new DepartmentDto();
														JobsDto jobsDto = new JobsDto();
														SalaryDto salaryDto = new SalaryDto();
														
														for (int i = 0; i < map.get("salaryDtoList").size(); i++) {
															employeesDto = (EmployeesDto)map.get("employeesDtoList").get(i);
															departmentDto = (DepartmentDto) map.get("departmentDtoList").get(i);
															jobsDto = (JobsDto)map.get("jobsDtoList").get(i);
															salaryDto = (SalaryDto)map.get("salaryDtoList").get(i);
													%>
															<tr role="row" tabindex="-1"
																class="ui-widget-content jqgrow ui-row-ltr">
																<td role="gridcell" style="" title="12341234"
																	aria-describedby="salaryVacationGrid_id"><%=employeesDto.getEmpId() %></td>
																<td role="gridcell" style="" title=""
																	aria-describedby="salaryVacationGrid_name"><%=employeesDto.getEmpName().trim() %></td>
																<td role="gridcell" style="" title="전사"
																	aria-describedby="salaryVacationGrid_organizationNamePath"><%=departmentDto.getDeptName() %></td>
																<td role="gridcell" style="" title="부사장"
																	aria-describedby="salaryVacationGrid_rank"><%=jobsDto.getJobName() %></td>
																<td role="gridcell" style="text-align: right;"
																	title="1,223,401"
																	aria-describedby="salaryVacationGrid_salary"><%=salaryDto.getSalaryMoney() %></td>
																<td role="gridcell" style="text-align: right;" title="5"
																	aria-describedby="salaryVacationGrid_incentive"><%=salaryDto.getSalaryIncentive() %></td>
																<td role="gridcell" style="text-align: right;"
																	title="511,234,120"
																	aria-describedby="salaryVacationGrid_bonus"><%=salaryDto.getSalaryBonus() %></td>
																<td role="gridcell" style="text-align: right;"
																	title="512,457,526"
																	aria-describedby="salaryVacationGrid_salaryTotal"><%=salaryDto.getSalaryMoney() + salaryDto.getSalaryIncentive() + salaryDto.getSalaryBonus()%></td>
																</td>
																<td role="gridcell" style="text-align: right;"
																	title="124"
																	aria-describedby="salaryVacationGrid_vacation"><%=salaryDto.getSalaryBasic() %></td>
																<td role="gridcell" style="text-align: right;" title="0"
																	aria-describedby="salaryVacationGrid_plusVacation"><%=salaryDto.getSalaryAdd() %></td>
																<td role="gridcell" style="text-align: right;" title="0"
																	aria-describedby="salaryVacationGrid_plusVacation"><a 
																	class="btn btn-info  btn-xs" href="javascript:salaryUpdateForm(<%=employeesDto.getEmpId() %>, '<%=employeesDto.getEmpName().trim() %>', <%=salaryDto.getSalaryMoney() %>, <%=salaryDto.getSalaryIncentive() %>, <%=salaryDto.getSalaryBonus() %>, <%=salaryDto.getSalaryBasic() %>, <%=salaryDto.getSalaryAdd() %>);" id="update" >수정</a> <a
																	 class="btn btn-danger  btn-xs" href="javascript:salaryDeleteForm(<%=employeesDto.getEmpId() %>)" >삭제</a></td>
															</tr>
														<%} %>
													</tbody>
												</table>
											</div>
										</div>
									</div>
									<div class="ui-jqgrid-resize-mark" id="rs_msalaryVacationGrid">&nbsp;</div>
								</div>
							</div>
						</div>
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

										<ul class="pagination pagination-sm">
											<c:if test="${numPageGroup > 1}">
												<li class="prev abled" data="0"><a
													href="${root}/salary?act=salaryList&currentPage=${(numPageGroup-2)*pageGroupSize+1 }"><i class="fa fa-angle-left"></i></a>
												</li>
											</c:if>
											
											
											<c:forEach var="i" begin="${startPage}" end="${endPage}">
												<c:if test="${currentPage == i}">
													<li class="active"><a href="${root}/salary?act=salaryList&currentPage=${i}">
															${i}&nbsp; </a></li>
												</c:if>
												<c:if test="${currentPage != i}">
													<li class="inactive"><a
														href="${root}/salary?act=salaryList&currentPage=${i}">
															${i}&nbsp; </a></li>
												</c:if>
											</c:forEach>
											
											
											<c:if test="${numPageGroup < pageGroupCount}">
											<li class="next abled" data="2"><a
												href="${root}/salary?act=salaryList&currentPage=${numPageGroup*pageGroupSize+1}"><i class="fa fa-angle-right"></i></a>
											</li>
											</c:if>
										</ul>

									</div>
						<div id="buttonSet" class="col-sm-4 text-right">
							<jsp:include page="salaryregister.jsp" flush="false"/>
							<p></p>
						</div>
					</div>
				</div>
			</div>
			</article>
</body>
</html>