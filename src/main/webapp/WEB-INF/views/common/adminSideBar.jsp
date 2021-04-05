<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<div id="adminSidebar" class="p-3" style="width: 280px; height: auto; background-color: #4ec7f2">
<a
  href="${path}/admin/adminMain"
  class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom"
>
  <span class="fs-5 fw-semibold text-light fs-2 fw-bolder">Adminpage</span>
</a>
<ul class="list-unstyled ps-0">
  <li class="mb-1">
    
    <button class="btn btn-toggle align-items-center rounded fs-5 fw-bold collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="false">
      회원정보 조회
    </button>
    <div class="collapse" id="home-collapse">
      <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small p-2">
        <li>
          <a
            href="${path}/admin/info/"
            class="link-dark rounded text-dark text-decoration-none fw-bold fs-5"
            >All</a
          >
        </li>
        <li>
          <a
            href="${path}/admin/info/user"
            class="link-dark rounded text-white text-decoration-none"
            >일반회원</a
          >
        </li>
        <li>
          <a
            href="${path}/admin/info/driver"
            class="link-dark rounded text-white text-decoration-none"
            >드라이버</a
          >
        </li>
        <li>
          <a
            href="${path}/admin/info/partner"
            class="link-dark rounded text-white text-decoration-none"
            >업체</a
          >
        </li>
      </ul>
    </div>
  </li>
  <li class="mb-1">
    <button
      class="btn btn-toggle align-items-center rounded collapsed fs-5 fw-bold"
      data-bs-toggle="collapse"
      data-bs-target="#dashboard-collapse"
      aria-expanded="false"
    >
      예약목록 확인
    </button>
    <div class="collapse" id="dashboard-collapse">
      <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small p-2">
        <li>
          <a href="${path}/admin/call/normal" class="link-dark rounded text-white text-decoration-none"
            >일반예약</a
          >
        </li>
        <li>
          <a href="${path}/admin/call/emergency" class="link-dark rounded text-white text-decoration-none"
            >긴급콜</a
          >
        </li>
        <li>
          <a href="${path}/admin/call/cancel" class="link-dark rounded text-white text-decoration-none"
            >예약취소</a
          >
        </li>
      </ul>
    </div>
  </li>
  <li class="mb-1">
    <button
      class="btn btn-toggle align-items-center rounded collapsed fs-5 fw-bold"
      data-bs-toggle="collapse"
      data-bs-target="#orders-collapse"
      aria-expanded="false"
    >
      결제내역 관리
    </button>
    <div class="collapse" id="orders-collapse">
      <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small p-2">
        <li>
          <a href="${path}/admin/pay" class="link-dark rounded text-white text-decoration-none"
            >결제내역</a
          >
        </li>
      </ul>
    </div>
  </li>
  <li class="mb-1">
    <button
      class="btn btn-toggle align-items-center rounded collapsed fs-5 fw-bold"
      data-bs-toggle="collapse"
      data-bs-target="#approve-collapse"
      aria-expanded="false"
    >
      승인 관리
    </button>
    <div class="collapse" id="approve-collapse">
      <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small p-2">
        <li>
          <a href="${path}/admin/apply/driver" class="link-dark rounded text-white text-decoration-none"
            >드라이버</a
          >
        </li>
        <li>
          <a href="${path}/admin/apply/partner" class="link-dark rounded text-white text-decoration-none"
            >제휴업체</a
          >
        </li>
      </ul>
    </div>
  </li>
  <li class="border-top my-3"></li>
</ul>
</div>
