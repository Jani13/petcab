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
    <title>데려다줄개 - 마이페이지</title>
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
            height: 350px;
        }

        .myDogsEvent:hover {
            background-color: seashell;
        }

        .userPageEvent:hover {
            background-color: rgba(138, 136, 136, 0.11);
        }
        
		.box-hover:hover{
			background-color : rgba(0,0,0,0.1);
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
                            <form class="row my-5 d-flex justify-content-center" method="post" action="${path}/updateinfo">
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
                                    <input type="button" class="col-3 btn btn-outline-info mx-auto"
                                    onclick="location.href='${path}/changePwd/'" value="비밀번호 변경">
                                    <input type="submit" class="col-3 btn btn-outline-info " value="정보 수정">
                                    <input type="button" class="col-2 btn btn-outline-danger mx-auto" value="탈퇴"
                                    onclick="location.href='${path}/user/delete/'">
                                </div>
                            </form> 
                        </div> 
                        <!-- 두 번째 컨텐츠 리뷰 관리 박스 -->
                        <div class="col-md-6 py-5" style="border-top: 1px ridge;">
                            <div class="d-flex justify-content-between">
                                <p class="h3 fw-bold mt-3 mx-4">내가 작성한 리뷰</p>
                                <a class="my-4 text-dark" onclick="myReviewList();"><i class="fas fa-plus">더보기</i></a>
                            </div>
	                        <div class="container-fluid">
								<c:if test="${empty review}">
									<div class="text-center fw-bold my-5">
										조회된 리뷰가 없습니다										
									</div>
								</c:if>
								<c:if test="${review != null}">
									<c:forEach var="board" items="${review}" end="2">
										<a href="${path}/review/reviewView?reviewNo=${board.reviewNo}" style="color:black;text-decoration: none;">
				                        	<div class="w-100 card border-light mb-3 my-5 box-hover" >
					                            <div class="card-header bg-transparent ">
					                            	<c:out value="${board.postDate}"/>
					                            </div>
					                            <div class="card-body ">
						                            <h5 class="card-title fw-bold">${board.title}</h5>
						                            <p class="card-text">${board.content}</p>
				                            	</div>
				                    	    </div>
			                    	    </a>
			                    	</c:forEach>
								</c:if>
                            </div>   
                        </div>
                        <!-- 세 번째 컨텐츠 내 애완동물 정보 박스 -->
                        <div class="col-12 pt-2 pt-3 row justify-content-center" style="border-top: 1px ridge;">
                            <div class="col-12 h3 fw-bold mt-3">
                                내 애완동물 정보
                                <button type="button" class="btn btn-outline-info border-white rounded-pill" onclick="location.href ='${path}/dog/mdogInformation'" ><i class="fas fa-eraser"></i>수정</button>
                                <button type="button" class="btn btn-outline-info border-white rounded-pill" onclick="location.href ='${path}/dog/dogInformation'" ><i class="fas fa-plus"></i>추가</button>
                            </div>
                            <div class="container my-2">
                                <div class="row">
									<c:if test="${empty dog}">
										<div>조회된 애견이 없습니다</div>
									</c:if>
									<c:if test="${dog != null}">
										<c:forEach var="dog" items="${dog}" end="2">
                                          <div class="col-sm text-center py-4 myDogsEvent">
                                              <a href="${path}/dog/view?dogNo=${dog.dogNo}" class="text-decoration-none text-dark">
                                              <c:if test="${dog.imageRe==null}">
                                                  <img src="${path }/resources/images/mung.png" class="myDogs rounded-pill img-thumbnail" alt="">
                                              </c:if>
                                              <c:if test="${dog.imageRe!=null}">
                                                  <img src="${path }/resources/upload/dog/${dog.imageRe}" class="myDogs rounded-pill img-thumbnail" alt="">
                                              </c:if>
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
                    <a class="my-2 text-white" onclick="useCallsList();"><i class="fas fa-plus">더보기</i></a>
                </div>
                <div class="container-fluid">
                	<c:if test="${empty useCall}">
						<div class="card-body text-center fw-bold p-4">
							조회된 예약이 없습니다
						</div>
					</c:if> 
					<c:if test="${useCall != null}">
						<c:forEach var="call" items="${useCall}" end="1">
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

                <!-- 이용 완료 목록 -->
                <div class="p-2 d-flex justify-content-between" style="background-color:#4ec7f2">
                    <p class="h4 mx-3 my-2 fw-bold text-white">이용 완료 목록</p>
                    <a class="my-2 text-white" href="${path}/call/book/end/${loginMember.userId}" target="_blank"><i class="fas fa-plus">더보기</i></a>
                </div>
                <div class="container-fluid">
                    <div class="row">
                    	<c:if test="${empty endCall}">
							<div class="card-body text-center fw-bold p-4">
								이용 완료된 내역이 없습니다
							</div>
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
		                                        애견 이름 : 
			                                        <c:forEach var="dog" items="${call.dogs}" end="2">
			                                		🐶${dog.dogName} 
			                                		</c:forEach>
		                                		<br>
		                                        예상 결제 금액 : ${call.paidAmount} <br>
		                                        드라이버 : ${call.driver.carType} / ${call.driver.carNo}<br>
				                            	<c:if test='${call.callType == "긴급"}'>
				                                제휴업체 : ${call.partner.partnerName }<br>
				                            	</c:if>
		                                    </p>
		                                    <div class="text-center pt-3">
		                                    	<button class="btn btn-outline-info"
		                                    	onclick="location.href='${path}/review/reviewWrite?callNo=${call.callNo}'">리뷰작성</button>
		                                    </div>
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
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e5214e2509e20a333ab78bf3a781c074&libraries=services,clusterer,drawing"></script>
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
