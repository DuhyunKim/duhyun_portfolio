<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/session_common.jsp" %>
<c:set var="root" value="${pageContext.request.contextPath}"> </c:set>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>

<head>
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>인사발령</title>
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" type="text/css" media="screen" href="${root}/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" media="screen" href="${root}/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" media="screen" href="${root}/css/smartadmin-production-plugins.min.css">
    <link rel="stylesheet" type="text/css" media="screen" href="${root}/css/smartadmin-production.min.css">
    <link rel="stylesheet" type="text/css" media="screen" href="${root}/css/smartadmin-skins.min.css">
    <link rel="stylesheet" type="text/css" media="screen" href="${root}/css/smartadmin-rtl.min.css">
    <link rel="stylesheet" type="text/css" media="screen" href="${root}/css/demo.min.css">
    <link rel="stylesheet" type="text/css" media="screen" href="${root}/css/ion_assist9.css">
    <link href="https://demo.assist9.com/res/images/favicon.png" rel="icon"
    type="image/x-icon">
  
    <style type="text/css">
      .jqstooltip { position: absolute;left: 0px;top: 0px;visibility: hidden;background: rgb(0, 0, 0) transparent;background-color: rgba(0,0,0,0.6);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";color: white;font: 10px arial, san serif;text-align: left;white-space: nowrap;padding: 5px;border: 1px solid white;z-index: 10000;}.jqsfield { color: white;font: 10px arial, san serif;text-align: left;}
    </style>
    

  	<!-- ==================================모달 링크========================================= -->
  	<script src="http://code.jquery.com/jquery-latest.min.js"></script> 
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script>
	<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script>
	<!-- ==================================모달 링크========================================= -->
	
<link rel="stylesheet" href="${root}/css/style.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
 

function employeesupdate(empId){
	document.location.href = "${root}/user?act=employeesmodify&empId="+empId;
}
function employeeslist(){
	var word = document.getElementById("word").value;
	document.location.href = "${root}/user?act=employeeslist&word="+word;
}

function employeesinsert(){
	document.location.href = "${root}/user?act=employeesinsert"
}

var deleteEmpIdCheck = "";
function employeesdelete(deleteEmpId){
	deleteEmpIdCheck = deleteEmpId;
		/* document.location.href = "${root}/pemployees?act=employeesdelete&empId="+empId;	 */
		return;
}
function modaldelete(){
	
	document.location.href = "${root}/user?act=delete&empId="+deleteEmpIdCheck;
	
}

function pagewrite(){ 
	document.location.href = "${root}/pemployees?act=pagewrite";
}
</script>
</head>
<body>



 <div id="content" style="opacity: 1;">
                <section id="widget-grid">
                    <div class="row"> 
                        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12 sortable-grid ui-sortable">
                            <div class="jarviswidget" id="employeeListResult_jarviswidget" data-widget-sortable="false" data-widget-editbutton="false" data-widget-colorbutton="false" data-widget-togglebutton="false" data-widget-deletebutton="false" role="widget">
                                <header role="heading">
                                    <div class="jarviswidget-ctrls" role="menu"></div>
                                    <h2>
                                    <span class="widget-icon">
                                        <i class="fa fa-table"></i>
                                    </span>
                                    사원 목록</h2>
                                    
                                    <span class="jarviswidget-loader">
                                        <i class="fa fa-refresh fa-spin"></i>
                                    </span>
                                </header>
                                <div role="content">
                                    <div class="widget-body no-padding">
                                        <div id="employeeListResult">
                                            <div class="dataTables_wrapper form-inline no-footer">
                                                <div class="dt-toolbar">
                                                    <div>
                                                        <div id="filterSet">
                                                          
                                                            
                                                                <div class="input-group">
                                                                    <input class="form-control" id="word" name="word" placeholder="성명" type="text">
                                                                    <span class="input-group-addon findBtn" style="cursor:pointer;" onClick="javascript:employeeslist();">
                                                                        <i class="fa fa-search"></i>
                                                                    </span>
                                                                </div>
              
                                                        </div>
                                                    </div>
                                                    <div></div>
                                                </div>
                                                <div class="table-responsive">
                                                    <table id="mainTable" class="table table-striped table-bordered table-hover dataTable ">
                                                        <thead class="table-head">
                                                            <tr>
                                                                <th class="sorting">사원번호</th>
                                                                <th class="sorting">성명</th>
                                                                <th>부서(조직)</th>
                                                                <th>직급</th>
                                                                <th>고용형태</th>
                                                                <th>최종학력</th>
                                                                <th class="sorting">입사일자</th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                      <c:if test="${employeesList.size() != 0}">
	<c:forEach var="employeeslist" items="${employeesList}" >
		<tr >
			<td >${employeeslist.empId}</td>	
			<td >${employeeslist.empName}</td>
			<td>${employeeslist.deptName}</td>
			<td>${employeeslist.jobName}</td>
			<td>${employeeslist.hireName}</td>
			<td>${employeeslist.empFinalEdu}</td>
			<td>${employeeslist.empHireDate}</td>
			<td>
				   <a class="btn btn-info  btn-xs" id="btnupdate" onclick="javascript:employeesupdate('${employeeslist.empId}');">수정</a>
                   <a class="btn btn-danger  btn-xs" id="btndelete" data-toggle="modal" data-target="#myModal" onclick="javascript:employeesdelete('${employeeslist.empId}');">삭제</a>
                   
				<%-- <input type="button" class="btn btn-info   btn-sm" value="수정" id="btnupdate" onclick="javascript:employeesupdate('${employeeslist.empId}');" />&nbsp;&nbsp;
				<input type="button" class="btn btn-danger  btn-xs" value="삭제" id="btndelete" onclick="javascript:employeesdelete('${employeeslist.empId}');" /> --%>
			
			</td>
			
		</tr>
	</c:forEach>
</c:if>
                                                    </table>
                                                </div>
							                                                
							                                              <div class="dt-toolbar-footer">
							                							  <div class="col-sm-4">
							                              <div id="dt_basic_info" class="dataTables_info">Total :
							                                 ${totalCount}</div>
							                           </div>
							                           <div class="col-sm-4 text-center">
							                              <c:set var="pageCount"
							                                 value="${totalCount / pageSize + ( totalCount % pageSize == 0 ? 0 : 1)}" />
							                              <c:set var="startPage"
							                                 value="${pageGroupSize*(numPageGroup-1)+1}" />
							                              <c:set var="endPage" value="${startPage + pageGroupSize-1}" />
							
							                              <c:if test="${endPage > pageCount}">
							                                 <c:set var="endPage" value="${pageCount}" />
							                              </c:if>
							
							                              <ul class="pagination pagination-sm">
							                                 <c:if test="${numPageGroup > 1}">
							                                    <li class="prev abled" data="0"><a
							                                       href="${root}/user?act=employeeslist&currentPage=${(numPageGroup-2)*pageGroupSize+1 }"><i class="fa fa-angle-left"></i></a>
							                                    </li>
							                                 </c:if>
							                                 
							                                 
							                                 <c:forEach var="i" begin="${startPage}" end="${endPage}">
							                                    <c:if test="${currentPage == i}">
							                                       <li class="active"><a href="${root}/user?act=employeeslist&currentPage=${i}">
							                                             ${i}&nbsp; </a></li>
							                                    </c:if>
							                                    <c:if test="${currentPage != i}">
							                                       <li class="inactive"><a
							                                          href="${root}/user?act=employeeslist&currentPage=${i}">
							                                             ${i}&nbsp; </a></li>
							                                    </c:if>
							                                 </c:forEach>
							                                 
							                                 
							                                 <c:if test="${numPageGroup < pageGroupCount}">
							                                 <li class="next abled" data="2"><a
							                                    href="${root}/user?act=employeeslist&currentPage=${numPageGroup*pageGroupSize+1}"><i class="fa fa-angle-right"></i></a>
							                                 </li>
							                                 </c:if>
							                              </ul>
							
							                           </div>
							                  <div id="buttonSet" class="col-sm-4 text-right">
							                  </div> 
							                   <div id="buttonSet" class="col-sm-4 text-right">
                                                        <a class="btn btn-info btn-sm" onclick="javascript:employeesinsert();">등록</a>
                                                    </div>
							                  
							               </div>
							               
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </article>
                    </div>
                </section>
                <div id="details-info-card" class="popover arrow-box-right" style="display:none;"></div>
             
            </div> 
            
<!-- ========================모달 팝업=============================== -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	 <!-- <div class="modal-backdrop fade in" style="height: 684px;"></div> -->
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="myModalLabel">확인요청</h4>
	      </div>
	      <div class="modal-body">
			삭제 하시겠습니까? 	

	      </div>
	      <div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="javascript:modaldelete();">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
<!-- ========================모달 팝업=============================== -->
            
</body>
</html>