<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function search(){
	if(document.getElementById("word").value == "") {
		alert("검색할 단어 입력!");
		return;
	} else {
		$.ajax({
			type : "GET",
			url : "${root}/document",
			data : {
				act : "personSearch",
				key : $('#key').val(),
				word : $('#word').val(),
			},
			dataType : "json",
			success : function(data) {
				
				if(data.person.length == 0){
					alert("검색한 조건의 해당 인원이 없습니다.")
				}
				makeList(data);
			},
			error : function(e) {
			}
		});
	}
}

function makeList(data) {
	
	var mlist = document.getElementById("mlist");
	var len = data.person.length;
	removeData();
	for (var i = 0; i < len; i++) {
		var person = data.person[i];
		var empid = createCell(person.empid);
		var deptname = createCell(person.deptname);
		var jobname = createCell(person.jobname);
		var empname = createCell(person.empname);
		var string = "<a class='btn btn-info btn-sm' href='javascript:person(\""+person.empname+"\", \""+person.jobname+"\", \""+person.empid+"\");'>선택</a>";
		var select = createCellInnerHtml(string);
		
		var row = createRow(empid,empname,deptname,jobname,select);
		mlist.appendChild(row);
	}
}

function removeData() {
	   var tbody = document.getElementById("mlist");
	   var len = tbody.childNodes.length;
	   for(var i=len-1;i>=0;i--){
	      tbody.removeChild(tbody.childNodes[i]);
	   }

}


function createCell(data) {
	var cell = document.createElement("td");//<td></td>
	cell.appendChild(document.createTextNode(data));

	return cell;
}

function createCellInnerHtml(data) {
	var cell = document.createElement("td");//<td></td>
	cell.innerHTML = data;
	return cell;
}

function createRow(empid,empname,deptname,jobname,select) {
	var row = document.createElement("tr");//<tr></tr>
	row.appendChild(empid);
	row.appendChild(deptname);
	row.appendChild(jobname);
	row.appendChild(empname);
	row.appendChild(select);
	return row;
}

</script>
</head>
<body>
<div class="modal fade" id="personSearch" role="dialog">
		<div class="modal-dialog">

			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" align="left">직원 검색</h4>
				</div>
				<div class="modal-body" style="max-height: 512px; overflow: auto;">
					<div>
						<div id="filterSet">
						
							<table width="350">
								<tr>
									<td>

										<div class="smart-form" style="width: 200px">
											<label class="select"><select id="key" name="key">
													<option value="이름" selected="selected">이름</option>
													<option value="부서">부서</option>
													<option value="직급">직급</option>
											</select><i></i></label>
										</div>

									</td>
									<td><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div></td>
									<td>
										<div class="input-group" style="width: 200px">
											<input class="form-control" id="word" name="word" type="text" value="">
											<span class="input-group-addon findBtn"
												style="cursor: pointer;" onclick="search()"> <i
												class="fa fa-search"></i>
											</span>
										</div>
									</td>
								</tr>
							</table>
						</div>
					</div>
					<br>
					<div class="ui-jqgrid-bdiv" style="height: auto;">
						<div style="position: relative;">
							<div></div>
							<table class="ui-jqgrid-btable table table-bordered table-striped">
								<tbody>
									<tr class="jqgfirstrow" role="row" style="height: auto">
										<td role="gridcell" style="width: 60px">사원번호</td>
										<td role="gridcell" style="width: 50px">부서</td>
										<td role="gridcell" style="width: 40px">직책</td>
										<td role="gridcell" style="width: 50px">이름</td>
										<td role="gridcell" style="width: 30px">선택</td>
									</tr>
								</tbody>
								<tbody id="mlist" name="mlist">
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<a class="btn btn-danger btn-sm" onclick="removeData()" data-dismiss="modal">닫기</a>
				</div>
			</div>

		</div>
	</div>
</body>
</html>