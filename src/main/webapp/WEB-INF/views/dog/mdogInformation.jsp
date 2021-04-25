<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
			<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
				<c:set var="path" value="${pageContext.request.contextPath }" />

				<!DOCTYPE html>
				<html lang="en">

				<head>
					<meta charset="UTF-8" />
					<meta http-equiv="X-UA-Compatible" content="IE=edge" />
					<meta name="viewport" content="width=device-width, initial-scale=1.0" />
					<title>mdogInformation</title>
					<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
						rel="stylesheet"
						integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
						crossorigin="anonymous" />
					<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
						integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
						crossorigin="anonymous"></script>
					<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"
						integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG"
						crossorigin="anonymous"></script>
					<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js"
						integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc"
						crossorigin="anonymous"></script>
					<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

					<script src="${path}/js/jquery-3.5.1.js"></script>
					<link rel="stylesheet" href="${path}/css/headerfooter.css" />
					<link rel="stylesheet" href="${path }/css/signupdog.css" />

				</head>

				<body>
					<jsp:include page="../common/header.jsp" />
					<jsp:include page="../common/nav.jsp" />
					<section>
						<div class="container">
							<br>
							<h1>반려 동물</h1>
							<br />
							<div>
								<form name=mydog action="${path}/dog/mdogInformation" method="POST"
									enctype="multipart/form-data">
									<div>
										<div class="row">
											<div class="col-md-3">
												<input type="hidden" name="userId" value="${loginMember.userId}" readonly>
												<input type="hidden" name="dogNo" id="dogNo" value="${dogs[0].dogNo}" readonly>
												<div class="input-group mb-2">
													<select class="form-select" aria-label="Default select example" id="noDog">
														<c:forEach var="dog" items="${dogs}" end="10">
															<option value="${dog.dogNo}">
																<c:out value="${dog.dogName}" />
															</option>
														</c:forEach>
													</select>
												</div>
											</div>
											<div class="col-md-6">
												<c:forEach var="dog" items="${dogs}" end="0">
													<table class="table table-borderless" style="text-align: left; margin: auto; border-spacing: 30px;">
														<tr>
															<th style="width: 130px;">등록번호</th>
															<td>
																<div class="input-group mb-2">
																	<input type="text" class="form-control" name="animalNo" id="" value="${dog.animalNo}" aria-describedby="button-addon2" readonly>
																</div>
															</td>
														</tr>
														<tr>
															<th>품 종</th>
															<td>
																<div class="input-group mb-2">
																	<input type="text" class="form-control" name="dogType" id="" value="${dog.dogType}" aria-describedby="button-addon2" readonly>
																</div>
															</td>
														</tr>
														<tr>
															<th style="width: 130px;">애 견 명</th>
															<td>
																<div class="input-group mb-2">
																	<input type="text" class="form-control" name="dogName" value="${dog.dogName}">
																</div>
															</td>
														</tr>
														<tr>
															<th style="width: 130px;">현재 사진</th>
															<td>
																<div class="input-group mb-2">
																	<c:if test="${ !empty dog.imageOri }">
																		<a href="${ path }/resources/upload/dog/${ dog.imageRe }" download="${ dog.imageOri }" id="dogPhoto">${ dog.imageOri }</a>
																	</c:if>
																</div>
															</td>
														</tr>
														<tr>
															<th style="width: 130px;">변경할 사진</th>
															<td>
																<div class="input-group mb-2">
																	<input type="hidden" name="imageOri"value="${dog.imageOri}">
																	<input type="hidden" name="imageRe" value="${dog.imageRe}">
																	<input type="file" class="form-control" name="reloadFile" id="inputGroupFile02" onchange="checkFile(this)">
																</div>
															</td>
														</tr>
														<tr>
															<th style="width: 130px;">나이</th>
															<td>
																<div class="input-group mb-2">
																	<input type="text" class="form-control" name="age" id="" value="${dog.age}"aria-describedby="button-addon2" required>
																</div>
															</td>
														</tr>
														<tr>
															<th>예방접종 확인</th>
															<td>
																<div class="form-check form-check-inline">
																	<label><input class="form-check-input"
																			type="checkbox" id="0" name="vacc" value="DHPPL" ${fn:contains(dog.vacc, 'DHPPL' ) ? 'checked': '' }>DHPPL</label>
																</div>
																<div class="form-check form-check-inline">
																	<label><input class="form-check-input"
																			type="checkbox" id="1" name="vacc" value="Coronavirus" ${fn:contains(dog.vacc, 'Coronavirus' )? 'checked' : '' }>Coronavirus</label>
																</div>
																<div class="form-check form-check-inline">
																	<label><input class="form-check-input"
																			type="checkbox" id="2" name="vacc" value="KennelCough" ${fn:contains(dog.vacc, 'KennelCough' )? 'checked' : '' }>KennelCough</label>
																</div>
																<div class="form-check form-check-inline">
																	<label><input class="form-check-input" type="checkbox" id="3" name="vacc" value="광견병" ${ fn:contains(dog.vacc, '광견병' )? 'checked' : '' }>광견병</label>
																</div>
															</td>
														</tr>
													</table>
													<div class="input-group mb-1"
														style="display: flex; align-items: center; justify-content: center; flex-direction: column;">
														<p style="font-size: 20px;">
															<br> 애견 질병 작성
														</p>
														<div class="editor-box">
															<div class="editor-box__editor">
																<textarea id="" rows="5" cols="60" name="disorder"><c:out value="${dog.disorder}" /></textarea>
															</div>
														</div>
														<p style="font-size: 20px;">
															<br> 기타 사항
														</p>
														<div class="editor-box">
															<div class="editor-box__editor">
																<textarea id="" rows="5" cols="60" name="other"><c:out value="${dog.other}" /></textarea>
															</div>
														</div>
													</div>
												</c:forEach>
												<br>
												<div style="text-align:center;">
													<button type="submit" class="btn btn-outline-info">정보 수정</button>
												</div>
											</div>
										</div>
									</div>
								</form>
								<div style="text-align:center;">
									<button type="submit" class="btn btn-outline-danger" style="margin-left: 600px;"
										onclick="deleteDog()">삭제하기</button>
								</div>
							</div>
						</div>
						<br>
					</section>
					<jsp:include page="../common/footer.jsp" />

<script> 


	function deleteDog(){      
	   if(confirm("애견정보를 삭제 하시겠습니까?")){
		   var dogNo = $('#dogNo').val(); 
		  location.replace('${path}/dog/deleteDog?dogNo='+ dogNo);
		  console.log(dogNo);
	   }
	}
   
	$('#noDog').change(function() {
 
		 let dogNo = $('#noDog').find(":selected").val(); //dogNo를 담는 변수
 
		 console.log('.change function called');
 
		 console.log('dogNo selected : ' + dogNo);
 
		 $.ajax({
			 async : true,
			 url : 'select',
			 dataType : 'json',
			 contentType : "application/json; charset=UTF-8",
			 type : 'get',
			 data : {
				 'dogNo' : dogNo
			 },
			 success : function(dog) {
 
				 console.log(dog);
 
				 $('input[name=animalNo]').val(dog.animalNo);
 
				 $('input[name=dogType]').val(dog.dogType);
 
				 $('input[name=dogName]').val(dog.dogName);
 
				 let url = '${ path }/resources/upload/dog/dog.imageRe';
 
				 $('#dogPhoto').attr('href', url);
				 $('#dogPhoto').attr('download', dog.imageOri);
				 $('#dogPhoto').text(dog.imageOri);
 
				 $('input[name=age]').val(dog.age);
 
				 console.log("dog.vacc : " + dog.vacc);
 
				 let dogVaccStr = (dog.vacc); //str
 
				 let dogVaccArr = dogVaccStr.split(',');
 
				 console.log("dogVaccArr : " + dogVaccArr); // arr
 
				 $('input[name=vacc]').each((index, elem) => {
 
					 console.log(elem);
 
					 let value = elem.getAttribute("value");
 
					 console.log(value);
 
					 if (dogVaccArr.indexOf(value) > -1) {
						 $(elem).prop('checked', true);
					 } else {
						 $(elem).prop('checked', false);
					 }
				 });
				 
				 if (dog.disorder !== null) {
					 $('textarea[name=disorder]').text(dog.disorder);
				 } else {
					 $('textarea[name=disorder]').text('');
				 }
 
				 if (dog.other !== null) {
					 $('textarea[name=other]').text(dog.other);
				 } else {
					 $('textarea[name=other]').text('');
				 }
			 },
			 error : function(e) {
				 console.log(e);
 
				 alert('애견을 다시 선택해주세요.');
			 }
		 });
	 });
	function checkFile(f){
    	var file = f.files;

    	if(!/\.(gif|jpg|jpeg|png)$/i.test(file[0].name)) alert('gif, jpg, png 파일만 선택해 주세요.\n\n현재 파일 : ' + file[0].name);

    	else return;
    	f.outerHTML = f.outerHTML;
    }
</script>
</body>
</html>
