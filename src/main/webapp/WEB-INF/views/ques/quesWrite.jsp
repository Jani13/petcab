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
    <title>문의작성</title>
    
    <script src="../../../resources/se2/js/service/HuskyEZCreator.js"></script>

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
          <form action='${path}/ques/write' method="post">
            <table class="table">
                <thead>
                  <tr>
                    <th scope="col"  style="width: 300px;"> * 문의 분류 *</th>
                    <th scope="col" >
                        <select class="form-select" aria-label="Default select example"  style="width: 300px;">
                            <option selected>아이디 관련 문의</option>
                            <option value="1">결재 문의</option>
                            <option value="2">긴급콜 관련 문의</option>
                            <option value="3">드라이버 지원 문의</option>
                            <option value="3">제휴업체 문의</option>
                            <option value="3">기타</option>
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
                    <td><input type="password" id="password" class="form-control" placeholder="비밀번호를 입력하세요."></td>
                  </tr>
                  <tr>
                    <th scope="row">* 제목 *</th>
                    <td><input type="text" id="title" class="form-control" placeholder="제목을 입력하세요."></td>
                  </tr>
                  <tr>
                    <th scope="row" colspan="2">
                      <p>* 글쓰기 *</p> 
                        <!-- ====  스마트 에디터  ===== -->
                        <div class="editor-box">
                          <div class="editor-box__editor">
                              <!-- 에디터에 기본으로 삽입할 글(수정 모드)이 없다면 이 value 값을 지정하지 않으시면 됩니다. -->
                              <textarea name="ir1" id="ir1" rows="10" cols="100"></textarea>
                          </div>
                      </div>
                      <div style="text-align : center; padding: 30px;">
                          <span style="padding-right : 3rem;">
                              <input type="submit" class="btn btn-primary" id="partnerSubmit" value="작성완료"> 
                          </span>
                          <span>
                              <input type="button" class="btn btn-secondary" id="partnerCancel" value="취소하기">
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
   
    <script type="text/javascript">
      var oEditors = [];
      nhn.husky.EZCreator.createInIFrame({
       oAppRef: oEditors,
       elPlaceHolder: "ir1",
       sSkinURI: "../../../resources/se2/SmartEditor2Skin.html",
       htParams : {
        bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
        bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
        bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
        //aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
        fOnBeforeUnload : function(){
          //alert("완료!");
        }
      }, //boolean
      fOnAppLoad : function(){
        //예제 코드
        //oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
      },
      fCreator: "createSEditor2"
    });
  
      // 스마트 에디터 이미지 삽입방법 
      function pasteHTML() {
      var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
      oEditors.getById["ir1"].exec("PASTE_HTML", [sHTML]);
    }
    
    function showHTML() {
      var sHTML = oEditors.getById["ir1"].getIR();
      alert(sHTML);
    }
      
    function submitContents(elClickedObj) {
      oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
      
      // 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
      
      try {
        elClickedObj.form.submit();
      } catch(e) {}
    }
    
    function setDefaultFont() {
      var sDefaultFont = '궁서';
      var nFontSize = 24;
      oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
    }
      </script>
</body>
</html>