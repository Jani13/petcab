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
            <div class="" style="border-bottom: 1px ridge;">
              <p class="h2 fw-bold p-4 mx-3">
                ${partner.partnerName}
              </p>
            </div> 
        </div>
        <div class="row align-items-center pb-5">
            <div class="col-2"></div>
            <div class="col-8 text-center">
                ${partner.about}
            </div>
            <div class="col-2"></div>
        </div>
        <div style="text-align : center; padding: 30px;">
            <span>
            	<a href="javascript:history.back();">
	                <input type="button" class="btn btn-secondary" id="partnerCancel" value="뒤로가기">
            	</a>
            </span>
        </div>
    </div>
</section>

  <jsp:include page="../common/footer.jsp" />
</html>