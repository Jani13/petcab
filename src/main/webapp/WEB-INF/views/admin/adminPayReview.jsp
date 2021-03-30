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
            <span><h4>결제 내역</h4></span>
            <br>
            <br>
            <div class="row">
              <div class="col-sm-6">
                <div class="card">
                  <div class="card-body">
                    <img src="..." class="card-img-top" alt="...">
                    <h5 class="card-title">Special title treatment</h5>
                    <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                  </div>
                </div>
              </div>
              <div class="col-sm-6">
                <div class="card">
                  <div class="card-body">
                    <img src="..." class="card-img-top" alt="...">
                    <h5 class="card-title">Special title treatment</h5>
                    <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                  </div>
                </div>
              </div>
            </div>
            <!-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑-->
            <!-- 여기 까지 -->
          </div>

          <br><br>

          <div class="container d-flex row mx-3 p-0">
            <!-- 여기서 부터 작업하세용 -->
            <!-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓-->
            <div
              class="d-flex flex-row bd-highlight mb-3"
              style="margin-bottom: 10px"
            >
              <ul class="list-group list-group-horizontal">
                <li class="list-group-item">
                  <button type="button" class="btn btn-outline-info">전체</button>
                  <button type="button" class="btn btn-outline-info">일반</button>
                  <button type="button" class="btn btn-outline-info">긴급콜</button>
                </li>
                <li class="list-group-item">
                  <select class="form-select" aria-label="Default select example"  style="width: 100px;">
                    <option selected>사용자</option>
                    <option value="1">드라이버</option>
                  </select>
                </li>
                <li class="list-group-item">
                  <input type="search" id="title" class="form-control" placeholder="내용을 입력하세요." size="30px">
                </li>
                <li class="list-group-item">
                  <button type="button" class="btn btn-outline-info">검색</button>
                </li>
              </ul>
            </div>
            
            <br>
            <br>

            <table class="table">
              <thead>
                <tr style="background-color: skyblue;">
                  <th scope="col">NO</th>
                  <th scope="col">운행일시</th>
                  <th scope="col">호출옵션</th>
                  <th scope="col">사용자</th>
                  <th scope="col">드라이버</th>
                  <th scope="col">차량번호</th>
                  <th scope="col">출발지</th>
                  <th scope="col">도착지</th>
                  <th scope="col">금액</th>
                  <th scope="col">결제수단</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <th scope="row">1</th>
                  <td>2021/4/26</td>
                  <td>긴급콜</td>
                  <td>여장구</td>
                  <td>송강호</td>
                  <td>18마 7365</td>
                  <td>경기도 성남시 분당구 양현로 479 2층</td>
                  <td>경기도 성남시 분당구 양현로 479 3층</td>
                  <td>30,000원</td>
                  <td>카드결제</td>
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
