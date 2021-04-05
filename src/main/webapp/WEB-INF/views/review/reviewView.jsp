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
    <title>리뷰댓글</title>

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
        /* section{
            width: 1200px;
            margin: auto;
        } */
        /* div{
            border: 1px solid red;
        } */
    </style>

    <link rel="stylesheet" href="${ path }/css/headerfooter.css" />
    <script src="${ path }/js/jquery-3.5.1.js"></script>
    
</head>
<body>
    <jsp:include page="../common/header.jsp" />
    <jsp:include page="../common/nav.jsp" />
    <section class="conent">

        <br>
        
        <div class="container ">
           
            <br><br>
            <div class="row">
                <div class="col-lg-2"></div>
                <div class="col-lg-8"><img src="${ path }/images/dogs.png" class="img-fluid" alt="..."></div>
                <div class="col-lg-2"></div>
            </div>
            
            <br><br><br><br>
    
            <div class="card" style="width: 18rem; margin-left: 100px;" >
                <div class="card-header">
                <h4>${review.title}</h4>
                </div>
                <ul class="list-group list-group-flush">
                <li class="list-group-item">${review.userId}</li>
                <li class="list-group-item">${member.userId} 기사님</li>
                <li class="list-group-item">get.제휴업체</li>
                <li class="list-group-item">${review.postDate}</li>
                <li class="list-group-item">${review.viewNo}</li>
                </ul>
            </div>

            <hr>
			
            <div class="form-floating text-center" style="height: auto;">
                ${review.content}
            </div>
            
            <div style="text-align : center; padding: 30px;">
                <span style="padding-right : 3rem;">
                    <input type="submit" class="btn btn-primary" id="partnerSubmit" value="수정하기"> 
                </span>
                <span>
                    <input type="button" class="btn btn-secondary" id="partnerCancel" value="삭제하기">
                </span>
            </div>

            <hr>

            <div class="card" style="width: 75%; align-items: center; margin-left: 150px;">
                <div class="card-body">
                    <h3>댓글</h3>
                    <span style="color: red;">(* 욕설 & 비방 악성 글은 관리자에 의해 삭제될 수 있습니다. )</span>
                </div>
            </div>
            <br>
            <!-- 댓글 -->
            <div class="form-floating mb-3" style="width: 400px;">
                <input type="id" class="form-control form-control-sm" id="floatingInput" placeholder="아이디" readonly>
                <label for="floatingInput">${review.userId}</label>
            </div>
            <div class="form-floating">
            
                <input type="hidden" name="reviewboardNo" value="">
	    		<input type="hidden" name="writer" value="">
    		 <form action="">
                <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="resize: vertical;"></textarea>
                <label for="floatingTextarea2">Comments</label>
                <input type="button" class="btn btn-secondary" id="partnerCancel" value="등록">
             </form>
            </div>
            <br>
            <table class="table">
            	<c:forEach var="reply" items="${list}">
                     <tr class="level1">
                        <td>
                            <sub class="comment-writer">${member.userId}</sub>
                            <sub class="comment-date">${reviewReply.postDate}</sub>
                            <br>
                          ${reviewReply.content}
                        </td>
                        <td>
                      		<c:if test="${!empty loginMember && (loginMember.userNo == review.userNo
                     		 || loginMember.userType == 'ROLE_ADMIN')}">
                     		 </c:if>
                        </td>
                    </tr>
              </c:forEach>
              </table>

              <div style="text-align : center; padding: 30px;">
                <span style="padding-right : 3rem;">
                    <input type="submit" class="btn btn-primary" id="partnerSubmit" value="뒤로가기"> 
                </span>
                <span>
                    <input type="button" class="btn btn-secondary" id="partnerCancel" value="확인">
                </span>
            </div>

        </div>
    </section>
    <jsp:include page="../common/footer.jsp" />

</body>
</html>