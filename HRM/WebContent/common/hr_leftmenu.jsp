<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
       <div class="collapse navbar-collapse navbar-ex1-collapse">
          <ul class="nav navbar-nav side-nav">
            <li class="active">
              <a href="settlement_gian.html"><i class="fa fa-fw fa-dashboard"></i>사원관리</a>
            </li>
            <li class="active">
              <a href="settlement_gian.html"><i class="fa fa-fw fa-dashboard"></i>부서관리</a>
            </li>
            <li class="active">
              <a href="settlement_gian.html"><i class="fa fa-fw fa-dashboard"></i>인사발령</a>
            </li>
            <li class="active">
              <a href="settlement_gian.html"><i class="fa fa-fw fa-dashboard"></i>연봉 및 연차관리</a>
            </li>
            <li class="active">
              <a href="settlement_gian.html"><i class="fa fa-fw fa-dashboard"></i>업무명세표(전체)</a>
            </li>
            <li class="active">
              <a href="settlement_gian.html"><i class="fa fa-fw fa-dashboard"></i>부서 목표(전체)</a>
            </li>
            <li class="active">
              <a href="${root}/pboard?act=boardlist"><i class="fa fa-fw fa-dashboard"></i>자유게시판</a>
            </li>
            <li class="active">
              <a href=""><i class="fa fa-fw fa-dashboard"></i>통계</a>
            </li>
            <li class="active">
              <a href=""><i class="fa fa-fw fa-dashboard"></i>설정</a>
            </li>
          </ul>
        </div>
        <!-- /.navbar-collapse -->
      </nav>