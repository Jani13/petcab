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
    <title>드라이버 지원서 - 데려다줄개</title>
    <link rel="stylesheet" href="${path}/css/driverdocument.css" />
    <script src="${path}/js/jquery-3.5.1.js"></script>
    <script src="${path}/js/headerfooter.js"></script>
  </head>
  <body>
    
  <jsp:include page="../common/header.jsp" />
  <jsp:include page="../common/nav.jsp" />
    <section>
      <div class="dirver-document__intro">
        <span class="driver-document__title">드라이버 지원서</span>
        <div class="diver-documnet__textbox">
          모집부문 및 담당업무 : <br />
          자격요건 및 우대사항 :<br />
          근무조건 : <br />
          특징 :<br />
        </div>
        <div class="driver-document__information">
          <form action="${path}/driver/apply/enroll" method="post" class="information">
            <div>
              <h5 class="information__title">이름</h5>
              <input
                type="text"
                name="userName"
                class="information__input"
                value="${loginMember.userName}"
                readonly
              />
            </div>
            <div>
              <h5 class="information__title">전화번호</h5>
              <input
                type="text"
                name="phone"
                class="information__input"
                value="${loginMember.phone}"
                readonly
              />
            </div>
            <div>
              <h5 class="information__title">보유차종</h5>
              <input
                type="text"
                name="carType"
                class="information__input"
                placeholder="차종을 입력해주세요(K3,아반떼,소나타)"
              />
            </div>
            <div>
              <h5 class="information__title">차량번호</h5>
              <input
                type="text"
                name="carNo"
                class="information__input"
                placeholder="OOO가 OOOO형태로 입력해주세요."
              />
            </div>
            <div>
              <h5 class="information__title">자기<br>소개</h5>
              <textarea name="about" id="" cols="28" rows="10"></textarea>
            </div>
            <div>
              <h5 class="information__title">프로필사진</h5>
              <input type="file" name="photo" class="information__input file" />
            </div>
            <button type="submit" class="information_btn">제출하기</button>
       		<input type="hidden" name="userNo"
        	value="${loginMember.userNo}" readonly>
          </form>
        </div>
      </div>
    </section>
  <jsp:include page="../common/footer.jsp" />
  </body>
</html>
