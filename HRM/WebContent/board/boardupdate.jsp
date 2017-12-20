<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ include file="/common/session_common.jsp" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script> -->
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function() {
    $('#summernote2').summernote();
});

function makeUpdateModal(data){	
	$('#title2').val(data.boardInfo[0].bbsTitle);
	$('#summernote2').summernote('code', data.boardInfo[0].bbsContent);	
	$('#bbsEname').html(data.boardInfo[0].bbsEname);
	$('#bbsDate').html(data.boardInfo[0].bbsDate);
	var output = "";
	if(data.boardInfo[0].boardFileName != null){
		output = "<input type=\"file\" name=\"picture\" id=\"picture\">&nbsp;&nbsp;";
		output += "<a href=\"javascript:downloadFile("+data.boardInfo[0].bbsSeq+");\">";
		output += data.boardInfo[0].boardFileName+"</a>";
	}else{
		output = "<input type=\"file\" name=\"picture\" id=\"picture\">";
	}
	$('#isBoardFile').html(output);
	$('#bbsSeq2').val(data.boardInfo[0].bbsSeq);
}

function boardupdate(){
	if(document.getElementById("title2").value == ""){
		alert("제목을 입력하세요.");
		return;
	}/* else if($('#summernote2').summernote('code') == ""){
		alert("내용을 입력하세요.");
		return;
	} */else{
		document.updateform.action = "${root}/pictureup?act=boardupdate";
		document.updateform.submit();	
	}
}

function downloadFile(bbsSeq){
	document.location.href = "${root}/pboard?act=downfile&bbsSeq="+bbsSeq;
}
</script>
</head>
<body>
<div class="modal modal-center fade" id="UpdateModal" tabindex="-1" role="dialog" aria-labelledby="myFullsizeModalLabel" aria-hidden="true" >
	<div class="modal-dialog modal-80size modal-center" role="document">
		<div class="modal-content modal-80size">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title" id="myModalLabel">자유게시판 수정</h4>
			</div>
			<div class="modal-body">
				<form name ="updateform" method="post" action="" class="smart-form" enctype="multipart/form-data">
				<%-- <input type="hidden" name="bbsSeq" id="bbsSeq" value="${boardInfo.bbsSeq}"> --%>
				<input type="hidden" name="bbsSeq" id="bbsSeq2" value="">
				<table class="table table-bordered" style="margin-bottom: 10px;">
				<tbody>
				<tr>
					<%-- <th width="100" nowrap="nowrap" style="background-color: #eee;">작성자</th><td width="30%">${boardInfo.bbsEname}</td>
					<th width="100" nowrap="nowrap" style="background-color: #eee;">작성일</th><td width="30%">${boardInfo.bbsDate}</td> --%>
					<th width="100" nowrap="nowrap" style="background-color: #eee;">작성자</th><td width="30%"><div id="bbsEname"></div></td>
					<th width="100" nowrap="nowrap" style="background-color: #eee;">작성일</th><td width="30%"><div id="bbsDate"></div></td>
				</tr>
				<tr>	
					<th nowrap="nowrap" style="background-color: #eee;">제목</th>
					<td colspan="3">
						<label class="input">
							<%-- <input type="text" name="title" id="title" value="${boardInfo.bbsTitle}"> --%>
							<input type="text" name="title" id="title2" value="">
						</label>
					</td>			
				</tr>
				<tr>
					<td colspan="4">
						<%-- <textarea name="content" id="content" class="form-control" rows="15">${boardInfo.bbsContent}</textarea> --%>
						<textarea id="summernote2"  name="content"  align="left"></textarea>
					</td>
				</tr>
				<tr>
					<th nowrap="nowrap" style="background-color: #eee;">첨부파일</th>
					<td colspan="3">
						<div id="isBoardFile"></div>
					</td>
				</tr>
				<%-- <c:if test="${boardFileInfo != null}">
							<input type="file" name="picture" id="picture">&nbsp;&nbsp;
							<a href="javascript:downloadFile('${boardFileInfo.boardFileName}');">
								${boardFileInfo.boardFileName}
							</a>
						</td>
				</c:if> --%>
				<%-- <c:if test="${boardFileInfo == null}">
					<tr>
						<th nowrap="nowrap" style="background-color: #eee;">첨부파일</th>
						<td colspan="3">
							<input type="file" name="picture" id="picture">
						</td>
					</tr>
				</c:if> --%>
				</tbody>
				</table>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="javascript:boardupdate()">확인</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>