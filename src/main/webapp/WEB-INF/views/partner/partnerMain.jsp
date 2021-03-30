<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>제휴업체 메인페이지</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
       rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
  <link rel="stylesheet" href="${path}/css/headerfooter.css" />
  <script src="${path}/js/jquery-3.5.1.js"></script>
</head>

 <jsp:include page="../common/header.jsp" />
 <jsp:include page="../common/nav.jsp" />
 
<section>
  <div class="container">
    <div class="card text-white bg-secondary bg-gradient my-5 py-5 text-center">
      <div class="card-body">
        <p class="text-white m-">데려다줄개는 제휴업체와의 연계를 통하여 <span style="color: red;"><b>긴급콜</b></span> 을 호출할 수 있습니다.</p>
        <br><br>
        <div class="container show-grid">
          <div class="row">
            <div class="col-md-3" style="text-align: right;"><img class="img-fluid" src="${path}/images/emergencyyy.png" style="width: 100px;"></div>
            <div class="col-md-9" style="text-align: left;">
              <p><b>긴급콜</b> 이란 ?</p>
              <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '긴급상황 시 제휴 병원에 예약을 하여 도착하자마자</p>
              <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 바로 의사의 진료를 통하여 처방 및 수술을 받을 수 있도록 하는 서비스'</p>
              <span>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                * 긴급콜로 발생하는 요금은 기본 요금의 2배로 측정되어 계산됩니다.
              </span>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <div class="container show-grid text-center">
      <div class="row">
        <div class="col-md-4">
          <a href="">
            <img class="img-fluid" style="width: 250px;" src="${path}/images/hospital.jpg"></a>
            <br><br>
            <h3>병원</h3>
        </div>
        <div class="col-md-4">
          <a href="">
            <img class="img-fluid" style="width: 250px;" src="${path}/images/kindergardennn.png" alt=""></a>
            <br><br>
            <h3>유치원</h3>
        </div>
        <div class="col-md-4">
          <a href="">
            <img class="img-fluid" style="width: 250px;" src="${path}/images/shoppp.png" alt=""></a>
            <br><br>
            <h3>샵</h3>
        </div>
      </div>

          
    </div>

  </div>
  <!-- /.container -->
</section>

  <jsp:include page="../common/footer.jsp" />

</html>