<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import = "java.util.*, java.text.*, com.tie.schedule.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<link href="https://demo.assist9.com/res/images/favicon.png" rel="icon"
	type="image/x-icon">
<link rel="manifest" href="https://demo.assist9.com/manifest.json">

<!-- 풀캘린더 사용 -->
<link href='${root }/calendar/fullcalendar.css' rel='stylesheet' />
<link href='${root }/calendar/fullcalendar.print.css' rel='stylesheet' media='print' />
<script src='${root }/calendar/moment.min.js'></script>
<script src='${root }/calendar/jquery.min.js'></script>
<script src='${root }/calendar/fullcalendar.min.js'></script>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<!-- 달력 입력 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
				var date = new Date();
				var d = date.getDate();
				var m = date.getMonth();
				var y = date.getFullYear();
				var today = date.getHours() + ":" + date.getMinutes();

				$('#calendar').fullCalendar(
						{
							header : {
								left : 'prev,next today',
								center : 'title',
								right : 'month,agendaWeek,agendaDay'
							},

							businessHours : true,//평일, 주말 구분
							defaultDate : date.format,
							navLinks : true, // can click names to navigate viewsay/week 
							selectHelper : true,
							selectable : false,// month, week, day 일정 이동 x 
							editable : false,// 첫페이지 일정 이동 x
							eventLimit : true, // allow "more" link when too many events
							events : [
								<%
								List<ScheduleDto> scheduleDtoList = (List<ScheduleDto>)request.getAttribute("scheduleDtoList");
								
								for(int i=0; i<scheduleDtoList.size(); i++){
								%> {
								type: '<%=scheduleDtoList.get(i).getScheduleCk() %>',
								seq: '<%=scheduleDtoList.get(i).getScheduleSeq() %>',
								title: '<%=scheduleDtoList.get(i).getScheduleTitle() %>',
								start: '<%=scheduleDtoList.get(i).getScheduleStart() %>',
								end: '<%=scheduleDtoList.get(i).getScheduleEnd() %>',
								contents: '<%=scheduleDtoList.get(i).getScheduleContents() %>',
								empId: '<%=scheduleDtoList.get(i).getEmpId() %>',
								<% 
								if("1".equals(scheduleDtoList.get(i).getScheduleCk())){
								%>
								color: '#9999ff'
								<%}else{%>
								color: '#303650'
								<%}%>
							}<%if(i < scheduleDtoList.size()-1){ %>
							,
							<%}
								}
							%>
							],
							dayClick : function(date, jsEvent, view) {// 해당 요일 클릭
								$('#inModal').on('show.bs.modal',function(event) { // myModal 윈도우가 오픈할때 아래의 옵션을 적용
											var modal = $(this);
											//modal.find('#empId').val(1); // 모달위도우에서 .modal-title을 찾아 titleTxt 값을 치환
								})
								$('#inModal').modal();

							}, 
							eventClick : function(event, element) {//이벤트 클릭
								var title = event.title;
								var startUpDate = event.start.format('YYYY-MM-DD');
								var endUpDate = event.end.format('YYYY-MM-DD');
								var startUpTime = event.start.format('HH:mm');
								var endUpTime = event.end.format('HH:mm');
								var contents = event.contents;
								var type = event.type;
								var empId = event.empId;
								var seq = event.seq;

								$('#udModal').on('show.bs.modal',function(event) { // myModal 윈도우가 오픈할때 아래의 옵션을 적용
									var modal = $(this);
									modal.find('#title2').val(title); // 모달위도우에서 .modal-title을 찾아 titleTxt 값을 치환
									modal.find('#startDate2').val(startUpDate);
									modal.find('#endDate2').val(endUpDate);
									modal.find('#startTime2').val(startUpTime);
									modal.find('#endTime2').val(endUpTime);
									modal.find('#contents2').val(contents);
									modal.find('#type2').val(type);
									modal.find('#empId2').val(empId);
									modal.find('#seq').val(seq);
								})
								
								$('#udModal').modal();
								
								/* event.title = "CLICKED!";
								$('#calendar').fullCalendar('updateEvent',event); */

							},
							monthNames : [ '1', '2', '3', '4', '5', '6', '7',
									'8', '9', '10', '11', '12' ],
							monthNamesShort : [ '1', '2', '3', '4', '5', '6',
									'7', '8', '9', '10', '11', '12' ],
							dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일',
									'금요일', '토요일' ],
							dayNamesShort : [ '일요일', '월요일', '화요일', '수요일',
									'목요일', '금요일', '토요일' ],
							buttonText : {
								prev : '이전',
								next : '다음',
								today : '오늘'
							},
							titleFormat : 'YYYY년 MM월'
						});

			});

	function scheduleInsert() {
		if(document.getElementById("type").value == "") {
			alert("타입 선택!");
			document.getElementById("type").value = "";
			document.getElementById("title").value = "";
			document.getElementById("startDate").value = "";
			document.getElementById("startTime").value = "";
			document.getElementById("endDate").value = "";
			document.getElementById("endTime").value = "";
			document.getElementById("contents").value = "";
			document.getElementById("empId").value = "";
			return;
		}else if(document.getElementById("title").value == "") {
			alert("제목 입력!");
			document.getElementById("type").value = "";
			document.getElementById("title").value = "";
			document.getElementById("startDate").value = "";
			document.getElementById("startTime").value = "";
			document.getElementById("endDate").value = "";
			document.getElementById("endTime").value = "";
			document.getElementById("contents").value = "";
			document.getElementById("empId").value = "";
			return;
		} else if(document.getElementById("startDate").value == "" || document.getElementById("startDate").value.length != 10) {
			alert("시작날짜 입력!");
			document.getElementById("type").value = "";
			document.getElementById("title").value = "";
			document.getElementById("startDate").value = "";
			document.getElementById("startTime").value = "";
			document.getElementById("endDate").value = "";
			document.getElementById("endTime").value = "";
			document.getElementById("contents").value = "";
			document.getElementById("empId").value = "";
			return;
		} else if(document.getElementById("startTime").value  == "" || document.getElementById("startTime").value.length != 5) {
			alert("시작시간 입력!");
			document.getElementById("type").value = "";
			document.getElementById("title").value = "";
			document.getElementById("startDate").value = "";
			document.getElementById("startTime").value = "";
			document.getElementById("endDate").value = "";
			document.getElementById("endTime").value = "";
			document.getElementById("contents").value = "";
			document.getElementById("empId").value = "";
			return;
		} else if(document.getElementById("endDate").value == "" || document.getElementById("endDate").value.length != 10) {
			alert("끝난날짜 입력!");
			document.getElementById("type").value = "";
			document.getElementById("title").value = "";
			document.getElementById("startDate").value = "";
			document.getElementById("startTime").value = "";
			document.getElementById("endDate").value = "";
			document.getElementById("endTime").value = "";
			document.getElementById("contents").value = "";
			document.getElementById("empId").value = "";
			return;
		} else if(document.getElementById("endTime").value == "" || document.getElementById("endTime").value.length != 5) {
			alert("끝난시간 입력!");
			document.getElementById("type").value = "";
			document.getElementById("title").value = "";
			document.getElementById("startDate").value = "";
			document.getElementById("startTime").value = "";
			document.getElementById("endDate").value = "";
			document.getElementById("endTime").value = "";
			document.getElementById("contents").value = "";
			document.getElementById("empId").value = "";
			return;
		}else if(document.getElementById("contents").value == "") {
			alert("자세한 내용 입력!");
			document.getElementById("type").value = "";
			document.getElementById("title").value = "";
			document.getElementById("startDate").value = "";
			document.getElementById("startTime").value = "";
			document.getElementById("endDate").value = "";
			document.getElementById("endTime").value = "";
			document.getElementById("contents").value = "";
			document.getElementById("empId").value = "";
			return;
		}else {
		$.ajax({
			type : "GET",
			url : "${root}/schedule",
			data : {
				act : "scheduleInsert",
				type : $('#type').val(),
				title : $('#title').val(),
				startDate : $('#startDate').val(),
				startTime : $('#startTime').val(),
				endDate : $('#endDate').val(), 
				endTime : $('#endTime').val(), 
				contents : $('#contents').val()
			},
			dataType : "json",
			success : function(data) {
				jsonInForm(data.seq, data.type, data.title, data.startDate, data.endDate, data.contents, data.empId);
				document.getElementById("type").value = "";
				document.getElementById("title").value = "";
				document.getElementById("startDate").value = "";
				document.getElementById("startTime").value = "";
				document.getElementById("endDate").value = "";
				document.getElementById("endTime").value = "";
				document.getElementById("contents").value = "";
				document.getElementById("empId").value = "";
			},
			error : function(e) {
			}
		});
		}
	}

	function jsonInForm(seq, type, title, startDate, endDate, contents, empId){
	 var eventData = null;
	 if(type == 0){
		 eventData = {
	 	type: type,
	 	seq: seq,
	 	title: title,
	 	start: startDate,
	 	end: endDate,
	 	contents: contents,
	 	empId: empId,
	 	color: '#303650'
	 	};
	 }else if(type == 1){
		 eventData = {
			 type: type,
			 seq: seq,
			 title: title,
			 start: startDate,
			 end: endDate,
			 contents: contents,
			 empId: empId,
			 color: '#9999ff'
	 };
	 }
	
	 $('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
	 } 
	
	function scheduleDelete() {
		$.ajax({
			type : "GET",
			url : "${root}/schedule",
			data : {
				act : "scheduleDelete",
				seq : $('#seq').val(),
				empId : $('#empId2').val() 
			},
			dataType : "json",
			success : function(data) {
				jsonDeForm(data.seq, data.empId);
			},
			error : function(e) {
			}
		});
	}

	function jsonDeForm(seq, empId) {
		$('#calendar').fullCalendar('removeEvents',function (event) {
			if(event.seq == seq && event.empId == empId){
				return seq;
			}
        });
	}
	
	function scheduleUpdate() {
		$.ajax({
			type : "GET",
			url : "${root}/schedule",
			data : {
				act : "update",
				seq : $('#seq').val(),
				type : $('#type2').val(),
				title : $('#title2').val(),
				startDate : $('#startDate2').val(),
				startTime : $('#startTime2').val(),
				endDate : $('#endDate2').val(), 
				endTime : $('#endTime2').val(), 
				contents : $('#contents2').val(), 
				empId : $('#empId2').val()
			},
			dataType : "json",
			success : function(data) {
				jsonUpForm(data.seq, data.type, data.title, data.startDate, data.endDate,data.contents, data.empId);
			},
			error : function(e) {
			}
		});
	}
	
	function jsonUpForm(seq, type, title, start, end, contents, empId) {
		var item = $("#calendar").fullCalendar('clientEvents' ,function (event) {
			if(event.seq == seq && event.empId == empId){
				return true;
			}
		});
		item = item[0];

		item.title = title;
		item.start = start;
		item.end = end;
		item.contents = contents;
		item.type = type;
		if('1' == type){
			item.color = '#9999ff';
		}else{
			item.color = '#303650';
		}
		
		$('#calendar').fullCalendar('updateEvent',item);
	}
</script>

<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 1200px;
	margin: 0 auto;
}

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

ul, li { list-style: none; }

.demo-3 i {
  position: absolute;
  right: 30px;
  bottom: 10px;
}

.container { margin: 150px auto; }
</style>
</head>

<body>
	<article
		class="col-xs-12 col-sm-12 col-md-12 col-lg-7 sortable-grid ui-sortable">
	<div class="jarviswidget jarviswidget-color-blueDark"
		id="hr_menu_anniversary" data-widget-sortable="false"
		data-widget-editbutton="false" data-widget-colorbutton="false"
		data-widget-togglebutton="false" data-widget-deletebutton="false"
		role="widget">

		<header role="heading">
		<h2>
		<span class="widget-icon"> <i class="fa fa-calendar"></i></span>
		</h2>
		<span class="jarviswidget-loader"> <i
			class="fa fa-refresh fa-spin"></i>
		</span> 
		</header>
		<div id='calendar'></div>
	</div>
	</article>

 	<div class="modal fade" id="inModal" role="dialog">
		<div class="modal-dialog">

			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title">일정 등록</h4>
				</div>
				<div class="modal-body" style="max-height: 512px; overflow: auto;">
					<div class="widget-body">
						<form id="scheduleIn" name="scheduleIn" class="smart-form" action="" method="post">
							<input id="empId" name="empId" type="hidden" value="">
							<fieldset>
								<section> <label class="label">제목</label> <label
									class="input"> <i class="icon-prepend fa fa-building"></i>
									<input id="title" name="title" type="text" value="">
								</label> </section>
								<div class="row">
								<section class="col col-4"> <label class="label">구분</label>
									<label class="select"> <select id="type" name="type" value="">
											<option selected="selected">선택</option>
											<option value="1">전체</option>
											<option value="0">개인</option>
									</select> <i></i>
								</label> </section>		
								<section class="col col-4"> <label class="label">시작 날짜</label>
									<label class="input"> 
										<i class="icon-prepend fa fa-calendar"></i> 
										<input type='text' id="startDate" class="form-control">
									</label> 
								</section>
								<section class="col col-4">
								<label class="label">시작 시간</label>
									<label class="input">
										<i class="icon-prepend fa fa-clock-o"></i> 
										<input id="startTime" name="startTime" type="text" placeholder="ex) 15:20" class="hasDatepicker">
									</label> 
								</section>
								
								</div>
								<div class="row">
									<section class="col col-4"> </section>
									<section class="col col-4"> 
										<label class="label">종료 날짜</label>
										<label class="input"> 
										<i class="icon-prepend fa fa-calendar"></i> 
										<input type='text' id="endDate" class="form-control">
										</label> 
									</section>
									<section class="col col-4"> <label class="label">종료 시간</label>
									<label class="input"> 
										<i class="icon-prepend fa fa-clock-o"></i> 
										<input type='text' id="endTime"  placeholder="ex) 15:20" class="form-control">
									</label> </section>

								</div>
								<section> <label class="label">비고</label> 
								<label class="textarea">
									<i class="icon-append fa fa-comment"></i>
									<textarea id="contents" name="contents" rows="5" value=""></textarea>
								</label> </section>
							</fieldset>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<a class="btn btn-info btn-sm" onclick="scheduleInsert()" data-dismiss="modal">저장</a> 
					<a class="btn btn-danger btn-sm" data-dismiss="modal">닫기</a>
				</div>
			</div>

		</div>
	</div>
	
	<div class="modal fade" id="udModal" role="dialog">
		<div class="modal-dialog">

			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title">일정 수정</h4>
				</div>
				<div class="modal-body" style="max-height: 512px; overflow: auto;">
					<div class="widget-body">
						<form id="scheduleUp" name="scheduleUp" class="smart-form" action="" method="post">
							<input id="seq" name="seq" type="hidden" value="">
							<input id="empId2" name="empId2" type="hidden" value="">
							<fieldset>
								<section> 
								<label class="label">제목</label> 
								<label class="input"> <i class="icon-prepend fa fa-building"></i>
									<input id="title2" name="title2" type="text" value="">
								</label> </section>
								<div class="row">
								<section class="col col-4"> <label class="label">구분</label>
									<label class="select"> 
									<select id="type2" name="type2">
											<option value="1">전체</option>
											<option value="0">개인</option>
									</select> <i></i>
									</label> 
								</section>		
								
								<section class="col col-4"> <label class="label">시작 날짜</label>
									<label class="input"> 
										<i class="icon-prepend fa fa-calendar"></i> 
										<input type='text' id="startDate2" name="startDate2" value="" class="form-control">
									</label> 
								</section>
								<section class="col col-4">
								<label class="label">시작 시간</label>
									<label class="input">
										<i class="icon-prepend fa fa-clock-o"></i> 
										<input id="startTime2" name="startTime2" type="text" value="" class="hasDatepicker">
									</label> 
								</section>
								
								</div>
								<div class="row">
									<section class="col col-4"> </section>
									<section class="col col-4"> 
										<label class="label">종료 날짜</label>
										<label class="input"> 
										<i class="icon-prepend fa fa-calendar"></i> 
										<input type='text' id="endDate2" name="endDate2" value="" class="form-control">
										</label> 
									</section>
									<section class="col col-4"> <label class="label">종료 시간</label>
									<label class="input"> 
										<i class="icon-prepend fa fa-clock-o"></i> 
										<input id="endTime2" name="endTime2" type="text" value="" class="hasDatepicker">
									</label> </section>

								</div>
								<section> <label class="label">비고</label> 
								<label class="textarea">
									<i class="icon-append fa fa-comment"></i>
									<textarea id="contents2" name="contents2" rows="5"></textarea>
								</label> </section>
							</fieldset>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<a class="btn btn-info btn-sm" onclick="scheduleUpdate()" data-dismiss="modal">수정</a> 
					<a class="btn btn-info btn-sm" onclick="scheduleDelete()" data-dismiss="modal">삭제</a>
					
					<a class="btn btn-danger btn-sm" data-dismiss="modal">닫기</a>
				</div>
			</div>

		</div>
	</div>

<script type="text/javascript">
$(function() {
    $( "#startDate" ).datepicker({
      dateFormat: 'yy-mm-dd',
      prevText: '<',
      nextText: '>',
      monthNames: ['1','2','3','4','5','6','7','8','9','10','11','12'],
      monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
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
         prevText: 'pre',
         nextText: '>',
         monthNames: ['1','2','3','4','5','6','7','8','9','10','11','12'],
         monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
         dayNames: ['일','월','화','수','목','금','토'],
         dayNamesShort: ['일','월','화','수','목','금','토'],
         dayNamesMin: ['일','월','화','수','목','금','토'],
         showMonthAfterYear: true,
         changeMonth: true,
         changeYear: true,
       });
     });
  
  $(function() {
	    $( "#startDate2" ).datepicker({
	      dateFormat: 'yy-mm-dd',
	      prevText: '<',
	      nextText: '>',
	      monthNames: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	      monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	      dayNames: ['일','월','화','수','목','금','토'],
	      dayNamesShort: ['일','월','화','수','목','금','토'],
	      dayNamesMin: ['일','월','화','수','목','금','토'],
	      showMonthAfterYear: true,
	      changeMonth: true,
	      changeYear: true,
	    });
	  });
	  
	  $(function() {
	       $( "#endDate2" ).datepicker({
	         dateFormat: 'yy-mm-dd',
	         prevText: '<',
	         nextText: '>',
	         monthNames: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	         monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	         dayNames: ['일','월','화','수','목','금','토'],
	         dayNamesShort: ['일','월','화','수','목','금','토'],
	         dayNamesMin: ['일','월','화','수','목','금','토'],
	         showMonthAfterYear: true,
	         changeMonth: true,
	         changeYear: true,
	       });
	     });


</script>
</body>
</html>
