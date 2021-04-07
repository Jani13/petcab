<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous" />
<link rel="stylesheet" href="${path}/css/call.css" />
<script src="${path}/js/jquery-3.5.1.js"></script>

<title>애견정보 불러오기</title>
</head>
<body>
	<section>
		<div class="container my-2">
			<div class="row">
				<c:choose>
					<c:when test="${dogs == null}">
						<div>애견을 먼저 등록해주세요! -- 등록버튼 추가</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="dog" items="${dogs}">
							${ dog.dogName }<input type="checkbox" name="dogNo"
								value="${ dog.dogNo }">

							<!-- 
							<div class="col-sm text-center py-4 myDogsEvent" 
								onclick="selectThisDog(${dog.dogNo});">
								<a href="" class="text-decoration-none text-dark"> <img
									src="${ path }/resources/images/mung.png"
									class="myDogs rounded-pill img-thumbnail" alt="">
									<p class="h5 my-4 fw-bold">${ dog.dogName }</p>
								</a>
							</div>
							-->
						</c:forEach>
					</c:otherwise>
				</c:choose>

				<button type="button" class="btn-select-dogs">선택</button>
			</div>
		</div>
	</section>
</body>

<script type="text/javascript">
	$(document).ready(function() {

	});

	let openerInputs = opener.window.document.getElementsByName('dogNo');

    // 체크된 체크박스 input 태그를 모두 선택하는 방법
    // let checkboxes = document.querySelectorAll('input[type=checkbox]:checked');
	// let openedInputs = document.querySelectorAll('input[type=checkbox]');

    let checked = function() {
        let inputs = $('input[type=checkbox]:checked');

        console.log(inputs);

        for (let i = 0; i < openerInputs.length; i++) {
            
            if(inputs[i] !== undefined) {
                openerInputs[i].value = inputs[i].value;
            }
        }

        window.close();
    }

     $('.btn-select-dogs').on('click', checked);

</script>
</html>
