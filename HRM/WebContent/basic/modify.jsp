<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/session_common.jsp" %>
<c:set var="root" value="${pageContext.request.contextPath}"> </c:set>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>  
  <head>
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 
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
    <link href="https://demo.assist9.com/res/images/favicon.png" rel="icon" stype="image/x-icon">
  
    <style type="text/css">
      .jqstooltip { position: absolute;left: 0px;top: 0px;visibility: hidden;background: rgb(0, 0, 0) transparent;background-color: rgba(0,0,0,0.6);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";color: white;font: 10px arial, san serif;text-align: left;white-space: nowrap;padding: 5px;border: 1px solid white;z-index: 10000;}.jqsfield { color: white;font: 10px arial, san serif;text-align: left;}
    
    </style>
    
 
 <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<script type="text/javascript">
	 function readURL(input) {
	        if (input.files && input.files[0]) {
	            var reader = new FileReader();
	            reader.onload = function (e) {
	                $('#blah').attr('src', e.target.result);
	            }
	            reader.readAsDataURL(input.files[0]);
	        }
	    }

	function  save(){
		if(document.getElementById("empName").value==""){
			alert("성명 입력!");
			return;
		}else if(document.getElementById("empRegNumber").value==""){
			alert("주민번호 입력!");
			return;
		}else if(document.getElementById("empBirth").value==""){
			alert("생일 입력!");
			return;
		}else if(document.getElementById("empPhone").value==""){
			alert("연락처 입력!");
			return;
		}else if(document.getElementById("empExtention").value==""){
			alert("내선번호 입력!");
			return;
		}else if(document.getElementById("empHireDate").value==""){
			alert("입사날짜 입력!");
			return;
		}else if(document.getElementById("empExtention").value==""){
			alert("회사내선입력!");
			return;
		}
		document.employeeform.action = "${root}/fileup?act=modify";
	    document.employeeform.submit();
	}
	
	function cancel(){
		location.href="${root}/user?act=employeeslist"; 
	}
	
	$(function() {
		  $( ".datePk" ).datepicker({
		    dateFormat: 'yy-mm-dd',
		    prevText: '<',
		    nextText: '>',
		    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    dayNames: ['일','월','화','수','목','금','토'],
		    dayNamesShort: ['일','월','화','수','목','금','토'],
		    dayNamesMin: ['일','월','화','수','목','금','토'],
		    showMonthAfterYear: true,
		    changeMonth: true,
		    changeYear: true,
		  
		  });
		  
		});
	 
	function downloadFile(filename,location){
		document.location.href = "${root}/user?act=downfile&filename="+filename+"&location="+location;
	}
	
	/* function opendept(){
		var empid = document.getElementById("empid").value;
		
	} */
	
	
	</script>
  </head>
  
  <body>
   <div id="content" style="opacity: 1;">
        <!-- widget grid -->
        <section id="widget-grid" class="">
          <!-- row -->
          <div class="row">
            <!-- NEW WIDGET START -->
            <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12 sortable-grid ui-sortable">
              <!-- Widget ID (each widget will need unique ID)-->
              <div class="jarviswidget" data-widget-sortable="false" data-widget-editbutton="false"
              data-widget-colorbutton="false" data-widget-togglebutton="false" data-widget-deletebutton="false"
              role="widget">
                <header id="tab_header" role="heading">
                  <h2>
                  <span class="widget-icon">
                    <i class="fa fa-table"></i>
                  </span>
                	  사원 수정</h2>
                  <span class="jarviswidget-loader">
                    <i class="fa fa-refresh fa-spin"></i>
                  </span>
                  <ul id="tab_header_ul_resize" class="nav nav-tabs pull-right">
                    <li class="active">
                      <a href="${root}/user?act=modfiy&empId=${modfiyInfo.empId}"><i class="fa fa-fw fa-lg fa-user"></i> 기본정보</a>
                    </li>
                    <li>
                      <a href="${root}/career?act=careerlist&empId=${modfiyInfo.empId}"><i class="fa fa-fw fa-lg fa-building"></i> 경력사항(입사전)</a>
                    </li>
                    <li>
                      <a href="${root}/license?act=licenseList&empId=${modfiyInfo.empId}"><i class="fa fa-fw fa-lg fa-book"></i> 자격&amp;면허</a>
                    </li>
                    <%-- <li>
                      <a href="${root}/appoint?act=mvlist&empId=${modfiyInfo.empId}&empName=${modfiyInfo.empName}"><i class="fa fa-fw fa-lg fa-archive"></i> 인사발령</a>
                    </li>
<!--                     <li>
                      <a href=""><i class="fa fa-fw fa-lg fa-trophy"></i> 상벌사항</a>
                    </li> -->
                      <li>
                      <a href=""><i class="fa fa-fw fa-lg fa-wrench"></i> 업무명세표</a>
                    </li>
                    <li>
                      <a href=""><i class="fa fa-fw fa-lg fa-money"></i> 연봉</a>
                    </li> --%>
                  </ul>
                </header>
                <div role="content">
                  <div class="widget-body">
                    <form name="employeeform" class="smart-form" action="" method="post"  novalidate="novalidate" enctype="multipart/form-data" >
                    
                      <input  type="hidden" name="empPw" id="empPw" value="${modfiyInfo.empPw}" >
                     <input  type="hidden" name="faceHidden" id="faceHidden" value="${modfiyFileInfo.faceSaveName}" >
                     
                      <input  type="hidden" name="appointId" id="appointId" value="${modfiyInfo.appointId}" >
             
                      <input type="hidden" name="act" id="act" value="modfiy">
                      <input id="pageNum" name="pageNum" type="hidden" value="1">
                      <input id="listNum" name="listNum" type="hidden" value="20">
                      <input id="searchKey" name="searchKey" type="hidden" value=""> 
                      <fieldset>
                        <div class="col col-2">
                   
                         <section>
                            <label class="label">사진</label>
                            <label for="file" class="input input-file">
                               <!--  <input type="file" id="faceImg" name="faceImg"> -->
                               <input type="file" id="faceImg" name="faceImg"   onchange="readURL(this);">
                                <c:if test="${modfiyFileInfo.faceSaveName != 'noimages.jpg'}">
                                 <img id="blah" 
                                 src="${root}/upload${modfiyFileInfo.saveFolder}${modfiyFileInfo.faceSaveName}"  width="200" height="260" />
                           </c:if>
                           <%-- <c:if test="${modfiyFileInfo.faceSaveName == 'noimages.jpg'}">
                                 <img id="blah" 
                                 src="${root}/upload/noimages.jpg"  width="200" height="260" />
                           </c:if> --%>
                           <c:if test="${modfiyFileInfo.faceSaveName == 'noimages.jpg'}">
                                 <img id="blah" 
                                 src="${root}/upload/noimages.jpg"  width="200" height="260" />
                           </c:if>
                           
                            </label> 
                            
                           <c:if test="${modfiyFileInfo.faceSaveName != 'noimages.jpg'}">
   							<a href="javascript:downloadFile('${modfiyFileInfo.faceSaveName}','${modfiyFileInfo.saveFolder}');">${modfiyFileInfo.faceSaveName}</a>
                          </c:if>
                          </section>
                          <section>       
                            <label class="label">
                            <!--   <img id="imgId" src="./photo(1)" class="col-md-12"> -->
                            </label>
                          </section>
                        </div>
                        <div class="col col-10">
                          <div class="row">
                            <section class="col col-6">
                              <label class="label">사원번호</label>
                              <label class="input">
                                <i class="icon-prepend fa fa-credit-card"></i>
                                <input id="empId" name="empId" style="background-color: #eee" readonly="readonly" type="text" value="${modfiyInfo.empId}" maxlength="8">
                              </label>
                            </section>
                            <section class="col col-6">
                              <label class="label">성명</label>
                              <label class="input">
                                <i class="icon-prepend fa fa-user"></i>
                                <input id="empName" name="empName" type="text" value="${modfiyInfo.empName}">
                              </label>
                            </section>
                          </div>
                          <div class="row">
                            <section class="col col-4">
                              <label class="label">부서(조직)</label>
 
                              <label class="select" >
                                <select id="empDeptName" name="empDeptName">
                                  <c:if test="${deptInfo.size() != 0}">
								  <c:forEach var="dept" items="${deptInfo}" >	   
								  <c:if test="${dept.deptId == modfiyInfo.deptId}">                         		    	
                                  	<option value="${dept.deptId}" selected="selected">${dept.highDept}>${dept.deptName}</option>
                                  </c:if>
								  <c:if test="${dept.deptId != modfiyInfo.deptId}">                         		    	
                                  	<option value="${dept.deptId}">${dept.highDept}>${dept.deptName}</option>
                                  </c:if>
                                  </c:forEach>
                                  </c:if>
                                </select>
                                <i></i>
                              </label>
                            </section>
                            
                            <section class="col col-4">
                              <label class="label">직급</label>
                              <label class="select">
                                <select id="empJobName" name="empJobName" >
                                   <c:if test="${jobsInfo.size() != 0}">
                                  <c:forEach var="job" items="${jobsInfo}" >
                                  <c:if test="${job.jobId == modfiyInfo.jobId}">
                                  <option value="${job.jobId}" selected="selected">${job.jobName}</option>
                                  </c:if>
                                  <c:if test="${job.jobId != modfiyInfo.jobId}">
                                  <option value="${job.jobId}" >${job.jobName}</option>
                                  </c:if>
                                  
                                  </c:forEach>
                                  </c:if>
                                </select>
                                <i></i>
                              </label>
                            </section>
                            
                          </div>
                          <div class="row">
                            <section class="col col-6">
                            <div class="">
                              <label class="label" >주민등록번호</label>  
                              </div>
                              <label class="input">
                                <i class="icon-prepend fa fa-credit-card "></i>
                                <input id="empRegNumber" name="empRegNumber" placeholder="000000-0000000"
                                type="text" value="${modfiyInfo.empRegNumber1}-${modfiyInfo.empRegNumber2}">
                              </label>
                            </section>
                            <section class="col col-3">
                              <label class="label">생년월일</label>
                              <label class="input" id="datepicker">
                                <i class="icon-prepend fa fa-calendar"></i>
                                <input id="empBirth" name="empBirth" type="text" value="${modfiyInfo.empBirth}" class="datePk">
                              </label>
                            </section>
                           
                          </div>
                          <div class="row">
                            <section class="col col-4">
                              <label class="label">연락처</label>
                              <label class="input">
                                <i class="icon-prepend fa fa-phone"></i>
                                <input id="empPhone" name="empPhone" type="text" value="010-${modfiyInfo.empPhone2}-${modfiyInfo.empPhone3}" placeholder="010-0000-0000">
                              </label>
                            </section>
                            <section class="col col-4">
                              <label class="label"><font color="red">*</font>회사(내선)</label>
                              <label class="input">
                                <i class="icon-prepend fa fa-phone"></i>
                                <input id="empExtention" name="empExtention" type="text" value="${modfiyInfo.empExtention1}-${modfiyInfo.empExtention2}-${modfiyInfo.empExtention3}">
                              </label>
                            </section>
                            <section class="col col-4">
                              <label class="label">이메일</label>
                              <label class="input">
                                <i class="icon-prepend fa fa-envelope-o"></i>
                                <input id="empEmail" name="empEmail" type="text" value="${modfiyInfo.empEmail1}@${modfiyInfo.empEmail2}">
                              </label>
                            </section>
                          </div>
                          <div class="row">
                            <section class="col col-4">
                              <label class="label">경력사항</label>
                              <label class="input">
                                <i class="icon-prepend fa fa-tag"></i>
                                <input id="" name="" type="text" value="" style="background-color: #eee" readonly="readonly">
                              </label>
                            </section>
                            <section class="col col-4">
                              <label class="label">최종학력</label>
                              <label class="select">
                                <select id="empFinalEdu" name="empFinalEdu">
                                <option value="${modfiyInfo.empFinalEdu}" selected="selected" >${modfiyInfo.empFinalEdu}</option>
                                  <option value="초등학교">초등학교</option>
                                  <option value="중학교">중학교</option>
                                  <option value="고등학교">고등학교</option>
                                  <option value="전문대학">전문대학</option>
                                  <option value="대학교">대학교</option>
                                  <option value="대학원(석사)">대학원(석사)</option>
                                  <option value="대학원(박사)">대학원(박사)</option>
                                </select>
                                <i></i>
                              </label>
                            </section>
                        <section class="col col-4">
                              <label class="label">학위증명서 사본</label>
                               <label for="file" class="input input-file">
                                <input type="file" id="degreeImg" name="degreeImg">
                            </label> 
                            <c:if test="${modfiyFileInfo.degreeSaveName != '없음'}">
   							<a href="javascript:downloadFile('${modfiyFileInfo.degreeSaveName}','${modfiyFileInfo.saveFolder}');">${modfiyFileInfo.degreeSaveName}</a>
                          </c:if>
                            </section>
                          </div>
                          <div class="row">
                            <section class="col col-4">
                              <label class="label"><font color="red">*</font>입사일자</label>
                              <label class="input">
                                <i class="icon-prepend fa fa-calendar"></i>
                                <input id="empHireDate" name="empHireDate" type="text" value="${modfiyInfo.empHireDate}"
                                class="datePk">
                              </label>
                            </section>
                            <section class="col col-4">
                              <label class="label">고용형태</label>
                              <label class="select">
                                <select id="empHireName" name="empHireName">
                                  <option value="${modfiyInfo.hireId}" selected="selected">${modfiyInfo.empHireName}</option>
                                  <option value="4">정직원(정규직)</option>
                                  <option value="1">계약직</option>
                                  <option value="2">인턴</option>
                                  <option value="3">현장실습</option>
                                </select>
                                <i></i>
                              </label>
                            </section>
                          <%--   <section class="col col-4">
                              <label class="label">전직장 경력(근무일수)</label>
                              <label class="input">
                                <input type="text" id="careerDate" name="careerDate"
                                 value="${modfiyInfo.careerDate}일 (${modfiyInfo.careerDate/365}년)" 
                                 readonly="readonly" style="background-color: #eee" />
                              </label> <!--  disabled="disabled" -->
                            </section> --%>
                          
                          
            				 <section class="col col-4">
                              <label class="label">입사관련서류</label>
                     			  <label for="file" class="input input-file">
                                <input type="file" id="joinImg" name="joinImg">
                           		</label> 
                           		<c:if test="${modfiyFileInfo.joinSaveName != '없음'}">
	   							<a href="javascript:downloadFile('${modfiyFileInfo.joinSaveName}','${modfiyFileInfo.saveFolder}');">${modfiyFileInfo.joinSaveName}</a>
	                          </c:if>
                            </section>
                      	   </div>
                         
                          <div class="row">
                         <section class="col col-4">
	                      
	                         <label class="label">우편번호</label>
	                         <input type="hidden" id="confmKey" name="confmKey" value=""  >
							<input type="text" id="zipNo" name="zipNo"  value="${modfiyInfo.zipNo}" readonly style="width:100px; height:25px;">
							<input type="button"  value="주소검색" class="btn btn-info btn-sm"  onclick="goPopup();">
							 <label class="label"></label>
							<label class="label">도로명주소</label>
							<input type="text" id="roadAddrPart1" name="roadAddrPart1" value="${modfiyInfo.roadAddrPart1}"  style="width:85%; height:25px;" >
							<label class="label"></label>
							<label class="label">지번주소</label>
							<input type="text" id="jibunAddr" name="jibunAddr" value="${modfiyInfo.jibunAddr}"  style="width:85%; height:25px;"> 
							<label class="label"></label>
							<label class="label">상세주소</label>
							<input type="text" id="addrDetail" name="addrDetail" value="${modfiyInfo.addrDetail}" style="width:40%; height:25px;" value="">
                         </section>
                        
                 
                           
                            <section class="col col-md-8">
                              <label class="label">비고</label>
                              <label class="textarea">
                                <i class="icon-append fa fa-comment"></i>
                                <textarea id="empDetail" name="empDetail" rows="3" >${modfiyInfo.empDetail}</textarea>
                              </label>
                            </section>
                           </div>
                        </div>
                       </fieldset>
                      <footer style="background-color: #fff;">
                        <input type="button" value="취소" class="btn btn-danger btn-sm" onclick="javascript:cancel();">
                        <input type="button" value="저장" class="btn btn-info btn-sm" onclick="javascript:save();">
                      </footer>
                    </form>
                  </div>
                </div>
              </div>
            </article>
            <!-- WIDGET END -->
          </div>
          <!-- end row -->
        </section>
      </div>
	</body>
	
</html>