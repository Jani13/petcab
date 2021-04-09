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
    <title>문의글 수정</title>

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

          <br><br>
          <div class="row">
              <div class="col-lg-2"></div>
              <div class="col-lg-8"><img src="${ path }/images/dogs.png" class="img-fluid" alt="..."></div>
              <div class="col-lg-2"></div>
          </div>
          
          <br><br><br><br>
          
          <div class="row">
              <div class="col-lg-2"></div>
              <div class="col-lg-2"><h2><b>1 : 1 문의</b></h2></div>
              <div class="col-lg-8"></div>
          </div>

          <br><br><br>

          <hr>
          <form action='${path}/ques/update' method="post">
          	<input type="hidden" name="quesNo" value = "${ques.quesNo}">
            <table class="table">
                <thead>
                  <tr>
                    <th scope="col"  style="width: 300px;"> * 문의 분류 *</th>
                    <th scope="col" >
                        <select class="form-select" aria-label="Default select example"  style="width: 300px;">
                            <option selected>${ques.quesType}</option>
                            <option value="1">아이디 관련 문의</option>
                            <option value="2">결재 문의</option>
                            <option value="3">긴급콜 관련 문의</option>
                            <option value="4">드라이버 지원 문의</option>
                            <option value="5">제휴업체 문의</option>
                            <option value="6">기타</option>
                          </select>
                    </th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <th scope="row">* 작성자 *</th>
                    <td><input type="text" id="userId" class="form-control" 
                    				name="userId" value="${ loginMember.userId }" readonly></td>         
                  </tr>
                  <tr>
                    <th scope="row">* 비밀번호 *</th>
                    <td><input type="password" id="password" class="form-control" 
                    				name="quesPwd" placeholder="숫자만 입력하세요."></td>
                  </tr>
                  <tr>
                    <th scope="row">* 제목 *</th>
                    <td><input type="text" id="title" class="form-control" name="title" value="${ques.title}">
                    	<input type="hidden" name="userNo" value = "${loginMember.userNo}">  <!-- 키값으로 사용 -->
                    </td>
                  </tr>
                  <tr>
                    <th scope="row" colspan="2">
                      <p>* 글쓰기 *</p> 
                        <!-- ====  스마트 에디터  ===== -->
                        <div class="editor-box">
                          <div class="editor-box__editor">
                              <!-- 에디터에 기본으로 삽입할 글(수정 모드)이 없다면 이 value 값을 지정하지 않으시면 됩니다. -->
                              <textarea name="content" id="ir1" rows="10" cols="100"><c:out value="${ques.content}"/></textarea>
                              <script type="text/javascript">
                 						 CKEDITOR.replace('ir1', {height: 300});
                  				</script>
                          </div>
                      </div>
                      <div style="text-align : center; padding: 30px;">
                          <span style="padding-right : 3rem;">
                              <input type="submit" class="btn btn-primary" id="partnerSubmit" value="수정완료"> 
                          </span>
                          <span>
                              <input type="reset" class="btn btn-secondary" id="partnerCancel" 
                              			onclick="location.replace('${path}/ques/list')" value="취소하기">
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