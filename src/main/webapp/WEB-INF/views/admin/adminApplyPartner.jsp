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
            <!-- 여기서 부터 작업하세용 -->
            <!-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓-->
            <span class="fw-bold fs-3 mt-3">제휴업체 승인 요청</span>
            <table class="table mt-3">
              <thead>
                <tr style="background-color: skyblue;">
                  <th scope="col">NO</th>
                  <th scope="col">회원번호</th>
                  <th scope="col">회원명</th>
                  <th scope="col">업체명</th>
                  <th scope="col">업체종류</th>
                  <th scope="col">연락처</th>
                  <th scope="col">주소</th>
                  <th scope="col">승인</th>
                </tr>
              </thead>
              <tbody>
                <c:if test="${empty waitPartners}">
	                <tr>
	                	<td class="text-center fw-bold" colspan="8">
	                		신청한 회원이 없습니다.
	                	</td>
	                </tr>
                </c:if>
                <c:if test="${waitPartners != null }">
					<c:forEach var="partner" items="${waitPartners}">
		                <tr>
		                  <th scope="row">${partner.rowNum }</th>
		                  <td>${partner.userNo }</td>
		                  <td>${partner.member.userName }</td>
		                  <td>${partner.partnerName }</td>
		                  <td>${partner.partnerType }</td>
		                  <td>${partner.member.phone }</td>
		                  <td>${partner.member.address}</td>
		                  <td>
		                    <button type="button" class="btn btn-outline-info" 
		                    onclick="location.href='${path}/admin/partner/grant?userNo=${partner.userNo}'">승인</button>
		                    <button type="button" class="btn btn-outline-info" 
		                    onclick="location.href='${path}/admin/partner/revoke?userNo=${partner.userNo}'">거절</button>
		                  </td>
		                </tr>
	                </c:forEach>
                </c:if> 
              </tbody>
            </table>
            <!-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑-->
            <!-- 여기 까지 -->
          </div>

          <br>

          <div class="container d-flex row mx-3 p-0">
            <!-- 여기서 부터 작업하세용 -->
            <!-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓-->
            <span class="fw-bold fs-3 mt-3">제휴업체 승인 거부</span>
            <table class="table mt-3">
              <thead>
                <tr style="background-color: skyblue;">
                  <th scope="col">NO</th>
                  <th scope="col">회원번호</th>
                  <th scope="col">회원명</th>
                  <th scope="col">업체명</th>
                  <th scope="col">업체종류</th>
                  <th scope="col">연락처</th>
                  <th scope="col">주소</th>
                  <th scope="col">상태</th>
                  <th scope="col">승인</th>
                </tr>
              </thead>
              <tbody>
                <c:if test="${empty rejectPartners}">
	                <tr>
	                	<td class="text-center fw-bold" colspan="9">
	                		조회 결과가 없습니다.
	                	</td>
	                </tr>
                </c:if>
                <c:if test="${rejectPartners != null }">
					<c:forEach var="partner" items="${rejectPartners}">
		                <tr>
		                  <th scope="row">${partner.rowNum }</th>
		                  <td>${partner.userNo }</td>
		                  <td>${partner.member.userName }</td>
		                  <td>${partner.partnerName }</td>
		                  <td>${partner.partnerType }</td>
		                  <td>${partner.member.phone }</td>
		                  <td>${partner.openTime }</td>
		                  <td>${partner.status }</td>
		                  <td>
		                    <button type="button" class="btn btn-outline-info" 
		                    onclick="location.href='${path}/admin/partner/grant?userNo=${partner.userNo}'">승인</button>
		                    <button type="button" class="btn btn-outline-info" 
		                    onclick="location.href='${path}/admin/partner/revoke?userNo=${partner.userNo}'">거절</button>
		                  </td>
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
                            <a class="page-link" href="${path}/admin/apply/partner?page=1" aria-label="Previous">
                              <span aria-hidden="true">&lt;&lt;</span>
                            </a>
                          </li>
                          <!-- 이전 페이지로 -->
                          <li class="page-item">
                            <a class="page-link" href="${path}/admin/apply/partner?page=${pageInfo.prvePage}" aria-label="Previous">
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
	                            <a class="page-link" href="${path}/admin/apply/partner?page=${status.current}"><c:out value="${status.current}"/></a>
	                          </li>
                          	</c:if>
                          </c:forEach>
                          
                          <!-- 다음 페이지로 -->
                          <li class="page-item">
                            <a class="page-link" href="${path}/admin/apply/partner?page=${pageInfo.nextPage}" aria-label="Previous">
                              <span aria-hidden="true">&gt;</span>
                            </a>
                          </li>
                          
                          <!-- 맨 끝으로 -->
                          <li class="page-item">
                            <a class="page-link" href="${path}/admin/apply/partner?page=${pageInfo.maxPage}" aria-label="Previous">
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
  </body>
</html>
