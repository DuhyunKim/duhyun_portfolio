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

function salaryUpdate(){
	document.salaryupdate.action = "${root}/salary?act=salaryUpdate";
	document.salaryupdate.submit();
}
function salaryDelete(){
	document.salarydelete.action = "${root}/salary?act=salaryDelete";
	document.salarydelete.submit();
}
</script>

</head>
<body>
	<div class="modal fade" id="salaryUpdate" role="dialog">
		<div class="modal-dialog">
		<form id="salaryupdate" name="salaryupdate" class="smart-form" action="" method="post">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title" align="left">연봉 등록</h4>
				</div>
				<div class="modal-body" style="max-height: 512px; overflow: auto;">
					<div class="widget-body">
							<input id="empId" name="empId" type="hidden" value="">
							<fieldset>
								<div class="row">
									<section class="col col-4"> <label class="label">사원명</label>
									<label class="input"> 
									<i class="icon-prepend fa fa-users"></i> 
									<input id="empName" name="empName" type="text" value="" class="hasDatepicker" readonly="readonly">
									</label> 
									</section>

									<section class="col col-4"> <label class="label">연봉</label>
									<label class="input"> 
									<i class="icon-prepend fa fa-money"></i> 
									<input id="money" name="money" type="text" value="" class="hasDatepicker">
									</label> 
									</section>
									
									<section class="col col-4"> <label class="label">인센티브</label>
									<label class="input"> 
									<i class="icon-prepend fa fa-money"></i> 
									<input id="incentive" name="incentive" type="text" value="" class="hasDatepicker">
									</label> 
									</section>
								</div>
								<div class="row">
									<section class="col col-4"> <label class="label">상여금</label>
									<label class="input"> 
									<i class="icon-prepend fa fa-money"></i> 
									<input id="bonus" name="bonus" type="text" value="" class="hasDatepicker">
									</label> 
									</section>
									<section class="col col-4"> <label class="label">기본 연차 수</label>
									<label class="input"> 
									<i class="icon-prepend fa fa-calendar"></i> 
									<input id="basic" name="basic" type="text" value="" class="hasDatepicker">
									</label> 
									</section>
									<section class="col col-4"> <label class="label">가산 연차 수</label>
									<label class="input"> 
									<i class="icon-prepend fa fa-calendar"></i> 
									<input id="add" name="add" type="text" value="" class="hasDatepicker">
									</label> 
									</section>
								</div>
							</fieldset>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info btn-sm" onclick="salaryUpdate()">저장</button>
					<button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">닫기</button>
				</div>
			</div>
			</form>
		</div>
	</div>
	
	<div class="modal fade" id="salaryDelete" role="dialog">
		<div class="modal-dialog">
		<form id="salarydelete" name="salarydelete" class="smart-form" action="" method="post">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title" align="left">확인 요청</h4>
				</div>
				<div class="modal-body" style="max-height: 512px; overflow: auto;" align="left">
				<input id="empId" name="empId" type="hidden" value="">
				<font size="5">삭제 하시겠습니까?</font>
				</div>
				<div class="modal-footer">
						<a class="btn btn-info btn-sm" onclick="javascript:salaryDelete()">확인</a>
                        <a class="btn btn-danger btn-sm" data-dismiss="modal">취소</a>
				</div>
			</div>
			</form>
		</div>
	</div>
</body>
</html>