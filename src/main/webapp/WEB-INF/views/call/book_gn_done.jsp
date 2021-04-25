<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath }" />

<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<script src="${path}/js/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="${path}/css/headerfooter.css" />
<link rel="stylesheet" href="${path }/css/call.css" />

<title>예약신청</title>
</head>

<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/nav.jsp" />

	<section class="section-wrap">
		<div class="container mt-5 mb-5">
			<div class="row row-call-1 text-center">
				<div
					class="col btn-call-gen bg-info h-100 d-flex justify-content-center flex-column"
					onclick="selectGen();">
					<h1 class="text-white">일반</h1>
				</div>
				<div
					class="col btn-call-emg bg-warning h-100 d-flex justify-content-center flex-column"
					onclick="selectEmg();">
					<h1 class="text-white">긴급</h1>
				</div>
			</div>

			<div class="row row-call-2">
				<div class="col-md-4 my-auto pt-5 pb-5 book-progress">
					<div class="row">
						<button type="button"
							class="btn btn-primary btn-lg btn-block disabled">가결제</button>
					</div>

					<div class="row">
						<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50"
							fill="currentColor" class="bi bi-arrow-down-circle"
							viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
								d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v5.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V4.5z" />
                          </svg>
					</div>

					<div class="row">
						<button type="button"
							class="btn btn-primary btn-lg btn-block disabled">드라이버
							확인</button>
					</div>

					<div class="row">
						<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50"
							fill="currentColor" class="bi bi-arrow-down-circle"
							viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
								d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v5.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V4.5z" />
                          </svg>
					</div>

					<div class="row">
						<button type="button"
							class="btn btn-secondary btn-lg btn-block disabled confirmed">예약완료</button>
					</div>
				</div>

				<div class="col-md">					
					<c:choose>
						<c:when test="${ emgCall != null }">
							<form action="${ path }/call/book/emg/cancel" method="POST">
								<input type="hidden" id="test" name="impUid" value="${payment.impUid}" />
								<input type="hidden" name="callNo" value="${ emgCall.callNo }" />
								<input type="hidden" name="callType" value="긴급" />
								<input type="hidden" name="pUserNo" value="${ emgCall.getPartner().getUserNo() }" />
								<input type="hidden" name="dUserNo" value="" />
								<!-- <input type="text" id="estCost" name="estCost" value="${estCost}"> -->
								
								<div class="pt-5 pb-3 pickup-heading-waiting">
									<h1 class="text-center mb-3">긴급 예약을 요청하셨습니다</h1>
									<h3 class="text-center mb-3">드라이버 확인 후 예약이 확정됩니다</h3>
								</div>

								<div class="pt-5 pb-3 pickup-heading-confirmed d-none">
									<h1 class="text-center mb-3">긴급 예약이 확정되었습니다</h1>
									<h3 class="text-center mb-3">승차시간을 꼭 지켜주세요</h3>
								</div>

								<table class="table call-sum text-center tb-call-done">
									<thead>
										<tr>
											<th colspan="4" class="text-center">예약내역</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row">제휴업체</th>
											<td>${ emgCall.getPartner().getPartnerName() }</td>
										</tr>
										<tr>
											<th scope="row">예약시간</th>
											<td>${ emgCall.getPickupTime() }</td>
										</tr>
										<tr>
											<th scope="row">요청사항</th>
											<td>${ emgCall.getToPartner() }</td>
										</tr>
										<tr>
											<th scope="row">출발지</th>
											<td>${ emgCall.getFromWhere() }</td>
										</tr>
										<tr>
											<th scope="row">도착지</th>
											<td>${ emgCall.getToWhere() }</td>
										</tr>
										<tr>
											<th scope="row">보호자 탑승 여부</th>
											<td>${ emgCall.getWithOwner() }</td>
										</tr>
										<tr>
											<th scope="row">드라이버 성함</th>
												<td class="dName"></td>
										</tr>
										<tr>
											<th scope="row">차량번호판</th>
												<td class="dCarNo"></td>
										</tr>
										<tr>
											<th scope="row">드라이버 요청사항</th>
											<td>${ emgCall.getToDriver() }</td>
										</tr>
										<tr>
											<th scope="row">애견</th>
											<td><c:forEach var="dog" items="${ emgCall.getDogs() }">
													<c:if test="${ dog.dogNo > 0}">
														<c:out value="${ dog.dogName }" />
														<br>
													</c:if>
												</c:forEach></td>
										</tr>
									</tbody>
								</table>

								<div class="pt-5 pb-3 book-time-cost row row-cols"
									style="margin-left: 0; margin-right: 0;">
									<div class="col-8">
										<table class="table">
											<tbody>
												<tr>
													<th scope="row">예상 금액</th>
													<td>${ emgCall.paidAmount }원</td>
												</tr>
											</tbody>
										</table>
									</div>

									<input type="hidden" name="paidAmount" value="${ emgCall.paidAmount }" />
									<input class="btn btn-lg btn-outline-info btn-cancel col"
										type="submit" value="예약취소">
								</div>
							</form>
						</c:when>

						<c:otherwise>
							<form name="ee" action="${ path }/call/book/cancel" method="POST">
								<input type="hidden" id="test" name="impUid" value="${payment.impUid}" />
								<input type="hidden" name="callNo" value="${ call.callNo }" />
								<input type="hidden" name="callType" value="일반" />
								<input type="hidden" name="dUserNo" value="" />
								<!-- <input type="text" id="estCost" name="estCost" value="${estCost}"> -->

								<div class="pt-5 pb-3 pickup-heading-waiting">
									<h1 class="text-center mb-3">일반 예약을 요청하셨습니다</h1>
									<h3 class="text-center mb-3">드라이버 확인 후 예약이 확정됩니다</h3>
								</div>

								<div class="pt-5 pb-3 pickup-heading-confirmed d-none">
									<h1 class="text-center mb-3">일반 예약이 확정되었습니다</h1>
									<h3 class="text-center mb-3">승차시간을 꼭 지켜주세요</h3>
								</div>

								<table class="table call-sum text-center tb-call-done">
									<thead>
										<tr>
											<th colspan="4" class="text-center">예약내역</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row">예약시간</th>
											<td>${ call.getPickupTime() }</td>
										</tr>
										<tr>
											<th scope="row">출발지</th>
											<td>${ call.getFromWhere() }</td>
										</tr>
										<tr>
											<th scope="row">도착지</th>
											<td>${ call.getToWhere() }</td>
										</tr>
										<tr>
											<th scope="row">보호자 탑승 여부</th>
											<td>${ call.getWithOwner() }</td>
										</tr>
										<tr>
											<th scope="row">드라이버 성함</th>
											<td class="dName"></td>
										</tr>
										<tr>
											<th scope="row">차량번호판</th>
											<td class="dCarNo"></td>
										</tr>
										<tr>
											<th scope="row">드라이버 요청사항</th>
											<td>${ call.getToDriver() }</td>
										</tr>
										<tr>
											<th scope="row">애견</th>
											<td><c:forEach var="dog" items="${ call.getDogs() }">
													<c:if test="${ dog.dogNo > 0}">
														<c:out value="${ dog.dogName }" />
														<br>
													</c:if>
												</c:forEach></td>
										</tr>
									</tbody>
								</table>

								<div class="pt-5 pb-3 book-time-cost row row-cols"
									style="margin-left: 0; margin-right: 0;">
									<div class="col-8">
										<table class="table">
											<tbody>
												<tr>
													<th scope="row">예상 금액</th>
													<td>${ call.paidAmount }원</td>
												</tr>
											</tbody>
										</table>
									</div>

									<input type="hidden" name="paidAmount" value="${ call.paidAmount }" />
									<input class="btn btn-lg btn-outline-info btn-cancel col" 
										type="submit" value="예약취소">
								</div>
							</form>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</section>

	<jsp:include page="../common/footer.jsp" />

	<!-- Optional JavaScript; choose one of the two! -->

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
		crossorigin="anonymous"></script>

	<!-- Option 2: Separate Popper and Bootstrap JS -->
	<!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js" integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js" integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc" crossorigin="anonymous"></script>
    -->
</body>

<!-- <script type="text/javascript" src="${ path }/resources/js/call.js" ></script> -->
 <script>
$(document).ready(function() {
        $('#test').val('${payment.impUid}');
    });
</script> 
<script>
	$(document).ready(function() {

	});

	function selectGen() {
		$('input[name=callType]').val('일반');
		window.location = "${path}/call/book";
	}

	function selectEmg() {
		$('input[name=callType]').val('긴급');
		window.location = "${path}/call/book/emg_a";
	}
</script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.1/sockjs.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<!-- <script src="${ pageContext.request.contextPath }/resources/app.js"></script> -->
<script src="${path}/js/webSocket.js"></script>
<script>
$(function() {	
    var socket = new SockJS("/work/notify");
    stompClient = Stomp.over(socket);
    stompClient.connect({}, function (frame) {
        console.log('Connected : ' + frame);
        
        let destCallNo = null;
        
		if (${ emgCall != null }) { // 긴급
			destCallNo = "${ emgCall.callNo }";
		} else if (${ call != null }) { // 일반
			destCallNo = "${ call.callNo }";
		}
        
        stompClient.subscribe('/topic/call/' + destCallNo, function(data) {

        	let callNo = JSON.parse(data.body).callNo;
        	let userNo = JSON.parse(data.body).dUserNo;
        	
        	let driver = {
        		'userNo' : userNo
        	};
        	        	
        	// AJAX로 드라이버 정보를 가져와서 뿌려준다.
			 $.ajax({
				 async : true,
				 url : 'driver',
				 dataType : 'json',
				 contentType : "application/json; charset=UTF-8",
				 type : 'get',
				 data : driver,
				 success : function(driver) {
					 console.log('ajax success!');
					 
					 console.log(driver);
					 
					 showDriverDetail(driver);
					 
					  $('.confirmed').removeClass('btn-secondary').addClass('btn-primary');
					  $('.pickup-heading-waiting').addClass('d-none');
					  $('.pickup-heading-confirmed').removeClass('d-none');
					  
					  $('input[name=dUserNo]').val(driver.userNo);
				 },
				 error : function(e) {
					 console.log('ajax error!');
					 console.log(e);	 
				 }
			 });
        	
        		// 여기까지
        	
        });
    });
});

function showDriverDetail(driver) {
	console.log(driver.userName);
	console.log(driver.carNo);
	
    $('.dName').text(driver.userName);
    $('.dCarNo').text(driver.carNo);
}

</script>
</html>
