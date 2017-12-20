<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ include file="/common/session_common.jsp" %>
<c:set var="root" value="${pageContext.request.contextPath}"> </c:set>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<a class="btn btn-info btn-sm" id="btnInsert" data-toggle="modal" data-target="#myModal" >등록</a>
<a class="btn btn-danger btn-sm" id="btnEmpList"  >사원 목록</a>

<!-- ========================모달 팝업=============================== -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	
     <!--  <div class="modal-backdrop fade in" style="height: 684px;"></div> -->
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title" style="text-align:left">자격&amp;면허 등록</h4>
          </div>
          <div class="modal-body" style="max-height:308px;overflow:auto;">
            <div class="widget-body">
              <form id="licenseform" name="licenseform" class="smart-form" action="" method="post" enctype="multipart/form-data">
                <input id="empId" name="empId" type="hidden" value="${empId}">
                <fieldset>
                  <div class="row">
                    <section class="col col-6">
                      <label class="label">자격(면허) 명</label>
                      <label class="input">
                        <i class="icon-prepend fa fa-book"></i>
                        <input id="rightName" name="rightName" type="text" value="">
                      </label>
                    </section>
                    <section class="col col-6">
                      <label class="label">자격(면허) 번호</label>
                      <label class="input">
                        <i class="icon-prepend fa fa-credit-card"></i>
                        <input id="certifiNum" name="certifiNum" type="text" value="">
                      </label>
                    </section>
                  </div>
                  <div class="row">
                    <section class="col col-6">
                      <label class="label">취득일자</label>
                      <label class="input">
                        <i class="icon-prepend fa fa-calendar"></i>
                        <input id="rightObtain" name="rightObtain" type="text" value="" class="datePk">
                      </label>
                    </section>
                    <section class="col col-6">
                      <label class="label">만기일자</label>
                      <label class="input">
                        <i class="icon-prepend fa fa-calendar"></i>
                        <input id="rightEnd" name="rightEnd" type="text" value="" class="datePk">
                      </label>
                    </section>
                  </div>
                  <div class="row">
                    <section class="col col-6">
                      <label class="label">갱신일자</label>
                      <label class="input">
                        <i class="icon-prepend fa fa-calendar"></i>
                        <input id="rightUpdate" name="rightUpdate" type="text" value="" class="datePk">
                      </label>
                    </section>
                    <section class="col col-6">
                      <label class="label">말소일자</label>
                      <label class="input">
                        <i class="icon-prepend fa fa-calendar"></i>
                        <input id="rightErasure" name="rightErasure" type="text" value="" class="datePk">
                      </label>
                    </section>
                  </div>
                  <div class="row">
                    <section class="col col-6">
                      <label class="label">발행기관</label>
                      <label class="input">
                        <i class="icon-prepend fa fa-building"></i>
                        <input id="rightInstitution" name="rightInstitution" type="text" value="">
                      </label>
                    </section>
                    <section class="col col-6">
                      <label class="label">말소사유</label>
                      <label class="input">
                        <i class="icon-prepend fa fa-comment"></i>
                        <input id="erasureContent" name="erasureContent" type="text" >
                      </label>
                    </section>
                  </div>
                  <section>
                    <label class="label">자격(면허)증 사본</label>
                    <label for="file" class="input input-file">
                       <input type="file" id="licenseImg" name="licenseImg">

                    </label>
                  </section>
                </fieldset>
              </form>
            </div>
          
			<script src="//code.jquery.com/jquery.min.js"></script>
			<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
            <script type="text/javascript">
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
            function  save(){
            	
            	document.licenseform.action = "${root}/license?act=licenseUpdate";
                document.licenseform.submit();
            }
            </script>
          </div>
          <div class="modal-footer">
            <a class="btn btn-info btn-sm" data-dismiss="modal" onclick="javascript:save();">저장</a>
            <a class="btn btn-danger btn-sm" data-dismiss="modal">닫기</a>
          </div>
        </div>
      </div>
    
<!-- ========================모달 팝업=============================== -->
