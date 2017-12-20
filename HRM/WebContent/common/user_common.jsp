<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>TIE ERP System</title>
<!-- Bootstrap Core CSS -->
<link href="${root}/css/bootstrap.min.css" rel="stylesheet">
<link href="${root}/css/sb-admin.css" rel="stylesheet">
<link href="${root}/css/plugins/morris.css" rel="stylesheet">
<link href="${root}/css/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="${root}/css/custom.css" rel="stylesheet" type="text/css">
<link href="${root}/css/jquery-ui.css" rel="stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="${root}/js/jquery-ui.js"></script>
<script src="${root}/js/bootstrap.min.js"></script>
</head>

<body >
   <div id="wrapper">
      <!-- Navigation -->
      <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
         <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
            <span class="sr-only">Toggle navigation</span> 
            <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
         </button>
         <a href="${root}/main?act=main">
         	<img src="${root}/images/LOGO03-white-gray_proto.png" style="margin-top: -7px; margin-bottom: -20px; width: 150px;">
         </a>
      </div>
      
      <c:if test="${infoMap.deptName == '인사부'}">
      <ul class="nav navbar-nav">
         <li class="dropdown">
         <a href="#" class="dropdown-toggle" data-toggle="dropdown">개인정보 <b class="caret"></b></a>
            <ul class="dropdown-menu">
               <li><a href="${root}/main?act=mvempinfo">개인정보</a></li>
               <li><a href="#">일정</a></li>
               <li><a href="#">연차현황</a></li>
               <li><a href="#">전사 조직도</a></li>
            </ul>
         </li>
         <li class="dropdown">
         <a href="#" class="dropdown-toggle" data-toggle="dropdown">인사관리 <b class="caret"></b></a>
            <ul class="dropdown-menu">
               <li><a href="#">사원관리</a></li>
               <li><a href="#">부서관리</a></li>
               <li><a href="#">상벌사항</a></li>
               <li><a href="#">연봉관리</a></li>
               <li><a href="#">인사발령</a></li>
            </ul>
         </li>            
         <li class="dropdown">
         <a href="#" class="dropdown-toggle" data-toggle="dropdown">근태관리 <b class="caret"></b></a>
            <ul class="dropdown-menu">
               <li><a href="${root}/main?act=mvattendance">출퇴근 체크</a></li>
               <li><a href="#">출퇴근 통계</a></li>
            </ul>
         </li>
         <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">휴가관리 <b class="caret"></b></a>
            <ul class="dropdown-menu">
               <li><a href="${root}/main?act=mvvacation">내 휴가 기록</a></li>
               <li><a href="#">휴가 사용 현황</a></li>
               <li><a href="#">휴가 종류 설정</a></li>
               <li><a href="#">휴가 일수 설정</a></li>
            </ul>
         </li>
         <li class="dropdown">
         <a href="#" class="dropdown-toggle" data-toggle="dropdown">전자결재 <b class="caret"></b></a>
            <ul class="dropdown-menu">
               <li><a href="${root}/main?act=mvdocument">기안서 작성</a></li>
               <li><a href="settlement_ready.html">내가받은결제</a></li>
               <li><a href="settlement_sangsin.html">내가올린결재</a></li>
               <li><a href="#">목록 관리</a></li>
               <li><a href="#">통계</a></li>
            </ul>
         </li>
      </ul>
      </c:if>
      
       <c:if test="${infoMap.deptName != '인사부'}">
      <!-- Top Menu Items -->
      <ul class="nav navbar-nav">
         <li class="dropdown">
         <a href="#" class="dropdown-toggle" data-toggle="dropdown">개인정보 <b class="caret"></b></a>
            <ul class="dropdown-menu">
               <li><a href="${root}/main?act=mvempinfo">개인정보</a></li>
               <li><a href="#">일정</a></li>
               <li><a href="#">연차현황</a></li>
               <li><a href="#">전사 조직도</a></li>
            </ul>
         </li>         
         <li class="dropdown">
         <a href="#" class="dropdown-toggle" data-toggle="dropdown">근태관리 <b class="caret"></b></a>
            <ul class="dropdown-menu">
               <li><a href="${root}/main?act=mvattendance">출퇴근 체크</a></li>
               <li><a href="#">출퇴근 통계</a></li>
            </ul>
         </li>
         <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">휴가관리 <b class="caret"></b></a>
            <ul class="dropdown-menu">
               <li><a href="${root}/main?act=mvvacation">내 휴가 기록</a></li>
               <li><a href="#">휴가 사용 현황</a></li>
               <li><a href="#">휴가 종류 설정</a></li>
               <li><a href="#">휴가 일수 설정</a></li>
            </ul>
         </li>
         <li class="dropdown">
         <a href="#" class="dropdown-toggle" data-toggle="dropdown">전자결재 <b class="caret"></b></a>
            <ul class="dropdown-menu">
               <li><a href="${root}/main?act=mvdocument">기안서 작성</a></li>
               <li><a href="settlement_ready.html">내가받은결제</a></li>
               <li><a href="settlement_sangsin.html">내가올린결재</a></li>
               <li><a href="#">목록 관리</a></li>
               <li><a href="#">통계</a></li>
            </ul>
         </li>
      </ul>
      </c:if>
      
      
      <ul class="nav navbar-right top-nav">
         <li class="dropdown">
         <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-envelope"></i> <b class="caret"></b></a>
            <ul class="dropdown-menu message-dropdown">
               <li class="message-preview">
				  <a href="#">
                     <div class="media">
                        <span class="pull-left"> 
                        	<img class="media-object" src="http://placehold.it/50x50" alt="">
                        </span>
                        <div class="media-body">
                           <h5 class="media-heading">
                              <strong>John Smith</strong>
                           </h5>
                           <p class="small text-muted">
                              <i class="fa fa-clock-o"></i> Yesterday at 4:32 PM
                           </p>
                           <p>Lorem ipsum dolor sit amet, consectetur...</p>
                        </div>
                     </div>
               	  </a>
               </li>
               <li class="message-preview">
				  <a href="#">
                     <div class="media">
                        <span class="pull-left"> 
                        	<img class="media-object" src="http://placehold.it/50x50" alt="">
                        </span>
                        <div class="media-body">
                           <h5 class="media-heading">
                              <strong>John Smith</strong>
                           </h5>
                           <p class="small text-muted">
                              <i class="fa fa-clock-o"></i> Yesterday at 4:32 PM
                           </p>
                           <p>Lorem ipsum dolor sit amet, consectetur...</p>
                        </div>
                     </div>
               	  </a>
               </li>
               <li class="message-preview">
				  <a href="#">
                     <div class="media">
                        <span class="pull-left"> 
                        	<img class="media-object" src="http://placehold.it/50x50" alt="">
                        </span>
                        <div class="media-body">
                           <h5 class="media-heading">
                              <strong>John Smith</strong>
                           </h5>
                           <p class="small text-muted">
                              <i class="fa fa-clock-o"></i> Yesterday at 4:32 PM
                           </p>
                           <p>Lorem ipsum dolor sit amet, consectetur...</p>
                        </div>
                     </div>
               	  </a>
               </li>
               <li class="message-footer"><a href="#">Read All New  Messages</a></li>
            </ul>
         </li>
         <li class="dropdown"><a href="#" class="dropdown-toggle"
            data-toggle="dropdown"><i class="fa fa-bell"></i> <b
               class="caret"></b></a>
            <ul class="dropdown-menu alert-dropdown">
               <li><a href="#">Alert Name <span
                     class="label label-default">Alert Badge</span></a></li>
               <li><a href="#">Alert Name <span
                     class="label label-primary">Alert Badge</span></a></li>
               <li><a href="#">Alert Name <span
                     class="label label-success">Alert Badge</span></a></li>
               <li><a href="#">Alert Name <span class="label label-info">Alert
                        Badge</span></a></li>
               <li><a href="#">Alert Name <span
                     class="label label-warning">Alert Badge</span></a></li>
               <li><a href="#">Alert Name <span
                     class="label label-danger">Alert Badge</span></a></li>
               <li class="divider"></li>
               <li><a href="#">View All</a></li>
            </ul>
         </li>
         <li class="dropdown">
         <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> ${userInfo.empName} ${infoMap.jobName}님 <b class="caret"></b></a>
            <ul class="dropdown-menu">
               <li><a href="#"><i class="fa fa-fw fa-user"></i> Profile</a></li>
               <li><a href="#"><i class="fa fa-fw fa-envelope"></i> Inbox</a></li>
               <li><a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a></li>
               <li class="divider"></li>
               <li><a href="#"><i class="fa fa-fw fa-power-off"></i> Log Out</a></li>
            </ul>
         </li>
      </ul>
		
      
