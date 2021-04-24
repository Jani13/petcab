<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta charset="UTF-8">
<title>리뷰 관리</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"
	integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js"
	integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc"
	crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/7eaa61533c.js"
	crossorigin="anonymous"></script>
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>

<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
.box-hover:hover{
	background-color : rgba(0,0,0,0.1);
}

</style>
</head>
<body>
	<div class="col-md-6 py-5" style="border-top: 1px ridge;">
		<div class="d-flex justify-content-between">
			<p class="h3 fw-bold mt-3 mx-4">리뷰 관리</p>
		</div>
		<div class="container-fluid">
			<c:if test="${empty review}">
				<div class="text-center fw-bold my-5">조회된 리뷰가 없습니다</div>
			</c:if>
			<c:if test="${review != null}">
				<c:forEach var="review" items="${review}">
					<a href="${path}/review/reviewView?reviewNo=${review.reviewNo}" style="color:black;text-decoration: none;">
						<div class="w-100 card border-light mb-3 my-5 box-hover">
							<div class="card-header bg-transparent ">
								<c:out value="${review.postDate}" />
							</div>
							<div class="card-body ">
								<h5 class="card-title fw-bold">${review.title}</h5>
								<p class="card-text">${review.content}</p>
							</div>
						</div>
					</a>
				</c:forEach>
			</c:if>
		</div>
	</div>
</body>
</html>