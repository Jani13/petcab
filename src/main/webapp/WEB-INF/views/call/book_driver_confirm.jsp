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

<link rel="stylesheet" href="${path }/css/headerfooter.css" />

<link rel="stylesheet" href="${path }/css/call.css" />

<script src="${path }/js/jquery-3.5.1.js"></script>
<script src="${path }/js/headerfooter.js"></script>

<title>드라이버 예약보기</title>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/nav.jsp" />

	<section class="section-wrap">
		<div class="container mt-5 mb-5">
			<div class="row row-call-1 text-center">
				<div
					class="col btn-call-gen bg-info h-100 d-flex justify-content-center flex-column">
					<h1 class="text-white">예약 정보</h1>
				</div>
				<div
					class="col btn-call-emg bg-warning h-100 d-flex justify-content-center flex-column">
					<h1 class="text-white">지도</h1>
				</div>
			</div>

			<div class="row row-call-2">
				<div class="col-md pickup-details bg-light">
					<div class="pt-5 pb-3 pickup-heading" style="margin-bottom: 150px;">
						<h2 class="mb-3" style="margin-left: 10px;">드라이버 예약 선택</h2>
					</div>

					<div class="pickup-fill-in" style="margin-bottom: 150px;">
						<!-- <form action="/" method="post"> -->
						<div class="form-group mb-3">
							<label style="margin-left: 10px;">예상 금액</label>

							<div class="row row-cols" style="margin-left: 0; margin-right: 0">
								<div class="col-12" style="padding-left: 0; padding-right: 0">
									<div style="margin-left: 10px;">
										<input type="text" class="form-control where-from"
											placeholder="출발지" name="fromWhere" readonly />
									</div>
									<div style="margin-left: 10px;">
										<input type="text" class="form-control where-to"
											placeholder="도착지" name="toWhere" readonly />
									</div>
								</div>
							</div>

							<div class="row">
								<div>
									<div style="margin-left: 10px;">
										<input type="text" class="form-control estCost"
											placeholder="예상금액 (원)" name="estCost" readonly />
									</div>
								</div>
							</div>
							<div class="row" style="margin-left: 10px; margin-right: 0px;">
								<button class="btn btn-lg btn-outline-secondary btn-finish"
									disabled onclick="finishCallByDriver(this);">운행종료</button>
							</div>
						</div>
						<!-- </form> -->
					</div>
				</div>
				<!-- 지도 API -->
				<div class="col-md locationMap" id="map">지도 API</div>
			</div>

			<div class="row row-call-3 bg-light">
				<div class="row row-cols-1 row-cols-md-3 g-4"
					style="margin-left: 0; margin-right: 0">

					<input type="hidden" name="callNo" value="" /> <input
						type="hidden" name="dUserNo" value="${ loginMember.userNo }" />

					<c:forEach var="call" items="${ calls }">
						<div class="col">

							<div class="card h-100 border-info">
								<div class="card-header">${ call.pickupTime }</div>
								<div class="card-body">
									<h5 class="card-title" id="startPoint">${ call.fromWhere }</h5>
									<h5 class="card-title" id="endPoint">${ call.toWhere }</h5>
									<div class="row row-cols-2">
										<p class="card-text col-8 callType">${ call.callType }</p>
										<p class="card-text col-8">${ call.toDriver }</p>
										<h6 class="col-8">${ fn:length(call.dogs) }마리</h6>
										<input type="hidden" name="${ call.callNo }"
											value="${ call.callNo }" />
										<button type="button"
											class="btn btn-outline-primary col-3 btn-select"
											onclick="selectCallByDriver(this);">선택</button>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.1/sockjs.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e5214e2509e20a333ab78bf3a781c074&libraries=services,clusterer,drawing"></script>

<!--<script src="${path}/js/book_driver_confirm.js"></script>-->
<script>
$(function () {
	var socket = new SockJS("/work/notify");
	stompClient = Stomp.over(socket);
    stompClient.connect({}, function (frame) {
    console.log('Connected: ' + frame);
    });
});

callNoInStore = localStorage.getItem('callNo');

$(function () {
	
    // 콜넘버에 해당하는 콜객체를 불러와서 출발지, 도착지, 예상금액을 찍어준다.
        
    console.log("callNoInStore : " + callNoInStore);
    
    let data = {
          	 'callNo' : callNoInStore
          	 };
    
    if (callNoInStore !== null && callNoInStore !== '') {
    	// null 이거나 ''이면 아래 ajax를 실행하지 않는다.
    	
	   	 $.ajax({
			 async : true,
			 url : 'confirm/progress',
			 dataType : 'json',
			 contentType : "application/json; charset=UTF-8",
			 type : 'post',
			 data : JSON.stringify(data),
			 success : function(call) {
	
				 console.log('ajax success!');
				 
				 console.log(call);
				  
				 $('.where-from').val(call.fromWhere);
				 
				 $('.where-to').val(call.toWhere);
				 
	             $('.btn-select').prop('disabled', true); // 기타선택 버튼 비활성화
	
	             $('.btn-finish').prop('disabled', false); // 운행종료 버튼 활성화	 
	             
	             $('input[name=callNo]').val(call.callNo);
	             
			 },
			 error : function(e) {
	
				 alert('선택하신 예약내역을 불러올 수 없습니다.');
			 }
		 });
    	
	     // ------------------------------------------------------------------------------------------------

// 	    document.getElementsByName('fromWhere')[0].value = document.getElementById("startPoint").innerText;
//	 	document.getElementsByName('toWhere')[0].value = document.getElementById("endPoint").innerText;
	 	
	 	// var point = [];

	 	// geocoder.addressSearch(document.getElementById("startPoint").innerText, function(result, status) {

	 			
	 	// 	   // 정상적으로 검색이 완료됐으면 
	 	//      if (status === kakao.maps.services.Status.OK) {

	 	//         var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	 	//         // 결과값으로 받은 위치를 마커로 표시합니다
	 	//         var marker = new kakao.maps.Marker({
	 	//             map: map,
	 	//             position: coords
	 	//         });

	 	//         // 인포윈도우로 장소에 대한 설명을 표시합니다
	 	//         var infowindow = new kakao.maps.InfoWindow({
	 	//             content: '<div style="width:150px;text-align:center;padding:6px 0;">출발지</div>'
	 	//         });
	 	//         infowindow.open(map, marker);

	 	//         // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	 	//         point.push(parseFloat(result[0].y));
	 	//         point.push(parseFloat(result[0].x));
	 	//     } 
	 	// }); 
	 	// geocoder.addressSearch(document.getElementById("endPoint").innerText, function(result, status) {

	 	//      if (status === kakao.maps.services.Status.OK) {

	 	//         var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	 	//         var marker = new kakao.maps.Marker({
	 	//             map: map,
	 	//             position: coords
	 	//         });

	 	//         var infowindow = new kakao.maps.InfoWindow({
	 	//             content: '<div style="width:150px;text-align:center;padding:6px 0;">목적지	</div>'
	 	//         });
	 	//         infowindow.open(map, marker);
	 	//         point.push(parseFloat(result[0].y));
	 	//         point.push(parseFloat(result[0].x));
	 	//     } 
	 	// });  
	 	// function setBounds() {
	 	// 	var cost = Math.floor(getDistanceFromLatLonInKm(point[0],point[1],point[2],point[3])) * 150;
	 	// 	if(cost<3000){
	 	// 		cost=3000
	 	// 	}
	 	//     document.getElementsByName('estCost')[0].value = cost;
	 	// 	var points = [
	 	//   	  new kakao.maps.LatLng(point[0], point[1]),
	 	// 	  new kakao.maps.LatLng(point[2], point[3])
	 	// 	];

	 	// 	// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
	 	// 	var bounds = new kakao.maps.LatLngBounds();    

	 	// 	var i, marker;
	 	// 	for (i = 0; i < points.length; i++) {
	 	// 	    // 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
	 	// 	    marker =     new kakao.maps.Marker({ position : points[i] });
	 	// 	    marker.setMap(map);
	 		    
	 	// 	    // LatLngBounds 객체에 좌표를 추가합니다
	 	// 	    bounds.extend(points[i]);
	 	// 	}

	 			
	 	// 	   // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
	 	// 	    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
	 	// 	    map.setBounds(bounds);
	 	// }
	 	
	 	// setTimeout(setBounds,500);
	 	
	     // ------------------------------------------------------------------------------------------------
    } 
});

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

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
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
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">목적지	</div>'
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

function selectCallByDriver(e) {
	// 예약상태를 '기사'로 바꿈
	
    let callNo = $(e).siblings('input').val();
    let dUserNo = $('input[name=dUserNo]').val();

    console.log('selectCallByDriver callNo : ' + callNo);
    
    $('input[name=callNo]').val(callNo);

    let data = {
	    'dUserNo': dUserNo,
    	'callNo': callNo
    };

	$.ajax({
        url : 'confirm/select',
        dataType : 'json',
        // contentType : "application/json; charset=UTF-8",
        type : 'post',
        data : data,
        // async : false,
        // cache : false,
        // processData : false,
		success : function(result) {

         	stompClient.send("/topic/call/" + callNo, {}, JSON.stringify(data)); // send() 메소드 실행

        	deleteCall(e);
         	
         	console.log('selectCallByDriver() called ' + callNo);
         	
            alert('예약 선택이 완료되었습니다. 마이페이지에서 내역을 확인하세요.');

            $(e).prop('disabled', true); // 선택한 예약 버튼 비활성화
            
            $('.btn-select').prop('disabled', true); // 기타선택 버튼 비활성화

            $('.btn-finish').prop('disabled', false); // 운행종료 버튼 활성화
            
            localStorage.setItem('callNo', callNo); // localStorage 아이템 세팅
            
            console.log('callNoInStore :' + callNo);
		},
		error : function(e) {

			console.log(e);

			alert('에러가 발생했습니다. 다시 시도해주세요!');
		}
	});
	
	document.getElementsByName('fromWhere')[0].value = document.getElementById("startPoint").innerText;
	document.getElementsByName('toWhere')[0].value = document.getElementById("endPoint").innerText;
	
	var point = [];

	geocoder.addressSearch(document.getElementById("startPoint").innerText, function(result, status) {

			
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

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        point.push(parseFloat(result[0].y));
	        point.push(parseFloat(result[0].x));
	    } 
	}); 
	geocoder.addressSearch(document.getElementById("endPoint").innerText, function(result, status) {

	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });

	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">목적지	</div>'
	        });
	        infowindow.open(map, marker);
	        point.push(parseFloat(result[0].y));
	        point.push(parseFloat(result[0].x));
	    } 
	});  
	function setBounds() {
		var cost = Math.floor(getDistanceFromLatLonInKm(point[0],point[1],point[2],point[3])) * 150;
		if(cost<3000){
			cost=3000
		}
	    document.getElementsByName('estCost')[0].value = cost;
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

function deleteCall(e){
	if(e)
	{
		var cell = e.parentNode.parentNode.parentNode.parentNode;
		console.log(cell);
		while ( cell.hasChildNodes() ) { 
			cell.removeChild( cell.firstChild ); 
		}
		cell.remove();
	}
}

function finishCallByDriver(e) {
    let callNo = $('input[name=callNo]').val();

    console.log(callNo);

    let data = {
    	'callNo': callNo
    };

	$.ajax({
        url : 'confirm/finish',
        dataType : 'json',
        type : 'post',
        data : data,
		success : function(result) {
			console.log("result : " + result);
			            
            console.log("callNo in success function  : " + callNo);
                        
            alert('선택하신 픽업서비스 운행이 종료되었습니다.');

            $('.btn-select').prop('disabled', false); // 선택버튼 전체 활성화
            
            $('.btn-finish').prop('disabled', true); // 운행종료 버튼 비활성화
            
            localStorage.setItem('callNo', ''); // localStorage 아이템 세팅
		},
		error : function(e) {

			console.log(e);

			alert('에러가 발생했습니다. 다시 시도해주세요!');
		}
	});
}

function refresh(){
	setTimeout(costView,500);
}
function costView(){
	point = [];
	if(document.getElementsByName('fromWhere')[0].value != ""){
		geocoder.addressSearch(document.getElementsByName('fromWhere')[0].value, function(result, status) {
			
		     if (status === kakao.maps.services.Status.OK) {
	
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
	
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
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">목적지	</div>'
		        });
		        infowindow.open(map, marker);
		        point.push(parseFloat(result[0].y));
		        point.push(parseFloat(result[0].x));
		    } 
		});  
		function setBounds() {
			var cost = Math.floor(getDistanceFromLatLonInKm(point[0],point[1],point[2],point[3])) * 150;
			if(cost<3000){
				cost=3000
			}
		    document.getElementsByName('estCost')[0].value = cost;
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
}
refresh();
</script>
</html>
