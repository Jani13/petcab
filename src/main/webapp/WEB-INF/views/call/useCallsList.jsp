<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>예약 내역</title>
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
</head>
<body>
				<!-- 현재 예약내역  -->
                <div class="p-2 d-flex justify-content-between" style="background-color:#4ec7f2">
                    <p class="h4 mx-3 my-2 fw-bold text-white">현재 예약 내역</p>
                    <a class="my-2 text-white" onclick="useCallsList();"><i class="fas fa-plus">더보기</i></a>
                </div>
                <div class="container-fluid">
                	<c:if test="${empty useCall}">
						<div class="card-body text-center fw-bold p-4">
							조회된 예약이 없습니다
						</div>
					</c:if> 
					<c:if test="${useCall != null}">
						<c:forEach var="call" items="${useCall}">
							<c:if test='${call.status=="신청" }'>
									<c:if test='${call.callType=="일반" }'>
										<form action="${ path }/call/book/prepay" method="POST">
									</c:if>
									<c:if test='${call.callType=="긴급" }'>
										<form action="${ path }/call/book/emg/prepay" method="POST">
									</c:if>
							</c:if>
							<c:if test='${call.status=="결제" }'>
									<c:if test='${call.callType=="일반" }'>
										<form action="${ path }/call/book/${call.callNo}/done" method="POST">
									</c:if>
									<c:if test='${call.callType=="긴급" }'>
										<form action="${ path }/call/book/emg/${call.callNo}/done" method="POST">
									</c:if>
							</c:if>
							<input type="hidden" name="fromWhere" value="${call.fromWhere}" />
							<input type="hidden" name="toWhere" value="${call.toWhere}" />
							<input type="hidden" name="paidAmount" />
							<input type="hidden" name="pickupTime" value="${call.pickupTime}" />
							<input type="hidden" name="withOwner" value="${call.withOwner}" />
							<input type="hidden" name="toDriver" value="${call.toDriver}" />
							<c:forEach var="dog" items="${call.dogs}" end="2">
								<input type="hidden" name="dogNo" value="${dog.dogNo}" />
							</c:forEach>
							<input type="hidden" name="callNo" value="${call.callNo }" />
							
		                    <div class="card w-70 m-5 userPageEvent">
		                        <div class="card-body p-4">
		                            <c:if test='${call.callType == "일반"}'> 
		                            	<i class="fas fa-bone text-secondary">일반</i>
		                            	<input type="hidden" name="callType" value="일반" />	
		                            </c:if>
		                            <c:if test='${call.callType == "긴급"}'>
		                            	<i class="fas fa-meteor text-danger">긴급</i>
		                            	<input type="hidden" name="callType" value="긴급" />
		                            	<input type="hidden" name="toPartner" value="${call.toPartner}" />
		                            	<input type="hidden" name="pUserNo" value="${call.partner.userNo }" />
		                            </c:if>
		                            <h5 class="card-title fw-bold">
		                                ${call.fromWhere}
		                                <i class="fas fa-arrow-right"></i> 
		                                 ${call.toWhere}
		                                <span class="mx-3">${call.pickupTime}</span>
		                                <button type="submit" class="btn btn-outline-info border-info rounded-pill" >예약확인</button>
		                                <button type="button" class="btn btn-outline-info border-info rounded-pill"
		                                onclick="location.href='${path}/call/book/cancel/${call.callNo}'">예약취소</button>
		                            </h5>
		                            <p class="card-text">
		                                애견 이름 : 
											<c:forEach var="dog" items="${call.dogs}" end="2">
			                                🐶${dog.dogName}
			                                </c:forEach>
		                                <br>
		                            	<c:if test='${call.callType == "긴급"}'>
		                                제휴업체 : ${call.partner.partnerName }<br>
		                            	</c:if>
		                                예상 결제 금액 : <span name="cost"></span><br>
		                            </p>
		                        </div>
		                    </div>
																</form>
	                    </c:forEach>
                   	</c:if>
                </div>
<script type="text/javascript"
src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e5214e2509e20a333ab78bf3a781c074&libraries=services,clusterer,drawing"></script>
 
<script>
function useCallsList() {
	let url = '${path}/call/book/using/${loginMember.userId}';
	let windowName = 'usingCall';
	let windowFeatures = 'resizable=no,height=800,width=600';

	window.open(url, windowName, windowFeatures);
	
	// opener.window.location.href="" 
}
function myReviewList() { 
	let url = '${path}/user/mypage/myreview/${loginMember.userId}';
	let windowName = 'myReviewList';
	let windowFeatures = 'resizable=no,height=800,width=600';
	
	window.open(url, windowName, windowFeatures);
}
function endCallsList() {
	let url = '${path}/call/book/end/${loginMember.userId}';
	let windowName = 'endCall';
	let windowFeatures = 'resizable=no,height=800,width=500';

	window.open(url, windowName, windowFeatures);
	
	// opener.window.location.href="" 
}


	// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
   
var point = [];

function searchView(i) {
	point = [];
	geocoder.addressSearch(document.getElementsByName('fromWhere')[i].value, function(result, status) {
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	        geocoder.addressSearch(document.getElementsByName('toWhere')[i].value, function(result1, status1) {
	    	     if (status1 === kakao.maps.services.Status.OK) {
	    	        var cost = Math.floor(getDistanceFromLatLonInKm(result[0].y,result[0].x,result1[0].y,result1[0].x)) * 150;
	        		if(cost<3000){
	        			cost=3000
	        		}
	        		document.getElementsByName('paidAmount')[i].value = cost;
	        		document.getElementsByName('cost')[i].innerText = cost;
	    	    } 
	    	});
	    } 
	}); 
}

function getDistanceFromLatLonInKm(lat1,lng1,lat2,lng2) {
    function deg2rad(deg) {
        return deg * (Math.PI/180)
    }

    var R = 6371; // Radius of the earth in km
    var dLat = deg2rad(lat2-lat1);  // deg2rad below
    var dLon = deg2rad(lng2-lng1);
    var a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.sin(dLon/2) * Math.sin(dLon/2);
    var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
    var d = R * c; // Distance in km
    return d*10;
}
for(var num=0;num<document.getElementsByName('paidAmount').length;num++)
{
	searchView(num);
}
</script>

</body>
</html>