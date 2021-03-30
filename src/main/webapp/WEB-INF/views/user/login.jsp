<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>   

<c:set var="path" value="${pageContext.request.contextPath }"/> 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" 
            rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" 
            crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" 
            crossorigin="anonymous"></script>
    <style>

        .container {
            width: 1200px;
        }

        /* section{
            width: 1200px;
            margin: auto;
        } */
        /* div{
            border: 1px solid red;
        } */

    </style>
    <link rel="stylesheet" href="${path}/css/headerfooter.css" />
    <script src="${path}/js/resources/js/jquery-3.5.1.js"></script>
    
</head>
<body>
    <jsp:include page="../common/header.jsp" />
    <jsp:include page="../common/nav.jsp" />
    <section id="content">
        <div class="container">
            <br><br>
            <div class="row">
                <div class="col-lg-2"></div>
                <div class="col-lg-8"><h2>데려다줄개의 서비스를 시작하겠습니다.</h2></div>
                <div class="col-lg-2"></div>
            </div>

            <br><br>

            <div class="row">
                <div class="col-lg-4"></div>
                <div class="col-lg-4">
                    <div class="form-floating mb-3">
                        <input type="id" class="form-control form-control-sm" id="floatingInput" placeholder="아이디">
                        <label for="floatingInput">아이디</label>
                    </div>
                    <div class="form-floating">
                        <input type="password" class="form-control" id="floatingPassword" placeholder="비밀번호">
                        <label for="floatingPassword">비밀번호</label>               
                    </div>
                    <br>
                    <div style="text-align: center;">
                        <button type="button" class="btn btn-outline-info justify-content-center btn-sm" >로그인</button>
                    </div>
                </div>
                <div class="col-lg-4"></div>
            </div>

            <br>
            
            <hr>

            <br><br>

            <div class="row" >
                <div class="col-lg-4"></div>
                <div class="col-lg-4" style="display: flex; justify-content: center;">
                    <table class="table table-success table-striped" style="width: 300px; ">
                        <tr>
                            <th><a href="https://www.naver.com" target="_blank">
                                <img src="${path}/images/naver.png" width="30px" height="30px"></th>
                            <th>네이버로 로그인</th>
                        </tr>
                        <tr>
                            <th><a href="" target="_blank">
                                <img src="${path}/images/kakao.png" width="30px" height="30px"></th>
                            <th>카카오로 로그인</th>
                        </tr>
                        <tr>
                            <th><a href="" target="_blank">
                                <img src="${path}/images/facebook.png" width="30px" height="30px"></th>
                            <th>페이스북으로 로그인</th>
                        </tr>
                        <tr>
                            <th><a href="" target="_blank">
                                <img src="${path}/images/twitter.png" width="30px" height="30px"></th>
                            <th>트위터로 로그인</th>
                        </tr>
                    </table>
                </div>
                <div class="col-lg-4"></div>
            </div>

            <br>

            <div class="row  text-center">
                <div class="col-lg-4"><a href="" class="text-decoration-none">회원가입 후 이용하실 수 있습니다.</a></div>
                <div class="col-lg-4"><a href="" class="text-decoration-none">아이디 찾기</a></div>
                <div class="col-lg-4"><a href="" class="text-decoration-none">비밀번호 찾기</a></div>
            </div>

            <br><br>
        </div>
    </section>
     <jsp:include page="../common/footer.jsp" />
</body>
</html>