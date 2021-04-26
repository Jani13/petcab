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

<title>예약 가결제</title>
<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>

<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/nav.jsp" />

	<section class="section-wrap">
		<div class="container mt-5 mb-5">
			<div class="row row-call-1 text-center">
				<div
					class="col btn-call-gen bg-info h-100 d-flex justify-content-center flex-column">
					<h1 class="text-white">일반</h1>
				</div>
				<div
					class="col btn-call-emg bg-warning h-100 d-flex justify-content-center flex-column">
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
							class="btn btn-secondary btn-lg btn-block disabled">드라이버
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
							<form class="payForm" action="${ path }/call/book/emg/${ emgCall.callNo }/done" method="post">
								<input type="hidden" name="callNo" value="${ emgCall.callNo }">
								<input type="hidden" name="callType" value="긴급">
								<input type="hidden" name="pUserNo" value="${ emgCall.getPartner().getUserNo() }">
								<!-- <input type="hidden" id="estCost" name="estCost" value="${estCost}"> -->

								<div class="pt-5 pb-3 pickup-heading">
									<h1 class="text-center mb-3">결제를 진행해주세요</h1>
									<h3 class="text-center mb-3">예약내역을 다시 한 번 확인해주세요</h3>
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
											<td class=".pName">${ emgCall.getPartner().getPartnerName() }</td>
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
												<td></td>
										</tr>
										<tr>
											<th scope="row">차량번호판</th>
												<td></td>
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
									<input type="hidden" name="impUid" value="" />
									<input type="hidden" id="userNo" value="${loginMember.userNo }">
									<input type="hidden" id="buyerName"
										value="${loginMember.userId }">
									<button class="btn btn-lg btn-outline-info btn-pay col" 
										id="api" type="button">결제하기</button>
									<input type="submit" class="btn-pay-next" 
										style="visibility: hidden;" />
								</div>
							</form>
						</c:when>

						<c:otherwise>
							<form class="payForm" action="${ path }/call/book/${ call.callNo }/done" method="post">
								<input type="hidden" name="callNo" value="${ call.callNo }" />
								<input type="hidden" name="callType" value="일반" />
								<!-- <input type="text" id="estCost" name="estCost" value="${estCost}"> -->

								<div class="pt-5 pb-3 pickup-heading">
									<h1 class="text-center mb-3">결제를 진행해주세요</h1>
									<h3 class="text-center mb-3">예약내역을 다시 한 번 확인해주세요</h3>
								</div>

								<table class="table call-sum text-center">
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
												<td></td>
										</tr>
										<tr>
											<th scope="row">차량번호판</th>
												<td></td>
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
									
									<!-- <input type="text" name="estCost" value="${estCost}"> -->
									<input type="hidden" name="paidAmount" value="${ call.paidAmount }" />
									<input type="hidden" name="impUid" value="" />
									<input type="hidden" id="userNo" value="${loginMember.userNo }">
									<input type="hidden" id="buyerName"
										value="${ loginMember.userId }">
									<button class="btn btn-lg btn-outline-info btn-pay col" 
										id="api" type="button">결제하기</button>
										<input type="submit" class="btn-pay-next" 
											style="visibility: hidden;" />
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
<script>
$('#api').click(function() {
	// getter
	var IMP = window.IMP;
	IMP.init('imp03179840');
	
	IMP.request_pay({
		pg : "inicis", // pg사
		merchant_uid : 'merchant_' + new Date().getTime(),
		name : 'PETCAB', // 결제창에서 보여질 이름
		amount : 100, // "${ call.paidAmount }' 100원은 테스트 값 
		buyer_name : '${loginMember.userId }',
		buyer_tel : '010-1234-5678',
		buyer_addr : '서울특별시 강남구 신사동',
		buyer_postcode : '123-456'
	}, function(rsp) {
		console.log(rsp);
		
		if (rsp.success) {
			var msg = '결제가 완료되었습니다.';
			msg += '고유ID : ' + rsp.imp_uid;
			msg += '상점 거래ID : ' + rsp.merchant_uid;
			msg += '결제 금액 : ' + rsp.paid_amount;
			msg += '카드 승인번호 : ' + rsp.apply_num;

			$('input[name=impUid]').val(rsp.imp_uid);
			
			console.log($('input[name=impUid]').val());
			
	        let callNo = null;
	        
			if (${ emgCall != null }) { // 긴급
				callNo = "${ emgCall.callNo }";
			} else if (${ call != null }) { // 일반
				callNo = "${ call.callNo }";
			}
			
			$.ajax({
				type : "POST",
				url : "${path}/call/payInfo/" + callNo,
				dataType : "json",
				contentType : "application/json; charset=UTF-8",
				data : JSON.stringify({
							merchantUid : rsp.merchant_uid,
							impUid : rsp.imp_uid,
							name : rsp.name,
							buyerName : rsp.buyer_name,
							paidAmount : rsp.paid_amount,
							applyNum : rsp.apply_num,
							status : rsp.status,
							payMethod : rsp.pay_method,
							pgProvider : rsp.pg_provider,
							pgTid : rsp.pg_tid,
							paidAt : rsp.paid_at,
							receiptUrl : rsp.receipt_url,
							userNo : $('#userNo').val()})
			});	
			
			submit = true;
			
			$('.btn-pay-next').click();
			
		} else {
			var msg = '결제에 실패하였습니다. 처음부터 다시 예약해 주세요. *^^*';
			//msg += '에러내용 : ' + rsp.error_msg;
							
			submit = false;
			
			document.location.href = "${path}/call/book"; //alert창 확인 후 이동할 url 설정
		}
		
		alert(msg);
		// document.location.href="${path}/call/book/cancel"; //alert창 확인 후 이동할 url 설정
	});
	
});

</script>
</html>
