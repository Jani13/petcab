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
				<div class="col-md-4 pickup-details">
					<div class="pt-5 pb-3 pickup-heading">
						<h2 class="mb-3" style="margin-left: 10px;">1. 제휴업체 검색</h2>
					</div>

					<div class="pickup-fill-in">
						<!-- 여기에 내용 삽입 -->
					</div>
				</div>

				<div class="col-md locationMap">지도 API</div>
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
        document.getElementsById("bookEmgA").style.visibility="visible";
        document.getElementsById("bookEmgB").style.visibility="hidden";
	});

	function selectGen() {
		$('input[name=callType]').val('일반');

		// hover, border change

		window.location = "${path}/call/book";
	}

	function selectEmg() {
		$('input[name=callType]').val('긴급');

		// hover, border change

		window.location = "${path}/call/book/emg_a";
	}

	function goNext() {
        document.getElementsById("bookEmgA").style.visibility="hidden";
        document.getElementsById("bookEmgB").style.visibility="visible";
	}
	
	function goBack() {
        document.getElementsById("bookEmgB").style.visibility="hidden";
        document.getElementsById("bookEmgA").style.visibility="visible";
	}
</script>
</html>
