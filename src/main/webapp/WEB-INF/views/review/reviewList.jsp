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
    <title>리뷰광장</title>

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
        
        .listHover:hover {
        	background-color: seashell;
        }
    </style>

    <link rel="stylesheet" href="${ path }/css/headerfooter.css" />
    <script src="${ path }/js/jquery-3.5.1.js"></script>

</head>
<body>
    <jsp:include page="../common/header.jsp" />
    <jsp:include page="../common/nav.jsp" />
    
    <section class="content">
        
    	<div class="container flex-column section-width">
   
	        <div class="p-3" style="background-color:#4ec7f2">
	            <p class="h2 fw-bold text-white mx-3">리뷰 공간</p>
	        </div>
	        
	        <div class="d-flex justify-content-md-end">
	            <img class="col-md-4 img-fluid mt-5 mx-5" src="${path}/images/dogs.png" alt="" >
	        </div>
	        
	        <div class="row d-flex justify-content-center" >
	            <div class="col-md-12 card text-center" style="width: 90%;  ">
	                <div class="card-body">
	                    자유롭게 작성 해주세요. <span style="color: red;">(* 욕설 & 비방 악성 글은 관리자에 의해 삭제될 수 있습니다. )</span>
	                </div>
	            </div>
	        </div>
	        
	        <div class="input mt-5 row d-flex justify-content-between mb-3" align="right" >
	            <div class="col-5 d-flex justify-content-start">
		            <form action="">
		                <input type="search" name="serchText" size="25px"  placeholder="검색할 내용을 입력하세요.">	            
		                <input type="submit" class="btn btn-info" value="조회">
		            </form>
	            </div>
	            <c:if test="${ loginMember != null }">
	                <button class="btn btn-info col-1 d-inline-block mx-3" type="button" id="btn-add"
	                onclick="location.href ='${path}/review/reviewWrite'">글쓰기</button>
	            </c:if>
	        </div>
	        
	        <table class="table">
	            <thead style="text-align: center;">
	              <tr>
	                <th scope="col">No</th>
	                <th scope="col">제목</th>
	                <th scope="col">글쓴이</th>
	                <th scope="col">평점</th>
	                <th scope="col">날짜</th>
	                <th scope="col">긴급콜</th>
	                <th scope="col">조회</th>
	              </tr>
	            </thead>
	            <tbody>
	                <c:if test="${empty list}">
	                    <tr>
	                        <td class="text-center fw-bold" colspan="7">
	                            조회된 게시글이 없습니다.
	                        </td>
	                    </tr>			
	                  </c:if>                 
	                <c:if test="${list != null}">
	                    <c:forEach var="review" items="${list}">
	                        <tr class="text-center listHover"
	                        	onclick="location.href='${path}/review/reviewView?reviewNo=${review.reviewNo}'"
	                        	style="cursor: pointer">
	                            <td><c:out value="${review.reviewNo}"/></td>
	                            <td><c:out value="${review.title}"/></td>
	                            <td><c:out value="${review.userId }"/></td>
	                            <td><c:out value="${review.starNo}"/></td>
	                            <td><fmt:formatDate type="both" value="${review.postDate}"/></td>
	                            <td><c:out value="${review.callType}"/></td>
	                            <td><c:out value="${review.viewNo}"/></td>
	                        </tr>                  
	                     </c:forEach>
	                </c:if>        
	            </tbody>
	        </table>
            
            <!-- 페이징 부분 -->
             <div
               aria-label="Page navigation example"
               class="d-flex justify-content-center pt-3"
             >
               <ul class="pagination">
                 
                 <!-- 맨 처음으로 -->
                 <li class="page-item">
                   <a class="page-link" href="${path}/review/list?page=1" aria-label="Previous">
                     <span aria-hidden="true">&lt;&lt;</span>
                   </a>
                 </li>
                 <!-- 이전 페이지로 -->
                 <li class="page-item">
                   <a class="page-link" href="${path}/review/list?page=${pageInfo.prvePage}" aria-label="Previous">
                     <span aria-hidden="true">&lt;</span>
                   </a>
                 </li>
                 
                 <!-- 5개 페이지 목록 -->
                 <c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1" varStatus="status">                          
                 	<c:if test="${status.current == pageInfo.currentPage}">
                  <li class="page-item">
                    <a class="page-link disabled"><c:out value="${status.current}"/></a>
                  </li>
                 	</c:if>
                 	<c:if test="${status.current != pageInfo.currentPage}">
                  <li class="page-item">
                    <a class="page-link" href="${path}/review/list?page=${status.current}"><c:out value="${status.current}"/></a>
                  </li>
                 	</c:if>
                 </c:forEach>
                 
                 <!-- 다음 페이지로 -->
                 <li class="page-item">
                   <a class="page-link" href="${path}/review/list?page=${pageInfo.nextPage}" aria-label="Previous">
                     <span aria-hidden="true">&gt;</span>
                   </a>
                 </li>
                 
                 <!-- 맨 끝으로 -->
                 <li class="page-item">
                   <a class="page-link" href="${path}/review/list?page=${pageInfo.maxPage}" aria-label="Previous">
                     <span aria-hidden="true">&gt;&gt;</span>
                   </a>
                 </li>
               </ul>
             </div>
             
            <br><br>
        </div>
    </section>
    <jsp:include page="../common/footer.jsp" />
    
</body>
</html>