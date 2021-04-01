<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>드라이버 지원 - 데려다줄개</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
      crossorigin="anonymous"
    ></script>
    <script src="${path}/js/jquery-3.5.1.js"></script>
    <link rel="stylesheet" href="${path}/css/headerfooter.css" />
    <link rel="stylesheet" href="${path}/css/driverapply.css" />
  </head>
  <body>
  <jsp:include page="../common/header.jsp" />
  <jsp:include page="../common/nav.jsp" />
    <section class="driver">
      <div class="driver-photo">
        <div>
          <span class="driver-photo__title">드라이버지원</span>
          <span class="driver-photo__text"
            >반려동물을 위한 택시 드라이버가 되어보세요 <br />
          </span>
          <span class="driver-photo__text"
            >운전자가 원하는 운행 경로 시간대의 예약을 선택하여
            <br />
          </span>
          <span class="driver-photo__text"
            >반려동물을 목적지에 이동시켜주며 수입 창출이 가능합니다.<br />
          </span>
          <a href="${path}/driver/apply" class="driver-btn">
            <span class="driver-btn__text">드라이버 지원</span>
          </a>
        </div>
      </div>
      <div>
        <span class="driver-guide__title">드라이버 지원 안내</span>
        <div class="driver-icons">
          <div class="driver-icon">
            <i class="far fa-envelope fa-9x"></i>
            <span>서류지원</span>
          </div>
          <i class="fas fa-arrow-right fa-5x"></i>

          <div class="driver-icon">
            <i class="fas fa-headset fa-9x"></i>
            <span>전화상담</span>
          </div>
          <i class="fas fa-arrow-right fa-5x"></i>
          <div class="driver-icon">
            <i class="fas fa-laptop-code fa-9x"></i>
            <span>교육</span>
          </div>
        </div>
      </div>
      <div class="driver-conditional">
        <span class="driver-conditional__title">드라이버 지원 조건</span>
        <div>
          <ul class="driver-conditional__list">
            <li>
              <i class="fas fa-check"></i>
              <span>자차 차량소지 필수!</span>
            </li>
            <li>
              <i class="fas fa-check"></i>
              <span>언제든지 자유롭게 근무가능!</span>
              (시간대 자유)
            </li>
            <li>
              <i class="fas fa-check"></i>
              <span>학생,전업주부도 지원 가능!</span>
              (투잡도 가능)
            </li>
          </ul>
        </div>
      </div>
      <script
        src="https://kit.fontawesome.com/0fe4d45686.js"
        crossorigin="anonymous"
      ></script>
    </section>
   
  <jsp:include page="../common/footer.jsp" />
  </body>
</html>
