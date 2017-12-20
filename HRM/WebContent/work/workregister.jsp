<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>업무명세표 등록</title>
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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript">
	function workRegister() {
		document.workform.action = "${root}/work?act=workRegister";
		document.workform.submit();
	}
	
	function workCancell() {
		document.location.href = "${root}/work?act=workList";
	}
	
	function check(){
		 $('input:checkbox[name="init"]').each(function() {
		      if(this.checked){//checked 처리된 항목의 값
		    	mytable = document.getElementById('breakDown');
		  		row = mytable.insertRow(mytable.rows.length);
		  		row.insertCell(0).innerHTML = '<input type="text" name="breakdownContents[]" value= "'+ this.value +'" />';
		  		row.insertCell(1).innerHTML = '<input type="text" name="breakdownImportant[]" value="" />';
		  		row.insertCell(2).innerHTML = '<input type="text" name="breakdownWeight[]" value="" />';
		  		row.insertCell(3).innerHTML = '<input type="text" name="breakdownResult[]" value="" />';
		  		row.insertCell(4).innerHTML = '<input type="text" name="breakdownCooperation[]" value="" />';
		      }
		 });
	}

	function add_row() {
		mytable = document.getElementById('breakDown');
		row = mytable.insertRow(mytable.rows.length);
		row.insertCell(0).innerHTML = '<input type="text" name="breakdownContents[]" value="" />';
		row.insertCell(1).innerHTML = '<input type="text" name="breakdownImportant[]" value="" />';
		row.insertCell(2).innerHTML = '<input type="text" name="breakdownWeight[]" value="" />';
		row.insertCell(3).innerHTML = '<input type="text" name="breakdownResult[]" value="" />';
		row.insertCell(4).innerHTML = '<input type="text" name="breakdownCooperation[]" value="" />';
	}

	function add_row2() {
		mytable = document.getElementById('periodic');
		row = mytable.insertRow(mytable.rows.length);
		row.insertCell(0).innerHTML = '<input type="text" name="periodicPeriod[]" value=""/>';
		row.insertCell(1).innerHTML = '<input type="text" name="periodicContents[]" value=""/>';
		row.insertCell(2).innerHTML = '<input type="text" name="periodicResult[]" value=""/>';
		row.insertCell(3).innerHTML = '<input type="text" name="periodicCoopration[]" value=""/>';
	}
	function add_row3() {
		mytable = document.getElementById('outCome');
		row = mytable.insertRow(mytable.rows.length);
		row.insertCell(0).innerHTML = '<input type="text" name="outcomePeriod[]" value="" />';
		row.insertCell(1).innerHTML = '<input type="text" name="outcomeWork[]" value="" />';
		row.insertCell(2).innerHTML = '<input type="text" name="outcomeResult[]" value="" />';
		row.insertCell(3).innerHTML = '<input type="text" name="outcomeCooperation[]" value="" />';
	}
	function add_row4() {
		mytable = document.getElementById('education');
		row = mytable.insertRow(mytable.rows.length);
		row.insertCell(0).innerHTML = '<input type="text" name="eduContents[]" value="" />';
		row.insertCell(1).innerHTML = '<input type="text" name="eduInstitution[]" value="" />';
		row.insertCell(2).innerHTML = '<input type="text" name="eduUnusual[]" value="" />';
	}

	function delete_row() {
		mytable = document.getElementById('breakDown');
		if (mytable.rows.length < 2)
			return;
		mytable.deleteRow(mytable.rows.length - 1);
	}
	function delete_row2() {
		mytable = document.getElementById('periodic');
		if (mytable.rows.length < 2)
			return;
		mytable.deleteRow(mytable.rows.length - 1);
	}
	function delete_row3() {
		mytable = document.getElementById('outCome');
		if (mytable.rows.length < 2)
			return;
		mytable.deleteRow(mytable.rows.length - 1);
	}
	function delete_row4() {
		mytable = document.getElementById('education');
		if (mytable.rows.length < 2)
			return;
		mytable.deleteRow(mytable.rows.length - 1);
	}
</script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script>

<!-- ie10-viewport-bug-workaround.js -->
<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script>
<!-- holder.js -->
</head>
<body class="desktop-detected" style="padding-right: 0px;">
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
	<div class="jarviswidget" id="hr_job_description_add"
		data-widget-sortable="false" data-widget-editbutton="false"
		data-widget-colorbutton="false" data-widget-togglebutton="false"
		data-widget-deletebutton="false" role="widget">
		<header role="heading">
		<h2>
			<span class="widget-icon"> <i class="fa fa-table"></i>
			</span> 업무명세표 등록
		</h2>
		<span class="jarviswidget-loader"> <i
			class="fa fa-refresh fa-spin"></i>
		</span> </header>
		<div role="content">
			<div class="widget-body">
				<form id="workform"  name="workform" class="smart-form" method="post" action="" novalidate="novalidate">
					<h6 style="font-weight: bold;">
						<i class="fa fa-chevron-circle-right"></i>기본정보
					</h6>
					<table class="table table-bordered" style="margin-bottom: 10px;">
						<tbody>
							<tr>
								<th nowrap="nowrap" style="background-color: #eee;">이름</th>
								<td>
									<label class="input"> 
										<input type="text" name="empName" id="empName" value="${userInfo.empName}" disabled="disabled" style="background-color: #eee">
										<input type="hidden" name="empId" id="empId" value="${userInfo.empId}">
									</label>
								</td>
								<th nowrap="nowrap" style="background-color: #eee;">부서</th>
								<td>
									<label class="input"> 
										<input type="text" name="deptName" id="deptName" value="${infoMap.deptName}" disabled="disabled" style="background-color: #eee"> 
										<input type="hidden" name="deptId" id="deptId" value="${userInfo.deptId}">
									</label>
								</td>
								<th width="13%" nowrap="nowrap" style="background-color: #eee;">직급</th>
								<td width="20%">
									<label class="input"> 
										<input type="text" name="jobName" id="jobName" value="${infoMap.jobName}" disabled="disabled" style="background-color: #eee"> 
										<input id="jobId" name="jobId" type="hidden" value="${userInfo.jobId}">
									</label>
								</td>
							</tr>
							<tr>
								<th nowrap="nowrap" style="background-color: #eee;">해당년도</th>
								<td>
									<label class="select"> 
										<select id="workYear" name="workYear">
											<option value="2017">2017</option>
											<option value="2016" selected="selected">2016</option>
											<option value="2015">2015</option>
										</select> <i></i>
									</label>
								</td>
								<th nowrap="nowrap" style="background-color: #eee;">평가자</th>
								<td>
									<label class="input">
										<!-- <div class="select2-container" id="s2id_assessorId"
											style="width: 100%">
											<a href="javascript:void(0)" class="select2-choice"
												tabindex="-1"> <span class="select2-chosen"
												id="select2-chosen-1">&nbsp;</span><abbr
												class="select2-search-choice-close"></abbr> <span
												class="select2-arrow" role="presentation"><b
													role="presentation"></b></span></a> <label for="s2id_autogen1"
												class="select2-offscreen"></label> <input
												class="select2-focusser select2-offscreen" type="text"
												aria-haspopup="true" role="button"
												aria-labelledby="select2-chosen-1" id="s2id_autogen1">
											<div
												class="select2-drop select2-display-none select2-with-searchbox">
												<div class="select2-search">
													<label for="s2id_autogen1_search" class="select2-offscreen"></label>
													<input type="text" autocomplete="off" autocorrect="off"
														autocapitalize="off" spellcheck="false"
														class="select2-input" role="combobox" aria-expanded="true"
														aria-autocomplete="list" aria-owns="select2-results-1"
														id="s2id_autogen1_search" placeholder="">
												</div>
												<ul class="select2-results" role="listbox"
													id="select2-results-1"></ul>
											</div>
										</div>  -->
										<input type="text" id="workAssessor" name="workAssessor" type="text" value="없음" />
									</label>
								</td>
								<th nowrap="nowrap" style="background-color: #eee;">상태</th>
								<td><label class="select"> 
								<select id="workStatus" name="workStatus">
											<option value="저장">저장</option>
											<option value="임시저장">임시저장</option>
									</select> <i></i>
								</label></td>
							</tr>
						</tbody>
					</table>
					
					<h6 style="font-weight: bold;">
						<i class="fa fa-chevron-circle-right"></i>업무 목표
					</h6>
					
					<label class="textarea"> 
					<textarea name="workGoal" id="workGoal" rows="5"></textarea>
					</label> 
					
					<br>
					
					<h6 style="font-weight: bold;">
						<span class="pull-left"> <i class="fa fa-chevron-circle-right"></i>
						업무 내역
						</span>
						<span class="pull-right"> 
						<a href="#" data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-th-list"></i></a> 
						<a href="#" onclick="add_row()"><i class="glyphicon glyphicon-plus"></i></a>
						<a href="#" onclick="delete_row()"><i class="glyphicon glyphicon-minus"></i></a>
						</span> 
						<input id="contents" name="contents" type="hidden" value="">
					</h6>
					<table class="table table-bordered" style="margin-bottom: 10px;" id="breakDown">
						<thead class="table-head">
							<tr>
								<th nowrap="nowrap">주요 업무</th>
								<th width="10%">중요도(%)</th>
								<th width="10%">시간비중(%)</th>
								<th width="15%">결과물</th>
								<th width="15%">협업대상</th>
							</tr>
						</thead>
					</table>
					
					<h6 style="font-weight: bold;">
						<span class="pull-left"> <i class="fa fa-chevron-circle-right"></i>
						Periodic Work(주기적인 일)
						</span> 
						<span class="pull-right"> 
						<a href="#" onclick="add_row2()"><i class="glyphicon glyphicon-plus"></i></a>
						<a href="#" onclick="delete_row2()"><i class="glyphicon glyphicon-minus"></i></a>
						</span> 
						<input id="periodWork" name="periodWork" type="hidden" value="">
					</h6>
					<table class="table table-bordered" style="margin-bottom: 10px;" id="periodic">
						<thead class="table-head">
							<tr>
								<th width="10%">주기</th>
								<th nowrap="nowrap">주요 업무</th>
								<th width="15%">결과물</th>
								<th width="15%">협업대상</th>
							</tr>
						</thead>
						<tbody>
							<tr style="background-color: #eee;"></tr>
						</tbody>
					</table>
					
					<h6 style="font-weight: bold;">
						<span class="pull-left"> <i class="fa fa-chevron-circle-right"></i>
						KPI(핵심 성과 지표)
						</span> 
						<span class="pull-right">  
						<a href="#" onclick="add_row3()"><i class="glyphicon glyphicon-plus"></i></a>
						<a href="#" onclick="delete_row3()"><i class="glyphicon glyphicon-minus"></i></a>
						</span> 
						<input id="kpi" name="kpi" type="hidden" value="">
					</h6>
					
					<table class="table table-bordered" style="margin-bottom: 10px;" id="outCome">
						<thead class="table-head">
							<tr>
								<th nowrap="nowrap">주요 업무</th>
								<th width="10%">중요도(%)</th>
								<th width="15%">결과물</th>
								<th width="15%">협업대상</th>
							</tr>
						</thead>
					</table>
					
					<h6 style="font-weight: bold;">
						<i class="fa fa-chevron-circle-right"></i>업무에 필요한 능력
					</h6>
					<table class="table table-bordered" style="margin-bottom: 10px;" id="ablity">
						<tbody>
							<tr>
								<th nowrap="nowrap" style="background-color: #eee;">업무 경력</th>
								<td>
								<label class="textarea"> 
								<textarea id="ablityCareer" name="ablityCareer" rows="3"></textarea>
								</label>
								</td>
							</tr>
							<tr>
								<th nowrap="nowrap" style="background-color: #eee;">필요한 학력</th>
								<td>
								<label class="textarea"> 
								<textarea id="ablityAcademic" name="ablityAcademic" rows="3"></textarea>
								</label>
								</td>
							</tr>
							<tr>
								<th nowrap="nowrap" style="background-color: #eee;">필요 기술</th>
								<td>
								<label class="textarea"> 
								<textarea id="academicSkill" name="academicSkill" rows="3"></textarea>
								</label>
								</td>
							</tr>
						</tbody>
					</table>
					<h6 style="font-weight: bold;">
						<span class="pull-left"> <i
							class="fa fa-chevron-circle-right"></i>업무 교육
						</span> 
						<span class="pull-right"> 
						<a href="#" onclick="add_row4()"><i class="glyphicon glyphicon-plus"></i></a>
						<a href="#" onclick="delete_row4()"><i class="glyphicon glyphicon-minus"></i></a>
						</span>
						<input id="training" name="training" type="hidden" value="">
					</h6>
					<table class="table table-bordered" style="margin-bottom: 10px;"
						id="education">
						<thead class="table-head">
							<tr>
								<th nowrap="nowrap">교육내용</th>
								<th>교육기관</th>
								<th>비고</th>
							</tr>
						</thead>
						<tbody>
							<tr style="background-color: #eee;"></tr>
						</tbody>
					</table>
					
					<footer style="background-color:#fff;"> 
					<a href="#" class="btn btn-danger btn-sm" onclick="workCancell()">취소</a>
					<button type="submit" class="btn btn-info btn-sm" onclick="workRegister()">저장</button>
					</footer>
				</form>
			</div>
		</div>
	</div>
	</article>
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">업무내역리스트</h4>
					</div>
					<div class="modal-body">
						<center>
							<table class="table table-striped table-bordered smart-form dataTable">
                  <tbody>
                    <tr>
                      <th nowrap="nowrap" rowspan="15">
                        <a href="javascript:allCheckDepth1('BA.1')">요구사항 수집</a>
                      </th>
                      <th nowrap="nowrap" rowspan="2">
                        <a href="javascript:allCheckDepth2('BA.1-1')">구축제안요청서 분석</a>
                      </th>
                      <td>
                        <label class="checkbox">
                          <input name="init" id="init" depth1="" depth2="" type="checkbox" value="비즈니스 환경에 대한 이해와 시스템 지식을 바탕으로 고객의 비기능적 요구를 파악할 수 있다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488fbd245ce57fa1afe0b00">비즈니스 환경에 대한 이해와 시스템 지식을 바탕으로 고객의 비기능적 요구를 파악할 수 있다.</div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.1" depth2="BA.1-1" type="checkbox"
                          value="제안요청서를 기반으로 구축할 대상(시스템/Application/등등)의 핵심 필요기능을 분석할 수 있다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488fbce45ce57fa1afe0a7b">제안요청서를 기반으로 구축할 대상(시스템/Application/등등)의 핵심 필요기능을 분석할 수 있다.</div>
                      </td>
                    </tr>
                    <tr>
                      <th nowrap="nowrap" rowspan="5">
                        <a href="javascript:allCheckDepth2('BA.1-2')">요구사항 수집</a>
                      </th>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.1" depth2="BA.1-2" type="checkbox"
                          value="체계적인 요구사항 수집을 위하여 경영전략 요구사항 수집 프로세스를 이해할 수 있다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488fbb245ced4eb0e08b31a">체계적인 요구사항 수집을 위하여 경영전략 요구사항 수집 프로세스를 이해할 수 있다.</div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.1" depth2="BA.1-2" type="checkbox"
                          value="효율적인 경영전략 요구사항 수집을 위하여 경영전략 요구사항 조사 기법을 이해할 수 있다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488fbb845ce57fa1afe096a">효율적인 경영전략 요구사항 수집을 위하여 경영전략 요구사항 조사 기법을 이해할 수 있다.</div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.1" depth2="BA.1-2" type="checkbox"
                          value="요구사항을 수집할 수 있다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488fba545ce57fa1afe07f4">요구사항을 수집할 수 있다.</div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.1" depth2="BA.1-2" type="checkbox"
                          value="이해관계자와 직접 대화를 통한 인터뷰와 핵심적 이해관계자들과의 워크숍 등을 통해 요구사항을 수집할 수 있다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488fbbd45ce57fa1afe09b9">이해관계자와 직접 대화를 통한 인터뷰와 핵심적 이해관계자들과의 워크숍 등을 통해 요구사항을 수집할 수 있다.</div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.1" depth2="BA.1-2" type="checkbox"
                          value="관련 요구사항 분석 프로세스를 이해할 수 있다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488fbab45ce57fa1afe0808">관련 요구사항 분석 프로세스를 이해할 수 있다.</div>
                      </td>
                    </tr>
                    <tr>
                      <th nowrap="nowrap" rowspan="4">
                        <a href="javascript:allCheckDepth2('BA.1-3')">요구사항 분석</a>
                      </th>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.1" depth2="BA.1-3" type="checkbox"
                          value="요구사항을 실질적으로 파악하여 자사의 강점과 약점을 파악할 수 있다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488fb8245ce57fa1afe03ba">요구사항을 실질적으로 파악하여 자사의 강점과 약점을 파악할 수 있다.</div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.1" depth2="BA.1-3" type="checkbox"
                          value="요구사항을 조사하기 위하여 고객과 인터뷰, 포커스 그룹 인터뷰, 설문조사, 관찰을 할 수 있다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488fb9745ced4eb0e08afa7">요구사항을 조사하기 위하여 고객과 인터뷰, 포커스 그룹 인터뷰, 설문조사, 관찰을 할 수 있다.</div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.1" depth2="BA.1-3" type="checkbox"
                          value="요구하는 핵심적인 품질 특성을 인지하였다가 향후 서비스 개발과정에서 핵심 목표로 활용할 수 있다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488fb9245ced4eb0e08af93">요구하는 핵심적인 품질 특성을 인지하였다가 향후 서비스 개발과정에서 핵심 목표로 활용할 수 있다.</div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.1" depth2="BA.1-3" type="checkbox"
                          value="요구사항을 확인하는 과정에서 고객이 요구하는 핵심적인 품질 특성을 파악할 수 있다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488fb8945ced4eb0e08af57">요구사항을 확인하는 과정에서 고객이 요구하는 핵심적인 품질 특성을 파악할 수 있다.</div>
                      </td>
                    </tr>
                    <tr>
                      <th nowrap="nowrap" rowspan="4">
                        <a href="javascript:allCheckDepth2('BA.1-4')">요구사항 도출</a>
                      </th>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.1" depth2="BA.1-4" type="checkbox"
                          value="요구사항간의 연관관계에서 상호작용을 반영하여 최적의 품질 목표를 도출할 수 있다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488fb7045ced4eb0e08af08">요구사항간의 연관관계에서 상호작용을 반영하여 최적의 품질 목표를 도출할 수 있다.</div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.1" depth2="BA.1-4" type="checkbox"
                          value="이해관계자의 기능적·비기능적 요구사항으로 식별된 IT프로젝트의 범위를 명세화할 수 있다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488fb7445ced4eb0e08af1c">이해관계자의 기능적·비기능적 요구사항으로 식별된 IT프로젝트의 범위를 명세화할 수 있다.</div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.1" depth2="BA.1-4" type="checkbox"
                          value="상위 레벨의 아키텍처 구성을 위해 요구항목으로부터 속성을 도출할 수 있다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488fb6645ced4eb0e08aee0">상위 레벨의 아키텍처 구성을 위해 요구항목으로부터 속성을 도출할 수 있다.</div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.1" depth2="BA.1-4" type="checkbox"
                          value="속성간의 의존성 분석을 위해 요구사항간의 연관관계를 도출할 수 있다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488fb6b45ced4eb0e08aef4">속성간의 의존성 분석을 위해 요구사항간의 연관관계를 도출할 수 있다.</div>
                      </td>
                    </tr>
                    <tr>
                      <th nowrap="nowrap" rowspan="9">
                        <a href="javascript:allCheckDepth1('BA.2')">기업 내부환경 분석</a>
                      </th>
                      <th nowrap="nowrap" rowspan="2">
                        <a href="javascript:allCheckDepth2('BA.2-1')">업무시스템 분석</a>
                      </th>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.2" depth2="BA.2-1" type="checkbox"
                          value="세부적인 업무 유형별 기능을 분석하기 위하여 업무 기능 목록을 파악할 수 있다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488fb4f45ced4eb0e08ae7c">세부적인 업무 유형별 기능을 분석하기 위하여 업무 기능 목록을 파악할 수 있다.</div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.2" depth2="BA.2-1" type="checkbox"
                          value="수행하는 조직의 업무시스템 기능에 대한 개선사항을 식별할 수 있다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488fb5345ced4eb0e08aea4">수행하는 조직의 업무시스템 기능에 대한 개선사항을 식별할 수 있다.</div>
                      </td>
                    </tr>
                    <tr>
                      <th nowrap="nowrap" rowspan="3">
                        <a href="javascript:allCheckDepth2('BA.2-2')">업무프로세스 분석</a>
                      </th>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.2" depth2="BA.2-2" type="checkbox"
                          value="업무 프로세스 구조를 조사하고 상세 활동을 정의할 수 있다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488fb3645ce57fa1afe02ac">업무 프로세스 구조를 조사하고 상세 활동을 정의할 수 있다.</div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.2" depth2="BA.2-2" type="checkbox"
                          value="업무와 시스템 간의 연계성을 파악하기 위하여 업무 프로세스와 시스템 간의 상관관계를 분석할 수 있다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488fb3d45ce57fa1afe02c0">업무와 시스템 간의 연계성을 파악하기 위하여 업무 프로세스와 시스템 간의 상관관계를 분석할 수 있다.</div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.2" depth2="BA.2-2" type="checkbox"
                          value="가치 흐름상의 연관 관계자의 업무 흐름을 상세하게 파악할 수 있도록 의사소통을 통해 업무 프로세스를 효율적으로 분석할 수 있다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488fb4245ce57fa1afe02d4">가치 흐름상의 연관 관계자의 업무 흐름을 상세하게 파악할 수 있도록 의사소통을 통해 업무 프로세스를 효율적으로 분석할 수 있다.</div>
                      </td>
                    </tr>
                    <tr>
                      <th nowrap="nowrap" rowspan="2">
                        <a href="javascript:allCheckDepth2('BA.2-3')">Legacy 시스템 분석</a>
                      </th>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.2" depth2="BA.2-3" type="checkbox"
                          value="소프트웨어 운용에 대한 개선사항을 식별할 수 있다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488fb2745ced4eb0e08ae16">소프트웨어 운용에 대한 개선사항을 식별할 수 있다.</div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.2" depth2="BA.2-3" type="checkbox"
                          value="운용하는 각종 소프트웨어 현황을 파악할 수 있다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488fb2545ced4eb0e08ae02">운용하는 각종 소프트웨어 현황을 파악할 수 있다.</div>
                      </td>
                    </tr>
                    <tr>
                      <th nowrap="nowrap" rowspan="2">
                        <a href="javascript:allCheckDepth2('BA.2-4')">데이터 분석</a>
                      </th>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.2" depth2="BA.2-4" type="checkbox"
                          value="전체적인 데이터의 활용성을 파악할 수 있다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488fb1245ced4eb0e08ada0">전체적인 데이터의 활용성을 파악할 수 있다.</div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.2" depth2="BA.2-4" type="checkbox"
                          value="활용도를 제고하기 위하여 비즈니스 연관관계(프로세스와 기능)를 데이터구조와 연계할 수 있다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488fb1845ced4eb0e08adc8">활용도를 제고하기 위하여 비즈니스 연관관계(프로세스와 기능)를 데이터구조와 연계할 수 있다.</div>
                      </td>
                    </tr>
                    <tr>
                      <th nowrap="nowrap" rowspan="17">
                        <a href="javascript:allCheckDepth1('BA.3')">기업 외부환경 분석</a>
                      </th>
                      <th nowrap="nowrap" rowspan="4">
                        <a href="javascript:allCheckDepth2('BA.3-1')">일반환경 조사</a>
                      </th>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.3" depth2="BA.3-1" type="checkbox"
                          value="진행하는 프로젝트와 연관된 법률과 정부의 정책 관련 자료를 분석하여 정책적 영향을 파악할 수 있다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488fad945ced4eb0e08ab81">진행하는 프로젝트와 연관된 법률과 정부의 정책 관련 자료를 분석하여 정책적 영향을 파악할 수 있다.</div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.3" depth2="BA.3-1" type="checkbox"
                          value="수행하는 프로젝트가 포함된 산업과 경쟁사들의 동향, 이용자들의 서비스 이용수준을 조사하여 예측할 수 있다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488fae845ced4eb0e08abe4">수행하는 프로젝트가 포함된 산업과 경쟁사들의 동향, 이용자들의 서비스 이용수준을 조사하여 예측할 수 있다.</div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.3" depth2="BA.3-1" type="checkbox"
                          value="과거와 현재의 서비스 이용 형태를 분석하여 중장기적 이용패턴의 변화추이를 파악함으로써 새로운 비즈니스 발굴에 활용할 수 있다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488faef45ced4eb0e08abf8">과거와 현재의 서비스 이용 형태를 분석하여 중장기적 이용패턴의 변화추이를 파악함으로써 새로운 비즈니스 발굴에 활용할 수 있다.</div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.3" depth2="BA.3-1" type="checkbox"
                          value="진행하는 프로젝트에 영향을 미칠 수 있는 요소를 분석하고 기술의 활용방안을 수립할 수 있다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488fae045ce57fa1afe015d">진행하는 프로젝트에 영향을 미칠 수 있는 요소를 분석하고 기술의 활용방안을 수립할 수 있다.</div>
                      </td>
                    </tr>
                    <tr>
                      <th nowrap="nowrap" rowspan="2">
                        <a href="javascript:allCheckDepth2('BA.3-2')">비즈니스 조사</a>
                      </th>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.3" depth2="BA.3-2" type="checkbox"
                          value="대상 산업의 개략적인 비즈니스 정보를 수집할 수 있다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488fabb45ced4eb0e08ab31">대상 산업의 개략적인 비즈니스 정보를 수집할 수 있다.</div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.3" depth2="BA.3-2" type="checkbox"
                          value="대상 산업에서 표준업무의 절차를 조사하고 산업별 프로세스의 차이점을 비교할 수 있다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488fac245ced4eb0e08ab45">대상 산업에서 표준업무의 절차를 조사하고 산업별 프로세스의 차이점을 비교할 수 있다.</div>
                      </td>
                    </tr>
                    <tr>
                      <th nowrap="nowrap" rowspan="6">
                        <a href="javascript:allCheckDepth2('BA.3-3')">경쟁사 분석</a>
                      </th>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.3" depth2="BA.3-3" type="checkbox"
                          value="기술 동향을 파악하고 해당 기술이 시장에 어떻게 적용되고 있는지 이해한다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488fa8b45ce57fa1afdfe84">기술 동향을 파악하고 해당 기술이 시장에 어떻게 적용되고 있는지 이해한다.</div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.3" depth2="BA.3-3" type="checkbox"
                          value="분석 자료를 바탕으로 SWOT분석에 반영한다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488faa145ced4eb0e08aaf4">분석 자료를 바탕으로 SWOT분석에 반영한다.</div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.3" depth2="BA.3-3" type="checkbox"
                          value="자사 SW제픔과 비교 분석 자료를 작성한다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488fa9d45ce57fa1afdfead">자사 SW제픔과 비교 분석 자료를 작성한다.</div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.3" depth2="BA.3-3" type="checkbox"
                          value="시장동향 분석 자료를 이용하여 경쟁사를 식별한다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488fa9145ced4eb0e08aa7d">시장동향 분석 자료를 이용하여 경쟁사를 식별한다.</div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.3" depth2="BA.3-3" type="checkbox"
                          value="경쟁사의 제품 특징을 이해하고 정리한다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488fa9845ce40496b412724">경쟁사의 제품 특징을 이해하고 정리한다.</div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.3" depth2="BA.3-3" type="checkbox"
                          value="분석 자료를 바탕으로 SWOT분석에 반영한다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488faa945ced4eb0e08ab08">분석 자료를 바탕으로 SWOT분석에 반영한다.</div>
                      </td>
                    </tr>
                    <tr>
                      <th nowrap="nowrap" rowspan="3">
                        <a href="javascript:allCheckDepth2('BA.3-4')">기술동향 검토</a>
                      </th>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.3" depth2="BA.3-4" type="checkbox"
                          value="검토된 자료를 바탕으로 보고서를 작성한다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488fa5745ced4eb0e08a9d5">검토된 자료를 바탕으로 보고서를 작성한다.</div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.3" depth2="BA.3-4" type="checkbox"
                          value="SW제품 기획에 반영할 수 있는 기술 동향을 분류 및 정리한다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488fa4b45ce40496b412656">SW제품 기획에 반영할 수 있는 기술 동향을 분류 및 정리한다.</div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.3" depth2="BA.3-4" type="checkbox"
                          value="외부 환경에 영향을 줄 수 있는 기술 동향을 검토한다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488fa4545ced4eb0e08a9ab">외부 환경에 영향을 줄 수 있는 기술 동향을 검토한다.</div>
                      </td>
                    </tr>
                    <tr>
                      <th nowrap="nowrap" rowspan="2">
                        <a href="javascript:allCheckDepth2('BA.3-5')">법제도 검토</a>
                      </th>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.3" depth2="BA.3-5" type="checkbox"
                          value="프로젝트 수행에 영향을 주는 법제도에 대처하기 위해 조사한 법제도에 따라 업무수행 절차, 제약조건을 파악할 수 있다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488fa2d45ce57fa1afdfc5d">프로젝트 수행에 영향을 주는 법제도에 대처하기 위해 조사한 법제도에 따라 업무수행 절차, 제약조건을 파악할 수 있다.</div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.3" depth2="BA.3-5" type="checkbox"
                          value="프로젝트 수행 시 준수하여야 할 법제도를 파악할 수 있다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488fa2745ced4eb0e08a971">프로젝트 수행 시 준수하여야 할 법제도를 파악할 수 있다.</div>
                      </td>
                    </tr>
                    <tr>
                      <th nowrap="nowrap" rowspan="11">
                        <a href="javascript:allCheckDepth1('BA.4')">범위 정의</a>
                      </th>
                      <th nowrap="nowrap" rowspan="4">
                        <a href="javascript:allCheckDepth2('BA.4-1')">요구사항 정의</a>
                      </th>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.4" depth2="BA.4-1" type="checkbox"
                          value="문서화된 이해관계자의 요구사항을 통해 IT 프로젝트의 전체 범위를 상세하게 식별할 수 있다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488f9f745ced4eb0e08a90e">문서화된 이해관계자의 요구사항을 통해 IT 프로젝트의 전체 범위를 상세하게 식별할 수 있다.</div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.4" depth2="BA.4-1" type="checkbox"
                          value="명세화된 범위에 대한 상세한 정의를 통해 IT프로젝트의 전체 범위 기술서를 작성 할 수 있다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488f9fe45ced4eb0e08a922">명세화된 범위에 대한 상세한 정의를 통해 IT프로젝트의 전체 범위 기술서를 작성 할 수 있다.</div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.4" depth2="BA.4-1" type="checkbox"
                          value="IT프로젝트 목표를 충족하기 위해 이해관계자의 기능적 요구사항과 비기능적 요구사항을 정의할 수 있다">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488fa0945ced4eb0e08a94a">IT프로젝트 목표를 충족하기 위해 이해관계자의 기능적 요구사항과 비기능적 요구사항을 정의할 수 있다.</div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.4" depth2="BA.4-1" type="checkbox"
                          value="수집된 이해관계자의 기능적․비기능적 요구사항을 IT프로젝트의 목적에 부합하도록 문서화 할 수 있다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488fa0445ced4eb0e08a936">수집된 이해관계자의 기능적․비기능적 요구사항을 IT프로젝트의 목적에 부합하도록 문서화 할 수 있다.</div>
                      </td>
                    </tr>
                    <tr>
                      <th nowrap="nowrap" rowspan="3">
                        <a href="javascript:allCheckDepth2('BA.4-2')">기능 정의</a>
                      </th>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.4" depth2="BA.4-2" type="checkbox"
                          value="정의된 기능이 실질적으로 현실화 될 수 있도록 파악된 기능 개선사항을 반영할 수 있다">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488f9eb45ce40496b412577">정의된 기능이 실질적으로 현실화 될 수 있도록 파악된 기능 개선사항을 반영할 수 있다.</div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.4" depth2="BA.4-2" type="checkbox"
                          value="분석된 내용을 바탕으로 기능을 정의하기 위하여 업무 기능 목록을 파악할 수 있다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488f9de45ce57fa1afdf9c3">분석된 내용을 바탕으로 기능을 정의하기 위하여 업무 기능 목록을 파악할 수 있다.</div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.4" depth2="BA.4-2" type="checkbox"
                          value="안정적이고 발전적인 구축을 위하여 분석내용을 바탕으로 기능을 도출할 수 있다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488f9e645ced4eb0e08a8d1">안정적이고 발전적인 구축을 위하여 분석내용을 바탕으로 기능을 도출할 수 있다.</div>
                      </td>
                    </tr>
                    <tr>
                      <th nowrap="nowrap" rowspan="4">
                        <a href="javascript:allCheckDepth2('BA.4-3')">사양 정의</a>
                      </th>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.4" depth2="BA.4-3" type="checkbox"
                          value="속성별 목표를 달성을 위한 기술적인 방법을 제시할 수 있다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488f9c145ce40496b412500">속성별 목표를 달성을 위한 기술적인 방법을 제시할 수 있다.</div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.4" depth2="BA.4-3" type="checkbox"
                          value="요구정의서에 제시된 요구사항과 명세된 사양간의 관계를 검증할 수 있다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488f9d245ce40496b41253c">요구정의서에 제시된 요구사항과 명세된 사양간의 관계를 검증할 수 있다.</div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.4" depth2="BA.4-3" type="checkbox"
                          value="분석된 정보를 바탕으로, 목표에 부합될 수 있는 사양을 정의할 수 있다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488f9c845ce40496b412514">분석된 정보를 바탕으로, 목표에 부합될 수 있는 사양을 정의할 수 있다.</div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <label class="checkbox">
                          <input name="init" depth1="BA.4" depth2="BA.4-3" type="checkbox"
                          value="요구사항 최적화를 위해 사양의 범위와 수준을 구체적으로 명세할 수 있다.">
                          <i></i>
                        </label>
                      </td>
                      <td>
                        <div id="jdPoolText_5488f9ce45ce40496b412528">요구사항 최적화를 위해 사양의 범위와 수준을 구체적으로 명세할 수 있다.</div>
                      </td>
                    </tr>
                  </tbody>
                </table>
						</center>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-primary"
							onclick="javascript:check();" data-dismiss="modal">선택</button>
					</div>
				</div>
			</div>
		</div>
	
</body>
</html>