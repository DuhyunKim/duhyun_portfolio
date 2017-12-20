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
<title>기안서 작성</title>
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
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<!-- 달력 입력 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>

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
<script type="text/javascript">

function personSearch(){
	$('#personSearch').on('show.bs.modal',function(event) { // myModal 윈도우가 오픈할때 아래의 옵션을 적용
		var modal = $(this);
		modal.find('#key').val("이름");
		modal.find('#word').val("");
		removeData();
	})

	$('#personSearch').modal();
}

function person(empname, jobname, empid){
	$('#personSearch').modal('hide');
	row = document.getElementById("person");
	if(row.children.length >= 3){
		alert("더 이상 추가할 수 없습니다.");
	}else{
		var cell = document.createElement("td");
		cell.innerHTML = "<b><font size=\"2\"><input type='hidden' id='personId' name='personId' value='"+empid+"' />순서: "+(row.children.length+1)+" 직급: "+jobname+" 이름: "+empname+"</font></b>";
		row.appendChild(cell);
	}
}

function register() {
	document.documentRegister.action = "${root}/document?act=documentInsert";
	document.documentRegister.submit();
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
table.type11 {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: center;
    line-height: 1.5;
}
table.type11 th {
    width: 60px;
    font-weight: bold;
    vertical-align: top;
    color: #fff;
    background: #ce4869 ;
}
table.type11 td {
    width: auto;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #eee;
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
			<span class="widget-icon"> <i class="fa fa-table"></i>
			</span> 기안서 작성
		</h2>
		<span class="jarviswidget-loader"> <i
			class="fa fa-refresh fa-spin"></i>
		</span> </header>
		<div role="content">
			<div class="widget-body">
				<form id="documentRegister"  name="documentRegister" class="smart-form" method="post" action="" novalidate="novalidate">
					<table class="table table-bordered" style="margin-bottom: 10px;">
							<tbody>
								<tr>
									<th width="20%" nowrap="nowrap" style="background-color: #eee;">기안일</th>
									<td width="30%">
									<label class="input"> 
									<i class="icon-prepend fa fa-calendar"></i> 
									<input type='text' id="documentDate" name="documentDate" class="form-control" value="">
									</label>
									</td>
									<th width="20%" nowrap="nowrap" style="background-color: #eee;">기안자</th>
									<td>${userInfo.empName}</td>
								</tr>
								<tr>
									<th width="20%" nowrap="nowrap" style="background-color: #eee;" >문서종류</th>
									<td width="30%" colspan="3">
									<div class="dt_filter" style="width: 200px;">
											<div class="smart-form">
												<label class="select"><select id="docTypeId" name="docTypeId">
														<option selected="selected">문서종류</option>
														<option value="1">제안서</option>
														<option value="2">신청서</option>
														<option value="3">작업서</option>
												</select><i></i></label>
											</div>
										</div>
									</td> 
								</tr>
								<tr>
									<th nowrap="nowrap" style="background-color: #eee;">결재라인
									 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									 
									<a href="#" onclick="personSearch()"><i class="glyphicon glyphicon-plus"></i></a>
									<a href="#" onclick="delete_row2()"><i class="glyphicon glyphicon-minus"></i></a>
									</th>
									<td colspan="3">
										<table class="type11">
											<tbody>
												<tr id="person">
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<th nowrap="nowrap" style="background-color: #eee;">제목</th>
									<td colspan="3"><label class="input"> <input
											id="docName" name="docName" type="text" value="">
									</label></td>
								</tr>
								<!-- <tr>
									<th nowrap="nowrap" style="background-color: #eee;">첨부파일</th>
									<td colspan="3"><label for="file" class="input input-file">
											<div class="button">
												<input type="file" id="uploadFile" name="uploadFile"
													onchange="link.fileInputChange(this)">Browse
											</div> <input type="text" readonly="readonly">
									</label></td>
								</tr> -->
							</tbody>
						</table>
					<label class="textarea"> 
					<textarea name="docContent" id="docContent" rows="5"></textarea>
					</label> 
					
					<br>
					
					<footer style="background-color:#fff;"> 
					<button type="submit" class="btn btn-info btn-sm" onclick="register()">승인요청</button>
					</footer>
				</form>
			</div>
			<div id="buttonSet" class="col-sm-4 text-right">
				<jsp:include page="personsearch.jsp" flush="false"/>
			</div>
		</div>
	</div>
	</article>
	
<script type="text/javascript">
$(function() {
    $( "#documentDate" ).datepicker({
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