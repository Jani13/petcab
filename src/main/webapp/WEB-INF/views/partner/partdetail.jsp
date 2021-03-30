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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>제휴업체 상세내용</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
</head>
<style>
    /* div {
        border: steelblue solid 1px;
    } */
</style>
<link rel="stylesheet" href="${path}/css/headerfooter.css" />
    <script src="${path}/js/jquery-3.5.1.js"></script>

  <jsp:include page="../common/header.jsp" />
  <jsp:include page="../common/nav.jsp" />

<section>
    <div class="container">
        <div class="row align-items-start py-5">
            <div class="col-2"></div>
            <div class="col-8 text-center">
                <!-- 로고로 바꿔야함 -->
                <img src="${path}/images/dog.jpg" alt="" width="50px">
                <span>의 제휴업체 <!-- 제휴업체 명을 연결--> 을 소개합니다! </span>
            </div>
            <div class="col-2"></div>
        </div>
        <div class="row align-items-center pb-5">
            <div class="col-2"></div>
            <div class="col-8 text-center">
                <!-- 여기에 스마트 에디터 내용 작성한 내용을 연결 -->스마트디터 내용이 들어갈 부분
            </div>
            <div class="col-2"></div>
        </div>
        <div style="text-align : center; padding: 30px;">
            <span>
                <input type="button" class="btn btn-secondary" id="partnerCancel" value="뒤로가기">
            </span>
        </div>
    </div>
</section>

  <jsp:include page="../common/footer.jsp" />
</html>