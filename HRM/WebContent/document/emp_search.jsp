<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
function selectEmpDept(data) {
    $.ajax({
      type: "GET",
      url: "${root}/doc/ajax",
      data: {act: "emplist", deptId: data},
      dataType: "json",
      success: function(data) {
    	  makeList(data);
      },
      error: function(e) {
    	  alert("에러발생 : " + e);
      }
    });
}
function selectDept(d1, d2) {
	var id = '${dept}' + 'Id';
	var name = '${dept}' + 'Name';
	console.log(id);
	opener.document.getElementById(id).value = d1;
	opener.document.getElementById(name).value = d2;
	
	self.close();
}

function makeList(data) {
	var emplist = document.getElementById("emplist");
	
	removeData();
	
	var txt = "";
	var len = data.emps.length;
	for (var i = 0; i < len; i++) {
		var emp = data.emps[i];
		console.log(emp.empId);
		txt += "<tr><td>" 
			  + "<input type='hidden' name='" + emp.empId + "' id='" + emp.emdId + "' value='" + emp.empId + "'>"
			  + emp.empName + " " + emp.jobName
			  + "</td></tr>";
	}
	emplist.innerHTML = txt;
}

function removeData() {
	var tbody = document.getElementById("emplist");
	var len = tbody.childNodes.length;
	
	for (var i = len-1; i >= 0; i--)
		tbody.removeChild(tbody.childNodes[i]);
}

</script>
</head>
<body>
<center>
<h3>사원 검색</h3>
<form name="empForm" method="get" >
<div style="padding:10px; float:left;">
<table width="150">
<c:if test="${deptEmplist.size() != 0 }" >
	<tr>
		<td>부서 선택</td>
	</tr>
	<c:forEach var="deptcode" items="${deptEmplist}">
		<tr>
			<td>
			<a href="javascript:selectEmpDept('${deptcode.deptId}');">
			${deptcode.deptName} (${deptcode.empCnt})
			</a>
			</td>
		</tr>
		</c:forEach>
	</c:if>
</table>
</div>
<div style="border:1px solid; width:150px; padding:10px; float:left;" >
	<table>
		<tbody id="emplist"></tbody>
	</table>
</div>
</form>
</center>
</body>
</html>



