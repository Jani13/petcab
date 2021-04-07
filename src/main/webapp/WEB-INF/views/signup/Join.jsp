<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${pageContext.request.contextPath }"/>

<% 
	request.setCharacterEncoding("UTF-8");
	String userType = request.getParameter("userType");
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Join</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"
        integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js"
        integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc"
        crossorigin="anonymous"></script>

    <script src="${path}/js/jquery-3.5.1.js"></script>
    <link rel="stylesheet" href="${path}/css/headerfooter.css" />
    <link rel="stylesheet" href="${path }/css/signupdog.css" />

</head>

<body>
     <jsp:include page="../common/header.jsp" />
	 <jsp:include page="../common/nav.jsp" />
    
    <section>
        <div class="container">
            <form action="" method="post">
                <br>
                <div class="row text-center">
                    <div class="col-sm-3" style="display: flex; align-items: center;
                    justify-content: center;
                    flex-direction: column;">
                        <img src="${path }/images/one.png">
                        <div class="card border-info mb-3" style="max-width: 8rem">
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
                        <img src="${path }/images/two.png">
                        <div class="card border-info mb-3" style="max-width: 8rem">
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
                        <img src="${path }/images/three.png">
                        <div class="card border-info mb-3" style="max-width: 8rem">
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
                        <img src="${path }/images/for.png">
                        <div class="card border-info mb-3" style="max-width: 8rem">
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
                <br />
                <div class="card bg-dark text-white">
                    <img src="${path}/images/joinImg.jpg" class="card-img" alt="...">
                    <div class="card-img-overlay my-5 p-4">
                      <p class="card-text my-5" style="font-size: 30px; margin-left: 700px;" >
                      	가입이 완료되었습니다. 
                      	<br>데려다줄개 많이 이용해주세요.<br>
                      	<span class="fs-5">* 모든 서비스는 로그인 후 이용 가능합니다.</span>
                      </p>
                    </div>
                </div>
                <br>
                  <div style="text-align:center;">
                    <button type="button" class="btn btn-outline-info" 
                    		onclick="location.href='${path}/login'"
                    >시작 하기</button>
                  </div>
            </form>
            <br>
        </div>
    </section>
  <jsp:include page="../common/footer.jsp" />
</body>

</html>