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
    <title>제휴업체 마이페이지 긴급콜 거절 팝업 창</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="${ path }/css/headerfooter.css" />
    <script src="${ path }/js/headerfooter.js"></script>
</head>
<body>
    <jsp:include page="../common/header.jsp" />
    <jsp:include page="../common/nav.jsp" />
    <section>
        <form class="p-2 tex">
            <p class="fw-bold">거절 사유</p>
            <div class="form-check">
                <input class="form-check-input" type="checkbox" value="다른 긴급콜에 대한 업무 진행 중" id="flexCheckChecked" checked>
                <label class="form-check-label" for="flexCheckChecked">
                    다른 긴급콜에 대한 업무 진행 중
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="checkbox" value="다른 중요 업무 진행 중" id="flexCheckDefault">
                <label class="form-check-label" for="flexCheckDefault">
                    다른 중요 업무 진행 중
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="checkbox" value="담당 선생님의 부재" id="flexCheckDefault">
                <label class="form-check-label" for="flexCheckDefault">
                    담당 선생님의 부재
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="checkbox" value="다른 중요 업무 진행 중" id="flexCheckDefault">
                <label class="form-check-label" for="flexCheckDefault">
                    다른 중요 업무 진행 중
                </label>
            </div>
            <div class="form-input">
                <label class="form-text">기타 : 
                    <input class="form-control" type="text" value="" id="" style="width: fit-content;">
                </label>
            </div>
            <hr>
            <div class="text-center">
                <button type="button" class="btn btn-danger">보내기</button>
                <button type="button" class="btn btn-secondary">취소</button>
            </div>
        </form>
    </section>
    <jsp:include page="../common/footer.jsp" />

</body>
</html>