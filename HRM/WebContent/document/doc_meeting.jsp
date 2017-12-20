<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.Date"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="root" value="${pageContext.request.contextPath}"></c:set> 	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>회의록</title>

<!-- Bootstrap Core CSS -->
<link href="${root}/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="${root}/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

</head>

<body style="backgoundcolor:white;">
	<div id="wrapper">
		<div id="page-wrapper">
		<form name="meetingform" method="post" action="">
			<input type="hidden" id="act" value="meetingform">
			<table class="table table-bordered" width="800" height="800" cellspacing="5">
				<tbody>
					<tr>
						<td>기안일</td>
						<c:set var="date" value="<%=new Date() %>" />
						<td><fmt:formatDate value="${date}" pattern="yyyy-MM-dd" /></td>
						<td>기안자</td>
						<td>승진해</td>
					</tr>
					<tr>
						<td>결재라인</td>
						<td colspan="3">dd</td>
					</tr>
					<tr>
						<td>수신부서</td>
						<td colspan="3"><input type="text" class="form-control" id="dept"></td>
					</tr>
					<tr>
						<td>제목</td>
						<td colspan="3"><input type="text" class="form-control" id="title"></td>
					</tr>
					<tr>
						<td>회의 안건</td>
						<td colspan="3"><input type="text" class="form-control" id="meetingitem"></td>
					</tr>
					<tr>
						<td>회의일자</td>
						<td colspan="3"><input type="text" class="form-control" id="meetingdate"></td>
					</tr>
					<tr>
						<td>회의장소</td>
						<td colspan="3"><input type="text" class="form-control" id="meetingplace"></td>
					</tr>
					<tr>
						<td>참석자</td>
						<td colspan="3"><input type="text" class="form-control" id="attendant"></td>
					</tr>
					<tr>
						<td>회의내용</td>
						<td colspan="3">
						<textarea class="form-control" id="meetingcontent"></textarea></td>
					</tr>
					<tr>
						<td>회의결과</td>
						<td colspan="3">
						<textarea class="form-control" id="meetingresult"></textarea></td>
					</tr>					
				</tbody>
			</table>
			<input type="submit" value="제출" ><input type="button" value="취소" >
		</form>
		</div>
	</div>



	<!-- jQuery -->
	<script src="${root}/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="${root}/js/bootstrap.min.js"></script>

</body>
</html>