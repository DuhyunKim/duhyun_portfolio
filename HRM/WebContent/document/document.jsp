<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/user_common.jsp" %>
<%@ include file="/document/doc_leftmenu.jsp" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

 
      <div id="page-wrapper">
        <div class="container-fluid">
          <!-- Page Heading -->
          <div class="row">
            <div class="col-lg-12">
              <h1 class="page-header">기안서 작성
                <small>결재 양식 목록</small>
              </h1>
              
            </div>
          </div>
          <!-- /.row -->
          <div class="col-lg-12">
            <div class="table-responsive">
              <table class="table table-bordered table-hover table-striped">
                <thead>
                  <tr>
                    <th>구분</th>
                    <th>결재양식명</th>
                    <th>표시순서</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>기본서식</td>
                    <td>기안서</td>
                    <td>1</td>
                    <td style="width:100px;">
                      <button type="button" class="btn btn-info  btn-xs">기안서 작성</button>
                    </td>
                  </tr>
                  <tr>
                    <td>기본서식</td>
                    <td>품의서</td>
                    <td>2</td>
                    <td style="width:100px;">
                      <button type="button" class="btn btn-info  btn-xs">기안서 작성</button>
                    </td>
                  </tr>
                  <tr>
                    <td>기본서식</td>
                    <td>지출 결의서</td>
                    <td>3</td>
                    <td style="width:100px;">
                      <button type="button" class="btn btn-info  btn-xs">기안서 작성</button>
                    </td>
                  </tr>
                  <tr>
                    <td>기본서식</td>
                    <td>휴가계</td>
                    <td>4</td>
                    <td style="width:100px;">
                      <a href="${root }/doc?act=mvDocVacation"><button type="button" class="btn btn-info  btn-xs" >기안서 작성</button></a>
                    </td>
                  </tr>
                  <tr>
                    <td>기본서식</td>
                    <td>회의록</td>
                    <td>5</td>
                    <td style="width:100px;">
                      <button type="button" class="btn btn-info  btn-xs" >기안서 작성</button>
                    </td>
                  </tr>
                  <tr>
                    <td>기본서식</td>
                    <td>발주서</td>
                    <td>6</td>
                    <td style="width:100px;">
                      <button type="button" class="btn btn-info  btn-xs">기안서 작성</button>
                    </td>
                  </tr>
                  <tr>
                    <td>기본서식</td>
                    <td>출장계</td>
                    <td>7</td>
                    <td style="width:100px;">
                      <button type="button" class="btn btn-info  btn-xs">기안서 작성</button>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div class="dt-toolbar-footer">
               <div class="col-sm-4">
                  <div  class="dataTables_info2 " style="margin: 20px 0;"><b>Total : 7</b></div>
               </div>
               
               </div>
          </div>
          <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
      </div>
      <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
    <!-- jQuery -->
    <script src="${root}/js/jquery.js"></script>
    <script src="${root}/js/bootstrap.min.js"></script>
    <!-- Morris Charts JavaScript -->
    <script src="${root}/js/plugins/morris/raphael.min.js"></script>
    <script src="${root}/js/plugins/morris/morris.min.js"></script>
    <script src="${root}/js/plugins/morris/morris-data.js"></script>
  

</body></html>