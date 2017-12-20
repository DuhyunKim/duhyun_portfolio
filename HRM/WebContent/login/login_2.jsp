<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>        

<c:forEach var="cook" items="${pageContext.request.cookies}">
	<c:if test="${cook.name == 'nid_sid'}">
		<c:set var="saveid" value="${cook.value}"/>
		<c:set var="ckid" value=" checked='checked'" />
	</c:if>
</c:forEach> 

<%-- 
<%
Cookie cookies[] = request.getCookies();
String saveid = "";
if(cookies != null){
	for(Cookie cookie : cookies){
		if("nid_sid".equals(cookie.getName())){
			saveid = cookie.getValue();
		}
	}
}
%>
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/css/style.css" type="text/css">
<script type="text/javascript">
function logincheck(){
	if(document.getElementById("id").value  == "") {
		alert("아이디 입력!");
		return;
	} else if(document.getElementById("pass").value == "") {
		alert("비밀번호 입력!");
		return;
	} else {
		document.loginform.action = "${root}/user";
		document.loginform.submit();
	}
}
</script>
</head>
<body>
<center>
<form name="loginform" method="post" action="">
<input type="hidden" name="act" id="act" value="login">
<table>
<%-- <tr>
	<td colspan="2" align="right">
		<input type="checkbox" name="idsv" id="idsv" value="saveok"${ckid}>아이디저장
	</td>
</tr> --%>
<tr>
	<td class="td1">아이디</td>
	<td class="td3"><input type="text" name="id" id="id" <%-- value="${saveid}" --%>></td>
</tr>
<tr>
	<td class="td2">비밀번호</td>
	<td class="td4"><input type="password" name="pass" id="pass"></td>
</tr>
<tr>
	<td colspan="2" align="center">
	<input type="button" value="로그인" onclick="javascript:logincheck();">
	</td>
</tr>
</table>
</form>
</center>
</body>
</html>