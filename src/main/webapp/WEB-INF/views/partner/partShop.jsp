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
  <title>제휴업체 샵페이지</title>
  
  	<script src="${path}/js/jquery-3.5.1.js"></script>
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
       	  rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
  	<link rel="stylesheet" href="${path}/css/headerfooter.css" />
  	<script src="${path}/js/jquery-3.5.1.js"></script>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" 
		  integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" 
		  crossorigin="anonymous">
	  
</head>

  <jsp:include page="../common/header.jsp" />
  <jsp:include page="../common/nav.jsp" />
  
<section>
  <div class="container">
    <div class="card text-white mt-4 py-5 text-center" style="background-color: #4ec7f2">
      <div class="card-body">
        <p class="text-white fw-bold fs-3">
        	데려다줄개는 제휴업체와의 연계를 통하여 
        	<span style="color: red;"><b>긴급콜</b></span> 을 
        	호출할 수 있습니다.
        </p>
        <br><br>
        <div class="container show-grid">
          <div class="row">
            <div class="col-md-3" style="text-align: right;"><img class="img-fluid" src="${path}/images/emergencyyy.png" style="width: 100px;"></div>
            <div class="col-md-9 fs-5" style="text-align: left;">
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

    <div class="fs-3 fw-bold rounded-3" style="background-color: #86f3ff; height: 60px">
		<p class="mx-4 p-2">샵</p>
	</div>
	<div class="container">
		<!-- <div class="row d-flex justify-content-md-end">
          <div class="col-12 input-group row" style="width: 500px;">
            <input type="text" class="form-control col-md-3" name="" id="" placeholder="입력해주세요"/>
            <input type="button" class="btn btn-secondary bg-gradient col-md-3" id="" onclick="" value="검색하기"/>
          </div>
        </div> -->
        
        <c:if test="${partnerList == null}">
        <div style="text-align: center;">
        	<h3 style="padding: 200px;">제휴업체가 존재하지 않습니다.</h3>
    	</div>
        </c:if>
        
        <c:if test="${partnerList != null}">
       	<div class="row justify-content-center">
       	
        	<c:forEach var="partner" items="${partnerList}" end="8">
	        <div class="col-md-3 my-5 m-4 card" style="height: 450px; cursor: pointer" onclick="location.href='${path}/'"> 
		    	<p class="fw-bold"><i class="fas fa-store"></i>샵</p>
				<img src="${path}/images/hos1.png" class="imgWrap card-img-top h-50 my-2 rounded-3" alt="" >           			
		        <div class="card-body">
			    	<p>업체명 : ${partner.partnerName}</p>
			        <p>위치 : ${partner.member.address}</p>
			        <p>전화번호 : ${partner.phone}</p>
			        <p>운영시간 : ${partner.openTime}</p>
		        </div>
	        </div>
        	</c:forEach>
        	
        </div>
        </c:if>
	</div>

    <!-- 페이징 파트 -->
    <div style="display: flex; align-items: center; justify-content: center;">
      <nav aria-label="Page navigation example">
        <ul class="pagination">
          <li class="page-item">
            <a class="page-link" href="채워야하는 부분">&lt;&lt;</a></li>
          <li class="page-item">
            <a class="page-link" href="채워야하는 부분">&lt;</a></li>
       
              <li class="page-item">    <!-- aria-disabled="true" 맞는지 코딩할 때 확인해봐야함 -->
                <a class="page-link" aria-disabled="true" href=""></a></li>
         
          <li class="page-item">
            <a class="page-link" href=""></a></li>
        
            <a class="page-link" href="채워야하는부분">&gt;</a></li>
          <li class="page-item">
            <a class="page-link" href="채워야하는부분">&gt;&gt;</a></li>
        </ul>
      </nav>
    </div>
    
  </div>
</section>

  <jsp:include page="../common/footer.jsp" />
  
</html>
