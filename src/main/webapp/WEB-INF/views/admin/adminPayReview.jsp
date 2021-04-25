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
    <style>
      section {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        background-color: rgba(0, 0, 0, 0.05);
      }

      .heightbox {
        width: 300px;
        height: 300px;
      }
      .admin__elements {
        background-color: #86f3ff;
      }
      .admin-box__elements {
        border: none;
      }
      .wheather-box {
        width: 200px;
        display: block;
        margin-bottom: 10px;
      }
    </style>

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
            <span class="fw-bold fs-3 mt-3">결제내역</span>
            <br>
            <br>
          </div>

          <br><br>

          <div class="container d-flex row mx-3 p-0">
            <!-- 여기서 부터 작업하세용 -->
            <!-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓-->
            
            <div class="d-flex justify-content-between">
            	<div>
            		<button type="button" class="btn btn-outline-info" onclick="location.href='${path}/admin/pay'">전체보기</button>
            	</div>
            	<div class="d-flex mb-3 justify-content-end">
	                <div class="input-group " style="width: 250px">
	                	<select class="form-select" name="searchType" id="searchType2">
	                		<option value="genCallType">일반</option>
	                		<option value="emgCallType">긴급</option>
	                	</select>
	                    <select class="form-select" name="searchType" id="searchType">
	                    	<option> - </option>
	                      	<option value="user">사용자</option>
	                      	<option value="paymentDate">결제날짜</option>
	                    </select>
	                </div>
	                <div class="input-group input-group-sm" style="width: 250px">
	                    <input type="text" class="form-control" name="keyword" id="keyword"/>
	                    <button class="btn btn-info" id="btnSearch" name="btnSearch">검색</button>
	                </div>
                </div>
            </div>
            
            <br>
            <br>

            <table class="table">
              <thead>
                <tr class="text-center fw-bold" style="background-color: skyblue;">
                  <th scope="col">NO</th>
                  <th scope="col">결제날짜</th>
                  <th scope="col">콜타입</th>
                  <th scope="col">사용자</th>
                  <th scope="col">드라이버</th>
                  <th scope="col">차량<br>번호</th>
                  <th scope="col">출발지</th>
                  <th scope="col">도착지</th>
                  <th scope="col">금액</th>
                  <th scope="col">상태</th>
                </tr>
              </thead>
              <tbody>
              <c:if test="${empty paymentList}">
	              <tr>
	              	<td class="text-center" colspan="10">
	               		결제 내역이 없습니다.
	              	</td>
	              </tr>
              </c:if>
              <c:if test="${!empty paymentList}">
	              <c:forEach var="payList" items="${paymentList}">
		              <tr class="text-center">
			              <th class="rowNum">${payList.rowNum}</th>
			              <td class="paymentDate">${payList.paymentDate}</td>
			              <td class="callType">${payList.call.callType}</td>
			              <td class="userId">${payList.dog.userId}</td>
			              <td class="userName">
			              	<c:if test="${payList.driver.userName != null }"> ${payList.driver.userName}</c:if>
			              	<c:if test="${payList.driver.userName == null }"> X</c:if>
			              </td>
			              <td class="carNo">
			              	<c:if test="${payList.driver.carNo != null }">${payList.driver.carNo}</c:if>
			              	<c:if test="${payList.driver.carNo == null }">X</c:if>
			              </td>
			              <td class="fromWhere">${payList.call.fromWhere}</td>
			              <td class="toWhere">${payList.call.toWhere}</td>
			              <td class="paidAmount">${payList.paidAmount}</td>
			              <td class="payMethod">${payList.call.status}</td>
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
                            <a class="page-link" href="${path}/admin/pay?page=1&searchType=${pageInfo.searchType}&keyword=${pageInfo.keyword}&searchType2=${pageInfo.searchType2}" aria-label="Previous">
                              <span aria-hidden="true">&lt;&lt;</span>
                            </a>
                          </li>
                          <!-- 이전 페이지로 -->
                          <li class="page-item">
                            <a class="page-link" href="${path}/admin/pay?page=${pageInfo.prvePage}&searchType=${pageInfo.searchType}&keyword=${pageInfo.keyword}&searchType2=${pageInfo.searchType2}" aria-label="Previous">
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
	                            <a class="page-link" href="${path}/admin/pay?page=${status.current}&searchType=${pageInfo.searchType}&keyword=${pageInfo.keyword}&searchType2=${pageInfo.searchType2}"><c:out value="${status.current}"/></a>
	                          </li>
                          	</c:if>
                          </c:forEach>
                          
                          <!-- 다음 페이지로 -->
                          <li class="page-item">
                            <a class="page-link" href="${path}/admin/pay?page=${pageInfo.nextPage}&searchType=${pageInfo.searchType}&keyword=${pageInfo.keyword}&searchType2=${pageInfo.searchType2}" aria-label="Previous">
                              <span aria-hidden="true">&gt;</span>
                            </a>
                          </li>
                          
                          <!-- 맨 끝으로 -->
                          <li class="page-item">
                            <a class="page-link" href="${path}/admin/pay?page=${pageInfo.maxPage}&searchType=${pageInfo.searchType}&keyword=${pageInfo.keyword}&searchType2=${pageInfo.searchType2}" aria-label="Previous">
                              <span aria-hidden="true">&gt;&gt;</span>
                            </a>
                          </li>
                        </ul>
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
    		
    		var url = "${path}/admin/pay";
    		
    		url = url + "?searchType=" + $('#searchType').val();
    		
    		url = url + "&keyword=" + $('#keyword').val();
    		
    		url = url + "&searchType2=" + $('#searchType2').val();
    		
    		location.href = url;
    		
    		console.log(url);
    	});
    	
    	$(document).ready(function() {
    		$('#genButton').click(function() {
				let btnValue = $('#genButton').val();
				
				console.log(btnValue);
				
				$.ajax({
					async : true,
					url : '${path}/admin/genCallSelect',
					dataType : 'json',
					contentType : "application/json; charset=UTF-8",
					type : 'get',
					data : {
						'btnValue' : btnValue
					},
					
					success : function(selectList) {
						
						console.log(selectList[0].CAR_NO);
						console.log(selectList);
					},
					error : function(e) {
						console.log(e);
						console.log('문제가 발생했습니다.');
					}
				});
			});
    	});
    </script>
  </body>
</html>
