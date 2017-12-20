<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Tie 로그인</title>

<!-- Bootstrap Core CSS -->
<link href="${root}/css/bootstrap.min.css" rel="stylesheet">
<!-- Morris Charts CSS -->
<link href="${root}/css/plugins/morris.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="${root}/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="${root}/css/custom.css"	rel="stylesheet" type="text/css">


<script type="text/javascript">
	function logincheck() {
		if (document.getElementById("id").value == "") {
			alert("이메일 혹은 사원번호 입력하세요.");
			return;
		} else if (document.getElementById("pass").value == "") {
			alert("비밀번호 입력하세요.");
			return;
		} else {
			document.loginform.action = "${root}/user";
			document.loginform.submit();
		}
	}
</script>
<style type="text/css">
body {
  font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
  font-size: 14px;
  line-height: 1.42857143;
  color: #333;
  background-color: #222222;
}
.container{
	margin-top: 200px;}
</style>
</head>
<body>
	<div class="container">
		<form class="form-signin" name="loginform" method="post" action="">
		<input type="hidden" name="act" value="login">
			<div>
			<img alt="" src="${root}/img/LOGO03-white-gray_proto.png" style="width: 250px;" />
			</div>
			<label for="inputId" class="sr-only">ID</label> 
			<input type="text" id="id" name="id" class="form-control" placeholder="사원번호를 입력하세요" > 
			
			<label for="inputPassword" class="sr-only">Password</label>
			<input type="password" id="pass" name="pass" class="form-control" placeholder="Password 입력하세요">
			<button class="btn btn-lg btn-primary btn-block"  style="background-color:#ed7d31; margin-top:30px;" onclick="javascript:logincheck();">로그인</button>
		</form>
	</div>
</body>
</html>