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
  <jsp:include page="../common/adminSideBar.jsp" />
        <!-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑-->
        <!-- 여기까지 건들지마세요-->
        <!-- 여기까지 건들지마세요-->
        <!-- 여기까지 건들지마세요-->

        <div class="container mx-0 p-3" style="width: 920px">
          <div class="container d-flex row mx-3 p-0">
            <!-- 여기서 부터 작업하세용 -->
            <!-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓-->
            <div class="container">
              <div class="row">
                <div class="col-xs-12">
                  <div class="card border-dark mb-3 admin-box__elements">
                    <div class="card-header fs-4 fw-bolder admin__elements">
                      일반 예약 정보
                    </div>
                    <div class="card-body text-dark">
                      <div
                        class="d-flex justify-content-end"
                        style="margin-bottom: 10px"
                      >
                        <form action="get">
                          <select name="type">
                            <option value="id">아이디</option>
                            <option value="name">날짜</option>
                          </select>
                          <input type="text" />
                          <input type="button" value="검색" />
                        </form>
                      </div>
                      <table class="table table-striped">
                        <thead>
                          <tr>
                            <th scope="col">No</th>
                            <th scope="col">예약번호</th>
                            <th scope="col">출발지</th>
                            <th scope="col">도착지</th>
                            <th scope="col">아이디</th>
                            <th scope="col">날짜</th>
                            <th scope="col">상태</th>
                            <th scope="col">드라이버</th>
                            <th scope="col">차량번호</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td>1</td>
                            <td>00210</td>
                            <td>강남구 가로수길</td>
                            <td>강남구 삼성역</td>
                            <td>user</td>
                            <td>yy/mm.dd</td>
                            <td>진행중</td>
                            <td>아무개</td>
                            <td>12마 1234</td>
                          </tr>
                          <tr>
                            <td>2</td>
                            <td>00230</td>
                            <td>강남구 청담역</td>
                            <td>강남구 대치역</td>
                            <td>user3</td>
                            <td>20/12/12</td>
                            <td>완료</td>
                            <td>홍길동</td>
                            <td>13호 1254</td>
                          </tr>
                        </tbody>
                      </table>
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
