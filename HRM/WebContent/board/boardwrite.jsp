<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <%@ include file="/common/session_common.jsp" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set> 
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd hh:mm:ss" var="currentTime" />     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function() {
    $('#summernote').summernote();
});

function boardwrite(){
	if(document.getElementById("title").value == ""){
		alert("제목을 입력하세요.");
		return;
	}else{
		document.writeform.action = "${root}/pictureup?act=boardwrite";
		document.writeform.submit();	
	}
}
	/* else if($('#summernote').summernote('code') == ""){
		alert("내용을 입력하세요.");
		return;
	} */
</script>
</head>
<body>
<div class="modal modal-center fade" id="WriteModal" tabindex="-1" role="dialog" aria-labelledby="myFullsizeModalLabel" aria-hidden="true" >
	<div class="modal-dialog modal-80size modal-center" role="document">
		<div class="modal-content modal-80size">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title" id="myModalLabel">자유게시판 등록</h4>
			</div>
			<div class="modal-body">
				<form name="writeform" method="post" action="" class="smart-form" enctype="multipart/form-data">
				<table class="table table-bordered" style="margin-bottom: 10px;">
				<tbody>
				<tr>
					<th width="100" nowrap="nowrap" style="background-color: #eee;">작성자</th><td width="30%">${userInfo.empName}</td>
					<th width="100" nowrap="nowrap" style="background-color: #eee;">작성일</th><td width="30%">${currentTime}</td>
				</tr>
				<tr>	
					<th nowrap="nowrap" style="background-color: #eee;">제목</th>
					<td colspan="3">
						<label class="input">
							<input type="text" name="title" id="title">
						</label>	
					</td>
				</tr>
				<tr>
					<td colspan="4">
						 <textarea id="summernote"  name="content"  align="left"></textarea> 
					</td>
				</tr>
				<tr>
					<th nowrap="nowrap" style="background-color: #eee;">첨부파일</th>
					<td colspan="3">
							<input type="file" name="picture" id="picture">
					</td>
				</tr>
				</tbody>
				</table>
				
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="javascript:boardwrite()">확인</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>