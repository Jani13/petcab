<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
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
		 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
		 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
		 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
		 <title>error404</title>
		 <style>
		      .mungImg {
		        width: 550px;
		        bottom: 1px;
		        margin-top: 330px;
		      }
		
		      .textWrap {
		        width: 1200px;
		        font-family: 'Binggrae-Bold';
		      }
		      @font-face {
		        font-family: 'Binggrae-Bold';
		        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Binggrae-Bold.woff') format('woff');
		        font-weight: normal;
		        font-style: normal;
		      }
  		</style>
	</head>
	<body>
	    <div class="container d-flex justify-content-center">
	        <div class="row position-absolute text-center textWrap">
	            <p class=" col-12 mt-5 text-center text-decoration-underline fw-bold" style="font-size: 200px">
	                403
	            </p>
	            <p class="col-12 fw-bold text-center" style="font-size: 30px;">
	                Forbidden
	            </p>
	        </div>
	    </div>
	    
	    <div class="container">
	        <img class="img-fluid mungImg " src="${path}/images/errorPage.png" alt="" >
	    </div>
	</body>
</html>