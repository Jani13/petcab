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
  <body>
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

        <div class="container mx-0 p-3" style="width: 920px">
          <div class="container d-flex row mx-3 p-0">
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
                      100 명
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
                      3명
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
                      3천원
                    </h5>
                  </div>
                </div>
              </div>
              <div class="col-xs-12">
                <div class="card border-dark mb-3 admin-box__elements">
                  <div class="card-header fs-4 fw-bolder admin__elements">
                    2021-03-28 12:21
                  </div>
                  <div style="padding: 0 30px">
                    <div
                      class="card-body text-dark row"
                      style="display: flex; justify-content: space-between"
                    >
                      <button
                        type="button"
                        class="btn btn-primary btn-lg col-auto"
                        disabled
                      >
                        <span class="wheather-box">
                          <i class="fas fa-thermometer-half fa-2x"></i>
                        </span>
                        <h3 class="fw-bolder">온도</h3>
                        <h5>30도</h5>
                      </button>
                      <button
                        type="button"
                        class="btn btn-primary btn-lg col-auto"
                        disabled
                      >
                        <span class="wheather-box"
                          ><i class="far fa-sad-tear fa-2x"></i
                        ></span>
                        <h3 class="fw-bolder">미먼세지</h3>
                        <h5>아주 나쁨</h5>
                      </button>
                      <button
                        type="button"
                        class="btn btn-primary btn-lg col-auto"
                        disabled
                      >
                        <span class="wheather-box"
                          ><i class="fas fa-smog fa-2x"></i
                        ></span>
                        <h3 class="fw-bolder">날씨</h3>
                        <h5>별로</h5>
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
                        <h6>1건</h6>
                      </button>
                      <button
                        type="button"
                        class="btn btn-secondary btn-lg col-auto"
                        style="width: 180px"
                      >
                        <h5 class="fs-4 fw-bolder">일반 예약</h5>
                        <h6>1건</h6>
                      </button>
                      <button
                        type="button"
                        class="btn btn-secondary btn-lg col-auto"
                        style="width: 180px"
                      >
                        <h5 class="fs-4 fw-bolder">긴급 콜</h5>
                        <h6>1건</h6>
                      </button>
                      <button
                        type="button"
                        class="btn btn-secondary btn-lg col-auto"
                        style="width: 180px"
                      >
                        <h5 class="fs-4 fw-bolder">취소</h5>
                        <h6>1건</h6>
                      </button>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-xs-12">
                <div class="card border-dark mb-3 admin-box__elements">
                  <div class="card-header fs-4 fw-bolder admin__elements">
                    알림
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
                        <tr>
                          <td>2021/03/28</td>
                          <td>노트북안가져와요?</td>
                          <td>윤정일</td>
                        </tr>
                        <tr>
                          <td>2021/03/28</td>
                          <td>노트북안가져와요?</td>
                          <td>윤정일</td>
                        </tr>
                        <tr>
                          <td>2021/03/28</td>
                          <td>노트북안가져와요?</td>
                          <td>윤정일</td>
                        </tr>
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
  </body>
</html>
