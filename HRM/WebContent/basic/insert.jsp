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
<script type="text/javascript" src="${ root}/js/httpRequest.js"></script>
	<script type="text/javascript">
	var flag= 0;
	<% int i = 1; %>
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#blah').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

	function save(){
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
		}else if(document.getElementById("empHireDate").value==""){
			alert("입사날짜 입력!");
			return;
		}else if(flag != 1) {
		      alert("사원번호 중복 확인!");
		      return;
		}else if(document.getElementById("empId").value=="") {
		      alert("사원번호 입력!");
		      return;
		}else if(document.getElementById("empExtention").value==""){
			alert("회사내선입력!");
			return;
		}else if(document.getElementById("empPw").value==""){
			alert("비밀번호입력!");
			return;
		}else{
			document.employeeform.action = "${root}/fileup?act=insert";
		    document.employeeform.submit();
		}
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

	function idcheck() {
	   var sid = document.getElementById("empId").value;
	   result = document.getElementById("idresult"); 
	   if(sid != ""){
	      result.innerHTML = "<font>";
	      var param = "act=idcheck&sid="+ sid;
	      sendRequest("${root}/user",param,resultview,"GET"); 
	   }else{
			var div = document.getElementById("idresult");

       		div.removeChild(div.childNodes[0]);
	   }
	}
	
	/* ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ID CHECK↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ */
	function resultview() {
		
	   if(httpRequest.readyState == 4) {
	      if(httpRequest.status == 200) {
	    	
	    	/*  idcheck_html.jsp을 했을때
	         var txt = httpRequest.responseText;
	         result.innerHTML = txt;  */
	         var xml = httpRequest.responseXML;
	         var sid = xml.getElementsByTagName("searchid").item(0).firstChild.nodeValue;   /* xml.getElementsByTagName("searchid") 태그 갯수 얻어옴 */
	         var idcnt = xml.getElementsByTagName("idcount").item(0).firstChild.nodeValue;
	       
	         var color = "pink";
	         var yn="불가능";
	         if(idcnt == 0){
	         	color = "cyan";
	         	yn="가능";
	         	flag=1;
	         }else{
	        	 flag=0;
	         }
	       //<font color ="blue||red"> xxx는 사용 가능 (불가능)합니다</font>
	       		var f = document.createElement("font"); // <font></font>
	       		f.setAttribute("color", color)  //<font color="p||c"></font>
	       		var txtNode = document.createTextNode(sid+"는 사용"+yn+"합니다.");
	       		f.appendChild(txtNode);
	       		
	       		var div = document.getElementById("idresult");

	       		div.removeChild(div.childNodes[0]);
	       		div.appendChild(f);
	      }
	   }   
	}
	/* ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ID CHECK↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ */
	
	/* ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓주소검색↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ */
	function goPopup(){
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	    var pop = window.open("basic/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}
	function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.employeeform.roadAddrPart1.value = roadAddrPart1;
		document.employeeform.addrDetail.value = addrDetail;
		document.employeeform.jibunAddr.value = jibunAddr;
		document.employeeform.zipNo.value = zipNo;
	}
	/* ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑주소검색↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ */
		function onlyNumber(event) {
	    var key = window.event ? event.keyCode : event.which;    
	
	    if ((event.shiftKey == false) && ((key  > 47 && key  < 58) || (key  > 95 && key  < 106)
	    || key  == 35 || key  == 36 || key  == 37 || key  == 39  // 방향키 좌우,home,end  
	    || key  == 8  || key  == 46 ) // del, back space
	    ) {
	 
	        return true;
	    }else {
	        return false;
	    }    
	};
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
                	  사원 등록</h2>
                  <ul class="nav nav-tabs pull-right" style="display: none;">
                    <li class="active">
                      <a href=""><i class="fa fa-fw fa-lg fa-user"></i> 기본정보</a>
                    </li>
                    <li>
                      <a href=""><i class="fa fa-fw fa-lg fa-building"></i> 경력사항(입사전)</a>
                    </li>
                    <li>
                      <a href=""><i class="fa fa-fw fa-lg fa-book"></i> 자격&amp;면허</a>
                    </li>
                    <li>
                      <a href=""><i class="fa fa-fw fa-lg fa-trophy"></i> 상벌사항</a>
                    </li>
                    <li>
                      <a href=""><i class="fa fa-fw fa-lg fa-archive"></i> 인사발령</a>
                    </li>
                    <li>
                      <a href=""><i class="fa fa-fw fa-lg fa-wrench"></i> 업무명세표</a>
                    </li>
                    <li>
                      <a href=""><i class="fa fa-fw fa-lg fa-calendar"></i> 기념일</a>
                    </li>
                    <li>
                      <a href=""><i class="fa fa-fw fa-lg fa-money"></i> 연봉</a>
                    </li>
                  </ul>
                  <span class="jarviswidget-loader">
                    <i class="fa fa-refresh fa-spin"></i>
                  </span>
                  <ul id="tab_header_ul_resize" class="nav nav-tabs pull-right">
                    <li class="active">
                      <a href=""><i class="fa fa-fw fa-lg fa-user"></i> 기본정보</a>
                    </li>
                   
                  </ul>
                </header>
                <div role="content">
                  <div class="widget-body">
                    <form name="employeeform" class="smart-form"  method="post"  novalidate="novalidate" enctype="multipart/form-data" >
                    
                      <!-- <input  type="hidden" name="empPw" id="empPw" value="0000"> -->
                      <input  type="hidden" name="appointId" id="appointId" value="1">
                      <input  type="hidden" name="anniId" id="anniId" value="1">
                      <input id="pageNum" name="pageNum" type="hidden" value="1">
                      <input id="listNum" name="listNum" type="hidden" value="20">
                      <input id="searchKey" name="searchKey" type="hidden" value=""> 
                      <fieldset>
                        <div class="col col-2">
                   
                          <section>
                            <label class="label">사진</label>
                            <label for="file" class="input input-file">
                               <!--  <input type="file" id="faceImg" name="faceImg"> -->
                               <input type="file" id="faceImg" name="faceImg"  onchange="readURL(this);">
                                 <img id="blah" 
                                 src="${root}/upload/noimages.jpg" width="200" height="260"  />
                            </label> 
  
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
                           
                              
                             <label class="label"><font color="red">*</font>사원번호</label>
                              <label class="input">
                                <i class="icon-prepend fa fa-credit-card"></i>
                                <input id="empId" name="empId"  type="text"  maxlength="10" style="ime-mode:disabled;" onkeydown="return onlyNumber(event)" onkeyup="idcheck();">
                                <!-- onkeyup="javascript:idcheck();" -->
                                <div id="idresult"></div> 
                              </label>
                            </section>
                            <section class="col col-6">
                            <label class="label">비밀번호</label>
                              <label class="input">
                                <i class="icon-prepend fa fa-credit-card"></i>
                                <input  type="text" name="empPw" id="empPw" value="0000">
                                <div id="idresult"></div> 
                              </label>
                            </section>
                            <section class="col col-6">

                            </section>
                            <section class="col col-6">
                              <label class="label"><font color="red">*</font>성명</label>
                              <label class="input">
                                <i class="icon-prepend fa fa-user"></i>
                                <input id="empName" name="empName" type="text" >
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
                                  <option value="${dept.deptId}">${dept.highDept}>${dept.deptName}</option>
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
                                  <option value="${job.jobId}" >${job.jobName}</option>
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
                              <label class="label" ><font color="red">*</font>주민등록번호</label>  
                              </div>
                              <label class="input">
                                <i class="icon-prepend fa fa-credit-card "></i>
                                <input id="empRegNumber" name="empRegNumber" placeholder="000000-0000000"
                                type="text" maxlength="14" >
                              </label>
                            </section>
                            <section class="col col-3">
                              <label class="label"><font color="red">*</font>생년월일</label>
                              <label class="input" id="datepicker">
                                <i class="icon-prepend fa fa-calendar"></i>
                                <input id="empBirth" name="empBirth" type="text" class="datePk">
                              </label>
                            </section>
                           
                          </div>
                          <div class="row">
                            <section class="col col-4">
                              <label class="label"><font color="red">*</font>연락처</label>
                              <label class="input">
                                <i class="icon-prepend fa fa-phone"></i>
                                <input id="empPhone" name="empPhone" type="text" value="010-" placeholder="010-0000-0000" maxlength="13">
                              </label>
                            </section>
                            <section class="col col-4"> 
                              <label class="label"><font color="red">*</font>회사(내선)</label>
                              <label class="input">
                                <i class="icon-prepend fa fa-phone"></i>
                                <input id="empExtention" name="empExtention" type="text" maxlength="12">
                              </label>
                            </section>
                            <section class="col col-4">
                              <label class="label">이메일</label>
                              <label class="input">
                                <i class="icon-prepend fa fa-envelope-o"></i>
                                <input id="empEmail" name="empEmail" type="text" >
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
                                
                                  <option value="초등학교">초등학교</option>
                                  <option value="중학교">중학교</option>
                                  <option value="고등학교">고등학교</option>
                                  <option value="전문대학">전문대학</option>
                                  <option selected="selected" value="대학교">대학교</option>
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
                      
                            </section>
                          </div>
                          
                          <div class="row">
                            <section class="col col-4">
                              <label class="label"><font color="red">*</font>입사일자</label>
                              <label class="input">
                                <i class="icon-prepend fa fa-calendar"></i>
                                <input id="empHireDate" name="empHireDate" type="text" 
                                class="datePk">
                              </label>
                            </section>
                            <section class="col col-4">
                              <label class="label">고용형태</label>
                              <label class="select">
                                <select id="empHireName" name="empHireName">
                                  
                                  <option selected="selected" value="4">정직원(정규직)</option>
                                  <option value="1">계약직</option>
                                  <option value="2">인턴</option>
                                  <option value="3">현장실습</option>
                                </select>
                               <!-- empJobDoc 입사관련서류 -->
                              </label>
                            </section>
                          
            				 <section class="col col-4">
                              <label class="label">입사관련서류</label>
                     			  <label for="file" class="input input-file">
                                <input type="file" id="joinImg" name="joinImg">
          
                           		</label> 
                            </section>
                      	   </div>
                         
                          <div class="row">
                         <section class="col col-4">
	                      
	                         <label class="label">우편번호</label>
	                         <input type="hidden" id="confmKey" name="confmKey" value=""  >
							<input type="text" id="zipNo" name="zipNo" readonly style="width:100px; height:25px; ">
							<input type="button"  value="주소검색" class="btn btn-info btn-sm"  onclick="goPopup();">
							 <label class="label"></label>
							<label class="label">도로명주소</label>
							<input type="text" id="roadAddrPart1" name="roadAddrPart1" style="width:85%; height:25px;" >
							<label class="label"></label>
							<label class="label">지번주소</label>
							<input type="text" id="jibunAddr" name="jibunAddr" style="width:85%; height:25px;"> 
							<label class="label"></label>
							<label class="label">상세주소</label>
							<input type="text" id="addrDetail" name="addrDetail" style="width:40%; height:25px;" value="">
                         </section>
                        
                 
                           
                            <section class="col col-md-8">
                              <label class="label">비고</label>
                              <label class="textarea">
                                <i class="icon-append fa fa-comment"></i>
                                <textarea id="empDetail" name="empDetail" rows="3"></textarea>
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