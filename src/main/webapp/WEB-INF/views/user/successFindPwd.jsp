<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${pageContext.request.contextPath }" />

<% 
	request.setCharacterEncoding("UTF-8");
	String userId = request.getParameter("userId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
    <script src="//code.jquery.com/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
    
	<link 
		rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" 
		integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" 
		crossorigin="anonymous">
	
    <link rel="stylesheet" href="${path}/css/headerfooter.css" />
<title>Insert title here</title>
</head>
<body class="body-wrap">
	<jsp:include page="../common/header.jsp" />
  	<jsp:include page="../common/nav.jsp" />
  	
	<section>
		<form action="${path}/user/successFindPwd" method="POST">
		<%if(userId != null){ %>
		  <input type="hidden" name="userId" value="<%= userId %>"/>
		  <%}else{%>
		  <input type="hidden" name="userId" value="${loginMember.userId}"/>
		  <%} %>
          <div class="container d-flex justify-content-center p-5" style="width: 1200px;">
            <div class="input-group mb-3 flex-column my-5" style="width: 300px;">
              <div class="fw-bolder">
                변경할비밀번호
                <input type="password" name="userPwd" id="pass1" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
              </div>
              <div class="fw-bolder">
                변경할비밀번호확인
                <input type="password" class="form-control" id="pass2" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
              </div>
              <input type="submit" class="btn border-info" value="변경하기">
            </div>
          </div>
        </form>
	</section>
	
	<jsp:include page="../common/footer.jsp" />
	
	<script type="text/javascript">
		$(document).ready(() => {
		      $("#pass2").blur((e) => {
		         let pass1 = $("#pass1").val();
		         let pass2 = $(e.target).val();
		         if(pass1.trim() != pass2.trim()){
		            alert("비밀번호가 일치하지 않습니다.");
		            $("#pass1").val("");
		            $(e.target).val("");
		            $("#pass1").focus();
		         }
		      });  
		});
	</script>
</body>
</html>