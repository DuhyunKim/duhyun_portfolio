<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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