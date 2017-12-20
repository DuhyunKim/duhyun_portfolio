<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head
    content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="http://bootstrapk.com/favicon.ico">
<title>main</title>
<!-- Bootstrap core CSS -->
<link href="${root}/main_css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="${root}/main_css/justified-nav.css" rel="stylesheet">
<script src="${root}/main_css/ie-emulation-modes-warning.js"></script>
<style type="text/css">
body {
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	font-size: 14px;
	line-height: 1.42857143;
	color: #333;
	background-color: #222222;
}
</style>

</head>
<body>
	<div class="container">
		<div class="masthead">
			<h3 class="text-muted" contenteditable="true">
				<img src="${root}/img/LOGO03-white-gray_proto.png"
					style="margin-top: -40px; margin-bottom: -20px; width: 150px;" align="left">
				<font color="#ffffff" style="text-align: right"><h4>${infoMap.deptName } ${userInfo.empName} ${infoMap.jobName}님</h4></font>
			</h3>
			<nav>
			<ul class="nav nav-justified">
				<li class="active"><a href="${root}/main?act=main">Home</a></li>
				<li><a href="${root}/main?act=mvboard">자유게시판</a></li>				
				<li><a href="${root}/main?act=mvempinfo">개인정보</a></li>
				<li><a href="${root}/main?act=mvattendance">근태관리</a></li>
				<li><a href="${root}/main?act=mvvacation">휴가관리</a></li>
				<li><a href="${root}/main?act=mvdocument">전자결재</a></li>
			</ul>
			</nav>
		</div>
		<!-- Jumbotron -->
		<div class="jumbotron">
		<font color="#ffffff">
			<h1 >TIE</h1>
			<p class="lead">생산, 판매, 자재, 인사, 회계 등 기업의 전반적인 업무 프로세스를 하나의 체계로
				통합/재구축하여 정보를 서로 공유하고 신속한 업무처리를 도와 주는 전사적 자원관리 패키지 시스템</p>
			<p>
				<a class="btn btn-lg btn-success"
					href="http://bootstrapk.com/examples/justified-nav/#" role="button">오늘
					하루도 업무를 시작해 보아요.</a>
			</p>
		</div>
		<!-- Example row of columns -->
		<div class="row">
			<div class="col-lg-4">
				<h2>이번달 회사소식</h2>
				<p class="text-danger">주희연 대리, 사장 멱살 잡아</p>
				<p>집에서 점심을 먹고 오후에 출근하는등, 대리로서의 직무유기를 일삼던 주희연 대리가 전날에 잠을 많이 자고서는
					에너지를 주체하지 못해 사장의 멱살을 잡는 만행을 드디어 저질렀다. 멱살을 잡고 "내가 오늘 너를 갈아마셔..</p>
				<p>
					<a class="btn btn-primary"
						href="http://bootstrapk.com/examples/justified-nav/#"
						role="button">View details »</a>
				</p>
			</div>
			<div class="col-lg-4">
				<h2>TODAY HOT NEWS</h2>
				<p>과도한 업무량과 미덥지 못한 신입사원들 덕분에 항상 야근을 일삼던 김민서 과장이 과로로 쓰러졌다. 비타민과
					커피로 연명하던 생활도 잠시 결국 과로로 쓰러지게 되었다. 김민서 과장이 코피를 흘리면 주희연 대리가 뒤에서 항상
					비웃었..</p>
				<p>
					<a class="btn btn-primary"
						href="http://bootstrapk.com/examples/justified-nav/#"
						role="button">View details »</a>
				</p>
			</div>
			<div class="col-lg-4">
				<h2>이번달 부서소식</h2>
				<p>영업부의 우준혁 대리가 신입사원 성희롱 문제로 신고를 당하게 되었다. 그의 죄 유/무가 제대로 밝혀지지 않았기
					때문에 향후 부서내에서의 그의 입지에 대한 얘기는 미루도록 한다. 여사원들은 특히 조심하..</p>
				<p>
					<a class="btn btn-primary"
						href="http://bootstrapk.com/examples/justified-nav/#"
						role="button">View details »</a>
				</p>
			</div>
		</div>
		<!-- Site footer -->
		<footer class="footer">
		<p>JUNO Company 2016</p>
		</footer>
		</font>
	</div>
	<!-- /container -->
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script
		src="./Justified Nav Template for Bootstrap_files/ie10-viewport-bug-workaround.js.다운로드"></script>

</body>
</html>