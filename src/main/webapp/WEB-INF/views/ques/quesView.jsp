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
    <title>문의댓글</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" 
            rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" 
            crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" 
            crossorigin="anonymous"></script>
            
	<link 
		rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" 
		integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" 
		crossorigin="anonymous">

    <style>
         .container {
            width: 1200px;
        }
        .contentArea {
        height: auto;
        min-height: 300px;
        border-top: 1px ridge; 
        border-bottom: 1px ridge;
    	}
    </style>
    <link rel="stylesheet" href="${ path }/css/headerfooter.css" />
    <script src="${ path }/js/jquery-3.5.1.js"></script>
  
</head>
<body>
    <jsp:include page="../common/header.jsp" />
    <jsp:include page="../common/nav.jsp" />
    <section class="container">
        <br><br>       
        <div class="container">
            <div class="mt-5" >
                <div class="d-flex justify-content-between" style="margin-top: 50px; background-color: #4ec7f2">
                    <p class="h1 text-white p-3" ><span class="fw-bold">Title. </span> ${ques.title}</p>
                    <i class="fas fa-lock fa-2x mt-4 mx-4"></i>
                </div>
                <div class="pt-4 mx-4 pb-3">
	                <p class="h5 "><span class="fw-bold">No. </span>${ques.viewNo}</p>
                </div>
                <div class="mx-4 pb-3">
	                <p class="h5 "><span class="fw-bold">Writer. </span>${ ques.userId }</p>             
                </div>
                <div class=" mx-4 pb-3 d-flex justify-content-between">
	                <p class="h5 "><span class="fw-bold">Post Date. </span>${ques.postDate}</p>
                    <p class="text-muted text-decoration-underline" onclick="location.replace('${path}/ques/list')" style="cursor: pointer;">목록으로</p>
                   
                </div>
            </div>
                       
            <div class="form-floating contentArea pt-4 px-5 text-break">
                    ${ques.content}
            </div>
              
             
	    					
            <div style="text-align : center; padding: 30px;">
           		<c:if test="${!empty loginMember && (loginMember.userNo == ques.userNo
	    					|| loginMember.userType == 'ROLE_ADMIN')}">
 
	                <span style="padding-right : 3rem;">
	                    <input type="submit" class="btn btn-info" onclick="updateQues()" value="수정하기"> 
	                </span>
	                <span style="padding-right : 3rem;">
	                    <input type="button" class="btn btn-secondary" onclick="deleteQues()" value="삭제하기">
	                </span>
            	</c:if>
	                      	
            </div>

            <hr>
 
            <div class="form-floating">
            	<sub class="comment-date">${ quesReply.postDate }</sub>
                <div class="d-flex">

                    <div class="card-body form-control col-md-8" onclick="checkAdmin()" id="floatingTextarea2" 
                    style="resize: vertical;" readonly>
                        ${quesReply.content}
                    </div>
                
                    <c:if test="${!empty loginMember && (loginMember.userNo == ques.userNo
                        || loginMember.userType == 'ROLE_ADMIN')}">
                        
                        <span >
                            <input type="button" class="btn btn-secondary" onclick="deleteReply()" value="삭제하기" style="height: 57px;">
                        </span>   
                    </c:if>
                </div>
            </div>
           
            <br>
                       	          
            
            <br>          
            <div class="row d-flex justify-content-center mb-5" >
            	<form action="${ path }/ques/reply" method="post">
                    <div class=" d-flex col-md-10"  >
                        <input type="hidden" name="quesNo" value="${ques.quesNo }">
                        <textarea class="form-control col-md-8" name="content" placeholder="관리자님이 곧 답을 드리겠습니다." 
                                        id="floatingTextarea2" style="resize: vertical; width: 1100px;" onclick="checkAdmin()"></textarea>
                        <input type="hidden" name="userNo" value = "${loginMember.userNo}">  <!-- 키값으로 사용 -->	                
                        <input type="submit" class="btn btn-secondary col-md-1" id="partnerCancel" 
                                                                    onclick="return checkAdmin2()" value="등록">       
                    </div>
            	</form>
            </div>
                      
            <br>
            
        </div>
    </section>
    <script>

function updateQues(){
	<c:if test="${loginMember.userNo == ques.userNo}">
	
	location.href= "${path}/ques/update?quesNo=${ques.quesNo}";
	</c:if>	
}

function deleteQues(){		
	if(confirm("정말로 게시글을 삭제 하시겠습니까?")){
		location.replace('${path}/ques/delete?quesNo=${ques.quesNo}');
	}
}


function deleteReply(){		
	if(confirm("정말로 답글을 삭제 하시겠습니까?")){
		location.replace('${path}/ques/deleteReply?quesNo=${ques.quesNo}');
	}
}

function checkAdmin(){
	<c:if test="${loginMember.userType != 'ROLE_ADMIN'}">
		alert("작성 및 수정 권한이 없습니다.");
		location.href="${path}/ques/view?quesNo=${ques.quesNo}";
	</c:if>
}

function checkAdmin2(){
	<c:if test="${loginMember.userType != 'ROLE_ADMIN'}">
		alert("작성 및 수정 권한이 없습니다.");		
		return false;
	</c:if>
	<c:if test="${quesReply.content != null}">
		alert("삭제 후 재작성이 가능합니다.");		
		return false;
	</c:if>
}

	</script>
     <jsp:include page="../common/footer.jsp" />
</body>
</html>