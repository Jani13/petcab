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
    <title>제휴업체 상세내용 작성</title>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
    <script src="${path}/se2/js/service/HuskyEZCreator.js"></script>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
    rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    
    <link rel="stylesheet" href="${path}/css/headerfooter.css" />
    
    <script src="${path}/js/jquery-3.5.1.js"></script>
    
    <script type="text/javascript" src="${ path }/resources/ckeditor/ckeditor.js"></script>
</head>
<style>

    /* 제휴업체 스마트 에디트 */
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

	<jsp:include page="../common/header.jsp" />
 	<jsp:include page="../common/nav.jsp" />
 	
<section id="content">
	<c:if test="${partner.userNo == null }">
    <div id="partner-container" style="margin: 0 auto; text-align:center">
        <form name="partnerFrm" action="${path}/partner/partApply" method="POST" enctype="multipart/form-data">
        	<input type="hidden" name="userNo" value="${loginMember.getUserNo()}">
            <div class="container show-grid text-center">
                <div class="row d-flex justify-content-center">
                  <div class="col-md-6">
                    <table class="table table-borderless my-5" style="text-align:left; margin:auto; border-spacing: 30px;">
                        <tr>
                            <th colspan="2">
                                <h2 style="line-height: 3.0; text-align: center;">제휴업체 상세내용 작성</h2>
                            </th>
                        </tr>
                        <tr>
                            <th style="width: 130px;">제휴업체명</th>
                            <td><input type="text" class="form-control" name="partnerName" id="partnerName" required>
                            </td>
                        </tr>
                        <tr>
                            <th>업체사진</th>
                            
                            <td><input type="file" class="form-control" name="upfile" id="image" onchange="checkFile(this)" required></td>
                        </tr>
                        <tr>
                            <th>업종</th>
                            <td>
                            	<label style="margin-right: 20px;">
                                	<input type="radio" class="form-check-input" name="partnerType" value="병원" required>
                                	병원
                                </label>
                                <label style="margin-right: 20px;">
                                	<input type="radio" class="form-check-input" name="partnerType" value="유치원" required>
                                	유치원
                                </label>
                                <label>
                                	<input type="radio" class="form-check-input" name="partnerType" value="샵" required>
                                	샵
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <th>전화번호</th>
                            <td><input type="tel" class="form-control" name="phone" id="phone" 
                                placeholder="'-'빼고 입력해주세요" maxlength="11">
                            </td>
                        </tr>
                        <tr>
                            <th>운영시간</th>
                            <td>
                                <input type="text" class="form-control" name="openTime" placeholder="평일" required>
                                <span class="mx-3" style="font-size: 13px">* 시간은 00:00 ~ 24:00 표기해주세요.(상세시간은 소개에 작성해주세요.)</span>
                            </td>
                        </tr>
                    </table>
                  </div>
                 
                </div>
            <!-- ====  스마트 에디터  ===== -->
            	<div class="editor-box">
                	<div style="padding-top: 50px;">
                    	<h3>제휴업체 소개</h3>
                	</div>
	            	<div class="editor-box">
	                	<div class="editor-box__editor">
	                              <!-- 에디터에 기본으로 삽입할 글(수정 모드)이 없다면 이 value 값을 지정하지 않으시면 됩니다. -->
	                    	<textarea name="about" id="ir1" rows="10" cols="100"></textarea>
	                    	<script type="text/javascript">
	                 			CKEDITOR.replace('ir1', {height: 400});
	                  	 	</script>
	                    </div>
	                </div>
            	</div>
                <div style="text-align : center; padding: 30px;">
                	<span style="padding-right : 3rem;">
                    	<input type="submit" class="btn btn-primary" id="reviewSubmit" value="작성완료"> 
                    </span>
                    <span>
                    	<a href="${path}/">
                    		<input type="button" class="btn btn-secondary" id="reviewCancel" value="취소하기">                    	
                    	</a>
                    </span>
                </div>
            </div>
        </form>
    </div>
    </c:if>
    
    <c:if test="${partner.userNo != null }">
    <div id="partner-container" style="margin: 0 auto; text-align:center">
        <form name="partnerFrm" action="${path}/partner/update" method="POST" enctype="multipart/form-data">
        	<input type="hidden" name="userNo" value="${loginMember.getUserNo()}">
            <div class="container show-grid text-center">
                <div class="row d-flex justify-content-center">
                  <div class="col-md-6">
                    <table class="table table-borderless my-5" style="text-align:left; margin:auto; border-spacing: 30px;">
                        <tr>
                            <th colspan="2">
                                <h2 style="line-height: 3.0; text-align: center;">제휴업체 상세내용 작성</h2>
                            </th>
                        </tr>
                        <tr>
                            <th style="width: 130px;">제휴업체명</th>
                            <td><input type="text" class="form-control" name="partnerName" id="partnerName" required value="${partner.partnerName}">
                            </td>
                        </tr>
                        <tr>
                            <th>업체사진</th>
                            <td><input type="file" class="form-control" name="upfile" id="image" onchange="checkFile(this)" required></td>
                        </tr>
                        <tr>
                            <th>업종</th>
                            <td>
                            	<label style="margin-right: 20px;">
                            		<c:if test="${partner.partnerType != '병원' }">
	                                	<input type="radio" class="form-check-input" name="partnerType" value="병원" required>
	                                	병원
                                	</c:if>
                                	<c:if test="${partner.partnerType == '병원' }">
	                                	<input type="radio" class="form-check-input" name="partnerType" value="병원" required checked>
	                                	병원
                                	</c:if>
                                </label>
                                <label style="margin-right: 20px;">
                            		<c:if test="${partner.partnerType != '유치원' }">
	                                	<input type="radio" class="form-check-input" name="partnerType" value="유치원" required>
	                                	유치원
                                	</c:if>
                                	<c:if test="${partner.partnerType == '유치원' }">
	                                	<input type="radio" class="form-check-input" name="partnerType" value="유치원" required checked>
	                                	유치원
                                	</c:if>
                                </label>
                                <label>
                            		<c:if test="${partner.partnerType != '샵' }">
	                                	<input type="radio" class="form-check-input" name="partnerType" value="샵" required>
	                                	샵
                                	</c:if>
                                	<c:if test="${partner.partnerType == '샵' }">
	                                	<input type="radio" class="form-check-input" name="partnerType" value="샵" required checked>
	                                	샵
                                	</c:if>
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <th>전화번호</th>
                            <td><input type="tel" class="form-control" name="phone" id="phone" 
                                placeholder="'-'빼고 입력해주세요" maxlength="11" value="${partner.phone}">
                            </td>
                        </tr>
                        <tr>
                            <th>운영시간</th>
                            <td>
                                <input type="text" class="form-control" name="openTime" placeholder="평일" required value="${partner.openTime}">
                                <span class="mx-3" style="font-size: 13px">* 시간은 00:00 ~ 24:00 표기해주세요.(상세시간은 소개에 작성해주세요.)</span>
                            </td>
                        </tr>
                    </table>
                  </div>
                 
                </div>
            <!-- ====  스마트 에디터  ===== -->
            	<div class="editor-box">
                	<div style="padding-top: 50px;">
                    	<h3>제휴업체 소개</h3>
                	</div>
	            	<div class="editor-box">
	                	<div class="editor-box__editor">
	                              <!-- 에디터에 기본으로 삽입할 글(수정 모드)이 없다면 이 value 값을 지정하지 않으시면 됩니다. -->
	                    	<textarea name="about" id="ir1" rows="10" cols="100">
	                    	${partner.about }</textarea>
	                    	<script type="text/javascript">
	                 			CKEDITOR.replace('ir1', {height: 400});
	                  	 	</script>
	                    </div>
	                </div>
            	</div>
                <div style="text-align : center; padding: 30px;">
                	<span style="padding-right : 3rem;">
                    	<input type="submit" class="btn btn-primary" id="reviewSubmit" value="작성완료"> 
                    </span>
                    <span>
                    	<a href="${path}/">
                    		<input type="button" class="btn btn-secondary" id="reviewCancel" value="취소하기">                    	
                    	</a>
                    </span>
                </div>
            </div>
        </form>
    </div>
    </c:if>
</section>

  <jsp:include page="../common/footer.jsp" />

<script>
    function DaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.querySelector(".addr3").value = extraAddr;
                
                } else {
                    document.querySelector(".addr3").value = '';
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.querySelector('.postalAddr').value = data.zonecode;
                document.querySelector(".addr1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.querySelector(".addr2").focus();
            }
        }).open();
    }
</script>
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
	function checkFile(f){
    	var file = f.files;

    	if(!/\.(gif|jpg|jpeg|png)$/i.test(file[0].name)) alert('gif, jpg, png 파일만 선택해 주세요.\n\n현재 파일 : ' + file[0].name);

    	else return;
    	f.outerHTML = f.outerHTML;
    }
    </script>
</html>