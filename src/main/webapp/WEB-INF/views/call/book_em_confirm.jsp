<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${pageContext.request.contextPath }"/>

<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <link rel="stylesheet" href="${path}/css/call.css">    
    <link rel="stylesheet" href="${path}/css/headerfooter.css">
    <script src="${path}/js/jquery-3.5.1.js"></script>
    <script src="${path}/js/headerfooter.js"></script>

    <title>콜예약</title>
</head>

<body>
    <jsp:include page="../common/header.jsp" />
  	<jsp:include page="../common/nav.jsp" />
  	
    <section class="section-wrap">
        <div class="container mt-5 mb-5">
            <div class="row row-call-1 text-center">
                <div class="col btn-call-gen bg-info h-100 d-flex justify-content-center flex-column">
                    <h1 class="text-white">일반</h1>
                </div>
                <div class="col btn-call-emg bg-warning h-100 d-flex justify-content-center flex-column">
                    <h1 class="text-white">긴급</h1>
                </div>
            </div>

            <div class="row row-call-2">
                <div class="col-md-4 my-auto pt-5 pb-5 book-progress">
                    <div class="row">
                        <button type="button" class="btn btn-primary btn-lg btn-block disabled">제휴업체 확인</button>
                    </div>

                    <div class="row">
                        <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-arrow-down-circle" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v5.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V4.5z"/>
                          </svg>
                    </div>

                    <div class="row">
                        <button type="button" class="btn btn-primary btn-lg btn-block disabled">드라이버 확인</button>
                    </div>

                    <div class="row">
                        <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-arrow-down-circle" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v5.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V4.5z"/>
                          </svg>
                    </div>

                    <div class="row">
                        <button type="button" class="btn btn-primary btn-lg btn-block disabled">가결제</button>
                    </div>

                    <div class="row">
                        <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-arrow-down-circle" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v5.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V4.5z"/>
                          </svg>
                    </div>

                    <div class="row">
                        <button type="button" class="btn btn-primary btn-lg btn-block disabled">예약완료</button>
                    </div>
                </div>

                <!--  -->

                <div class="col-md">
                    <div class="">
                        <div class="pt-5 pb-3 pickup-heading">
                            <h1 class="text-center mb-3">예약이 확정되었습니다</h1>
                            <h3 class="text-center mb-3">승차시간을 꼭 지켜주세요</h3>
                        </div>

                        <table class="table call-sum text-center">
                            <thead>
                                <tr>
                                    <th colspan="4" class="text-center">예약내역</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row">제휴업체</th>
                                    <td>뷰티펫</td>
                                </tr>
                                <tr>
                                    <th scope="row">예약시간</th>
                                    <td>YYYYMMDD HH:SS</td>
                                </tr>
                                <tr>
                                    <th scope="row">요청사항</th>
                                    <td>애견커트원해요</td>
                                </tr>
                                <tr>
                                    <th scope="row">출발지</th>
                                    <td>신용산역 1번출구</td>
                                </tr>
                                <tr>
                                    <th scope="row">도착지</th>
                                    <td>홍대입구역 9번출구</td>
                                </tr>
                                <tr>
                                    <th scope="row">보호자 탑승 여부</th>
                                    <td>YES</td>
                                </tr>
                                <tr>
                                    <th scope="row">드라이버 성함</th>
                                    <td>홍길동</td>
                                </tr>
                                <tr>
                                    <th scope="row">차량번호판</th>
                                    <td>123가4567</td>
                                </tr>
                                <tr>
                                    <th scope="row">드라이버 요청사항</th>
                                    <td>조심히 와주세요</td>
                                </tr>
                                <tr>
                                    <th scope="row">애견</th>
                                    <td>뭉뭉이</td>
                                </tr>
                            </tbody>
                        </table>

                        <div class="pt-5 pb-3 book-time-cost row row-cols" style="margin-left: 0; margin-right: 0;">
                            <!-- <h2 class="mb-3">예약신청이 완료되었습니다</h2>
                            <h3 class="mb-3">제휴업체 혹은 드라이버 확인 후 예약이 확정됩니다</h3> -->

                            <div class="col-8">
                                <table class="table">
                                    <tbody>
                                        <tr>
                                            <th scope="row">예상 시간</th>
                                            <td>40분</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">예상 금액</th>
                                            <td>30,000원</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <button class="btn btn-lg btn-outline-info btn-pay col" type="button">예약취소</button>
                        </div>
                    </div>
                </div>
            </div>
    </section>

    <jsp:include page="../common/footer.jsp" />
    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
        crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js" integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js" integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc" crossorigin="anonymous"></script>
    -->
</body>

</html>