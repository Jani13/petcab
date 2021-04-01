<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<nav class="navbar navbar-expand-md navbar-light sticky-top" style="background-color: #86f3ff" >
<div class="container">
  <button
    class="navbar-toggler"
    type="button"
    data-toggle="collapse"
    data-target="#collapsibleNavbar"
  >
    <span class="navbar-toggler-icon"></span>
  </button>
  <div
    class="collapse navbar-collapse justify-content-md-end"
    id="collapsibleNavbar"
  >
    <ul class="navbar-nav mynav-nav">
      <li class="nav-item">
        <a class="nav-link text-black" href="#">예약하기</a>
      </li>
      <li class="nav-item dropdown">
        <a
          class="nav-link dropdown-toggle text-black"
          href="#"
          id="navbarDarkDropdownMenuLink"
          data-bs-toggle="dropdown"
          aria-expanded="false"
          >제휴업체</a
        >
        <ul class="dropdown-menu" aria-labelledby="navbarDarkDropdownMenuLink">
          <li>
            <a class="dropdown-item text-black" href="#">제휴업체검색</a>
          </li>
          <li>
            <a class="dropdown-item text-black" href="#">제휴업체등록</a>
          </li>
        </ul>
      </li>
      <li class="nav-item">
        <a class="nav-link text-black" href="">드라이버지원</a>
      </li>
      
      <c:if test="${loginMember  == null}">
      <li class="nav-item" style="margin-left: 30px;">
        <a class="nav-link text-black" href="${path}/signup/agreement">회원가입</a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-black" href="${path}/login">로그인</a>
      </li>
      </c:if>
    
      
    </ul>
  </div>
</div>
</nav>
