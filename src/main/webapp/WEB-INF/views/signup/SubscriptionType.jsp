<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>SubscriptionType</title>
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
        <link 
		rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" 
		integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" 
		crossorigin="anonymous">
        
    <script src="${path}/js/jquery-3.5.1.js"></script>
    <link rel="stylesheet" href="${path}/css/headerfooter.css" />
    <link rel="stylesheet" href="${path }/css/signupdog.css" />
	<style>
        .userType {
            height: 350px;
            background-color: white;
        }

        .userType:hover {
            background-color: seashell;
        }
    </style>
    </head>
    <body>
	  <jsp:include page="../common/header.jsp" />
	  <jsp:include page="../common/nav.jsp" />
        <section>
            <div class="container">

                    <br>
                <div class="row text-center">
                    <div class="col-sm-3" style="display: flex; align-items: center;
                    justify-content: center;
                    flex-direction: column;">
                        <img src="${path}/images/one.png" >
                        <div
                            class="card border-info mb-3"
                            style="max-width: 8rem"
                        >
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title" style="font-size: 20px;">약관동의</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3" style="display: flex; align-items: center;
                    justify-content: center;
                    flex-direction: column;">
                        <img src="${path }/images/two.png" >
                        <div
                            class="card border-info mb-3"
                            style="max-width: 8rem"
                        >
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title" style="font-size: 20px;">가입유형</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3" style="display: flex; align-items: center;
                    justify-content: center;
                    flex-direction: column;">
                        <img src="${path }/images/three.png" >
                        <div
                            class="card border-dark mb-3"
                            style="max-width: 8rem"
                        >
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title" style="font-size: 20px;">정보입력</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3" style="display: flex; align-items: center;
                    justify-content: center;
                    flex-direction: column;">
                        <img src="${path }/images/for.png" >
                        <div
                            class="card border-dark mb-3"
                            style="max-width: 8rem"
                        >
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title" style="font-size: 20px;">가입완료</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <hr />
                <br />
                <h1>가입유형 선택</h1>
                <br />
           		<!-- <div class="container">
			        <div class="row d-flex p-5">
			            <div class="col-6 p-4 text-center">
			                <a href="Information.jsp?userType='ROLE_MEMBER'" class="row d-flex justify-content-center 
			                text-decoration-none text-dark userType" style="border: 1px ridge;">
			                    <i class="col-12 far fa-user fa-4x my-5"></i>
			                    <p class="col-12 h5 fw-bold fs-3">데려다줄개 일반회원가입</p>
			                    <p class="col-12"> 
			                        데려다줄개 회원으로 가입됩니다. <br> 
			                        회원자격을 유지하는 동안 <br>
			                        개인정보는 별도의 개인정보처리시스템에 저장됩니다.
			                    </p>
			                </a>
			            </div>
			            <div class="col-6 p-4 text-center">
			                <a href="Information.jsp?userType='ROLE_DRIVER" class="row d-flex justify-content-center 
			                text-decoration-none text-dark userType" style="border: 1px ridge;">
			                    <i class="col-12 fas fa-car fa-4x my-5"></i>
			                    <p class="col-12 h5 fw-bold fs-3">데려다줄개 드라이버 회원가입</p>
			                    <p class="col-12"> 
			                        회원가입 후 데려다줄개 드라이버 지원을 하실수 있습니다.<br> 
			                        회원자격을 유지하는 동안 <br> 
			                        개인정보는 별도의 개인정보처리시스템에 저장됩니다.
			                    </p>
			                </a>
			            </div>
			            <div class="col-6 p-4 text-center">
			                <a href="Information.jsp?userType='ROLE_PARTNER'" class="row d-flex justify-content-center 
			                text-decoration-none text-dark userType" style="border: 1px ridge;">
			                    <i class="col-12 far fa-handshake fa-4x my-5"></i>
			                    <p class="col-12 h5 fw-bold fs-3">데려다줄개 제휴업체 회원가입</p>
			                    <p class="col-12"> 
			                        회원가입 후 데려다줄개 제휴업체 파트너가 되어주세요.<br> 
			                        회원자격을 유지하는 동안 <br>
			                        개인정보는 별도의 개인정보처리시스템에 저장됩니다.
			                    </p>
			                </a>    
			            </div>
			        </div>            
		    	</div>  -->
                	
                   <!-- <div class="container"> -->
				        <div class="row d-flex p-5">
				            <div class="col-md-6 p-4">
				                <form action="Information" method="get">
					                <button type="submit" class="row d-flex justify-content-center userType" name="userType" 
					                		value="ROLE_MEMBER" onclick="location.href='${path}/singup/Information'">
					                		
					                    <i class="col-12 far fa-user fa-4x my-5"></i>
					                    <p class="col-12 h5 fw-bold fs-3">데려다줄개 일반회원가입</p>
					                    <p class="col-12"> 
					                        데려다줄개 회원으로 가입됩니다. <br> 
					                        회원자격을 유지하는 동안 <br>
					                        개인정보는 별도의 개인정보처리시스템에 저장됩니다.
					                    </p>
					                </button>
				                </form>
				            </div>
				            <div class="col-md-6 p-4">
				            	<form action="Information" method="get">
					                <button type="submit" class="row d-flex justify-content-center userType" name="userType"
					                		value="ROLE_DRIVER" onclick="location.href='${path}/singup/Information'">
					                    <i class="col-12 fas fa-car fa-4x my-5"></i>
					                    <p class="col-12 h5 fw-bold fs-3">데려다줄개 드라이버 회원가입</p>
					                    <p class="col-12"> 
					                        회원가입 후 데려다줄개 드라이버 지원을 하실수 있습니다.<br> 
					                        회원자격을 유지하는 동안 <br> 
					                        개인정보는 별도의 개인정보처리시스템에 저장됩니다.
					                    </p>
					                </button>
				            	</form>
				            </div>
				            <div class="col-md-6 p-4">
				        		<form action="Information" method="get">
					                <button type="submit" class="row d-flex justify-content-center userType" name="userType"
					                		value="ROLE_PARTNER" onclick="location.href='${path}/singup/Information'">
				                   		<i class="col-12 far fa-handshake fa-4x my-5"></i>
					                    <p class="col-12 h5 fw-bold fs-3">데려다줄개 제휴업체 회원가입</p>
					                    <p class="col-12"> 
					                        회원가입 후 데려다줄개 제휴업체 파트너가 되어주세요.<br> 
					                        회원자격을 유지하는 동안 <br>
					                        개인정보는 별도의 개인정보처리시스템에 저장됩니다.
					                    </p>
					                </button>    
				               </form>
				            </div>
				        </div>            
	    			</div> 
            <!-- </div> -->
        </section>
  <jsp:include page="../common/footer.jsp" />
    </body>
</html>   