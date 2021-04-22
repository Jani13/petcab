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
    <title>리뷰작성</title>
    
    <script src="${ path }/se2/js/service/HuskyEZCreator.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" 
       rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" 
      crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" 
      integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" 
      crossorigin="anonymous"></script>

  <style>

    /* section{
        width: 1200px;
        margin: auto;
    } */

    .container {
        width: 1200px;
    }

    /* div{
        border: 1px solid red;
    } */

      #edit{
          resize: none;
      }

      .editor-box{
          display: flex;
          align-items: center;
          justify-content: center;
          flex-direction: column;
      }
      .editor-box__editor{
          width: 725px;
          height: 500px;
      }
  </style>

  <link rel="stylesheet" href="${ path }/css/headerfooter.css" />
      <script src="${ path }/js/jquery-3.5.1.js"></script>
      <script type="text/javascript" src="${ path }/resources/ckeditor/ckeditor.js"></script>

</head>
<body>
    <jsp:include page="../common/header.jsp" />
    <jsp:include page="../common/nav.jsp" />
    <section class="content">

        <br><br>
        
        <div class="container ">
	<form action='${path}/review/update' method="post">
		<input type="hidden" name="reviewNo" value="${review.reviewNo}">
          <br><br>
          <div class="row">
              <div class="col-lg-2"></div>
              <div class="col-lg-8"><img src="${ path }/images/dogs.png" class="img-fluid" alt="..."></div>
              <div class="col-lg-2"></div>
          </div>
          
          <br><br><br>
          <div class="row">
              <div class="col-lg-5"></div>
              <div class="col-lg-2"><h2><b>리뷰 작성</b></h2></div>
              <div class="col-lg-5"></div>
          </div>

          <br><br><br>
                    <input type="hidden" id="useInfo" name="useInfo" class="form-control" >
                    <input type="hidden" value="${review.callNo}" name="callNo">
                    <input type="hidden" value="${review.callType}" name="callType">
            <table class="table">
					<tbody>
						<tr>
							<th scope="row">* 긴급콜 이용 *</th>
							<td>
								<div class="form-check">
									<c:out value="${review.callType}"></c:out>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">* 평점 *</th>
							<td><input type="number" id="starNo" name="starNo"
								value="${review.starNo}" class="form-control"></td>
						</tr>
						<tr>
							<th scope="row">* 제목 *</th>
							<td><input type="text" id="title" name="title"
								class="form-control" value="${review.title}"
								placeholder="제목을 입력하세요."> <input type="hidden"
								name="userNo" value="${loginMember.userNo}"></td>
						</tr>
						<tr>
							<th scope="row" colspan="2">
								<p>* 글쓰기 *</p> <!-- ====  스마트 에디터  ===== -->
								<div class="editor-box">
									<div class="editor-box__editor">
										<!-- 에디터에 기본으로 삽입할 글(수정 모드)이 없다면 이 value 값을 지정하지 않으시면 됩니다. -->
										<textarea name="content" id="ir1" rows="10" cols="100"><c:out
												value="${review.content}" /> </textarea>
										<script type="text/javascript">
                 						 CKEDITOR.replace('content', {height: 500});
                  				</script>
									</div>
								</div>
								<div style="text-align: center; padding: 30px;">
									<span style="padding-right: 3rem;"> <input type="submit"
										class="btn btn-primary" id="reviewSubmit" value="작성완료">
									</span> <span> <input type="button" class="btn btn-secondary"
										id="reviewCancel"
										onclick="location.replace('${path}/review/list')" value="취소하기">
									</span>
								</div>
							</th>
						</tr>
					</tbody>
				</table>
              </form>
        </div>

    </section>
    <jsp:include page="../common/footer.jsp" />

    
</body>
</html>