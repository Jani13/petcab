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
    <title>데려다줄개 긴급콜 요청상황</title>
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
    <script
      src="https://kit.fontawesome.com/7eaa61533c.js"
      crossorigin="anonymous"
    ></script>
    <script src="//code.jquery.com/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>

    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <!-- header footer include시 밑에 소스 2줄-->
    <!-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ -->
	<link rel="stylesheet" href="${ path }/css/headerfooter.css" />
	<script src="${ path }/js/jquery-3.5.1.js"></script>
    <!-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ -->

    <style>
      .myDogs {
        width: 200px;
        height: 200px;
      }

      .successCall {
        width: 300px;
        height: 300px;
      }

      .emergencyCall{
        width: 300px;
        height: fit-content;
      }
    </style>
  </head>
  <body class="body-wrap">
    <jsp:include page="../common/header.jsp" />
    <jsp:include page="../common/nav.jsp" />
    <section>
      <div class="d-flex justify-content-center">
        <div class="section-width">
          <div class="p-4" style="background-color: #4ec7f2">
            <p class="h1 fw-bold text-white">긴급콜 요청상황</p>
          </div>
          <div class="container-fluid">
            <div class="row">
              <div class="col-sm-4">
                <div class="card m-5 emergencyCall">
                  <div class="card-body p-4">
                    <i class="fas fa-meteor text-danger">긴급</i>
                    <h5 class="card-title fw-bold">
                      출발지
                      <i class="fas fa-arrow-right"></i>
                      목적지
                    </h5>
                    <p class="fs-5">YYYY/MM/DD HH:mm:ss</p>
                    <p class="card-text">
                      고객명 : 땡떙땡 <br /> 
                      애견 이름 : 멍멍이<br />
                      출발시간 : <br />
                      도착시간 : <br />
                      보호자 동반여부 : <br />
                      드라이버 : XXX / xx마 1234<br />
                      제휴업체 : KH 애견샵 <br />
                      요청사항 : dasdasdas
                    </p>
                    <div class="text-center">
                        <button type="button" class="btn btn-danger">수락</button>
                        <button type="button" class="btn btn-secondary">거절</button>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-sm-4">
                <div class="card m-5 emergencyCall">
                  <div class="card-body p-4">
                    <i class="fas fa-meteor text-danger">긴급</i>
                    <h5 class="card-title fw-bold">
                      출발지
                      <i class="fas fa-arrow-right"></i>
                      목적지
                    </h5>
                    <p class="fs-5">YYYY/MM/DD HH:mm:ss</p>
                    <p class="card-text">
                      고객명 : 땡떙땡 <br /> 
                      애견 이름 : 멍멍이<br />
                      출발시간 : <br />
                      도착시간 : <br />
                      보호자 동반여부 : <br />
                      드라이버 : XXX / xx마 1234<br />
                      제휴업체 : KH 애견샵 <br />
                      요청사항 : dasdasdas
                    </p>
                    <div class="text-center">
                        <button type="button" class="btn btn-danger">수락</button>
                        <button type="button" class="btn btn-secondary">거절</button>
                    </div>
                  </div>
                </div>
              </div><div class="col-sm-4">
                <div class="card m-5 emergencyCall">
                  <div class="card-body p-4">
                    <i class="fas fa-meteor text-danger">긴급</i>
                    <h5 class="card-title fw-bold">
                      출발지
                      <i class="fas fa-arrow-right"></i>
                      목적지
                    </h5>
                    <p class="fs-5">YYYY/MM/DD HH:mm:ss</p>
                    <p class="card-text">
                      고객명 : 땡떙땡 <br /> 
                      애견 이름 : 멍멍이<br />
                      출발시간 : <br />
                      도착시간 : <br />
                      보호자 동반여부 : <br />
                      드라이버 : XXX / xx마 1234<br />
                      제휴업체 : KH 애견샵 <br />
                      요청사항 : dasdasdas
                    </p>
                    <div class="text-center">
                        <button type="button" class="btn btn-danger">수락</button>
                        <button type="button" class="btn btn-secondary">거절</button>
                    </div>
                  </div>
                </div>
              </div><div class="col-sm-4">
                <div class="card m-5 emergencyCall">
                  <div class="card-body p-4">
                    <i class="fas fa-meteor text-danger">긴급</i>
                    <h5 class="card-title fw-bold">
                      출발지
                      <i class="fas fa-arrow-right"></i>
                      목적지
                    </h5>
                    <p class="fs-5">YYYY/MM/DD HH:mm:ss</p>
                    <p class="card-text">
                      고객명 : 땡떙땡 <br /> 
                      애견 이름 : 멍멍이<br />
                      출발시간 : <br />
                      도착시간 : <br />
                      보호자 동반여부 : <br />
                      드라이버 : XXX / xx마 1234<br />
                      제휴업체 : KH 애견샵 <br />
                      요청사항 : dasdasdas
                    </p>
                    <div class="text-center">
                        <button type="button" class="btn btn-danger">수락</button>
                        <button type="button" class="btn btn-secondary">거절</button>
                    </div>
                  </div>
                </div>
              </div><div class="col-sm-4">
                <div class="card m-5 emergencyCall">
                  <div class="card-body p-4">
                    <i class="fas fa-meteor text-danger">긴급</i>
                    <h5 class="card-title fw-bold">
                      출발지
                      <i class="fas fa-arrow-right"></i>
                      목적지
                    </h5>
                    <p class="fs-5">YYYY/MM/DD HH:mm:ss</p>
                    <p class="card-text">
                      고객명 : 땡떙땡 <br /> 
                      애견 이름 : 멍멍이<br />
                      출발시간 : <br />
                      도착시간 : <br />
                      보호자 동반여부 : <br />
                      드라이버 : XXX / xx마 1234<br />
                      제휴업체 : KH 애견샵 <br />
                      요청사항 : dasdasdas
                    </p>
                    <div class="text-center">
                        <button type="button" class="btn btn-danger">수락</button>
                        <button type="button" class="btn btn-secondary">거절</button>
                    </div>
                  </div>
                </div>
              </div><div class="col-sm-4">
                <div class="card m-5 emergencyCall">
                  <div class="card-body p-4">
                    <i class="fas fa-meteor text-danger">긴급</i>
                    <h5 class="card-title fw-bold">
                      출발지
                      <i class="fas fa-arrow-right"></i>
                      목적지
                    </h5>
                    <p class="fs-5">YYYY/MM/DD HH:mm:ss</p>
                    <p class="card-text">
                      고객명 : 땡떙땡 <br /> 
                      애견 이름 : 멍멍이<br />
                      출발시간 : <br />
                      도착시간 : <br />
                      보호자 동반여부 : <br />
                      드라이버 : XXX / xx마 1234<br />
                      제휴업체 : KH 애견샵 <br />
                      요청사항 : dasdasdas
                    </p>
                    <div class="text-center">
                        <button type="button" class="btn btn-danger">수락</button>
                        <button type="button" class="btn btn-secondary">거절</button>
                    </div>
                  </div>
                </div>
              </div><div class="col-sm-4">
                <div class="card m-5 emergencyCall">
                  <div class="card-body p-4">
                    <i class="fas fa-meteor text-danger">긴급</i>
                    <h5 class="card-title fw-bold">
                      출발지
                      <i class="fas fa-arrow-right"></i>
                      목적지
                    </h5>
                    <p class="fs-5">YYYY/MM/DD HH:mm:ss</p>
                    <p class="card-text">
                      고객명 : 땡떙땡 <br /> 
                      애견 이름 : 멍멍이<br />
                      출발시간 : <br />
                      도착시간 : <br />
                      보호자 동반여부 : <br />
                      드라이버 : XXX / xx마 1234<br />
                      제휴업체 : KH 애견샵 <br />
                      요청사항 : dasdasdas
                    </p>
                    <div class="text-center">
                        <button type="button" class="btn btn-danger">수락</button>
                        <button type="button" class="btn btn-secondary">거절</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div
              aria-label="Page navigation example"
              class="d-flex justify-content-center"
              style="margin-bottom: 10px"
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
    </section>
    <jsp:include page="../common/footer.jsp" />

    <script>
      function DaumPostcode() {
        new daum.Postcode({
          oncomplete: function (data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ""; // 주소 변수
            var extraAddr = ""; // 참고항목 변수
            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === "R") {
              // 사용자가 도로명 주소를 선택했을 경우
              addr = data.roadAddress;
            } else {
              // 사용자가 지번 주소를 선택했을 경우(J)
              addr = data.jibunAddress;
            }
            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if (data.userSelectedType === "R") {
              // 법정동명이 있을 경우 추가한다. (법정리는 제외)
              // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
              if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
                extraAddr += data.bname;
              }
              // 건물명이 있고, 공동주택일 경우 추가한다.
              if (data.buildingName !== "" && data.apartment === "Y") {
                extraAddr +=
                  extraAddr !== ""
                    ? ", " + data.buildingName
                    : data.buildingName;
              }
              // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
              if (extraAddr !== "") {
                extraAddr = " (" + extraAddr + ")";
              }
              // 조합된 참고항목을 해당 필드에 넣는다.
              document.getElementById("addr3").value = extraAddr;
            } else {
              document.getElementById("addr3").value = "";
            }
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("postalAddr").value = data.zonecode;
            document.getElementById("addr1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("addr2").focus();
          },
        }).open();
      }
    </script>
  </body>
</html>
