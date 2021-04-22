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
    <title>데려다줄개홈</title>
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
    <script
      src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"
      integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js"
      integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc"
      crossorigin="anonymous"
    ></script>
    <script src="//code.jquery.com/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
    
	<link 
		rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" 
		integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" 
		crossorigin="anonymous">
	
    <link rel="stylesheet" href="${path}/css/headerfooter.css" />
	<style type="text/css">
		.mainPcard:hover {
			border: 1px ridge;
		}
	</style>
  </head>
  <body class="body-wrap">
	
  <jsp:include page="../common/header.jsp" />
  <jsp:include page="../common/nav.jsp" />
    <section>
      <div class="section-wrap flex-column align-items-center">
        <div class="big-img-wrap">
          <img
            src="${path }/images/main.png"
            class="img-fluid big-img section-width"
          />
          <div class="p-wrap-first">
            <p class="p1 fs-2 h-100">Premium <br />반려동물 픽업서비스</p>
            <p class="p2 fs-6 h-100">
              데려다줄개에서 당신의 소중한 반려견을 위한<br />
              프리미엄 반려동물 픽업 서비스를 시작합니다.
            </p>
          </div>
        </div>
        <div class="section-width container d-flex justify-content-end">
          <img
            class="img-fluid small-dogs"
            src="${path }/images/dogs.png"
            alt=""
          />
        </div>
        <div
          class="d-flex fee-search section-width flex-column container-fluid"
          style="height: 360px"
        >
          <div class="row align-items-start mt-2">
            <div class="col-lg-12 m-5 fee-search-title">
              이동요금을 미리 알아보세요.
            </div>
          </div>
          <div class="row justify-content-center fee-search-input container mt-4">
            <div class="col-md-1">
              <img src="${path }/images/carImg.png" alt="" style="height: 55px"/>
            </div>
            <div class="col-md-3 ">
              <input type="text" class="form-control" placeholder="출발지" style="height: 50px"/>
            </div>
            <div class="col-md-3">
              <input type="text" class="form-control" placeholder="도착지" style="height: 50px"/>
            </div>
            <div class="col-md-2">
              <button type="button" class="btn btn-outline-light" style="height: 50px">
                확인하기
              </button>
            </div>
          </div>
          <div class="mx-4">
          <p class="fee-search-info">
            * 저희 데려다줄개는 전국 픽업서비스를 제공합니다.
          </p>
          </div>
        </div>

        <div class="container flex-column section-width my-5">
          <div class="h3 fw-bold mx-5">데려다줄개의 서비스</div>
          <div class="container">
            <div class="row my-5">
              <div class="col-md-4 col-sm-12">
                <i
                  class="col-12 fas fa-sms fa-8x text-center img-fluid my-3"
                ></i>
                <p class="h4 col-12 text-center">
                  <br />목적지 도착시 문자 알림
                </p>
              </div>
              <div class="col-md-4 col-sm-12">
                <i
                  class="col-12 fas fa-won-sign fa-8x text-center img-fluid my-3"
                ></i>
                <p class="h4 col-12 text-center">
                  서비스 종료시<br />
                  가상계좌를 통한 입금 가능
                </p>
              </div>
              <div class="col-md-4 col-sm-12">
                <i class="col-12 fas fa-car fa-8x text-center img my-3"></i>
                <p class="h4 col-12 text-center">
                  <br />드라이버 위치 확인 가능
                </p>
              </div>
            </div>
          </div>
        </div>

        <div class="container-fluid section-width w-80 my-5">
          <img src="${path }/images/EMERGENCY.png" class="img-fluid" alt="..." />
        </div>
        
        <div
          class="section-width container-fluid main-review mb-5"
          style="padding: 0 50px"
        >
          <div class="h3 fw-bold">리뷰</div>
          <div class="container row row-cols-1 row-cols-lg-3 g-4 mt-3">
            <div class="col">
              <a class="card h-100 text-decoration-none text-reset" href="...">
                <img src="..." class="card-img-top" alt="..." />
                <div class="card-body overflow-hidden" style="height: 300px">
                  <h5 class="card-title text-decoration-underline">
                    첫번째 리뷰
                  </h5>
                  <p class="card-text">
                    This is a longer card with supporting text below as a
                    natural lead-in to additional content. This content is a
                    little bit longer.
                  </p>
                </div>
              </a>
            </div>
            <div class="col">
              <a class="card h-100 text-decoration-none text-reset" href="...">
                <img src="..." class="card-img-top" alt="..." />
                <div class="card-body overflow-hidden">
                  <h5 class="card-title text-decoration-underline">
                    두번째 리뷰
                  </h5>
                  <p class="card-text">This is a short card.</p>
                </div>
              </a>
            </div>
            <div class="col">
              <a class="card h-100 text-decoration-none text-reset" href="...">
                <img src="..." class="card-img-top" alt="..." />
                <div class="card-body overflow-hidden">
                  <h5 class="card-title text-decoration-underline">
                    세번째 리뷰
                  </h5>
                  <p class="card-text">
                    This is a longer card with supporting text below as a
                    natural lead-in to additional content.
                  </p>
                </div>
              </a>
            </div>
          </div>
        </div>

        <div class="container show-grid align-items-center p-3">
          <div class="container section-width flex-column">
            <div class="col-12 p-2 my-5" style="background-color: #4ec7f2">
              <p class="text-white fw-bold h3 mx-5 p-2">제휴업체 보러가기</p>
            </div>
            <div class="row container mx-1">
              <div class="col-md-4 col-sm-12 text-center p-4 mainPcard">
                <a href="${path}/partner/partHospital">
                  <img class="img-fluid pt-3" src="${path}/images/hos1.png" alt="" />
                </a>
                <div class="h4 fw-bold my-3">병원</div>
              </div>
              <div class="col-md-4 col-sm-12 text-center p-4 mainPcard">
                <a href="${path}/partner/partKindergarten">
                  <img
                    class="img-fluid"
                    src="${path }/images/school1.png"
                    alt=""
                  />
                </a>
                <div class="h4 fw-bold my-3">유치원</div>
              </div>
              <div class="col-md-4 col-sm-12 text-center p-4 mainPcard">
                <a href="${path}/partner/partShop">
                  <img class="img-fluid" src="${path }/images/shop1.png" alt="" />
                </a>
                <div class="h4 fw-bold my-2">샵</div>
              </div>
            </div>
          </div>
        </div>

        <div
          class="container-fluid align-items-center bg-secondary bg-gradient text-white mb-2 section-width"
        >
          <div class="row">
            <p class="col-md-12 h3 fw-bold m-5">
              데려다줄개의 드라이버를 모집합니다.
            </p>
            <p class="col-md-12 mx-5 mb-5">
              반려동물 택시 드라이버가 되어 보세요. <br />
              운전자가 원하는 운행 경로 시간대의 예약을 선택하여 반려동물을
              목적지에 이동 시켜주며 수입을 창출할 수 있습니다.<br />
              지금 '<a class="text-white" href="${path}/driver/">드라이버지원</a>' 을 확인해
              보세요
            </p>
          </div>
        </div>
      </div>
    </section>

  <jsp:include page="../common/footer.jsp" />
  </body>
</html>
