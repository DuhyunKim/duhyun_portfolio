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
function licenseUpdateInfo(certifiNum){
	$.ajax({
		type: "POST",
		url: "${root}/license",
		data: {act: "licenseUpdateInfo", certifiNum: certifiNum},
		dataType: "json",
		success: function(data) {
			makeLicense(data);
		},
		error: function(e) {
			alert("에러발생 : " + e);
		}
	});
	//document.location.href = "${root}/license?act=licenseUpdateInfo&empId="+empId;
}


function makeLicense(data){
	
	document.getElementById("certifiNum2").value =  data.licenseUpdateInfo[0].certifiNum;
	document.getElementById("rightName2").value =  data.licenseUpdateInfo[0].rightName;
	document.getElementById("rightInstitution2").value =  data.licenseUpdateInfo[0].rightInstitution;
	document.getElementById("rightObtain2").value =  data.licenseUpdateInfo[0].rightObtain;
	document.getElementById("rightEnd2").value =  data.licenseUpdateInfo[0].rightEnd;
	document.getElementById("rightUpdate2").value =  data.licenseUpdateInfo[0].rightUpdate;
	document.getElementById("rightErasure2").value =  data.licenseUpdateInfo[0].rightErasure;
	document.getElementById("erasureContent2").value =  data.licenseUpdateInfo[0].erasureContent;
	document.getElementById("rightImage2").value =  data.licenseUpdateInfo[0].rightImage;
	document.getElementById("rightSaveName2").value =  data.licenseUpdateInfo[0].rightSaveName;
	document.getElementById("saveFolder2").value =  data.licenseUpdateInfo[0].saveFolder;
	document.getElementById("empId2").value =  data.licenseUpdateInfo[0].empId;
}
var deletecertifiNum = "";
function licenseDelete(certifiNum){
	deletecertifiNum = certifiNum;
		/* document.location.href = "${root}/pemp
		loyees?act=employeesdelete&empId="+empId;	 */
		return;
}
function modaldelete(){
	
	document.location.href = "${root}/license?act=delete&certifiNum="+deletecertifiNum;
	
}

function pagewrite(){ 
	document.location.href = "${root}/pemployees?act=pagewrite";
}

function downloadFile(filename,location){
	document.location.href = "${root}/user?act=downfile&filename="+filename+"&location="+location;
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
                                    자격 면허</h2>
                                    <ul class="nav nav-tabs pull-right" >
                    <li >
                      <a href="${root}/user?act=modfiy&empId=${modfiyInfo.empId}"><i class="fa fa-fw fa-lg fa-user"></i> 기본정보</a>
                    </li>
                    
                    <li><a href="career?act=careerlist&empId=${modfiyInfo.empId}"><i
							class="fa fa-fw fa-lg fa-building"></i> 경력사항(입사전)</a>
					</li>
                    <li class="active">
                      <a href="${root}/license?act=licenseList"><i class="fa fa-fw fa-lg fa-book"></i> 자격&amp;면허</a>
                    </li>
                    <!--  <li>
                      <a href=""><i class="fa fa-fw fa-lg fa-archive"></i> 상벌사항</a>
                    </li> -->
                    <!-- <li>
                      <a href=""><i class="fa fa-fw fa-lg fa-archive"></i> 인사발령</a>
                    </li>
                    <li>
                      <a href=""><i class="fa fa-fw fa-lg fa-wrench"></i> 업무명세표</a>
                    </li>
                    <li>
                      <a href=""><i class="fa fa-fw fa-lg fa-money"></i> 연봉</a>
                    </li> -->
                  </ul>
                                    
                                    <span class="jarviswidget-loader">
                                        <i class="fa fa-refresh fa-spin"></i>
                                    </span>
                                </header>
                                <div role="content">
                                    <div class="widget-body no-padding">
                                        <div id="employeeListResult">
                                            <div class="dataTables_wrapper form-inline no-footer">
                                            
                                                <div class="table-responsive">
                                                    <table id="mainTable" class="table table-striped table-bordered table-hover dataTable ">
                                                        <thead class="table-head">
                                                            <tr>
                                                                <th>자격(면허)명</th>
                                                                <th>자격(면허)번호</th>
                                                                <th>발행기관</th>
                                                                <th>취득일자</th>
                                                                <th>만기일자</th>
                                                                <th>갱신일자</th>
                                                                <th>말소일자</th>
                                                                <th>말소사유</th>
                                                                <th>자격(면허)증 사본</th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                      <c:if test="${licenseList.size() != 0}">
	<c:forEach var="licenseList" items="${licenseList}" >
		<tr>
			<td>${licenseList.rightName}</td>	
			<td>${licenseList.certifiNum}</td>
			<td>${licenseList.rightInstitution}</td>
			<td>${licenseList.rightObtain}</td>
			<td>${licenseList.rightEnd}</td>
			<td>${licenseList.rightUpdate}</td>
			<td>${licenseList.rightErasure}</td>
			<td>${licenseList.erasureContent}</td>
			<td><a href="javascript:downloadFile('${licenseList.rightSaveName}','${licenseList.saveFolder}');">${licenseList.rightSaveName}</a></td>
			<td>
				     <a class="btn btn-info  btn-xs" id="btnupdate" data-toggle="modal" data-target="#myModal2" onclick="javascript:licenseUpdateInfo('${licenseList.certifiNum}');">수정</a> 
                    <%-- <jsp:include page="licenseUpdateInfoModal.jsp"></jsp:include>  --%>
                   <a class="btn btn-danger  btn-xs" id="btndelete" data-toggle="modal" data-target="#myModalDelete" onclick="javascript:licenseDelete('${licenseList.certifiNum}');">삭제</a>
                   
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
                                                        <div id="dt_basic_info" class="dataTables_info">Total :  ${totalCount}</div>
                                                    </div>
                                                    <div class="col-sm-4 text-center">
                                                        <div class="dataTables_paginate paging_bootstrap_full">
                                                            <ul class="pagination pagination-sm">
                                                             
                                                               <c:choose>
			<c:when test="${totalCount%listNum == 0}">
				<c:forEach var="page" begin="1" end="${totalCount/listNum}">
					<a href="${root}/user?act=employeeslist&pg=${page}">${page}</a>&nbsp;&nbsp;
				</c:forEach>
			</c:when>
			<c:otherwise>
				<c:forEach var="page" begin="1" end="${totalCount/listNum + 1}">
					<a href="${root}/user?act=employeeslist&pg=${page}" >${page}</a>&nbsp;&nbsp;
				</c:forEach>
			</c:otherwise>
		</c:choose>
                                                              
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div id="buttonSet" class="col-sm-4 text-right">
                                                    	<jsp:include page="licenseInsertModal.jsp"></jsp:include>
                                                        <!-- <a class="btn btn-info btn-sm" onclick="javascript:licenseList();">등록</a> -->
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
	<div class="modal fade" id="myModalDelete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
		
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
<jsp:include page="/license/licenseUpdateInfoModal.jsp"></jsp:include>
<!-- ====================수정 모달================================== -->            
</body>
</html>