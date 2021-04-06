<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>    
<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:set var="addr" value="${fn:split(loginMember.address,',')}"/>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
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

    <!-- header footer include시 밑에 소스 2줄-->
    <!-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ -->
    <link rel="stylesheet" href="${ path }/css/headerfooter.css" />
 	<script src="${ path }/js/jquery-3.5.1.js"></script>
    <!-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ -->

    <style>
        .myDogs {
            width: 200px;
            height: 200px;
        }

        .successCall {
            width: 300px;
            height: 300px;
        }

        .myDogsEvent:hover {
            background-color: seashell;
        }

        .userPageEvent:hover {
            background-color: rgba(138, 136, 136, 0.11);
        }
    </style>

  </head>
  <body class="body-wrap">
    <jsp:include page="../common/header.jsp" />
    <jsp:include page="../common/nav.jsp" />
    <section>
        <div class="d-flex justify-content-center">
            <div class="section-width">
                <div class="p-4" style="background-color:#4ec7f2">
                    <p class="h1 fw-bold text-white">My Page</p>
                </div> 
                <div class="container-fluid">
                    <div class="row d-flex justify-content-center">
                        <!-- 첫 번째 컨텐츠 내 정보 박스 -->
                        <div class="col-md-6 py-5" style="border-right: 1px ridge; border-top: 1px ridge;">
                            <p class="h3 fw-bold mt-3 mx-4">내 정보</p>
                            <form class="row my-5 d-flex justify-content-center">
                                <div class="col-sm-10 my-2">
                                    <label for="Id">아이디</label>
                                    <input type="text" class="form-control" id="Id" name="userId" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" readonly
                                    value="${loginMember.userId }">
                                </div>
                                <div class="col-sm-10 my-2">
                                    <label for="Name">이름</label>
                                    <input type="text" class="form-control" id="Name" name="userName" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" readonly
                                    value="${loginMember.userName }">
                                </div>
                                <div class="col-sm-10 my-2">
                                    <label for="callNum">전화번호</label>
                                    <input type="text" class="form-control" id="callNum" name="phone" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
                                    value="${loginMember.phone }">
                                </div>
                                <div class="col-sm-10 form-floating mb-3 my-2">
                                   <div for="postalAddr">주소</div>
                                   <div class="input-group mb-1">
                                       <input type="text" class="form-control postalAddr" name="postalAddr" id="postalAddr" placeholder="우편번호" aria-label="Recipient's username" aria-describedby="basic-addon2"
                                       value="${loginMember.postCode}">
                                       <input type="button" class="input-group-text" id="findPostalAddr" onclick="DaumPostcode()" value="우편번호 검색"></input>
                                   </div>   
                                   <div class="input-group mb-1">
                                       <input type="text" class="form-control addr1" name="addr1" id="addr1" placeholder="주소"
                                       value="${addr[0]}">
                                   </div>
                                   <!-- 동이름 / 빌딩이름 등이 나온다 -->
                                   <div class="row">
                                       <div class="col-md-7" style="height: 42px;">
                                           <input type="text" class="form-control addr2" name="addr2" id="addr2" placeholder="상세주소"
                                           value="${addr[1]}">
                                       </div>
                                       <div class="col-md-5">
                                           <input type="text" class="form-control addr3" name="addr3" id="addr3" placeholder="참고항목" readonly>
                                       </div>
                                    </div>
                                </div>
                                <div class="row d-flex justify-content-center my-3">    
                                    <input type="button" class="col-3 btn btn-outline-info mx-auto" value="비밀번호 변경">
                                    <input type="button" class="col-3 btn btn-outline-info " value="정보 수정">
                                    <input type="button" class="col-2 btn btn-outline-danger mx-auto" value="탈퇴하기">
                                </div>
                            </form> 
                        </div> 
                        <!-- 두 번째 컨텐츠 리뷰 관리 박스 -->
                        <div class="col-md-6 py-5" style="border-top: 1px ridge;">
                            <div class="d-flex justify-content-between">
                                <p class="h3 fw-bold mt-3 mx-4">리뷰 관리</p>
                                <a href="" class="my-4 text-dark"><i class="fas fa-plus">더보기</i></a>
                            </div>
	                        <div class="container-fluid">
								<c:if test="${review == null}">
									<div>조회된 리뷰가 없습니다</div>
								</c:if>
								<c:if test="${review != null}">
									<c:forEach var="board" items="${review}" end="2">
			                        	<div class="w-100 card border-light mb-3 my-5" >
				                            <div class="card-header bg-transparent ">
				                            	<fmt:formatDate type="both" value="${board.postDate}" pattern="yyyy.MM.dd"/>
				                            </div>
				                            <div class="card-body ">
					                            <h5 class="card-title fw-bold">${board.title}</h5>
					                            <p class="card-text">${board.content}</p>
			                            	</div>
			                    	    </div>
			                    	</c:forEach>
								</c:if>
                            </div>   
                        </div>
                        <!-- 세 번째 컨텐츠 내 애완동물 정보 박스 -->
                        <div class="col-12 pt-2 pt-3 row justify-content-center" style="border-top: 1px ridge;">
                            <div class="col-12 h3 fw-bold mt-3">
                                내 애완동물 정보
                                <button type="button" class="btn btn-outline-info border-white rounded-pill"><i class="fas fa-eraser"></i>수정</button>
                                <button type="button" class="btn btn-outline-info border-white rounded-pill"><i class="fas fa-plus"></i>추가</button>
                            </div>
                            <div class="container my-2">
                                <div class="row">
									<c:if test="${dog == null}">
										<div>조회된 애견이 없습니다</div>
									</c:if>
									<c:if test="${dog != null}">
										<c:forEach var="dog" items="${dog}" end="2">
		                                    <div class="col-sm text-center py-4 myDogsEvent">
		                                        <a href="" class="text-decoration-none text-dark">
		                                            <img src="${path }/resources/images/mung.png" class="myDogs rounded-pill img-thumbnail" alt="">
		                                            <p class="h5 my-4 fw-bold">${dog.dogName }</p>
		                                        </a>
		                                    </div>
	                                    </c:forEach>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- 현재 예약내역  -->
                <div class="p-2 d-flex justify-content-between" style="background-color:#4ec7f2">
                    <p class="h4 mx-3 my-2 fw-bold text-white">현재 예약 내역</p>
                    <a href="" class="my-2 text-white"><i class="fas fa-plus">더보기</i></a>
                </div>
                <div class="container-fluid">
                	<c:if test="${useCall== null}">
						<div class="card-body p-4">
							조회된 예약이 없습니다
						</div>
					</c:if>
					<c:if test="${useCall != null}">
						<c:forEach var="call" items="${useCall}" end="1">
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
		                                <button type="button" class="btn btn-outline-info border-info rounded-pill">예약취소</button>
		                            </h5>
		                            <p class="card-text">
		                                애견 이름 : ${call.animalNoA}<br>
		                                예상 소요 시간 : 미정<br>
		                                예상 결제 금액 : 미정<br>
		                                드라이버 : ${call.driver.carType} / ${call.driver.carNo}<br>
		                                제휴업체 : 미정
		                            </p>
		                        </div>
		                    </div>
	                    </c:forEach>
                   	</c:if>
                </div>

                <!-- 이용 완료 목록 -->
                <div class="p-2" style="background-color:#4ec7f2">
                    <p class="h4 mx-3 my-2 fw-bold text-white">이용 완료 목록</p>
                </div>
                <div class="container-fluid">
                    <div class="row">
                    	<c:if test="${endCall == null}">
							<div>조회된 예약이 없습니다</div>
						</c:if>
						<c:if test="${endCall != null}">
							<c:forEach var="call" items="${endCall}" end="2">
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
		                                        애견 이름 : ${call.animalNoA}<br>
		                                        예상 소요 시간 : 아직미정<br>
		                                        예상 결제 금액 : 아직미정<br>
		                                        드라이버 : ${call.driver.carType} / ${call.driver.carNo}<br>
		                                        제휴업체 : 아직미정
		                                    </p>
		                            	</div>
		                            </div>
		                        </div>
			                </c:forEach>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <jsp:include page="../common/footer.jsp" />

    <script>
    function DaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수
						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}
						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName
										: data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.querySelector(".addr3").value = extraAddr;

						} else {
							document.querySelector(".addr3").value = '';
						}
						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.querySelector(".postalAddr").value = data.zonecode;
						document.querySelector(".addr1").value = addr;
						document.querySelector(".addr2").value = '';
						// 커서를 상세주소 필드로 이동한다.
						document.querySelector(".addr2").focus();
					}
				}).open();
	}
    </script>
  </body>
</html>
