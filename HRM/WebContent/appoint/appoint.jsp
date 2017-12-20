<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, javax.servlet.http.* ,com.tie.appoint.model.*, com.tie.basic.model.EmployeesDto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
<link rel="stylesheet" type="text/css" media="screen" href="${root }/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" media="screen" href="${root }/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" media="screen" href="${root }/css/smartadmin-production-plugins.min.css">
<link rel="stylesheet" type="text/css" media="screen" href="${root }/css/smartadmin-production.min.css">
<link rel="stylesheet" type="text/css" media="screen" href="${root }/css/smartadmin-skins.min.css">
<link rel="stylesheet" type="text/css" media="screen" href="${root }/css/smartadmin-rtl.min.css">
<link rel="stylesheet" type="text/css" media="screen" href="${root }/css/demo.min.css">
<link rel="stylesheet" type="text/css" media="screen" href="${root }/css/ion_assist9.css">
<link href="${root}/css/bootstrap.min.css" rel="stylesheet">
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

<link href="${root}/css/jquery.searchableSelect.css" rel="stylesheet" type="text/css">
<script src="${root}/js/jquery-1.11.1.min.js"></script>
<script src="${root}/js/jquery.searchableSelect.js"></script>

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> -->
<script type="text/javascript">
    
	var personnalSeq = null;
	var delSeq = null;
	var inSeq = null;
	var ttt = null;
	
    $(document).ready(function(){$('#empname1').searchableSelect();});
	//$(document).ready(function(){$("select[name='empname1']").searchableSelect();});
	
	function appInsert() {
		$('#inModal').on('show.bs.modal', function (event) { // myModal 윈도우가 오픈할때 아래의 옵션을 적용
            var modal = $(this);
            modal.find('#calendar1').val();
       })
       
       $('#inModal').modal();
	}
	
	function appIn() {
		alert("날짜 입력!");
		if(document.getElementById("calendar1").value == "") {
			alert("날짜 입력!");
			return;
		}else if("${empId}" == null) {
			if(document.getElementById("empname1").value == ""){
				alert("이름 입력!");
				return;	
			}
		}/* else if("${empId}" != null) {
			if(document.getElementById("empId1").value == ""){
				alert("이름 입력!");
				return;	
			}
		} */else {
			document.joinform.action = "${root}/appoint";
			document.joinform.submit();
		}
		
		/* alert($('#calendar1').val());
		alert($('#empname1').val());
		alert($('#searchName1').val());
		alert($('#content1').val());
		
		document.location.href =  "${root}/user?act=insert&calender="+$('#calendar1').val()
		+"&empname="+$('#empname1').val()
		+"&searchName="+$('#searchName1').val()
		+"&context="+$('#content1').val(); */
	}
	
	function appDel(seq) {
		$('#myModal').on('show.bs.modal', function (event) { // myModal 윈도우가 오픈할때 아래의 옵션을 적용
            var modal = $(this);
            delSeq = seq;
       })
       
       $('#myModal').modal();
	}
	
	function appointDel(personnalSeq) {
		document.location.href = "${root}/appoint?act=delete&personnalSeq=" + delSeq;
	}
	
	function appUpdate(seq,date,name,searchName,content) {
		$('#upModal').on('show.bs.modal', function (event) { // myModal 윈도우가 오픈할때 아래의 옵션을 적용
            var modal = $(this);
            modal.find('#calendar').val(date); // 모달위도우에서 .modal-title을 찾아 titleTxt 값을 치환
            modal.find('#empname').val(name); 
            modal.find('#searchName').val(searchName); 
            modal.find('#content').val(content); 
            personnalSeq = seq;
       })
       $('#upModal').modal();
	}

	function appointUp() {
		/* alert("시퀀스번호 : " + personnalSeq +"\n"
			+ "날짜 : " + $('#calendar').val()+"\n"
			+"발령상태 : " + $('#searchName').val()+"\n"
			+"비고 : " + $('#content').val()); */
		
		document.location.href =  "${root}/appoint?act=update&personnalSeq="+personnalSeq
				+"&calender="+$('#calendar').val()
				+"&searchName="+$('#searchName').val()
				+"&context="+$('#content').val();
		//document.location.href = "${root}/user?act=update&empId=" + empId;
	}
	
	function serchAction(val) {
		document.location.href = "${root}/appoint?act=mvlist&serch=" + val;
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

	<div class="jarviswidget" id="appointListResult_jarviswidget"
		data-widget-sortable="false" data-widget-editbutton="false"
		data-widget-colorbutton="false" data-widget-togglebutton="false"
		data-widget-deletebutton="false" role="widget">
		<header role="heading">
		<div class="jarviswidget-ctrls" role="menu">
			
		</div>
		<h2>
		<span class="widget-icon"> <i class="fa fa-table"></i>
		</span>
		인사발령 목록</h2>
		<span class="jarviswidget-loader"> <i
			class="fa fa-refresh fa-spin"></i>
		</span> </header>
		<div role="content">
			<div class="widget-body no-padding">
				<div id="appointListResult">
					<div class="dataTables_wrapper form-inline no-footer">
						<div class="dt-toolbar">
							<div>
								<div id="filterSet">
									<div class="dt_filter" style="width: 200px;">
										<div class="smart-form">
											<label class="select"> 
											<select id="searchType" name="searchType" class="form-control"
												onchange="serchAction(this.value)">
													<option value="전체" ${val33 == '전체' ? 'selected="selected"' : '' }>== 발령구분 ==</option>
													<option value="신입" ${val33 == '신입' ? 'selected="selected"' : '' }>신입</option>
													<option value="휴직" ${val33 == '휴직' ? 'selected="selected"' : '' }>휴직</option>
													<option value="복직" ${val33 == '복직' ? 'selected="selected"' : '' }>복직</option>
													<option value="퇴사" ${val33 == '퇴사' ? 'selected="selected"' : '' }>퇴사</option>
											</select> <i></i>
											</label>
										</div>
									</div>
								</div>
							</div>
							<div>
								<div id="listNumLabel" class="dataTables_length">
									
								</div>
							</div>
						</div>
						<div class="table-responsive">
						
							<table id="mainTable"
								class="table table-striped table-bordered table-hover dataTable ">
								<thead class="table-head">
									<tr>
										<th class="sorting">발령일자</th>
										<th class="sorting">사원</th>
										<th>발령구분</th>
										<th>비고</th>
										<th></th>
									</tr>
								</thead>
								<tbody id="mlist">
									<%
										Map<String, List<Object>> map = (Map<String, List<Object>>) request.getAttribute("appointlist");
										AppointsDto appointDto = null;
										PersonnalDto personnalDto = null;
										EmployeesDto employeesDto = null;

										for (int i = 0; i < map.get("list1").size(); i++) {
											personnalDto = (PersonnalDto) map.get("list1").get(i);
											appointDto = (AppointsDto) map.get("list2").get(i);
											employeesDto = (EmployeesDto) map.get("list3").get(i);
											String date = personnalDto.getPersonnalDate();
											//String dateResult = date.substring(0, 10);
									%>
									<tr>
										<td width = "150"><%=date%></td>
										<td width = "300"><%=employeesDto.getEmpName()%>(사번:<%=personnalDto.getEmpId()%>)</td>
										<td width = "300"><%=appointDto.getAppointName()%></td>
									
										<td><%=personnalDto.getPersonnalUnusual()%></td>
										<td width = "150">
											<button type="button" id="test" name="test" onclick="appUpdate(<%=personnalDto.getPersonnalSeq()%>,'<%=date%>','<%=employeesDto.getEmpName()%>','<%=appointDto.getAppointName()%>','<%=personnalDto.getPersonnalUnusual()%>')" class="btn btn-info btn-xs">수정</button>
											<button type="button" id="del" name="del" onclick="appDel(<%=personnalDto.getPersonnalSeq()%>)" class="btn btn-danger  btn-xs">삭제</button>
										</td>
										
										<%
											}
										%>
									
									
									</tr>
								</tbody> 
							</table>
						</div> 
						<div class="dt-toolbar-footer">
                           <div class="col-sm-4">
                              <div id="dt_basic_info" class="dataTables_info">Total : 
                                 ${count}</div>
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
                                       href="${root}/appoint?act=mvlist&currentPage=${(numPageGroup-2)*pageGroupSize+1 }"><i class="fa fa-angle-left"></i></a>
                                    </li>
                                 </c:if>
                                 
                                 
                                 <c:forEach var="i" begin="${startPage}" end="${endPage}">
                                    <c:if test="${currentPage == i}">
                                       <li class="active"><a href="${root}/appoint?act=mvlist&currentPage=${i}">
                                             ${i}&nbsp; </a></li>
                                    </c:if>
                                    <c:if test="${currentPage != i}">
                                       <li class="inactive"><a
                                          href="${root}/appoint?act=mvlist&currentPage=${i}">
                                             ${i}&nbsp; </a></li>
                                    </c:if>
                                 </c:forEach>
                                 
                                 
                                 <c:if test="${numPageGroup < pageGroupCount}">
                                 <li class="next abled" data="2"><a
                                    href="${root}/appoint?act=mvlist&currentPage=${numPageGroup*pageGroupSize+1}"><i class="fa fa-angle-right"></i></a>
                                 </li>
                                 </c:if>
                              </ul>

                           </div>

				
							<div id="buttonSet" class="col-sm-4 text-right">
								<button type="button" id="" name="" onclick="appInsert()" class="btn btn-info btn-sm">등록</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</article>
	<!-- ***********************************Modal***************** *****************-->
	<!-- ***************** 삭제 모달 ***************** -->
		<div id="myModal" class="modal fade" role="dialog">
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
							onclick="javascript:appointDel();">확인</button>
						<button type="button" class="btn btn-danger"
							data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>

		<!-- *****************수정 모달 *****************-->
		<div id="upModal"
			class="modal fade" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">인사발령 수정</h4>
						
						<link rel="stylesheet"
						href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
					<!-- <script src="//code.jquery.com/jquery-1.10.2.js"></script> -->
					<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
					
						<script>
						$(function() {
					        $( "#calendar" ).datepicker({
					          dateFormat: 'y/mm/dd',
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
					</div>
					<div class="modal-body">
						<div>
							&nbsp;&nbsp;<font size="5">발령일자</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;<font size="5">사원</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;<font size="5">발령구분</font>
						</div>

						<div>
							&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name = "date1"
								id="calendar"
								size="11" />
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
							<input type="text" id=empname size="7" readonly="readonly"
								value="" />
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<!--<input type="text" id="personal" size=11" /-->
							<select id="searchName" name="searchName" style="width:80px; height:25px;">
								<option value="신입">신입</option>
								<option value="휴직">휴직</option>
								<option value="복직">복직</option>
								<option value="퇴사">퇴사</option>
							</select>
						</div>
						<br> <br>
						<div>
							&nbsp;&nbsp;&nbsp;&nbsp;<font size="5">비고</font>
						</div>
						<div>
							&nbsp;&nbsp;
							<textarea id="content" cols="60" rows="7" placeholder="내용입력">
							</textarea>
						</div>
						
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" onclick="javascript:appointUp();">확인</button>
						<button type="button" class="btn btn-danger"
							data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	
	<!-- ***************** 등록 모달 ***************** -->
	<div id="inModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">인사발령 등록</h4>

					<link rel="stylesheet"
						href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
					<!-- <script src="//code.jquery.com/jquery-1.10.2.js"></script> -->
					<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>

					<script>
					
					$(function() {
				        $( "#calendar1" ).datepicker({
				          dateFormat: 'y/mm/dd',
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
				</div>
				
			<form name ="joinform" method="post" action="">
			<input type="hidden" name="act" id="act" value="insert">
				<div class="modal-body">
					<div>
						&nbsp;&nbsp;<font size="5">발령일자</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;<font size="5">사원</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;<font size="5">발령구분</font>
					</div>

					<div>
						&nbsp;&nbsp; <input type="text" name = "calendar1"
							id="calendar1" size="11" />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<c:if test="${empId != null}">
								<input type="text" id="empId1" name="empname1" size="7" readonly="readonly" value="${empName}" />
							</c:if>
							<c:if test="${empId == null}">
								<select id="empname1" name="empname1" style="width:80px; height:25px;"> 
									<option>-----</option>
									<c:forEach var="empname" items="${empnames}">
										<option value="${empname}">${empname}</option>
									</c:forEach>
								</select>
							</c:if>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						
						<select id="searchName1" name="searchName1" style="width:80px; height:32px;">
							<option value="1">신입</option>
							<option value="2">휴직</option>
							<option value="3">복직</option>
							<option value="4">퇴사</option>
						</select>
					</div>
					<br> <br>
					<div>
						&nbsp;&nbsp;&nbsp;&nbsp;<font size="5">비고</font>
					</div>
					<div>
						&nbsp;&nbsp;
						<textarea id="content1" name = "content1" cols="60" rows="7" placeholder="내용입력">
						</textarea>
					</div>
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="javascript:appIn();">확인</button>
					<button type="button" class="btn btn-danger"
						data-dismiss="modal">Close</button>
				</div>
				</form>
			</div>

		</div>
	</div>
	<script src="${root}/js/bootstrap.min.js"></script>
</body>
</html>