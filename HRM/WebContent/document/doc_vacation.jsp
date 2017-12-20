<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/common/user_common.jsp" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>


        <div class="collapse navbar-collapse navbar-ex1-collapse">
          <ul class="nav navbar-nav side-nav">
            <li class="active">
              <a href="settlement_gian.html"><i class="fa fa-fw fa-dashboard"></i> 기안서 작성</a>
            </li>
            <li>
              <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-arrows-v"></i> 내가받은결재 <i class="fa fa-fw fa-caret-down"></i></a>
              <ul id="demo" class="collapse">
                <li>
                  <a href="settlement_ready.html">결재 해야 할 문서</a>
                </li>
                <li>
                  <a href="settlement_done.html">결재한 문서</a>
                </li>
              </ul>
            </li>
            <li>
              <a href="javascript:;" data-toggle="collapse" data-target="#demo2"><i class="fa fa-fw fa-arrows-v"></i> 내가올린결재 <i class="fa fa-fw fa-caret-down"></i></a>
              <ul id="demo2" class="collapse">
                <li>
                  <a href="settlement_sangsin.html">상신문서</a>
                </li>
                <li>
                  <a href="settlement_return.html">반려문서</a>
                </li>
                <li>
                  <a href="settlement_settle_done.html">결재완료문서</a>
                </li>
              </ul>
            </li>
            <li>
              <a href="javascript:;" data-toggle="collapse" data-target="#demo3"><i class="fa fa-fw fa-arrows-v"></i> 목록 관리 <i class="fa fa-fw fa-caret-down"></i></a>
              <ul id="demo3" class="collapse">
                <li>
                  <a href="#">Dropdown Item</a>
                </li>
                <li>
                  <a href="#">Dropdown Item</a>
                </li>
              </ul>
            </li>
            <li>
              <a href="javascript:;" data-toggle="collapse" data-target="#demo4"><i class="fa fa-fw fa-arrows-v"></i> 통계 <i class="fa fa-fw fa-caret-down"></i></a>
              <ul id="demo4" class="collapse">
                <li>
                  <a href="#">Dropdown Item</a>
                </li>
                <li>
                  <a href="#">Dropdown Item</a>
                </li>
              </ul>
            </li>
            <li>
              <a href="tables.html"><i class="fa fa-fw fa-table"></i> 설정</a>
            </li>
          </ul>
        </div>
        <!-- /.navbar-collapse -->
      </nav>
<div id="page-wrapper">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-8">
      <h2>휴가신청서 등록</h2>
      <hr>
      <form name="vacationForm" method="post">
      <input type="hidden" id=>
      <input type="hidden" >
      
      <div class="table-responsive">
        <table class="table table-bordered table-hover">
          <tbody>
            <tr>
              <th width="100px">문서번호</th>
			  <td width="300px	">2016-XX-XXXX</td>
              <th width="100px" >기안일</th>
              <c:set var="date" value="<%=new Date() %>" />
			  <td><fmt:formatDate value="${date}" pattern="yyyy-MM-dd" /></td>
            </tr>
            <tr>
              <th>부서</th>
              <td>${infoMap.deptName}</td>
              <th>기안자</th>
              <td>${userInfo.empName}</td>
            </tr>
            <tr>
              <th>결재라인</th>
              <td colspan="3">
              	<table class="table table-bordered">
					<tr style="height: 30px;">
						
						<th style="width:30px;"></th>
						<th style="width:30px;"></th>
						<th style="width:30px;"></th>
						
					</tr>
					<tr style="width:100px;">
						<c:if test="">
							<td><input type="button" value="선택" onclick="javascript:openEmp('1');"></td>
						</c:if>
						<c:if test="">
							<td><input type="button" value="선택" onclick="javascript:openEmp('');"></td>
						</c:if>
						<td><input type="button" value="선택"></td>
						<td><input type="button" value="선택"></td>
					</tr>
              	</table>
              </td>
            </tr>
            <tr>
              <th >수신부서</th>
              <td colspan="3">
	              <div class="form-inline">
		              <input type="hidden" name="receiveDeptId" id="receiveDeptId" >
		              <input type="text" class='form-control' name="receiveDeptName" id="receiveDeptName" >
		              <input type="button" class='form-control' onclick="javascript:openDept('receiveDept');" value="부서 선택">
	              </div>
	           </td>
            </tr>
            <tr>
              <th >참조부서</th>
              <td colspan="3">
              	<div class="form-inline">
	              	<input type="hidden" name="referenceDeptId" id="referenceDeptId">
	           		<input type="text" class='form-control' name="referenceDeptName" id="referenceDeptName" >
		            <input type="button" class='form-control' onclick="javascript:openDept('referenceDept');" value="부서 선택">
	            </div>
	          </td>
            </tr>
            <tr>
              <th >제목</th>
              <td colspan="3"><input type="text" class='form-control' name="docTitle" id="docTitle"></td>
            </tr>
            <tr>
              <th >기간</th>
              <td colspan="3">
              <div class="form-inline">
	              <input type="text" name="vacationDay1" class='form-control' id="vacationDay1"> ~ 
	              <input type="text" name="vacationDay2" class='form-control' id="vacationDay2"> 
	              <input type="text" class='form-control' name="vacationUseday" id="vacationUseday" size="1"> 일
              </div>
              </td>
            </tr>
            <tr>
              <th >사유</th>
              <td colspan="3">
              <textarea name="vacationReason" class='form-control' id="vacationReason" cols="80" rows="5" ></textarea>
              </td>
            </tr>
            <tr>
              <th>휴가타입</th>
              <td colspan="3">
              <select name="vacationType" id="vacationType" class='form-control' style="width:150px">
					<option value="yearly">정기휴가
					<option value="absence">결근(병가)
					<option value="familyEvent">경조사
					<option value="maternity">출산휴가
					<option value="halfday">반차
					<option value="etc">기타
				</select>
				</td>
            </tr>
          </tbody>
        </table>
       
      </div>
      <center>
        <button type="button" class="btn btn-info">승인요청</button>
        <button type="button" class="btn btn-danger">닫기</button>
      </center>
       </form>
    </div>
    </div>
    </div>
    </div>
    
<script>
$(document).ready(function(){
	$(function() {
	    $('#vacationDay1').datepicker({
	    	  closeText: '닫기',
	    	  prevText: '이전달',
	    	  nextText: '다음달',
	    	  currentText: '오늘',
	    	  monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    	  monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    	  dayNames: ['일','월','화','수','목','금','토'],
	    	  dayNamesShort: ['일','월','화','수','목','금','토'],
	    	  dayNamesMin: ['일','월','화','수','목','금','토'],
	    	  weekHeader: 'Wk',
	    	  dateFormat: 'yy-mm-dd',
	    	  firstDay: 0,
	    	  isRTL: false,
	    	  duration:200,
	    	  showAnim:'show',
	    	  showMonthAfterYear: true,
	          changeMonth: true,
	          changeYear: true,
	    	  yearSuffix:'년',
    	      maxDate: '+1Y+6M',
     		  onSelect: function (dateStr) {
    	        var min = $(this).datepicker('getDate'); // Get selected date
    	       	$("#vacationDay2").datepicker('option', 'minDate', min || '0'); // Set other min, default to today
    	    }
	    });
	    $('#vacationDay2').datepicker({
	    	  closeText: '닫기',
	    	  prevText: '이전달',
	    	  nextText: '다음달',
	    	  currentText: '오늘',
	    	  monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    	  monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    	  dayNames: ['일','월','화','수','목','금','토'],
	    	  dayNamesShort: ['일','월','화','수','목','금','토'],
	    	  dayNamesMin: ['일','월','화','수','목','금','토'],
	    	  weekHeader: 'Wk',
	    	  dateFormat: 'yy-mm-dd',
	    	  firstDay: 0,
	    	  isRTL: false,
	    	  duration:200,
	    	  showAnim:'show',
	    	  showMonthAfterYear: true,
	          changeMonth: true,
	          changeYear: true,
	    	  yearSuffix:'년',
	    	  minDate: $('#vacationDay1').val(),
	    	  onSelect: function (dateStr) {
	    	        var max = $(this).datepicker('getDate'); // Get selected date
	    	        $('#datepicker').datepicker('option', 'maxDate', max || '+1Y+6M'); // Set other max, default to +18 months
	    	        var start = $("#vacationDay1").datepicker("getDate");
	    	        var end = $("#vacationDay2").datepicker("getDate");
	    	        var days = ((end - start) / (1000 * 60 * 60 * 24)) + 1;
	    	        $("#vacationUseday").val(days);
	    	  }
	    });
	    
	});
	
});
    
	</script>
    <script type="text/javascript">
  	function openDept(data) {
  		window.open("${root}/doc?act=listDept&param=" + data,"dept","top=200, left=300, width=400, height=300, menubar=no, status=no, toolbar=no, location=no, scrollbars=yes");
  	}
  	
    function openEmp(data) {
    	window.open("${root}/doc?act=listDeptEmp&param=" + data,"emp","top=200, left=300, width=400, height=300, menubar=no, status=no, toolbar=no, location=no, scrollbars=yes");
    }
	</script>
    




</body></html>