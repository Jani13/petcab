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

<title>애견 선택하기</title>
</head>
<body>
	<section>
		<div class="container my-2 bg-light">
            <div class="row">
                <h1 class="text-center">애견 선택하기</h1>
            </div>
			<div class="row row-cols-1 row-cols-md-3 g-4 dog-list"
				style="margin-left: 0; margin-right: 0; margin-top: 0;">
				<c:choose>
					<c:when test="${dogs == null}">
						<div>애견을 먼저 등록해주세요! - 등록버튼 추가</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="dog" items="${dogs}">
							<div class="col d-flex justify-content-center" style="padding: 0; margin-bottom: 24px;">
								<div class="card border-info d-flex align-items-center" style="width: 18rem; padding: 0;">
									<img class="card-img-top"
										src="${ path }/resources/images/mung.png" alt="Card image cap">
									<div class="card-body">
										<p class="card-text">
											${ dog.dogName } <input type="checkbox" name="dogNo"
												value="${ dog.dogNo }">
										</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
            
            <div class="row d-flex justify-content-center" style="margin: 0;">
                <button type="button" class="btn btn-outline-info btn-select-dogs" 
                    style="width: 18rem; margin: 0;">선택</button>
            </div>
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

			if (inputs[i] !== undefined) {
				openerInputs[i].value = inputs[i].value;
			}
		}

		window.close();
	}

	$('.btn-select-dogs').on('click', checked);
</script>
</html>
