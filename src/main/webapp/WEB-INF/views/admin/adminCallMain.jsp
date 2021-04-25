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
    <style>
      section {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        background-color: rgba(0, 0, 0, 0.05);
      }

      .heightbox {
        width: 300px;
        height: 300px;
      }
      .admin__elements {
        background-color: #86f3ff;
      }
      .admin-box__elements {
        border: none;
      }
      .wheather-box {
        width: 200px;
        display: block;
        margin-bottom: 10px;
      }
      .chart-box {
        width: 400px;
        height: 300px;
        border: 1px solid black;
      }
    </style>

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
        <div
          id="adminSidebar"
          class="p-3"
          style="width: 280px; height: auto; background-color: #4ec7f2"
        ></div>
        <!-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑-->
        <!-- 여기까지 건들지마세요-->
        <!-- 여기까지 건들지마세요-->
        <!-- 여기까지 건들지마세요-->

        <div class="container mx-0 p-3" style="width: 1120px">
          <div class="container d-flex row mx-3 p-0">
            <!-- 여기서 부터 작업하세용 -->
            <!-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓-->
            <div class="container">
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
                    예약 차트
                  </div>
                  <div class="card-body text-dark">
                    <div class="row">
                      <div class="col-xs-12 mb-3" style="text-align: end">
                        <form action="get">
                          <input type="date" /> <span>~ </span
                          ><input type="date" />
                          <input type="button" value="검색" />
                        </form>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-6 m-2 chart-box">차트</div>
                      <div class="col-md-6 m-2 chart-box">차트</div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-xs-12">
                  <div class="card border-dark mb-3 admin-box__elements">
                    <div class="card-header fs-4 fw-bolder admin__elements">
                      예약 정보 (다른 것을 추가하게 되면 바꿀 부분)
                    </div>
                    <div class="card-body text-dark">
                      <div
                        class="d-flex justify-content-end"
                        style="margin-bottom: 10px"
                      >
                      
                      </div>
                      <div
                        aria-label="Page navigation example"
                        class="d-flex justify-content-center"
                      >
                        <ul class="pagination">
                          <li class="page-item">
                            <a class="page-link" href="#" aria-label="Previous">
                              <span aria-hidden="true">&laquo;</span>
                            </a>
                          </li>
                          <li class="page-item">
                            <a class="page-link" href="#">1</a>
                          </li>
                          <li class="page-item">
                            <a class="page-link" href="#">2</a>
                          </li>
                          <li class="page-item">
                            <a class="page-link" href="#">3</a>
                          </li>
                          <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                              <span aria-hidden="true">&raquo;</span>
                            </a>
                          </li>
                        </ul>
                      </div>
                    </div>
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
