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
    <title>데려다줄개 - 관리자 페이지</title>
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
    <link rel="stylesheet" href="${path}/css/adminpage.css" />

    <link rel="stylesheet" href="${path}/css/headerfooter.css" />
    <script src="${path}/js/jquery-3.5.1.js"></script>
  </head>
  <body>

  <jsp:include page="../common/header.jsp" />
  <jsp:include page="../common/nav.jsp" />
    <section>
      <div class="container d-flex mx-0 p-0">
        <!-- 건들지마세요 -->
        <!-- 건들지마세요 -->
        <!-- 건들지마세요 -->
        <!-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓-->
  <jsp:include page="../common/adminSideBar.jsp" />
        <!-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑-->
        <!-- 여기까지 건들지마세요-->
        <!-- 여기까지 건들지마세요-->
        <!-- 여기까지 건들지마세요-->

        <div class="container mx-0 p-3" style="width: 1120px">
          <div class="container d-flex row mx-3 p-0">
            <!-- 여기서 부터 작업하세용 -->
            <!-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓-->
            <div class="container">
              <div class="row">
                <div class="col-xs-12">
                  <div class="card border-dark mb-3 admin-box__elements">
                    <div class="card-header fs-4 fw-bolder admin__elements">
                      일반 회원 정보
                    </div>
                    <div class="card-body text-dark">
                    	<div class="d-flex mb-3 justify-content-between">
                    		<div>
                    			<button class="btn btn-outline-info" 
	                      	  		  	onclick="location.href='${path}/admin/info/user'">
	                      	  		전체보기
	                      	  	</button>
                    		</div>
		                    <div class="d-flex mb-3 justify-content-end">
		                    	<div class="input-group " style="width: 100px">
			                         <select class="form-select" name="searchType" id="searchType">
			                           <option value="userId">id</option>
			                           <option value="userName">이름</option>
			                         </select>
		                     	</div>
			                    <div class="input-group input-group-sm" style="width: 250px">
			                         <input type="text" class="form-control" name="keyword" id="keyword" />
			                         <button class="btn btn-info" id="btnSearch" name="btnSearch">검색</button>
			                    </div>
		                    </div>
                    	</div>
                      <table class="table table-striped">
                        <thead>
                          <tr>
                            <th scope="col">No</th>
                            <th scope="col">회원번호</th>
                            <th scope="col">아이디</th>
                            <th scope="col">이름</th>
                            <th scope="col">연락처</th>
                            <th scope="col">애견정보</th>
                            <th scope="col">가입상태</th>
                          </tr>
                        </thead>
                        <tbody>
                        	<c:if test="${empty onlyUserList}">
                        		<tr>
	                        		<td class="text-center fw-bold" colspan="7">
	                        			회원이 존재하지 않습니다.
	                        		</td>
	                        	</tr>
                        	</c:if>
                        	
                        	<c:if test="${onlyUserList != null }">
                        		<c:forEach var="user" items="${onlyUserList}">
	 	                            <tr>
				                        <td>${user.rowNum}</td>
				                        <td>${user.userNo}</td>
				                        <td>${user.userId}</td>
				                        <td>${user.userName}</td>
				                        <td>${user.phone}</td>
				                        <td>${user.dog.dogName}</td>
				                        <td>${user.status}</td>
		                            </tr>
                        		</c:forEach>
                        	</c:if>
                        </tbody>
                      </table>
                      
                      <!-- 페이징 부분 -->
                      <div
                        aria-label="Page navigation example"
                        class="d-flex justify-content-center"
                      >
                        <ul class="pagination">
                          
                          <!-- 맨 처음으로 -->
                          <li class="page-item">
                            <a class="page-link" href="${path}/admin/info/user?page=1" aria-label="Previous">
                              <span aria-hidden="true">&lt;&lt;</span>
                            </a>
                          </li>
                          <!-- 이전 페이지로 -->
                          <li class="page-item">
                            <a class="page-link" href="${path}/admin/info/user?page=${pageInfo.prvePage}" aria-label="Previous">
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
	                            <a class="page-link" href="${path}/admin/info/user?page=${status.current}&searchType=${pageInfo.searchType}&keyword=${pageInfo.keyword}"><c:out value="${status.current}"/></a>
	                          </li>
                          	</c:if>
                          </c:forEach>
                          
                          <!-- 다음 페이지로 -->
                          <li class="page-item">
                            <a class="page-link" href="${path}/admin/info/user?page=${pageInfo.nextPage}" aria-label="Previous">
                              <span aria-hidden="true">&gt;</span>
                            </a>
                          </li>
                          
                          <!-- 맨 끝으로 -->
                          <li class="page-item">
                            <a class="page-link" href="${path}/admin/info/user?page=${pageInfo.maxPage}" aria-label="Previous">
                              <span aria-hidden="true">&gt;&gt;</span>
                            </a>
                          </li>
                        </ul>
                      </div>
                      
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑-->
            <!-- 여기 까지 -->
          </div>
        </div>
      </div>
    </section>


  <jsp:include page="../common/footer.jsp" />
    <script
      src="https://kit.fontawesome.com/0fe4d45686.js"
      crossorigin="anonymous"
    ></script>
    
    <!-- 검색기능 url만들어주는 부분 -->
    <script>
    	$(document).on('click', '#btnSearch', function(e){
    		e.preventDefault();
    		
    		var url = "${path}/admin/info/user";
    		
    		url = url + "?searchType=" + $('#searchType').val();
    		
    		url = url + "&keyword=" + $('#keyword').val();
    		
    		location.href = url;
    		
    		console.log(url);
    	});
    </script>
  </body>
</html>
