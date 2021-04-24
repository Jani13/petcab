<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>리뷰댓글</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
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
<body onload="aa()">
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/nav.jsp" />
	<section class="conent">

		<br>

		<div class="container ">
			<br> <br>
			<div class="row">
				<div class="col-lg-2"></div>
				<div class="col-lg-8">
					<img src="${ path }/images/dogs.png" class="img-fluid" alt="...">
				</div>
				<div class="col-lg-2"></div>
			</div>

			<br> <br> <br> <br>

			<div class="card" style="width: 18rem; margin-left: 100px;">
				<div class="card-header">
					<h4>${review.title}</h4>
				</div>
				<ul class="list-group list-group-flush">
					<li class="list-group-item">${review.userId}</li>
					<li class="list-group-item">${review.postDate}</li>
					<li class="list-group-item">${review.viewNo}</li>
				</ul>
			</div>

			<hr>

			<div class="form-floating text-center" style="height: auto;">${review.content}</div>

			<hr>

			<div style="text-align: center; padding: 30px;">
				<span style="padding-right: 3rem;"> <input type="submit"
					class="btn btn-primary" id="partnerSubmit" onclick="updateReview()"
					value="수정하기">
				</span> <span> <input type="button" class="btn btn-secondary"
					id="partnerCancel" onclick="deleteReview()" value="삭제하기">
				</span>
			</div>

			<hr>

			<div class="card"
				style="width: 75%; align-items: center; margin-left: 150px;">
				<div class="card-body">
					<h3>댓글</h3>
					<span style="color: red;">(* 욕설 & 비방 악성 글은 관리자에 의해 삭제될 수
						있습니다. )</span>
				</div>
			</div>
			<br>
			<!-- 댓글 -->
			<form action="${ path }/review/reply" name="sendingReply"
				method="POST">
				<div class="form-floating mb-3" style="width: 400px;">
					<input type="hidden" class="form-control form-control-sm"
						id="floatingInput" name="id" placeholder="아이디"
						value="${review.userId}" readonly>
				</div>

				<input type="hidden" name="reviewNo" id="reviewNo"
					value="${review.reviewNo}">

				<textarea class="form-control" placeholder="Leave a comment here"
					name="content" id="floatingTextarea2" style="resize: none;"></textarea>
				<!-- <input type="submit" class="btn btn-secondary"
					onclick="insertRRely()" value="등록"> -->
				<input type="button" class="btn btn-secondary" onclick="sendReply()"
					value="등록">
			</form>
			
			<br>

			<table class="table">
				<c:forEach var="rReply" items="${replyList}" varStatus="vs">
					<tr class="level1" id="commentReply${vs.index}">
						<td><sub class="comment-writer">${rReply.userId}</sub> <br>
							<sub class="comment-date">${rReply.postDate}</sub> <!-- <sub><input type="button" id="" onclick="commentReply(${vs.index})"
							value="답글 달기"></sub>  --> <br> <input type="text"
							class="form-controll" id="replyContent${vs.index}"
							readonly="readonly" style="border: 0; width: 300px;"
							value="${rReply.content}"></td>
						<td id="nodii"><c:if
								test="${!empty loginMember && loginMember.userNo == rReply.userNo}">
								<input type="hidden" name="" id="replyNo${vs.index}"
									value="${rReply.replyNo}">
								<div style="text-align: center; padding: 17px;">
									<span style="padding-right: 3rem;" id="nodify${vs.index}">
										<input type="button" class="btn btn-secondary"
										onclick="updateReply(${vs.index} , nodify${vs.index},replyContent${vs.index} )"
										value="수정하기"> <input type="button"
										class="btn btn-secondary" onclick="deleteReply(${vs.index})"
										value="삭제하기">
									</span>
								</div>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</table>

			<div style="text-align: center; padding: 30px;">
				<span style="padding-right: 3rem;"> <input type="submit"
					class="btn btn-primary" value="뒤로가기"
					onclick="location.replace('${path}/review/list')">
				</span> <span> <input type="button" class="btn btn-secondary"
					value="확인">
				</span>
			</div>
		</div>
	</section>
	<input type="hidden" id="msg" value="${msg}">
	<jsp:include page="../common/footer.jsp" />
	<script>
		function aa() {
			var msg = $("#msg").val();
			if (msg == null || msg == "") {
				console.log("확인하기 위한 콘솖ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ");
			} else {
				alert(msg);
			}
		}

		// 댓글 작성
		function sendReply() {
			var data1, data2, data3;

			data2 = $('#reviewNo').val();
			data3 = $('#floatingTextarea2').val();

			console.log(data2, data3);
			$.ajax({
				url : "reply",
				type : "POST",
				data : {
					reviewNo : data2,
					content : data3
				},
				success : function(result) {
					if (result == "등록 실패") {
						alert("잠시 후에 시도해주세요.");
					} else {
						if (alert("저장되었습니다.")) {
						}
						location.reload();
					}
				},
				error : function(e) {
					alert("에러가 발생하였습니다.");
					console.log(e);
				}
			})

		}

		// 댓글 수정
		function updateReply(replyNo, span , textArea) {
			var data1, data2, data3;
		
			//$("#nodifyReply").prop('readonly', false);
			//$(replyNo).removeAttr('readonly');
			data1 = "replyContent"+replyNo;
			
			console.log(textArea)
			$("#"+textArea.id).prop('readonly', false);
			document.getElementById(textArea.id).style.border = "1px solid #000000"; 
			//document.getElementById(textArea.id).style.border = "1px;";
			
			console.log(textArea.value);
			
			var input1 = document.createElement('input');
			
			// set attribute (input) 
			input1.setAttribute("type", "button");
			input1.setAttribute("class", "btn btn-info");
			input1.setAttribute("style", "color: #fff");
			input1.setAttribute("name", "nodiContent");
			input1.setAttribute("id", "nodiContent");
			input1.setAttribute("value", "수정 완료");
			input1.setAttribute("onclick", "nodiComplete("+replyNo+")");

			span.appendChild(input1);

		}
		// 댓글 수정 완료
		function nodiComplete(replyNo) {
			var data1, data2, data3;

			//document.getElementById("nodifyReply").readonly = true;
			var a = "replyNo"+replyNo;
			var b = "replyContent"+replyNo;
			data2 = $('#'+a).val();
			data3 = $('#'+b).val();

			console.log(data2, data3);
			$.ajax({
				url : "updateReply",
				type : "POST",
				data : {
					replyNo : data2,
					content : data3
				},
				success : function(result) {
					if (result == "등록 실패") {
						alert("잠시 후에 시도해주세요.");
					} else {
						if (alert("저장되었습니다.")) {
						}
						location.reload();
					}
				},
				error : function(e) {
					alert("에러가 발생하였습니다.");
					console.log(e);
				}
			})

		}
		
		// 댓글 삭제
		function deleteReply(replyNo) {
			var data1, data2, data3;

			//document.getElementById("nodifyReply").readonly = true;
			var a = "replyNo"+replyNo;
			var b = "replyContent"+replyNo;
			data2 = $('#'+a).val();
			data3 = $('#'+b).val();

			console.log(data2, data3);
			$.ajax({
				url : "deleteReply",
				type : "POST",
				data : {
					replyNo : data2,
					content : data3
				},
				success : function(result) {
					if (result == "등록 실패") {
						alert("잠시 후에 시도해주세요.");
					} else {
						if (alert("삭제되었습니다.")) {
						}
						location.reload();
					}
				},
				error : function(e) {
					alert("에러가 발생하였습니다.");
					console.log(e);
				}
			})

		}
		
		// 대댓글 작성하기
		/*
		function commentReply(replyNo) {
			var data1, data2, data3;
			
			var a = "commentReply"+replyNo;
			data2 = $('#'+a).val();
			data3 = $('#'+b).val();

			var commentInput = document.createElement('tr');
			
			// set attribute (input) 
			commentInput.setAttribute("type", "button");
			commentInput.setAttribute("name", "nodiContent");
			commentInput.setAttribute("id", "nodiContent");
			commentInput.setAttribute("value", "작성 완료");
			commentInput.setAttribute("onclick", "nodiComplete("+replyNo+")");
			
			console.log(data2, data3);
			$.ajax({
				url : "deleteReply",
				type : "POST",
				data : {
					replyNo : data2,
					content : data3
				},
				success : function(result) {
					if (result == "등록 실패") {
						alert("잠시 후에 시도해주세요.");
					} else {
						if (alert("삭제되었습니다.")) {
						}
						location.reload();
					}
				},
				error : function(e) {
					alert("에러가 발생하였습니다.");
					console.log(e);
				}
			})

		}
		*/

		function updateReview() {
			location.href = "${path}/review/update?reviewNo=${review.reviewNo}";
		}

		function deleteReview() {
			if (confirm("정말로 게시글을 삭제 하시겠습니까?")) {
				location
						.replace('${path}/review/delete?reviewNo=${review.reviewNo}');
			}
		}
		
	</script>
</body>
</html>