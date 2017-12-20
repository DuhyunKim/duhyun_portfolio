<%@page import="com.tie.basic.model.EmployeesDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/session_common.jsp" %>
<c:set var="root" value="${pageContext.request.contextPath}"> </c:set>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
    rel="stylesheet">
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
    <link href="https://demo.assist9.com/res/images/favicon.png" rel="icon" type="image/x-icon">
    <link rel="manifest" href="https://demo.assist9.com/manifest.json">
    
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	
    <style type="text/css">
      .jqstooltip { position: absolute;left: 0px;top: 0px;visibility: hidden;background: rgb(0, 0, 0) transparent;background-color: rgba(0,0,0,0.6);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";color: white;font: 10px arial, san serif;text-align: left;white-space: nowrap;padding: 5px;border: 1px solid white;z-index: 10000;}.jqsfield { color: white;font: 10px arial, san serif;text-align: left;}
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript"> 
	function cc(path){
	/* 	var div = document.getElementById("div"); */
	/* 	 $("#div").empty();  */

		/*   if(div.childNodes[0].length > 0){
			 div.removeChild(view);
		}  
		 */
			/* div.removeChild(view); */
		
		/* var view = document.createElement('iframe');
		view.src =getsrc;
		view.frameborder="0"; 
	 	view.width="1450";
		view.height="1000"; 
		view.marginwidth="0";
		view.marginheight="0";
		view.scrolling="yes";
		view.id="iframeId";
		view.className="iframeId";
		div.appendChild(view); */
		var userInfo = "<%=(EmployeesDto) session.getAttribute("userInfo")%>";
		if(userInfo != null){
			$("#frame").attr("src",path);
		}else{
			alert("로그인 전용 페이지입니다.\n로그인 페이지로 이동합니다.");
			document.location.href = "${root}/user?act=mvlogin";
		}
	}
	
	</script>
  </head>
  
  <body class="desktop-detected" style="padding-right: 0px;">
    <header id="header" class="main_header">
      <a id="show-shortcut" data-action="toggleShortcut" href="javascript:void(0);"><h1 class="top_logo"><span>Assist9</span></h1></a>
      <div class="info_area">
        <div class="user_info">
          <a href="javascript:link.currentUserEditPopup('hrga', false, 'a9_demo');">
          <!--   <p class="user_pic"><img src="./photo"></p> -->
            <span class="user_name">${userInfo.empName }</span>&nbsp;&nbsp;&nbsp;
         </a>
        </div>
        <div id="notification" class="notification">
          <i class="fa fa-bell " style="cursor:pointer;" title="알림"></i>
          <!-- <b class="badge">0</b> -->
        </div>
        <div class="ajax-dropdown">
          <div id="notification-config" class="notification-body" style="padding-top: 9px; color: rgb(51, 51, 51);">
            <span style="padding: 0px;background: none;">
              <span class="onoffswitch-title" style="margin-top:0px;">
                <i class="fa fa-cog" style="padding: 3px;"></i>푸시 서비스 설정</span>
              <span class="onoffswitch">
                <input name="oneSignalConfig" class="onoffswitch-checkbox" id="oneSignalConfig"
                type="checkbox" workspaceid="a9_demo" userid="hrga">
                <label class="onoffswitch-label" for="oneSignalConfig">
                  <span class="onoffswitch-inner" data-swchon-text="ON" data-swchoff-text="OFF"></span>
                  <span class="onoffswitch-switch"></span>
                </label>
              </span>
              <span class="pull-right" style="margin-top: 3px;cursor: pointer;">
                <a class="allRemove">[전체삭제]</a>
              </span>
            </span>
          </div>
          <div class="ajax-notifications custom-scroll" style="display: block;"></div>
        </div>
        <ul class="header-dropdown-list hidden-xs" style="float: left;">
          <!-- <li class="">
            <a style="color:#fff;margin-top:12px;" aria-expanded="false" href="https://demo.assist9.com/hr/main#"
            class="dropdown-toggle" data-toggle="dropdown"> <img style="width:25px;" src="./ko.png"> <i class="fa fa-angle-down"></i> </a>
            <ul class="dropdown-menu pull-right">
              <li class="active">
                <a href="javascript:void(0);"><img style="width:25px;" src="./ko.png"> 한국어</a>
              </li>
              <li>
                <a href="javascript:link.changeLangCd('en');"><img style="width:25px;" src="./en.png"> English</a>
              </li>
            </ul>
          </li> -->
          <li class="">
            <a style="color:#fff;margin-top:12px;" aria-expanded="false" href="https://demo.assist9.com/hr/main#"
            class="dropdown-toggle" data-toggle="dropdown">Logout</a> 
          </li>
        </ul>
        <div class="btn_area">
          <a title="Sign Out" href="https://demo.assist9.com/logout"><span class="btn_signout">Sign Out</span></a>
          <span title="Collapse Menu" data-action="toggleMenu" class="btn_menu">Collapse Menu</span>
          <a title="Main" href="https://demo.assist9.com/main/list"><span class="btn_main">Main</span></a>
        </div>
      </div>
    </header>
    <aside id="left-panel">
      <div class="login-info">
        <span style="font-size:22px;font-weight:bold;color:#75C1FE;overflow:hidden;">
          <i class="fa fa-group"></i>인적자원관리</span>
      </div>
      <nav>
        <ul style="">
        	<li class="">
             <a href="javascript:cc('${root}/main?act=mvboard');"  title="게시판"><i class="fa fa-lg fa-fw fa-user"></i>게시판</a>
          </li>
          <li class="">
             <a href="javascript:cc('${root}/user?act=employeeslist');"  title="사원관리"><i class="fa fa-lg fa-fw fa-user"></i>사원관리</a>
          </li>
         <%--  <li>
            <a href="javascript:cc('${root}/pboard?act=boardlist');" title="게시판"><i class="fa fa-newspaper-o"></i> <span class="menu-item-parent">자유게시판</span></a>
            <ul>
              <li>
                <a href="html/list_0_1.html"><i class="fa fa-newspaper-o"></i>공지사항</a>
              </li>
              <li>
                <!-- <a href="html/list_0_2.html"><i class="fa fa-newspaper-o"></i>게시판</a> -->
              </li>
            </ul>
          </li> --%>
          <li>
           	<a href="javascript:cc('${root}/pdept?act=deptlist');" ><i class="fa fa-lg fa-fw fa-group"></i>부서(조직)관리</a>
          </li>
          <li>
             <a href="javascript:cc('${root}/schedule?act=scheduleList');"  title="일정관리"><i class="fa fa-lg fa-fw fa-calendar"></i> <span class="menu-item-parent" >일정관리</span></a> 
          </li>
		  <li>
			   <a href="javascript:cc('${root}/appoint?act=mvlist');" title="인사발령"><i class="fa fa-lg fa-fw fa-archive"></i>인사발령</a>
		  </li>
		  <li>
			   <a href="javascript:cc('${root}/salary?act=salaryList');" title="월급 및 연차관리"><i class="fa fa-lg fa-fw fa-money"></i>월급 및 연차관리</a>
		  </li>
		  
          <li>
            <a href="javascript:cc('${root}/work?act=workList');" title="업무명세서" ><i class="fa fa-lg fa-fw fa-briefcase"></i> <span class="menu-item-parent">업무명세서</span></a>
          </li>
          <li class="dropdown">
            <a id="menu1" data-toggle="dropdown" title="내가올린결재"><i class="fa fa-lg fa-fw fa-file-text-o" aria-hidden="true"></i> <span class="menu-item-parent">내가올린결재</span></a>
            <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
              <li>
                <a href="javascript:cc('${root}/document?act=documentForm');">&nbsp;&nbsp;&nbsp;<i class="fa fa-file" aria-hidden="true">&nbsp;</i>기안서 작성</a>
              </li>
              <li>
                <a href="javascript:cc('${root}/salary?act=salaryList');">&nbsp;&nbsp;&nbsp;<i class="fa fa-file" aria-hidden="true">&nbsp;</i>미결재 문서</a>
              </li>
              <li>
                <a href="javascript:cc('${root}/salary?act=salaryList');">&nbsp;&nbsp;&nbsp;<i class="fa fa-file" aria-hidden="true">&nbsp;</i>결제된 문서</a>
              </li>
            </ul>
          </li>
          <li class="dropdown">
            <a id="menu1" data-toggle="dropdown" title="내가받은결재"><i class="fa fa-lg fa-fw fa-file-text-o" aria-hidden="true"></i> <span class="menu-item-parent">내가받은결재</span></a>
            <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
              <li>
                <a href="javascript:cc('${root}/salary?act=salaryList');">&nbsp;&nbsp;&nbsp;<i class="fa fa-file" aria-hidden="true">&nbsp;</i>내가 결재해야 할 문서</a>
              </li>
              <li>
                <a href="javascript:cc('${root}/salary?act=salaryList');">&nbsp;&nbsp;&nbsp;<i class="fa fa-file" aria-hidden="true">&nbsp;</i>결재한 문서</a>
              </li>
            </ul>
          </li>
          <li>
            <a href="javascript:cc('${root}/commute?act=commuteList');" title="근퇴현황"><i class="fa fa-lg fa-fw fa-calendar" aria-hidden="true"></i> <span class="menu-item-parent">근퇴현황</span></a>
          </li>
          
     <%--     <li>
            <a href="" title="인사관리"  onclick="javascript:cc('${root}/user?act=employeeslist');"><i class="fa fa-lg fa-fw fa-group" ></i> <span class="menu-item-parent" >인사관리</span><b class="collapse-sign"><em class="fa fa-plus-square-o"></em></b></a>
            <ul>
              <li>
                <a href="html/list_8_1.html"><i class="fa fa-lg fa-fw fa-user"></i>사원관리</a>
              </li>
              <li>
                <a href="html/list_8_3.html"><i class="fa fa-lg fa-fw fa-group"></i>전사조직도</a>
              </li>
              <li>
                <a href="html/list_8_5.html"><i class="fa fa-lg fa-fw fa-trophy"></i>상벌사항</a>
              </li>
              <li>
                <a href="html/list_8_6.html"><i class="fa fa-lg fa-fw fa-calendar"></i>사원 기념일 관리</a>
              </li>
              <li>
                <a href="html/list_8_7.html"><i class="fa fa-lg fa-fw fa-money"></i>연봉및 연차관리</a>
              </li>
              <li>
                <a href="html/list_8_8.html"><i class="fa fa-lg fa-fw fa-puzzle-piece"></i>업무명세표</a>
              </li>
              <li>
                <a href="html/list_8_9.html"><i class="fa fa-lg fa-fw fa-flag"></i>부서목표 </a>
              </li>
              <li>
                <a href="html/list_8_10.html"><i class="fa fa-lg fa-fw fa-group"></i>퇴직자관리 </a>
              </li>
            </ul>
          </li> 
          <li>
            <a href="" title="통계"><i class="fa fa-lg fa-fw fa-bar-chart-o"></i> <span class="menu-item-parent">통계</span><b class="collapse-sign"><em class="fa fa-plus-square-o"></em></b></a>
            <ul>
              <li>
                <a href="html/list_6_1.html"><i class="fa fa-fw fa-bar-chart-o"></i>전체</a>
              </li>
              <li>
                <a href="html/list_6_2.html"><i class="fa fa-fw fa-bar-chart-o"></i>부서별 인원수</a>
              </li>
              <li>
                <a href="html/list_6_3.html"><i class="fa fa-fw fa-bar-chart-o"></i>직급별 인원수</a>
              </li>
              <li>
                <a href="html/list_6_4.html"><i class="fa fa-fw fa-bar-chart-o"></i>직책별 인원수</a>
              </li>
              <li>
                <a href="html/list_6_5.html"><i class="fa fa-fw fa-bar-chart-o"></i>직급별 연봉평균</a>
              </li>
              <li>
                <a href="html/list_6_6.html"><i class="fa fa-fw fa-bar-chart-o"></i>부서별 연봉평균</a>
              </li>
              <li>
                <a href="html/list_6_7.html"><i class="fa fa-fw fa-bar-chart-o"></i>월별 입퇴사자 </a>
              </li>
            </ul>
          </li>
          <li>
            <a href="" title="설정"><i class="fa fa-cog"></i> <span class="menu-item-parent">설정</span><b class="collapse-sign"><em class="fa fa-plus-square-o"></em></b></a>
            <ul>
              <li>
                <a href="html/list_7_1.html"><i class="fa fa-cog"></i>직급코드</a>
              </li>
              <li>
                <a href="html/list_7_2.html"><i class="fa fa-cog"></i>직책코드</a>
              </li>
              <li>
                <a href="html/list_7_3.html"><i class="fa fa-cog"></i>고용형태코드 </a>
              </li>
            </ul>
          </li>  --%>
               </ul>
      </nav>
      <span class="minifyme" data-action="minifyMenu">
        <i class="fa fa-arrow-circle-left hit"></i>
      </span>
    </aside>
    <div id="main" role="main">
      <div id="ribbon">
        <ol class="breadcrumb">
          <li>Home</li>
          <li>인사관리자</li>
        </ol>
      </div>     
      
       <div id="div">
      <iframe id="frame" name="frame" src="${root}/user?act=employeeslist" width="1400" height="950" scrolling="yes"></iframe>
      </div >
   
    </div>
  </body>

</html>