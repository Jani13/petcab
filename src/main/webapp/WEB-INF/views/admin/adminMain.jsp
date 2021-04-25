<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<style>
 .listHover:hover {
 	background-color: seashell;
 }
</style>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>데려다줄개 - 관리자 페이지</title>
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
    <link rel="stylesheet" href="${path}/css/adminpage.css" />
    <link rel="stylesheet" href="${path}/css/headerfooter.css" />
    <script src="${path}/js/jquery-3.5.1.js"></script>
  </head>
  <body onload="go_time()">
  <jsp:include page="../common/header.jsp" />
  <jsp:include page="../common/nav.jsp" />
    <section>
      <div class="container d-flex mx-0 p-0">
        <!-- 건들지마세요 -->
        <!-- 건들지마세요 -->
        <!-- 건들지마세요 -->
        <!-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓-->
  <jsp:include page="../common/adminSideBar.jsp" />
        <!-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑-->
        <!-- 여기까지 건들지마세요-->
        <!-- 여기까지 건들지마세요-->
        <!-- 여기까지 건들지마세요-->

        <div class="container mx-0 p-2" style="width: 1120px">
          <div class="container d-flex row mx-3 ">
            <!-- 여기서 부터 작업하세용 -->
            <!-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓-->
            <div class="row pt-4">
              <div class="col-md-4">
                <div
                  class="card border-dark mb-3 admin-box__elements"
                  style="max-width: 18rem"
                >
                  <div class="card-header fs-4 fw-bolder admin__elements">
                    총 회원수
                  </div>
                  <div class="card-body text-dark">
                    <h5
                      class="card-title fs-4 fw-bolder"
                      style="text-align: center"
                    >
                      ${memberCount}명
                    </h5>
                  </div>
                </div>
              </div>
              <div class="col-md-4">
                <div
                  class="card border-dark mb-3 admin-box__elements"
                  style="max-width: 18rem"
                >
                  <div class="card-header fs-4 fw-bolder admin__elements">
                    오늘 방문자수
                  </div>
                  <div class="card-body text-dark">
                    <h5
                      class="card-title fs-4 fw-bolder"
                      style="text-align: center"
                    >
                    ${todayVisitorCount}명 
                    </h5>
                  </div>
                </div>
              </div>
              <div class="col-md-4">
                <div
                  class="card border-dark mb-3 admin-box__elements"
                  style="max-width: 18rem"
                >
                  <div
                    class="card-header fs-4 fw-bolder admin__elements fs-4 fw-bolder"
                  >
                    오늘 결제금액
                  </div>
                  <div class="card-body text-dark">
                    <h5
                      class="card-title fs-4 fw-bolder"
                      style="text-align: center"
                    >
                      ${amountAll}원
                    </h5>
                  </div>
                </div>
              </div>
              <div class="col-xs-12">
                <div class="card border-dark mb-3 admin-box__elements">
                  <div class="card-header fs-4 fw-bolder admin__elements" id="clock">
                    	
                  </div>
                  <div style="padding: 0 30px">
                    <div
                      class="card-body text-dark row"
                      style="display: flex; justify-content: space-between"
                    >
                      <button
                        type="button"
                        class="btn btn-primary btn-lg col-12"
                        style="height: 200px;"
                        disabled
                      >
                        <div class="CurrIcon fa-3x"></div>
                        <div class="CurrTemp fw-bolder"></div>
                        <div class="City fw-bolder"></div>
                      </button>
                      
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-xs-12">
                <div class="card border-dark mb-3 admin-box__elements">
                  <div class="card-header fs-4 fw-bolder admin__elements">
                    당일 예약 현황
                  </div>

                  <div style="padding: 0 30px">
                    <div
                      class="card-body text-dark row"
                      style="display: flex; justify-content: space-between"
                    >
                      <button
                        type="button"
                        class="btn btn-secondary btn-lg col-auto"
                        style="width: 180px"
                      >
                        <h5 class="fs-4 fw-bolder">총 예약건</h5>
                        <h6>${allCall}건</h6>
                      </button>
                      <button
                        type="button"
                        class="btn btn-secondary btn-lg col-auto"
                        style="width: 180px"
                      >
                        <h5 class="fs-4 fw-bolder">일반 예약</h5>
                        <h6>${genCall}건</h6>
                      </button>
                      <button
                        type="button"
                        class="btn btn-secondary btn-lg col-auto"
                        style="width: 180px"
                      >
                        <h5 class="fs-4 fw-bolder">긴급 콜</h5>
                        <h6>${emergCall}건</h6>
                      </button>
                      <button
                        type="button"
                        class="btn btn-secondary btn-lg col-auto"
                        style="width: 180px"
                      >
                        <h5 class="fs-4 fw-bolder">취소</h5>
                        <h6>${cancelledCall}건</h6>
                      </button>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-xs-12">
                <div class="card border-dark mb-3 admin-box__elements">
                  <div class="card-header fs-4 fw-bolder admin__elements">
                    문의 알림
                  </div>
                  <div class="card-body text-dark">
                    <table class="table table-striped">
                      <thead>
                        <tr>
                          <th scope="col">일시</th>
                          <th scope="col">내용</th>
                          <th scope="col">작성자</th>
                        </tr>
                      </thead>
                      <tbody>
                      	<c:forEach var="list" items="${list}" end="2">
                        <tr class="listHover" onclick="location.href='${path}/ques/view?quesNo=${list.quesNo}'" style="cursor: pointer;">
                          <td>${list.postDate}</td>
                          <td>${list.title}</td>
                          <td>${list.userId}</td>
                        </tr>                      	
                      	</c:forEach>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
            <!-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑-->
            <!-- 여기 까지 -->
          </div>
        </div>
      </div>
    </section>
   
  <jsp:include page="../common/footer.jsp" />
    <script
      src="https://kit.fontawesome.com/0fe4d45686.js"
      crossorigin="anonymous"
    ></script>
    <script type="text/javascript">
    	function go_time() {
			var	now = new Date();
			
			var year = now.getFullYear();
			var month = now.getMonth()+1;
			month = month >= 10 ? month : '0' + month;
			var date = now.getDate(); 
			date = date >= 10 ? date : '0' + date;
			var hour = now.getHours();
			var min = now.getMinutes(); 
			var sec = now.getSeconds();
			
			var week = new Array("일", "월", "화", "수", "목", "금", "토");
			
			
			document.getElementById("clock").innerHTML 
			 = year+"년 "+ month +"월 "+ date +"일 " + week[now.getDay()] + "요일 " + hour + ":"+ min +":"+ sec
			 //id가 clock인 html에 현재시각을 넣음
			 
			 setTimeout("go_time()", 1000);
		}
    	
    	$(document).ready(function() { 
    		let weatherIcon = { 
    				'01' : 'fas fa-sun', 
    				'02' : 'fas fa-cloud-sun', 
    				'03' : 'fas fa-cloud', 
    				'04' : 'fas fa-cloud-meatball', 
    				'09' : 'fas fa-cloud-sun-rain', 
    				'10' : 'fas fa-cloud-showers-heavy', 
    				'11' : 'fas fa-poo-storm', 
    				'13' : 'far fa-snowflake', 
    				'50' : 'fas fa-smog' 
    		};
    		
    		$.ajax({ 
    			url:'http://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=b8fbfc238137e86d2625f29e9516ce38&units=metric', 
    			dataType:'json', 
    			type:'GET', 
    			success:function(data){ 
    				var $Icon = (data.weather[0].icon).substr(0,2); 
    				var $Temp = Math.floor(data.main.temp) + 'º'; 
    				var $city = data.name; 
    					
    				$('.CurrIcon').append('<i class="' + weatherIcon[$Icon] +'"></i>'); 
    				$('.CurrTemp').prepend($Temp); 
    				$('.City').append($city); 
    				} 
    			}) 
    		});  	
    </script>
  </body>
</html>
