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
<script src="${path}/js/jquery-3.5.1.js"></script>

<title>애견정보 불러오기</title>
</head>
<body>
	<section>
		<!-- 
		<div class="container my-2">
			<div class="row">
				<div class="col-sm text-center py-4 myDogsEvent">
					<a href="" class="text-decoration-none text-dark">
						<img src="${path}/resources/images/mung.png" class="myDogs rounded-pill img-thumbnail" alt="">
						<p class="h5 my-4 fw-bold">애견이름</p>
					</a>
				</div>
			</div>
		</div>
		-->

		<div class="container my-2">
			<div class="row">
				<c:if test="${dog == null}">
					<div>조회된 애견이 없습니다</div>
				</c:if>
				<c:if test="${dog != null}">
					<c:forEach var="dog" items="${dog}" end="2">
						<div class="col-sm text-center py-4 myDogsEvent">
							<a href="" class="text-decoration-none text-dark"> <img
								src="${path }/resources/images/mung.png"
								class="myDogs rounded-pill img-thumbnail" alt="">
								<p class="h5 my-4 fw-bold">${dog.dogName }</p>
							</a>
						</div>
					</c:forEach>
				</c:if>
			</div>
		</div>
	</section>
</body>
</html>
