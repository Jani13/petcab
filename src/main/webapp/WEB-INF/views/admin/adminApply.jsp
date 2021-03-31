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
            <span><h4>드라이버</h4></span>
            <br>
            <table class="table">
              <thead>
                <tr style="background-color: skyblue;">
                  <th scope="col">NO</th>
                  <th scope="col">날짜</th>
                  <th scope="col">이름</th>
                  <th scope="col">성별</th>
                  <th scope="col">연령</th>
                  <th scope="col">주소</th>
                  <th scope="col">연락처</th>
                  <th scope="col">차량번호</th>
                  <th scope="col">승인</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <th scope="row">1</th>
                  <td>2021/4/26</td>
                  <td>adminApply</td>
                  <td>여</td>
                  <td>20대</td>
                  <td>경기도 성남시 분당구 양현로 479 2층</td>
                  <td>010-1234-5678</td>
                  <td>18마 7365</td>
                  <td>
                    <button type="button" class="btn btn-outline-info">확인</button>
                    <button type="button" class="btn btn-outline-info">취소</button>
                  </td>
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

          <br>

          <div class="container d-flex row mx-3 p-0">
            <!-- 여기서 부터 작업하세용 -->
            <!-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓-->

            <span><h4>제휴업체</h4></span>
            <br>
            <table class="table">
              <thead>
                <tr style="background-color: skyblue;">
                  <th scope="col">NO</th>
                  <th scope="col">날짜</th>
                  <th scope="col">이름</th>
                  <th scope="col">업체명</th>
                  <th scope="col">업종</th>
                  <th scope="col">주소</th>
                  <th scope="col">연락처</th>
                  <th scope="col">운영시간</th>
                  <th scope="col">승인</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <th scope="row">1</th>
                  <td>2021/4/26</td>
                  <td>이커피</td>
                  <td>KH유치원</td>
                  <td>유치원</td>
                  <td>경기도 성남시 분당구 양현로 479 2층</td>
                  <td>010-1234-5678</td>
                  <td>평일 10:00~20:00</td>
                  <td>
                    <button type="button" class="btn btn-outline-info">확인</button>
                    <button type="button" class="btn btn-outline-info">취소</button>
                  </td>
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

    <footer
      id="footer"
      class="footer-wrap"
      style="background-color: #0064b7"
    ></footer>

    <script
      src="https://kit.fontawesome.com/0fe4d45686.js"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
