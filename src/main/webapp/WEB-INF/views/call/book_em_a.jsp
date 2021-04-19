<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous" />
<link rel="stylesheet" href="${path}/css/call.css" />
<link rel="stylesheet" href="${path}/css/headerfooter.css" />
<script src="${path}/js/jquery-3.5.1.js"></script>
<script src="${path}/js/headerfooter.js"></script>

<title>콜예약</title>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/nav.jsp" />

	<section class="section-wrap">
		<div class="container mt-5 mb-5 bg-light">
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
				<div class="col-md-4 pickup-details"
					style="padding-left: 12px; padding-right: 12px">
					<div class="pickup-fill-in" style="margin-left: 10px;">
						<form id="emgCallForm" action="${ path }/call/book/emg/done" method="POST">
							<input type="hidden" name="callType" value="긴급" />
							<!-- <input type="hidden" name="pUserNo" value="3" /> -->
						
							<div id="bookEmgA">
								<div class="pt-5 pb-3 pickup-heading">
									<h2 class="mb-3" style="margin-left: 10px;">1. 제휴업체 검색</h2>
								</div>
								<div class="form-group mb-3 row row-cols partner-type"
									style="margin-left: 10px;">
									
									<div class="dropdown col-sm-4">
									  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
									    병원
									  </button>
									  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
									  	<c:forEach var="hospital" items="${hospital}">
											<c:set var="addr" value="${fn:split(hospital.member.address,',')}"/>
									   		<li><a class="dropdown-item" href="#" onclick="pickPartner('${addr[0]}');"><c:out value="${hospital.partnerName}"/></a></li>
									  	</c:forEach>
									  </ul>
									</div>
									<div class="dropdown col-sm-4">
									  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
									    유치원
									  </button>
									  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
									  	<c:forEach var="school" items="${school}">
											<c:set var="addr" value="${fn:split(school.member.address,',')}"/>
									   		<li><a class="dropdown-item" href="#" onclick="pickPartner('${addr[0]}');"><c:out value="${school.partnerName}"/></a></li>
									  	</c:forEach>
									  </ul>
									</div>
									<div class="dropdown col-sm-4">
									  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
									    애견샵
									  </button>
									  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
									  	<c:forEach var="shop" items="${shop}">
											<c:set var="addr" value="${fn:split(shop.member.address,',')}"/>
									   		<li><a class="dropdown-item" href="#" onclick="pickPartner('${addr[0]}');"><c:out value="${shop.partnerName}"/></a></li>
									  	</c:forEach>
									  </ul>
									</div>
								</div>
								
								<div class="row row-cols"
									style="margin-left: 0; margin-right: 0">
									<div class="col-9" style="padding-left: 0; padding-right: 0">
										<input type="input" class="form-control where-from"
											name="fromWhere" placeholder="출발지" required
											onclick="selectStart();"/> 
										<input type="text"
											class="form-control where-to" name="toWhere"
											placeholder="도착지" required readonly/>
									</div>

									<div class="col-3" style="padding-left: 0; padding-right: 0">
										<button class="btn btn-outline-info btn-calc-cost"
											type="button" onclick="searchView();">조회</button>
											
									</div>
								</div>

								<div class="pt-5 pb-3 pickup-heading">
									<h2 class="mb-3" style="margin-left: 10px;">2. 예약시간 선택</h2>
								</div>

								<div class="form-group mb-3" style="margin-left: 30px;">
									<input type="datetime-local" id="pickupTime" name="pickupTime" required />
								</div>

								<div class="pt-5 pb-3 pickup-heading">
									<h2 class="mb-3" style="margin-left: 10px;">3. 기타사항</h2>
								</div>

								<div class="form-floating mb-3" style="margin-left: 20px;">
									<textarea class="form-control" name="toPartner"
										placeholder="Leave a comment here" id="floatingTextarea" required></textarea>
									<label for="floatingTextarea">Comments</label>
								</div>

								<div class="d-grid gap-1 mb-3" style="margin-left: 20px;">
									<button class="btn btn-lg btn-outline-info btn-next"
										type="button" onclick="goNext();">다음페이지로</button>
								</div>
							</div>

							<div id="bookEmgB">
								<div class="pt-5 pb-3 pickup-heading">
									<h2 class="mb-3" style="margin-left: 10px;">4. 픽업정보 기입</h2>
								</div>

								<div class="form-group mb-3">
									<label for="expCost">예상 금액</label>

									<div class="row row-cols"
										style="margin-left: 0; margin-right: 0">
										<div class="col-9" style="padding-left: 0; padding-right: 0">
											<input type="text" class="form-control where-from"
												name="fromWhere" placeholder="출발지" required />
											<input type="text"
												class="form-control where-to" name="toWhere"
												placeholder="도착지" required />
										</div>

										<div class="col-3" style="padding-left: 0; padding-right: 0">
											<button class="btn btn-outline-info btn-calc-cost"
												type="button">조회</button>
										</div>
									</div>

									<div class="row" style="margin-left: 0; margin-right: 0">
										<input type="text" class="form-control" id="estCost"
											name="estCost" placeholder="예상금액 (원)" required />
									</div>
								</div>

								<div class="form-group mb-3">
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="Y"
											id="flexCheckDefault" name="withOwner" /> <label
											class="form-check-label" for="flexCheckDefault"> 보호자
											탑승 </label>
									</div>
								</div>

								<div class="d-grid gap-1 mb-3">
									<button class="btn btn-sm btn-outline-info" type="button"
										onclick="selectDogs();">
										애견정보 불러오기</button>
									<!-- 버튼 클릭 후 애견 선택 시 여기에 애견 프로필 띄우기 -->
									<input type="hidden" name="dogNo" value="" required>
									<input type="hidden" name="dogNo" value="">
									<input type="hidden" name="dogNo" value="">
								</div>

								<div class="form-floating mb-3">
									<textarea class="form-control"
										placeholder="Leave a comment here" id="floatingTextarea"
										name="toDriver" required></textarea>
									<label for="floatingTextarea">Comments</label>
								</div>

								<div class="row row-cols">
									<div class="col">
										<button class="btn btn-lg btn-outline-info btn-back"
											type="button" onclick="goBack();">이전페이지로</button>
									</div>

									<div class="col">
										<input class="btn btn-lg btn-outline-info btn-emg-book"
											type="submit" value="예약하기">
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
				<!-- 지도입니다 -->
				<div class="col-md locationMap" id="map"></div>
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e5214e2509e20a333ab78bf3a781c074&libraries=services,clusterer,drawing"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
   
var point = [];

function searchView() {
	geocoder.addressSearch(document.getElementsByName('fromWhere')[0].value, function(result, status) {

		
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">출발지</div>'
	        });
	        infowindow.open(map, marker);

	        point.push(parseFloat(result[0].y));
	        point.push(parseFloat(result[0].x));
	    } 
	}); 
	geocoder.addressSearch(document.getElementsByName('toWhere')[0].value, function(result, status) {

	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });

	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">목적지</div>'
	        });
	        infowindow.open(map, marker);
	        
	        point.push(parseFloat(result[0].y));
	        point.push(parseFloat(result[0].x));
	    } 
	});  
	function setBounds() {
	var points = [
	    new kakao.maps.LatLng(point[0], point[1]),
	    new kakao.maps.LatLng(point[2], point[3])
	];

	// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
	var bounds = new kakao.maps.LatLngBounds();    

	var i, marker;
	for (i = 0; i < points.length; i++) {
	    // 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
	    marker =     new kakao.maps.Marker({ position : points[i] });
	    marker.setMap(map);
	    
	    // LatLngBounds 객체에 좌표를 추가합니다
	    bounds.extend(points[i]);
	}

		
	    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
	    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
	    map.setBounds(bounds);
	}
	setTimeout(setBounds,500);
}


</script>
</body>

<!-- <script type="text/javascript" src="${ path }/resources/js/call.js" ></script> -->
<script>
$(document).ready(function() {
    $('#bookEmgA').show();
    $('#bookEmgB').hide();
});

function selectGen() {
    $('input[name=callType]').val('일반');
    window.location = "${path}/call/book";
}

function selectEmg() {
    $('input[name=callType]').val('긴급');
    window.location = "${path}/call/book/emg_a";
}

function goNext() {
    $('#bookEmgA').hide();
    $('#bookEmgB').show();
}

function goBack() {
    $('#bookEmgB').hide();
    $('#bookEmgA').show();
}
	
function selectDogs() {
	let url = '${path}/call/book/selectDogs/${loginMember.userId}';
	let windowName = 'dogsForCall';
	let windowFeatures = 'resizable=no,height=800,width=600';

	window.open(url, windowName, windowFeatures);
	
	// opener.window.location.href="" 
}

document.getElementById('emgCallForm').onsubmit = function () {
	let inputs = document.getElementsByName('dogNo'); // 3개
    let dogs = 0;

    inputs.forEach(input => {
        if (input.value !== "") {
            dogs++;
        }
    });

    if (dogs == 0) {
        alert('애견을 선택해주세요.');

        return false;
    }
}	

function pickPartner(e){
	console.log(e);
	document.getElementsByName('toWhere')[0].value = e;
}

function selectStart() {
	let url = '${path}/call/search?option=start';
	let windowName = '위치 검색';
	let windowFeatures = 'resizable=no,height=550,width=1200';

	window.open(url, windowName, windowFeatures);
	 
}
</script>
</html>
