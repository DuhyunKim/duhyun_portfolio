<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>

function selectDept(d1, d2) {
	var id = '${dept}' + 'Id';
	var name = '${dept}' + 'Name';
	console.log(id);
	opener.document.getElementById(id).value = d1;
	opener.document.getElementById(name).value = d2;
	
	self.close();
}

</script>
</head>
<body>
<center>
<h3>부서 검색</h3>
<table width="350">
	<c:if test="${deptlist.size() != 0 }" >
		<c:forEach var="deptcode" items="${deptlist}">
		<tr>
			<td>
			
			<a href="javascript:selectDept('${deptcode.deptId}', '${deptcode.deptName}');">
			 ${deptcode.deptName}
			</a>
			</td>
		</tr>
		</c:forEach>
	</c:if>

</table>
</center>
</body>
</html>