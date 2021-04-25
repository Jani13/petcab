<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />

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

<title>일반콜 예약</title>
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
					style="padding-left: 12px; padding-right: 12px; min-height: 750px;">
					<div class="pt-5 pb-3 pickup-heading">
						<h2 class="mb-3" style="margin-left: 10px;">픽업정보 기입</h2>
					</div>
					
					<div class="pickup-fill-in" style="margin-left: 10px;">
						<form action="${ path }/call/book/prepay" method="POST" id="callForm">
							<input type="hidden" name="callType" value="일반" />
							
							<div class="form-group mb-3">
								<label for="pickupTime">예약 시간</label> <input
									type="datetime-local" id="pickupTime" name="pickupTime"
									required />
							</div>

							<div class="form-group mb-3">
								<label for="expCost">예상 금액</label>

								<div class="row row-cols"
									style="margin-left: 0; margin-right: 0">
									<div class="col-9" style="padding-left: 0; padding-right: 0">
										<input type="text" class="form-control where-from"
											name="fromWhere" placeholder="출발지" required
											onclick="selectStart();" /> 
										<input type="text"
											class="form-control where-to" name="toWhere"
											placeholder="도착지" required onclick="selectEnd();" />
									</div>

									<div class="col-3" style="padding-left: 0; padding-right: 0">
										<button class="btn btn-outline-info btn-calc-cost"
											type="button" onclick="searchView();" id="viewBtn">조회</button>
									</div>
								</div>

								<div class="row" style="margin-left: 0; margin-right: 0">
									<input type="text" class="form-control" id="estCost"
										name="estCost" placeholder="예상금액 (원)" required readonly/>
									<input type="hidden" class="form-control" name="paidAmount" value="" />
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
									onclick="selectDogs();">애견 선택하기</button>
								<!-- 버튼 클릭 후 애견 선택 시 여기에 애견 프로필 띄우기 -->
								<!-- 미로그인 시 로그인 페이지로 이동 -->
								<input type="hidden" name="dogNo" value="" /> <input
									type="hidden" name="dogNo" value="" /> <input type="hidden"
									name="dogNo" value="" />
							</div>

							<div class="form-floating mb-3">
								<textarea class="form-control"
									placeholder="Leave a comment here" id="floatingTextarea"
									name="toDriver" required></textarea>
								<label for="floatingTextarea">Comments</label>
							</div>

							<div class="d-grid gap-1 mb-3">
								<button class="btn btn-lg btn-outline-info" type="submit">예약하기</button>
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
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e5214e2509e20a333ab78bf3a781c074&libraries=services,clusterer,drawing"></script>
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
	point = [];
	deletePoint();
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
	            content: '<div id="pointBox" style="width:150px;text-align:center;padding:6px 0;">출발지</div>'
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
	setTimeout(setBounds,500);
}

function setBounds() {
	var cost = Math.floor(getDistanceFromLatLonInKm(point[0],point[1],point[2],point[3])) * 150;
	if(cost<3000){
		cost=3000
	}
    document.getElementsByName('estCost')[0].value = cost;
    
    document.getElementsByName('paidAmount')[0].value = cost; // 값을 다음페이지로 넘기는 역할 수행 
    
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
function deletePoint(){
	if(document.getElementById('pointBox'))
	{
		var cell = document.getElementById('pointBox').parentNode.parentNode.parentNode; 
		while ( cell.hasChildNodes() ) { 
			cell.removeChild( cell.firstChild ); 
		}
	}
}

</script>
</body>

<!-- <script type="text/javascript" src="${ path }/resources/js/call.js" ></script> -->
<script>
$(document).ready(function(){

});
	
function selectGen() {
	$('input[name=callType]').val('일반');
    window.location = "${path}/call/book";
}

function selectEmg() {
	$('input[name=callType]').val('긴급');
    window.location = "${path}/call/book/emg_a";
}

function selectDogs() {
	let url = '${path}/call/book/selectDogs/${loginMember.userId}';
	let windowName = 'dogsForCall';
	let windowFeatures = 'resizable=no,height=800,width=600';

	window.open(url, windowName, windowFeatures);
	
	// opener.window.location.href="" 
}

function selectStart() {
	let url = '${path}/call/search?option=start';
	let windowName = '위치 검색';
	let windowFeatures = 'resizable=no,height=550,width=1200';

	window.open(url, windowName, windowFeatures);
	 
}
function selectEnd() {
	let url = '${path}/call/search?option=end';
	let windowName = '위치 검색';
	let windowFeatures = 'resizable=no,height=550,width=1200';

	window.open(url, windowName, windowFeatures);
	
}

document.getElementById('callForm').onsubmit = function () {
	if ($('input[name=estCost]').val() == "") {
        alert('예상금액을 조회해주세요.');

    	return false;
    }
	
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
</script>
</html>
