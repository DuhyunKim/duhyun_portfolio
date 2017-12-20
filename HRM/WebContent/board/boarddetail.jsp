<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ include file="/common/session_common.jsp" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>자유게시판 등록</title>
<script type="text/javascript">

function makeDetailModal(data){
	var output = "<tr><th width=\"100\" nowrap=\"nowrap\" style=\"background-color: #eee;\">작성자</th>";
	output += "<td align=\"left\" width=\"150\">"+data.boardInfo[0].bbsEname+"</td>";
	output += "<th width=\"100\" nowrap=\"nowrap\" style=\"background-color: #eee;\">작성일</th>";
	output += "<td width=\"30%\">"+data.boardInfo[0].bbsDate+"</td></tr>";
	output += "<tr><th nowrap=\"nowrap\" style=\"background-color: #eee;\">제목</th>";
	output += "<td colspan=\"3\">"+data.boardInfo[0].bbsTitle+"</td></tr>";
	output += "<tr><td colspan=\"4\" height=\"350\">"+data.boardInfo[0].bbsContent+"</td></tr>";
	if(data.boardInfo[0].boardFileName != null){
		output += "<tr><th nowrap=\"nowrap\" style=\"background-color: #eee;\">첨부파일</th>";
		output += "<td colspan=\"3\">"+data.boardInfo[0].boardFileName+"&nbsp;";
		output += "<a class=\"btn btn-default btn-xs\" title=\"다운로드\" ";
		output += "href=\"javascript:downloadFile("+data.boardInfo[0].bbsSeq+");\">";
		output += "<b>다운로드</b></a></td></tr>";
	}
	$('#boarddetail').html(output);
	$('#bbsSeq').val(data.boardInfo[0].bbsSeq);
	
	$("#commentResult").empty();
	if(data.boardcomments.length > 0){
		makeReply(data);
	}
}

function addreboard(){
	$.ajax({
	    type: "POST",
	    dataType: 'json',
	    url: "${root}/pboard",
	    data: { act: "reboardwrite", bbsSeq: $("#bbsSeq").val(), content: $("#textarea_addComment").val() },
	    success:function(data) {
	    	$("#textarea_addComment").val("");
	    	makeReply(data);
	    },
	    error: function(e) {
	    	alert("에러!!");
	    }
    });
}

function makeReply(data){
	$("#commentResult").empty();
	var len = data.boardcomments.length;
	var	output = "<div class=\"chat-body no-padding profile-message\">";
	output += "<ul id=\"commont-list-ul\" style=\"margin: 3px; padding-bottom: 15px;\">";
	for(var i=0;i<len;i++){
		var comment = data.boardcomments[i];
		var commentNum= comment.commentNum;
		var empName = comment.empName;
		var commentDate = comment.commentDate;
		var commentContent = comment.commentContent;
		var empImage = comment.empImage;
		var empImageFolder = comment.empImageFolder;
		
		output += "<li class=\"chat-message\" id=\"chat-message_"+commentNum+"\">"; 
		//output += "<img src=\"http://192.168.12.42:8081/HRM/upload/noimages.jpg\" width=\"53\">";
		if(empImage == "noimages.jpg"){
			//output += "<img src=\"http://192.168.12.42/HRM/upload/"+empImage+"\" width=\"53\">";
			output += "<img src=\"${root}/upload/"+empImage+"\" width=\"53\">";
		}else{
			//output += "<img src=\"http://192.168.12.42/HRM/upload/"+empImageFolder+empImage+"\" width=\"53\">";			
			output += "<img src=\"${root}/upload/"+empImageFolder+empImage+"\" width=\"53\">";			
		}
		output += "<div class=\"message-head\">"; 
		output += "<a class=\"username\">"+empName+"</a>"; 
		output += "<time>"+commentDate+"</time>"; 
		output += "</div><div class=\"message-body\">";
		output += "<div class=\"message-body-content\">"; 
		output += commentContent+"</div>";
		output += "<div class=\"message-body-button\">";
		output += "<span id=\"editComment_"+commentNum+"\" class=\"fa fa-edit text-primary\""; 
		output += " style=\"top: 21px;right: 14px;\" data-container=\"body\" data-original-title=\"\" title=\"\" onclick=\"javascript:commentUpdateForm("+commentNum+");\" ></span>";
		output += "<span id=\"removeComment_"+commentNum+"\" class=\"fa fa-times text-danger\" data-container=\"body\""; 
		output += " data-original-title=\"\" title=\"\" onclick=\"javascript:commentDelete("+commentNum+");\"></span></div>";
		output += "<label class=\"textarea\" style=\"display:none;\">";
		output += "<a id=\"updateComment_"+commentNum+"\" class=\"icon-append\""; 
		output += "onclick=\"javascript:commentUpdate("+commentNum+");\" style=\"border-left-style: none;right:30px;\" data-container=\"body\" data-original-title=\"\" title=\"\"><i class=\"fa fa-save\"></i></a>";
		output += "<a id=\"cancelComment_"+commentNum+"\" class=\"icon-append\""; 
		output += "onclick=\"javascript:commentUpdateCancel("+commentNum+");\" style=\"border-left-style: none;\" data-container=\"body\" data-original-title=\"\" title=\"\">";
		output += "<i class=\"fa fa-times\"></i></a>";
		output += "<textarea name=\"textarea_"+commentNum+"\" id=\"textarea_"+commentNum+"\" placeholder=\"댓글을 입력하세요...\""; 
		output += " style=\"padding-right: 75px; padding-top: 8px; height: 36px;\">"+commentContent.replace(/<br>/g, "\n")+"</textarea></label>";
		output += "</div>"; 
		output += "</li>"; 
	}
	output += "</ul>"; 
	output += "</div>"; 
	
	$("#commentResult").html(output);
	if(len == 0)
		$("#commentResult").empty();
}

function commentUpdateForm(commentSeq){
	$('#chat-message_'+commentSeq+' .message-body-content').css("display", "none");
	$('#chat-message_'+commentSeq+' .message-body-button').css("display", "none");
	$('#chat-message_'+commentSeq+' .textarea').show();
	
}

function commentDelete(commentSeq){
	//document.location.href = "${root}/pboard?act=reboarddelete&commentSeq="+commentSeq;
	$.ajax({
	    type: "POST",
	    dataType: 'json',
	    url: "${root}/pboard",
	    data: { act: "reboarddelete", commentSeq : commentSeq, bbsSeq: $("#bbsSeq").val()},
	    success:function(data) {
	    	makeReply(data);
	    },
	    error: function(e) {
	    	alert("에러!!");
	    }
    });
}

function commentUpdateCancel(commentSeq){
	$('#chat-message_'+commentSeq+' .message-body-content').show();
	$('#chat-message_'+commentSeq+' .message-body-button').show();
	$('#chat-message_'+commentSeq+' .textarea').css("display", "none");
}

function commentUpdate(commentSeq){
	if(document.getElementById("textarea_"+commentSeq).value == ""){
		alert("댓글을 입력하세요.");
		return;
	}else{
		$.ajax({
		    type: "POST",
		    dataType: 'json',
		    url: "${root}/pboard",
		    data: { act: "reboardupdate", commentSeq : commentSeq, content: $("#textarea_"+commentSeq+"").val(), bbsSeq: $("#bbsSeq").val()},
		    success:function(data) {
		    	makeReply(data);
		    },
		    error: function(e) {
		    	alert("에러!!");
		    }
	    });
	}
}

function downloadFile(bbsSeq){
	//document.location.href = "${root}/pboard?act=downfile&filename="+filename+"&location=${boardFileInfo.boardFileLocation}";
	document.location.href = "${root}/pboard?act=downfile&bbsSeq="+bbsSeq;
}
</script>
</head>
<body onload="javascript:boardreply();">
<div class="modal modal-center fade" id="DetailModal" tabindex="-1" role="dialog" aria-labelledby="myFullsizeModalLabel" aria-hidden="true" >
	<div class="modal-dialog modal-80size modal-center" role="document">
		<div class="modal-content modal-80size">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title" id="myModalLabel">자유게시판</h4>
			</div>
			<div class="modal-body">
				<form name="detailform" method="post" action="" class="smart-form">
				<input type="hidden" name="bbsSeq" id="bbsSeq" value="">
				<table class="table table-bordered" style="margin-bottom: 10px;">
				<tbody id="boarddetail"></tbody>
				</table>
				<div id="commentResult">
					<%-- <c:if test="${commentList.size() != 0}">
						<div class="chat-body no-padding profile-message">
							<ul id="commont-list-ul" style="margin: 3px; padding-bottom: 15px;">
								<c:forEach var="comment" items="${commentList}">
									<li class="chat-message" id="chat-message_${comment.bbsCommentNum}"> 
										<img src="http://192.168.12.42:8081/HRM/upload/noimages.jpg" width="53">
										<div class="message-head">
											<a class="username">${comment.bbsCommentEname}</a> 
											<time>${comment.bbsCommentDate}</time>
										</div>
										<div class="message-body">
											<div class="message-body-content">
												${comment.bbsCommentContent}
											</div>
											<div class="message-body-button">
												<span id="editComment_${comment.bbsCommentNum}" class="fa fa-edit text-primary" 
												style="top:21px;right:14px;" data-container="body" data-original-title="" title="" onclick="javascript:commentUpdateForm('${comment.bbsCommentNum}');"></span>
												<span id="removeComment_${comment.bbsCommentNum}" class="fa fa-times text-danger" data-container="body" 
												data-original-title="" title="" onclick="javascript:commentDelete('${comment.bbsCommentNum}');"></span>
											</div>
											<label class="textarea" style="display:none;">
												<a id="updateComment_${comment.bbsCommentNum}" class="icon-append" 
												onclick="javascript:commentUpdate('${comment.bbsCommentNum}');" style="border-left-style: none;right:30px;" data-container="body" data-original-title="" title=""><i class="fa fa-save"></i></a>
												<a id="cancelComment_${comment.bbsCommentNum}" class="icon-append" 
												onclick="javascript:commentUpdateCancel('${comment.bbsCommentNum}');" style="border-left-style: none;" data-container="body" 
												data-original-title="" title="">
												<i class="fa fa-times"></i></a>
												<textarea name="textarea_${comment.bbsCommentNum}" id="textarea_${comment.bbsCommentNum}" placeholder="댓글을 입력하세요..." style="padding-right: 75px; padding-top: 8px; height: 36px;">
													<c:set var="comment" value="${comment.bbsCommentContent}"></c:set>
													<c:out value="${fn:replace(comment,'<br>', lineChar)}"/>
													${fn:replace(comment,'<br>', lineChar)}
												</textarea>
											</label>
										</div> 
									</li>
								</c:forEach>
							</ul>
						</div>
					</c:if>  --%>
				</div>
				<div id="chat-footer" class="chat-footer">
					<div style="padding-top: 5px;">
						<label class="textarea"> 
							<a class="icon-append" id="createComment" href="javascript:addreboard();" style="border-left-style: none;" data-container="body" data-original-title="" title="">
							<i class="fa fa-send"></i></a>
							<textarea name="content" id="textarea_addComment" placeholder="댓글을 입력하세요..." style="padding-right: 50px; padding-top: 8px; height: 31.4px;"></textarea>
						</label>
					</div>
				</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>