<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import = "java.util.*, java.text.*, com.tie.commute.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
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

<link href='${root }/calendar/fullcalendar.css' rel='stylesheet' />
<link href='${root }/calendar/fullcalendar.print.css' rel='stylesheet' media='print' />
<script src='${root }/calendar/moment.min.js'></script>
<script src='${root }/calendar/jquery.min.js'></script>
<script src='${root }/calendar/fullcalendar.min.js'></script>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script>
<!--  ie10-viewport-bug-workaround.js -->
<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script>

<script type="text/javascript">

$(document).ready(function() {

	var date = new Date(); 
    var d = date.getDate(); 
    var m = date.getMonth(); 
    var y = date.getFullYear(); 
    var today = date.getHours() + ":" + date.getMinutes();

	$('#calendar').fullCalendar({

		businessHours: true, // display business hours

		defaultDate: date.format,
		editable: true,
		eventLimit: true, // allow "more" link when too many events
		
		events: [	
					<% 
					List<AttendanceDto> attendanceDtolist = (List<AttendanceDto>)request.getAttribute("attendanceDtolist");
					if( attendanceDtolist != null){
					for(AttendanceDto i: attendanceDtolist){
						%>
					{
		    			title  : '<%=i.getAttendGo()%>',
		   				start  : '<%=i.getAttendStart()%>',
		   				<%if(i.getAttendGo().equals("지각")){ %>
		   				color  : '#303650'
		   				<%}%>
					},
					{
						title  : '<%=i.getAttendLeave()%>',
		   				start  : '<%=i.getAttendEnd()%>',
		   				color  : '#ff0066'
					},
					<%}
					}%>
				]
		,
	        
	    monthNames: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
		monthNamesShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
		dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
		dayNamesShort: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
		buttonText: {
			prev: '이전',
		    next: '다음',
		    today: '오늘'
		},
		titleFormat: 'YYYY년 MM월'

	});

});

window.onload = function(){
	starttime();
}

var httpRequest = null;

function getXMLHttpRequest() {
   if (window.ActiveXObject) {
      try {
         return new ActiveXObject("Msxml2.XMLHTTP");
      } catch (e1) {
         try {
            return new ActiveXObject("Microsoft.XMLHTTP");
         } catch (e2) {
            return null;
         }
      }
   } else if (window.XMLHttpRequest) {
      return new XMLHttpRequest();
   } else {
      return null;
   }
}

function starttime() {
   httpRequest = getXMLHttpRequest();
   httpRequest.onreadystatechange = viewtime;
   httpRequest.open("POST", "${root}/calendar/currenttime.jsp", true); //get,post /url / true비동기
   httpRequest.send(null); //넘길 파라미터가 없어서 null
}

function viewtime() {
 	//1:로딩중, 2:로딩완료, 3:서버처리중
   if (httpRequest.readyState == 1 || httpRequest.readyState == 2   || httpRequest.readyState == 3) {
      document.getElementByID("ctime").innerHTML = "서버 문제 생김";
   } else if (httpRequest.readyState == 4) {//4:서버처리완료
      if (httpRequest.status == 200) {//403:접근거부, 404:파일/페이지 없음, 200:성공
         var time = httpRequest.responseText;
         document.getElementById("ctime").innerHTML = time;
         window.setTimeout("starttime();", 1000);
      }
   }
}
function currenttime(data) {
	//1:로딩중, 2:로딩완료, 3:서버처리중
   if (httpRequest.readyState == 1 || httpRequest.readyState == 2   || httpRequest.readyState == 3) {
      document.getElementByID("ctime").innerHTML = "서버 문제 생김";
   } else if (httpRequest.readyState == 4) {//4:서버처리완료
      if (httpRequest.status == 200) {//403:접근거부, 404:파일/페이지 없음, 200:성공
    	 var string = httpRequest.responseText;
         var time = string.substring(15, 23);
         var date = new Date(httpRequest.responseText)
         
         if("start" == data){
        	 if(date.getHours()<9){
        		 document.getElementById("startTime").innerHTML = time;
            	 commuteInsert(string, "출근", 1);
        	 }else if(date.getHours()>=9){
        		 document.getElementById("startTime").innerHTML = time;
            	 commuteInsert(string, "지각", 1);
        	 }
        	 
         }else if("end" == data){
        	 document.getElementById("endTime").innerHTML = time; 
        	 commuteInsert(string, "퇴근", 1);
         } 
      }
   }
}

function commuteInsert(date, status, empId) {
	$.ajax({
		type : "GET",
		url : "${root}/commute",
		data : {
			act : "commuteInsert",
			date : date,
			status: status
		},
		dataType : "json",
		success : function(data) {
			/* alert(data.empId);
			alert(data.date); */
			jsonForm(data.date, data.status)
		},
		error : function(e) {
			if(status == "출근" || status == "지각"){
				alert("이미 입력되셨습니다.");
			}else if(status == "퇴근"){
				alert("출근부터 입력하셔야합니다.");
			}
		}
	});
}

function jsonForm(date, status){
	var eventData = null;
	if(status == "출근"){
		eventData = {
				title : status,
				start : date
			};
	}else if(status == "퇴근"){
		eventData = {
				title : status,
				start : date,
				color : '#ff0066'
			};
	}else if(status == "지각"){
		eventData = {
				title : status,
				start : date,
				color : '#303650'
			};
	}
	
	$('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
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
</style>
</head>

<body>

	<article
		class="col-xs-12 col-sm-12 col-md-12 col-lg-5 sortable-grid ui-sortable">
	<div class="jarviswidget jarviswidget-color-blueDark"
		id="hr_menu_anniversary" data-widget-sortable="false"
		data-widget-editbutton="false" data-widget-colorbutton="false"
		data-widget-togglebutton="false" data-widget-deletebutton="false"
		role="widget">
		<header role="heading">
		<h2>
			<span class="widget-icon"> <i class="fa fa-calendar"></i></span> 출/퇴근
			관리
		</h2>
		</header>
		<div role="content">
			<div class="widget-body no-padding">
				<div id="giftListResult">
					<div class="dataTables_wrapper form-inline no-footer">
						<table id="mainTable"
							class="table table-striped table-bordered table-hover dataTable "
							style="table-layout: fixed;">

							<tr>
								<td colspan="2"><font size="5" color="pink"><div
											id="ctime"></div></font></td>
							</tr>
							<tr>
								<td><a class="btn btn-info  btn-xs" href="#"
									onclick="currenttime('start')">출근</a></td>
								<td><div id="startTime"></div></td>
							</tr>
							<tr>
								<td><a class="btn btn-danger  btn-xs" href="#"
									onclick="currenttime('end')">퇴근</a></td>
								<td><div id="endTime"></div></td>
							</tr>
						</table>
					</div>
					<div class="dt-toolbar-footer"></div>
				</div>
			</div>
		</div>
	</div>
	</article>

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

</body>
</html>
