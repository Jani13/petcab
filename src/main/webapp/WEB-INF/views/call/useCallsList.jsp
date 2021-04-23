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
<title>Insert title here</title>
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
				<div class="p-2 d-flex justify-content-between" style="background-color:#4ec7f2">
                    <p class="h4 mx-3 my-2 fw-bold text-white">현재 예약 내역</p>
                </div>
                <div class="container-fluid">
                	<c:if test="${empty useCall}">
						<div class="card-body text-center fw-bold p-4">
							조회된 예약이 없습니다
						</div>
					</c:if>
					<c:if test="${useCall != null}">
						<c:forEach var="call" items="${useCall}">
		                    <div class="card w-70 m-5 userPageEvent">
		                        <div class="card-body p-4">
		                            <c:if test='${call.callType == "일반"}'> 
		                            	<i class="fas fa-bone text-secondary">일반</i>
		                            </c:if>
		                            <c:if test='${call.callType == "긴급"}'>
		                            	<i class="fas fa-meteor text-danger">긴급</i>
		                            </c:if>
		                            <h5 class="card-title fw-bold">
		                                ${call.fromWhere}
		                                <i class="fas fa-arrow-right"></i> 
		                                 ${call.toWhere}
		                                <span class="mx-3">${call.pickupTime}</span>
		                                <button type="button" class="btn btn-outline-info border-info rounded-pill"
		                                onclick="location.href='${path}/call/book/listCancel/${call.callNo}'">예약취소</button>
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
		                                예상 결제 금액 : ${call.paidAmount}<br>
		                            </p>
		                        </div>
		                    </div>
	                    </c:forEach>
                   	</c:if>
                </div>

</body>
</html>