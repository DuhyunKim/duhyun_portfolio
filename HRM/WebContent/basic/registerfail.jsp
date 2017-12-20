<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ include file="/common/session_common.jsp" %>
<c:set var="root" value="${pageContext.request.contextPath}"> </c:set> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="JavaScript">
alert("등록 오류");
location.href="${root}/user?act=employeeslist"; 
</script>

<title>Insert title here</title>

</head>
<body>

</body>
</html>