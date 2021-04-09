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

        <br><br>
        
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
                <h4>${ques.title}</h4>
                </div>
                <ul class="list-group list-group-flush">
	                <li class="list-group-item">${ ques.userId }</li>             
	               
	                <li class="list-group-item">${ques.postDate}</li>
	                <li class="list-group-item">${ques.viewNo}</li>
                </ul>
            </div>

            <hr>           
            <div class="form-floating text-center" style="height: auto;">
                ${ques.content}
            </div>
            <hr>      
             
	    					
            <div style="text-align : center; padding: 30px;">
           		<c:if test="${!empty loginMember && (loginMember.userNo == ques.userNo
	    					|| loginMember.userType == 'ROLE_ADMIN')}">
 
	                <span style="padding-right : 3rem;">
	                    <input type="submit" class="btn btn-primary" onclick="updateQues()" value="수정하기"> 
	                </span>
	                <span style="padding-right : 3rem;">
	                    <input type="button" class="btn btn-secondary" onclick="deleteQues()" value="삭제하기">
	                </span>
            	</c:if>
	                <span>
	                    <input type="button" class="btn btn-secondary" 
	                    					onclick="location.replace('${path}/ques/list')" value="목록으로">
	                </span>             	
            </div>

            <hr>

            <div class="card" style="width: 85%; align-items: center; margin-left: 90px;">
                <div class="card-body">
                    <h3>관리자의 답글입니다.</h3>
                    <span style="color: blue;">(* 서비스 이용에 불편이 없도록 최선을 다 하겠습니다. * )</span>
                </div>
            </div>
            <br>
            
            <div class="form-floating">
            	<sub class="comment-date">${ quesReply.postDate }</sub>
                <textarea class="form-control" placeholder="" onclick="checkAdmin()" id="floatingTextarea2" 
                			style="resize: vertical;"><c:out value="${quesReply.content}"/></textarea>
                <label for="floatingTextarea1"></label>
            </div>
            <br>
                       	          
            <c:if test="${!empty loginMember && (loginMember.userNo == ques.userNo
	    					|| loginMember.userType == 'ROLE_ADMIN')}">
	    					
            	<div style="text-align : center; padding: 30px;">
 
	                <span style="padding-right : 3rem;">
	                    <input type="button" class="btn btn-secondary" onclick="deleteReply()" value="삭제하기">
	                </span>
	                <span>
	                    <input type="button" class="btn btn-secondary" 
	                    					onclick="location.replace('${path}/ques/list')" value="목록으로">
	                </span>             	
  
            	</div>
            </c:if>
            
            <br>          
            <div class="form-floating">
            	<form action="${ path }/ques/reply" method="post">
	                <input type="hidden" name="quesNo" value="${ques.quesNo }">
	                <textarea class="form-control" name="content" placeholder="관리자님이 곧 답을 드리겠습니다." 
	                				id="floatingTextarea2" style="resize: vertical;" onclick="checkAdmin()"></textarea>
	                <label for="floatingTextarea2"></label>
	                <input type="hidden" name="userNo" value = "${loginMember.userNo}">  <!-- 키값으로 사용 -->	                
	                <input type="submit" class="btn btn-secondary" id="partnerCancel" 
	                											onclick="return checkAdmin2()" value="등록">
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