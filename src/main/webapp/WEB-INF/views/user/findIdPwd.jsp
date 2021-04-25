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
    <title>아이디/비밀번호 찾기</title>
    
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"
      integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js"
      integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc"
      crossorigin="anonymous"
    ></script>
    <script src="//code.jquery.com/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
    
	<link 
		rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" 
		integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" 
		crossorigin="anonymous">
	
    <link rel="stylesheet" href="${path}/css/headerfooter.css" />

    <style>

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
    <section class="content">
        <div class="container">
            <br><br>
            <h3 class="ft">아이디 / 비밀번호 찾기</h3>
            <br><br>
            <form action="${path}/user/findId/success" method="POST">
                    <div class="row">
                        <div class="col-md-3"></div>
                        <div class="col-md-6">
                            <h5 class="fw-bolder">아이디 찾기</h5>
                            <br>

                            <table class="table table-borderless"
                                style="text-align:left; margin:auto; border-spacing: 30px;">
                                <tr>
                                    <th style="width: 130px;">이름</th>
                                    <td>
                                        <div class="input-group mb-2">
                                            <input type="text" class="form-control" placeholder="이름을 입력해주세요."
                                                aria-describedby="button-addon2" name="userName" required>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>휴대전화</th>
                                    <td>
                                        <div class="input-group mb-2">
                                            <select class="form-select" aria-label="Default select example">
                                                <option selected>대한민국 +82</option>
                                                <option value="1">가나 +233</option>
                                                <option value="2">가봉 +241</option>
                                                <option value="3">가이아나 +529</option>
                                                <option value="4">감비아 +220</option>
                                                <option value="5">과테말라 +502</option>
                                                <option value="6">괌 +1 671</option>
                                                <option value="7">그레나다 +1 473</option>
                                                <option value="8">그리스 +30</option>
                                                <option value="9">기니 +224</option>
                                                <option value="10">기니비사우 +245</option>
                                                <option value="11">나미비아 +264</option>
                                                <option value="12">나우루 +674</option>
                                                <option value="13">나이지리아 +234</option>
                                                <option value="14">남극,오스트레일리아의외 +672</option>
                                                <option value="15">남아프리카공화국 +27</option>
                                                <option value="16">네덜란드 +31</option>
                                                <option value="17">네덜란드령보네르 +599</option>
                                                <option value="18">네덜란드령아루바 +297</option>
                                                <option value="19">네팔 +977</option>
                                                <option value="20">노르웨이 +47</option>
                                                <option value="21">뉴질랜드 +64</option>
                                                <option value="22">뉴질랜드령니우에 +683</option>
                                                <option value="23">뉴질랜드령토켈라우제도 +690</option>
                                                <option value="24">니제르 +227</option>
                                                <option value="25">니카라과 +505</option>
                                                <option value="26">대한민국 +82</option>
                                                <option value="27">덴마크 +45</option>
                                                <option value="28">덴마크령그린란드 +299</option>
                                                <option value="29">덴마크령페로제도 +298</option>
                                                <option value="30">도미니카공화국 +1 809</option>
                                                <option value="31">도미니카공화국 2 +1 829</option>
                                                <option value="32">도미니카공화국 3 +1 849</option>
                                                <option value="33">독일 +49</option>
                                                <option value="34">동티모르 +670</option>
                                                <option value="35">라오스 +856</option>
                                                <option value="36">라이베리아 +231</option>
                                                <option value="37">라트비아 +371</option>
                                                <option value="38">러시아/카자흐스탄 +7</option>
                                                <option value="39">레바논 +961</option>
                                                <option value="40">레소토 +266</option>
                                                <option value="41">루마니아 +40</option>
                                                <option value="42">룩셈부르크 +352</option>
                                                <option value="43">르완다 +250</option>
                                                <option value="44">리비아 +218</option>
                                                <option value="45">리투아니아 +370</option>
                                                <option value="46">리히텐슈타인 +423</option>
                                                <option value="47">마다가스카르 +261</option>
                                                <option value="48">마셜제도공화국 +692</option>
                                                <option value="49">마이크로네시아연방 +691</option>
                                                <option value="50">마카오 +853</option>
                                                <option value="51">마케도니아공화국 +389</option>
                                                <option value="52">말라위 +265</option>
                                                <option value="53">말레이시아 +60</option>
                                                <option value="54">말리 +223</option>
                                                <option value="55">멕시코 +52</option>
                                                <option value="56">모나코 +377</option>
                                                <option value="56">모로코 +212</option>
                                                <option value="56">모리셔스 +230</option>
                                            </select>
                                        </div>
										<div class="input-group mb-2">
											<input type="tel" class="form-control"
												placeholder="'-' 빼고 입력해주세요." id="newPhone" name="phone">
											<button class="btn btn-outline-secondary" type="button"
												id="send">인증번호 받기</button><br>												
										</div>										
										<div class="input-group mb-2">
											<input type="text" class="form-control" id="userNum" placeholder="인증번호 입력">
											<button class="btn btn-outline-secondary" type="button"
												id="enterBtn">확인</button>
											<input type="hidden" name="text" id="text"> 		<!-- 인증번호를 히든으로 저장해서 보낸다 -->																				
										</div>                                        
                                    </td>
                                </tr>                         
                            </table>
                            <div style="text-align: right;">
                                <button type="submit" id="idSearchBtn" class="btn btn-outline-info justify-content-center btn-sm" >확인</button>
                            </div>
                        </div>
                        <div class="col-md-3"></div>   
                    </div>
            </form>

            <br>
            <br>
			
			<!-- 04/03작업중 -->
            <form action="${path}/user/findPwd/success" method="POST">
                    <div class="row">
                        <div class="col-md-3"></div>
                        <div class="col-md-6">
                            <h5 class="fw-bolder">비밀번호 찾기</h5>
                            <br>

                            <table class="table table-borderless"
                                style="text-align:left; margin:auto; border-spacing: 30px;">
                                <tr>
                                    <th style="width: 130px;">아이디</th>
                                    <td>
                                        <div class="input-group mb-2">
                                            <input type="text" class="form-control" placeholder="아이디를 입력해주세요."
                                                aria-describedby="button-addon2" name="userId" required>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>휴대전화</th>
                                    <td>
                                        <div class="input-group mb-2">
                                            <select class="form-select" aria-label="Default select example">
                                                <option selected>대한민국 +82</option>
                                                <option value="1">가나 +233</option>
                                                <option value="2">가봉 +241</option>
                                                <option value="3">가이아나 +529</option>
                                                <option value="4">감비아 +220</option>
                                                <option value="5">과테말라 +502</option>
                                                <option value="6">괌 +1 671</option>
                                                <option value="7">그레나다 +1 473</option>
                                                <option value="8">그리스 +30</option>
                                                <option value="9">기니 +224</option>
                                                <option value="10">기니비사우 +245</option>
                                                <option value="11">나미비아 +264</option>
                                                <option value="12">나우루 +674</option>
                                                <option value="13">나이지리아 +234</option>
                                                <option value="14">남극,오스트레일리아의외 +672</option>
                                                <option value="15">남아프리카공화국 +27</option>
                                                <option value="16">네덜란드 +31</option>
                                                <option value="17">네덜란드령보네르 +599</option>
                                                <option value="18">네덜란드령아루바 +297</option>
                                                <option value="19">네팔 +977</option>
                                                <option value="20">노르웨이 +47</option>
                                                <option value="21">뉴질랜드 +64</option>
                                                <option value="22">뉴질랜드령니우에 +683</option>
                                                <option value="23">뉴질랜드령토켈라우제도 +690</option>
                                                <option value="24">니제르 +227</option>
                                                <option value="25">니카라과 +505</option>
                                                <option value="26">대한민국 +82</option>
                                                <option value="27">덴마크 +45</option>
                                                <option value="28">덴마크령그린란드 +299</option>
                                                <option value="29">덴마크령페로제도 +298</option>
                                                <option value="30">도미니카공화국 +1 809</option>
                                                <option value="31">도미니카공화국 2 +1 829</option>
                                                <option value="32">도미니카공화국 3 +1 849</option>
                                                <option value="33">독일 +49</option>
                                                <option value="34">동티모르 +670</option>
                                                <option value="35">라오스 +856</option>
                                                <option value="36">라이베리아 +231</option>
                                                <option value="37">라트비아 +371</option>
                                                <option value="38">러시아/카자흐스탄 +7</option>
                                                <option value="39">레바논 +961</option>
                                                <option value="40">레소토 +266</option>
                                                <option value="41">루마니아 +40</option>
                                                <option value="42">룩셈부르크 +352</option>
                                                <option value="43">르완다 +250</option>
                                                <option value="44">리비아 +218</option>
                                                <option value="45">리투아니아 +370</option>
                                                <option value="46">리히텐슈타인 +423</option>
                                                <option value="47">마다가스카르 +261</option>
                                                <option value="48">마셜제도공화국 +692</option>
                                                <option value="49">마이크로네시아연방 +691</option>
                                                <option value="50">마카오 +853</option>
                                                <option value="51">마케도니아공화국 +389</option>
                                                <option value="52">말라위 +265</option>
                                                <option value="53">말레이시아 +60</option>
                                                <option value="54">말리 +223</option>
                                                <option value="55">멕시코 +52</option>
                                                <option value="56">모나코 +377</option>
                                                <option value="56">모로코 +212</option>
                                                <option value="56">모리셔스 +230</option>
                                            </select>
                                        </div>
										<div class="input-group mb-2">
											<input type="tel" class="form-control"
												placeholder="'-' 빼고 입력해주세요." id="newPhone1" name="phone">
											<button class="btn btn-outline-secondary" type="button"
												id="send1">인증번호 받기</button><br>												
										</div>										
										<div class="input-group mb-2">
											<input type="text" class="form-control" id="userNum1" placeholder="인증번호 입력">
											<button class="btn btn-outline-secondary" type="button"
												id="enterBtn1">확인</button>
											<input type="hidden" name="text1" id="text1"> 		<!-- 인증번호를 히든으로 저장해서 보낸다 -->																				
										</div>                                        
                                    </td>
                                </tr>                         
                            </table>
                            <div style="text-align: right;">
                                <button type="submit" id="idSearchBtn2" class="btn btn-outline-info justify-content-center btn-sm" >확인</button>
                            </div>
                        </div>
                        <div class="col-md-3"></div>   
                    </div>
            </form>
        </div>
        <br><br>
    </section>
    
    <jsp:include page="../common/footer.jsp" />
    
    <script>
	    $("#idSearchBtn").on("click", () => {
	        
	        var phone = $("#newPhone").val();
	        var userNum = $("#userNum").val();
	        var sysNum = $("#text").val();         
	           
	        if(phone.length == 0) {
	       	 alert("전화번호를 입력해주세요");
	       	 $("#newPhone").focus();
	       	 return false;
	        }
	        
	        if(userNum.length == 0) {
	       	 alert("인증번호를 받아 입력해주세요");
	       	 $("#userNum").focus();
	       	 return false;
	        }	       
	        
	        if(userNum.trim() != sysNum.trim()){
	            alert("본인인증을 다시 진행하시기 바랍니다.");
	         } 
	     });
    </script>

	<script>
	  var count = 0; /* 문자 중복을 막기 위한 인증번호 */
	   
	 $(document).ready(function() {
	
	    $("#send").click(function() {
	       
	       var number = Math.floor(Math.random() * 100000) + 100000;
	          if(number>100000){
	             number = number - 10000;
	          }
	
	          $("#text").val(number);      /* 난수로 생성된 인증번호를 hidden name : text 에 숨긴다 */
	       
	       var to = $("#newPhone").val();
	       
	       if(to == "" || to == null){
	          alert("빈칸이나 공백을 채워주세요");
	       } else {
	       var con_test = confirm("해당번호로 인증문자를 발송하시겠습니까?");   /* 문자를 보낼껀지 물어본다 */
	          
	          if(con_test == true){
	               
	             if(count < 10){      /* 추후 데이터베이스에 컬럼 값을 확인하여 count 값을 비교 할 예정 */
	                 
	               $.ajax({
	                   url:"${path }/sendSms.do",
	                   type:"post",
	                   data:{to: $("#newPhone").val(),
	                        text: $("#text").val()
	                        },
		               success:function(){
		                   alert("해당 휴대폰으로 인증번호를 발송했습니다");
		                   count++;
		                   
		                  //alert(count);
		               },
	                   error(){
	                      
	                   }
	                   
	                });
	             } else {
	                alert("휴대폰 인증 그만하세요")
	             }
	          
	          } else if(con_test == false){
	                
	          }
	      }   
	 })
	 
    $("#enterBtn").click(function() {   /* 내가 작성한 번호와 인증번호를 비교한다 */
       //alert($("#text").val());
    
       var userNum = $("#userNum").val();
       
       var sysNum = $("#text").val();         
       
       if(userNum == null || userNum == ""){
          alert("휴대폰으로 발송된 인증번호를 입력해주세요");
       } else {     
          if(userNum.trim() == sysNum.trim()){
              alert("본인확인 성공입니다.");
           }
           else {
              alert("본인확인에 실패했습니다.");
           }          
       }
    });
  });
  </script>

	 <script>
	    $("#idSearchBtn2").on("click", () => {
	        
	        var phone = $("#newPhone1").val();
	        var userNum = $("#userNum1").val();
	        var sysNum = $("#text1").val();    
	           
	        if(phone.length == 0) {
	       	 alert("전화번호를 입력해주세요");
	       	 $("#newPhone1").focus();
	       	 return false;
	        }
	        
	        if(userNum.length == 0) {
	       	 alert("인증번호를 받아 입력해주세요");
	       	 $("#userNum1").focus();
	       	 return false;
	        }	       
	        
	        if(userNum.trim() != sysNum.trim()){
	            alert("본인인증을 다시 진행하시기 바랍니다.");
	         } 
	     });
    </script>
	<script>
	  var count = 0; /* 문자 중복을 막기 위한 인증번호 */
	   
	 $(document).ready(function() {
	
	    $("#send1").click(function() {
	       
	       var number = Math.floor(Math.random() * 100000) + 100000;
	          if(number>100000){
	             number = number - 10000;
	          }
	
	          $("#text1").val(number);      /* 난수로 생성된 인증번호를 hidden name : text 에 숨긴다 */
	       
	       var to = $("#newPhone1").val();
	       
	       if(to == "" || to == null){
	          alert("빈칸이나 공백을 채워주세요");
	       } else {
	       var con_test = confirm("해당번호로 인증문자를 발송하시겠습니까?");   /* 문자를 보낼껀지 물어본다 */
	          
	          if(con_test == true){
	               
	             if(count < 10){      /* 추후 데이터베이스에 컬럼 값을 확인하여 count 값을 비교 할 예정 */
	                 
	               $.ajax({
	                   url:"${path }/sendSms.do",
	                   type:"post",
	                   data:{to: $("#newPhone1").val(),
	                        text: $("#text1").val()
	                        },
		               success:function(){
		                   alert("해당 휴대폰으로 인증번호를 발송했습니다");
		                   count++;
		                   
		                   //alert(count);
		               },
	                   error(){
	                      
	                   }
	                   
	                });
	             } else {
	                alert("휴대폰 인증 그만하세요")
	             }
	          
	          } else if(con_test == false){
	                
	          }
	      }   
	 })
	 
    $("#enterBtn1").click(function() {   /* 내가 작성한 번호와 인증번호를 비교한다 */
       //alert($("#text1").val());
    
       var userNum = $("#userNum1").val();
       
       var sysNum = $("#text1").val();         
       
       if(userNum == null || userNum == ""){
          alert("휴대폰으로 발송된 인증번호를 입력해주세요");
       } else {     
          if(userNum.trim() == sysNum.trim()){
              alert("본인확인 성공입니다.");
           }
           else {
              alert("본인확인에 실패했습니다.");
           }          
       }
    });
  });
  </script>

</body>
</html>