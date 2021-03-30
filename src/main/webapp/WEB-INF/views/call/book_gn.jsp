<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="${path}/css/call.css" />
    <link rel="stylesheet" href="${path}/css/headerfooter.css" />
    <script src="${path}/js/jquery-3.5.1.js"></script>
    <script src="${path}/js/headerfooter.js"></script>

    <title>콜예약</title>
  </head>

  <body>
    <jsp:include page="../common/header.jsp" />
  	<jsp:include page="../common/nav.jsp" />

    <section class="section-wrap">
      <div class="container mt-5 mb-5 bg-light">
        <div class="row row-call-1 text-center">
          <div
            class="col btn-call-gen bg-info h-100 d-flex justify-content-center flex-column"
          >
            <h1 class="text-white">일반</h1>
          </div>
          <div
            class="col btn-call-emg bg-warning h-100 d-flex justify-content-center flex-column"
          >
            <h1 class="text-white">긴급</h1>
          </div>
        </div>

        <div class="row row-call-2">
          <div class="col-md-4 pickup-details">
            <div class="pt-5 pb-3 pickup-heading">
              <h2 class="mb-3" style="margin-left: 10px;">픽업정보 기입</h2>
            </div>

            <div class="pickup-fill-in" style="margin-left: 10px;">
              <form action="">
                <div class="form-group mb-3">
                  <label for="pickup-time">예약 시간</label>
                  <input
                    type="datetime-local"
                    id="pickup-time"
                    name="meeting-time"
                    value="2021-03-25T15:30"
                    min="2018-06-07T00:00"
                    max="2021-04-01T00:00"
                  />
                </div>

                <div class="form-group mb-3">
                  <label>예상 금액</label>

                  <div
                    class="row row-cols"
                    style="margin-left: 0; margin-right: 0"
                  >
                    <div
                      class="col-9"
                      style="padding-left: 0; padding-right: 0"
                    >
                      <input
                        type="text"
                        class="form-control where-from"
                        placeholder="출발지"
                      />
                      <input
                        type="text"
                        class="form-control where-to"
                        placeholder="도착지"
                      />
                    </div>

                    <div
                      class="col-3"
                      style="padding-left: 0; padding-right: 0"
                    >
                      <button
                        class="btn btn-outline-info btn-calc-cost"
                        type="button"
                      >
                        조회
                      </button>
                    </div>
                  </div>

                  <div class="row" style="margin-left: 0; margin-right: 0">
                    <input
                      type="text"
                      class="form-control"
                      placeholder="예상금액 (원)"
                    />
                  </div>
                </div>

                <div class="form-group mb-3">
                  <div class="form-check">
                    <input
                      class="form-check-input"
                      type="checkbox"
                      value=""
                      id="flexCheckDefault"
                    />
                    <label class="form-check-label" for="flexCheckDefault">
                      보호자 탑승 여부
                    </label>
                  </div>
                </div>

                <div class="d-grid gap-1 mb-3">
                  <button class="btn btn-sm btn-outline-info" type="button">
                    애견정보 불러오기
                  </button>
                  <!-- 버튼 클릭 후 애견 선택 시 여기에 애견 프로필 띄우기 -->
                </div>

                <div class="form-floating mb-3">
                  <textarea
                    class="form-control"
                    placeholder="Leave a comment here"
                    id="floatingTextarea"
                  ></textarea>
                  <label for="floatingTextarea">Comments</label>
                </div>

                <div class="d-grid gap-1 mb-3">
                  <button class="btn btn-lg btn-outline-info" type="button">
                    예약하기
                  </button>
                </div>
              </form>
            </div>
          </div>

          <div class="col-md locationMap">지도 API</div>
        </div>
      </div>
    </section>

    <jsp:include page="../common/footer.jsp" />
    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
      crossorigin="anonymous"
    ></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js" integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js" integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc" crossorigin="anonymous"></script>
    -->
  </body>
</html>