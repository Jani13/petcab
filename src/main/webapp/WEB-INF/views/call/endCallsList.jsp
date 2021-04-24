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
<title>종료내역</title>
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
				<div class="p-2" style="background-color:#4ec7f2">
                    <p class="h4 mx-3 my-2 fw-bold text-white">이용 완료 목록</p>
                </div>
                <div class="container-fluid">
                    <div class="row">
                    	<c:if test="${empty endCall}">
							<div class="card-body text-center fw-bold p-4">
								이용 완료된 내역이 없습니다
							</div>
						</c:if>
						<c:if test="${endCall != null}">
							<c:forEach var="call" items="${endCall}">
		                        <div class="col-sm-4">
		                            <div class="card m-5 successCall">
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
		                                    </h5>
		                                    <p class="fs-5">${call.pickupTime}</p>
		                                    <p class="card-text m-0">
		                                        애견 이름 : 
			                                        <c:forEach var="dog" items="${call.dogs}" end="2">
			                                		🐶${dog.dogName} 
			                                		</c:forEach>
		                                		<br>
		                                        예상 결제 금액 : ${call.paidAmount} <br>
		                                        <c:if test="${loginMember.userType !='ROLE_DRIVER'}">
		                                        드라이버 : ${call.driver.carType} / ${call.driver.carNo}<br>
		                                        </c:if>
				                            	<c:if test='${call.callType == "긴급"}'>
				                                제휴업체 : ${call.partner.partnerName }<br>
				                            	</c:if>
		                                    </p>
		                                    <div class="text-center pt-3">
		                                        <c:if test="${loginMember.userType !='ROLE_DRIVER'}">
			                                    	<button class="btn btn-outline-info"
			                                    	onclick="location.href='${path}/review/reviewWrite?callNo=${call.callNo}'">리뷰작성</button>
		                                    	</c:if>
		                                    </div>
		                            	</div>
		                            </div>
		                        </div>
			                </c:forEach>
                        </c:if>
                    </div>
                </div>
</body>
</html>