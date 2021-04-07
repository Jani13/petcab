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
  <title>제휴업체 병원페이지</title>
  <script src="${path}/js/jquery-3.5.1.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
       rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
  <link rel="stylesheet" href="${path}/css/headerfooter.css" />
  <script src="${path}/js/jquery-3.5.1.js"></script>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<style>
  /* div{
    border: red solid 1px;
  } */
</style>

  <jsp:include page="../common/header.jsp" />
  <jsp:include page="../common/nav.jsp" />
  
<section>
  <div class="container">
    <div class="card text-white my-4 py-5 text-center" style="background-color: #4ec7f2">
      <div class="card-body">
        <p class="text-white fw-bold fs-3">
        	데려다줄개는 제휴업체와의 연계를 통하여 
        	<span style="color: red;"><b>긴급콜</b></span> 
        	을 호출할 수 있습니다.
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
	
	
	
	
	
	<!-- 0406_이슬 화면에 어떻게 뿌려줄지 테스트 중입니다.∨∨∨∨∨∨∨∨∨∨∨∨∨∨∨∨ -->
	
	<div class="container my-5">
      	<div class="row">
	        <div class="col">
	        	<div class="input-group mx-1 d-flex justify-content-end row">
          			<input type="text" class="form-control col-md-3" name="" id="" placeholder="입력해주세요">
          			<input type="button" class="btn btn-secondary bg-gradient col-md-1" id="" onclick="" value="검색하기"></input>
        		</div>
	        	<ul class="nav nav-tabs">
	            	<li class="nav-item">
	                	<a class="nav-link active text-info" data-toggle="tab" href="#all">모두보기</a>
	              	</li>
	            	<li class="nav-item">
	                	<a class="nav-link text-info" data-toggle="tab" href="#hospital">병원</a>
	              	</li>
		        	<li class="nav-item">
		                <a class="nav-link text-info" data-toggle="tab" href="#kinGar">유치원</a>
		            </li>
	              	<li class="nav-item">
	                	<a class="nav-link text-info" data-toggle="tab" href="#shop">샵</a>
	              	</li>
	          	</ul> 
	            <div class="tab-content container pt-4">
	            	<div class="tab-pane fade show active row d-flex justify-content-between" id="all" style="height: 350px;">
                  		<div class="card col-md-3" style="height: 350px;">
                    		<img src="${path}/images/hos1.png" class="card-img-top h-50 my-2 rounded-3" alt="">
                   			<div class="card-body">
                   				<p>위치 : </p>
                   				<p>전화번호 : </p>
                   				<p>운영시간 : </p>
                   			</div>
                  		</div>
		                <div class="card col-md-3" style="height: 350px;">
		                	<img src="${path}/images/mung.png" class="card-img-top h-50 my-2 rounded-3" alt="">
		                    <div class="card-body">
		                    	<p>위치 : </p>
                   				<p>전화번호 : </p>
                   				<p>운영시간 : </p>
		                    </div>
		                </div>
		                <div class="card col-md-3" style="height: 350px;">
		                	<img src="${path}/images/hos1.png" class="card-img-top h-50 my-2 rounded-3" alt="">
		                    <div class="card-body">
		                    	<p>위치 : </p>
                   				<p>전화번호 : </p>
                   				<p>운영시간 : </p>
		                    </div>
		                </div>
	              	</div>
	            	<div class="tab-pane fade row d-flex justify-content-between" id="hospital">
	            		<p>병원 보여 줄꺼야</p>
	              	</div>
	              	<div class="tab-pane fade" id="kinGar">
	                	<p>유치원 보여 줄꺼야</p>
	              	</div>
	              	<div class="tab-pane fade" id="shop">
	                	<p>샵 보여 줄꺼야</p>
	              	</div>
	            </div>
	        </div>
    	</div>
    </div>
	<!-- 테스트 중입니다 ^^^^^^^^^^^^^^^^^^^^^-->	
	
	



	
    <div class="row">
      <div class="col-md-8"></div>
      <div class="col-md-4">
        <div class="input-group mb-1">
          <input type="text" class="form-control" name="" id="" placeholder="입력해주세요">
          <input type="button" class="btn btn-secondary bg-gradient" id="" onclick="" value="검색하기"></input>
        </div>
      </div>
    </div>

    <div class="card text-white bg-secondary bg-gradient my-3 py-3 text-left">
      <span style="margin-left: 20px;"> 제휴병원</span>
    </div>

     <!-- 나중에 꼭 div 생성할 시에 밑으로만 늘어나서
        페이징 처리가 쓸모없지 않도록 하기 -->
    
     
    <div style="text-align: center;">
        <h3 style="padding-top: 50px;">제휴병원이 존재하지 않습니다.</h3>
    </div>
 
    <div class="row row-cols-1 row-cols-md-4 g-4">
        
      <div class="col" style="height: fit-content;">
        <div class="card">
          <a href="제휴업체에서 만든 에디터가 보이는 페이지 연결">
            <img src="" class="card-img-top" alt="..."></a>
          <div class="card-body">
            <h5 class="card-title" style="text-align: center;"><!-- 제휴업체 이름이 들어가야하는 부분 --></h5>
            <p class="card-text">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 위치 : 
              <span><!-- 위치가 들어가는 부분 --></span></p>
            <p class="card-text">전화번호 : 
              <span><!-- 전화번호가 들어가는 부분 --></span></p>
            <p class="card-text">운영시간 : 
              <span><!-- 운영시간이 들어가는 부분 --></span></p>
          </div>
        </div>
      </div>
    
    </div>
    <br><br>

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
       
          <li><a class="page-link" href="채워야하는부분">&gt;</a></li>
          <li class="page-item">
            <a class="page-link" href="채워야하는부분">&gt;&gt;</a></li>
        </ul>
      </nav>
    </div>
    
  </div>
</section>
  <jsp:include page="../common/footer.jsp" />
</html>
