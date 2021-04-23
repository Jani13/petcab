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
    <title>문의하기</title>

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
	            <p class="h2 fw-bold text-white mx-3">문의 공간</p>
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
	        
            <div class="d-flex justify-content-between pt-5 mb-3 mx-2">        
	        	<form class="d-flex row col-md-5" name="form1" action="${path}/ques/list/search" method="GET">
	        		<div class="input-group px-1" style="width: 110px" >
				        <select class="form-select" name="searchType">
				            <option value="M.USER_ID"
				    			<c:if test="${searchType == ques.userId}">selected</c:if>
				       		>작성자</option>
				    
				            <option value="Q.TITLE" 
				    			<c:if test="${searchType == ques.title}">selected</c:if>
				            >제목</option>
				        </select>
	        		</div>
	        		<div class="input-group input-group-sm" style="width: 250px">
				        <input type="search" name="keyword" class="form-control" placeholder="검색어를 입력하세요.">
				        <input type="submit" class="btn btn-info" value="조회">
	        		</div>
			    </form>
		       

			    <c:if test="${loginMember != null}">     
                   <button type="button" id="btn-add" class="btn btn-info mx-3"
                   onclick="location.href ='${path}/ques/write'">글쓰기</button>
               </c:if>
	        </div>
            <table class="table">
                <thead style="text-align: center;">
                  <tr>
                    <th scope="col">No</th>
                    <th scope="col">제목</th>
                    <th scope="col">글쓴이</th>
                    <th scope="col">작성일</th>
                    <th scope="col">수정일</th>
                    <th scope="col">문의분류</th>
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
						<c:forEach var="ques" items="${list}">
		                    <tr class="text-center listHover" 
		                    	onclick="location.href='${path}/ques/view?quesNo=${ques.quesNo}'"
		                    	style="cursor: pointer">
		                    
		                        <td><c:out value="${ques.quesNo}"/></td>
		                        <td><c:out value="${ques.title}"/></td>
		                        <td><c:out value="${ques.userId }"/></td>	                       
		                        <td><fmt:formatDate value="${ques.postDate}" type="date"/></td>
		                        <td><fmt:formatDate value="${ques.editDate}" type="date"/></td>	                       
		                        <td><c:out value="${ques.quesType}"/></td>
		                        <td><c:out value="${ques.viewNo}"/></td>
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
                   <a class="page-link" href="${path}/ques/list/search?page=1&searchType=${pageInfo.searchType}&keyword=${pageInfo.keyword}" aria-label="Previous">
                     <span aria-hidden="true">&lt;&lt;</span>
                   </a>
                 </li>
                 <!-- 이전 페이지로 -->
                 <li class="page-item">
                   <a class="page-link" href="${path}/ques/list/search?page=${pageInfo.prvePage}&searchType=${pageInfo.searchType}&keyword=${pageInfo.keyword}" aria-label="Previous">
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
                    <a class="page-link" href="${path}/ques/list/search?page=${status.current}&searchType=${pageInfo.searchType}&keyword=${pageInfo.keyword}"><c:out value="${status.current}"/></a>
                  </li>
                 	</c:if>
                 </c:forEach>
                 
                 <!-- 다음 페이지로 -->
                 <li class="page-item">
                   <a class="page-link" href="${path}/ques/list/search?page=${pageInfo.nextPage}&searchType=${pageInfo.searchType}&keyword=${pageInfo.keyword}" aria-label="Previous">
                     <span aria-hidden="true">&gt;</span>
                   </a>
                 </li>
                 
                 <!-- 맨 끝으로 -->
                 <li class="page-item">
                   <a class="page-link" href="${path}/ques/list/search?page=${pageInfo.maxPage}&searchType=${pageInfo.searchType}&keyword=${pageInfo.keyword}" aria-label="Previous">
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