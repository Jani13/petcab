<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath }"/><!DOCTYPE html>
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
            <div class="container">
              <div class="row">
                <div class="col-xs-12">
                  <div class="card border-dark mb-3 admin-box__elements">
                    <div class="card-header fs-4 fw-bolder admin__elements">
                      드라이버 회원 정보
                    </div>
                    <div class="card-body text-dark">
                      <div
                        class="d-flex justify-content-end"
                        style="margin-bottom: 10px"
                      >
                        <form action="get">
                          <select name="type">
                            <option value="id">id</option>
                            <option value="name">이름</option>
                          </select>
                          <input type="text" />
                          <input type="button" value="검색" />
                        </form>
                      </div>
                      <table class="table table-striped">
                        <thead>
                          <tr>
                            <th scope="col">No</th>
                            <th scope="col">타입</th>
                            <th scope="col">아이디</th>
                            <th scope="col">이름</th>
                            <th scope="col">연락처</th>
                            <th scope="col">애견정보</th>
                            <th scope="col">가입상태</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td>1</td>
                            <td>드라이버</td>
                            <td>user1</td>
                            <td>고구마</td>
                            <td>010-0000-0000</td>
                            <td>(+)</td>
                            <td>Y</td>
                          </tr>
                          <tr>
                            <td>1</td>
                            <td>드라이버</td>
                            <td>user1</td>
                            <td>미나리</td>
                            <td>010-0000-0000</td>
                            <td>(+)</td>
                            <td>Y</td>
                          </tr>
                          <tr>
                            <td>1</td>
                            <td>드라이버</td>
                            <td>user1</td>
                            <td>변기통</td>
                            <td>010-0000-0000</td>
                            <td>(+)</td>
                            <td>Y</td>
                          </tr>
                          <tr>
                            <td>1</td>
                            <td>드라이버</td>
                            <td>user1</td>
                            <td>물티슈</td>
                            <td>010-0000-0000</td>
                            <td>(+)</td>
                            <td>Y</td>
                          </tr>
                          <tr>
                            <td>1</td>
                            <td>드라이버</td>
                            <td>user1</td>
                            <td>노트북</td>
                            <td>010-0000-0000</td>
                            <td>(+)</td>
                            <td>Y</td>
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