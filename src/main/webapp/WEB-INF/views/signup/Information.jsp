<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath }" />

<% 
	request.setCharacterEncoding("UTF-8");
	String userType = request.getParameter("userType");
%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Information</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"
	integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js"
	integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc"
	crossorigin="anonymous"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
			<div class="row text-center">
				<div class="col-sm-3"
					style="display: flex; align-items: center; justify-content: center; flex-direction: column;">
					<img src="${path }/images/one.png">
					<div class="card border-info mb-3" style="max-width: 8rem">
						<div class="card">
							<div class="card-body">
								<h5 class="card-title" style="font-size: 20px;">????????????</h5>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-3"
					style="display: flex; align-items: center; justify-content: center; flex-direction: column;">
					<img src="${path }/images/two.png">
					<div class="card border-info mb-3" style="max-width: 8rem">
						<div class="card">
							<div class="card-body">
								<h5 class="card-title" style="font-size: 20px;">????????????</h5>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-3"
					style="display: flex; align-items: center; justify-content: center; flex-direction: column;">
					<img src="${path }/images/three.png">
					<div class="card border-info mb-3" style="max-width: 8rem">
						<div class="card">
							<div class="card-body">
								<h5 class="card-title" style="font-size: 20px;">????????????</h5>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-3"
					style="display: flex; align-items: center; justify-content: center; flex-direction: column;">
					<img src="${path }/images/for.png">
					<div class="card border-dark mb-3" style="max-width: 8rem">
						<div class="card">
							<div class="card-body">
								<h5 class="card-title" style="font-size: 20px;">????????????</h5>
							</div>
						</div>
					</div>
				</div>
			</div>
			<hr />
			<br />
			<h1>????????????</h1>
			<br />
			<div>
				<form action="${path}/signup/Information" method="POST">
					<input type="hidden" name="userType" value="<%= userType %>">
					<div class="row">
						<div class="col-md-3"></div>
						<div class="col-md-6">
							<table class="table table-borderless"
								style="text-align: left; margin: auto; border-spacing: 30px;">
								<tr>
									<th style="width: 130px;">?????????</th>
									<td>
										<div class="input-group mb-2">
											<input type="text" class="form-control" id="newId" name="userId"
												placeholder="????????? ??????????????????." aria-describedby="button-addon2"
												required>
											<button class="btn btn-outline-secondary" type="button"
												id="button-addon2">????????????</button>
										</div>
									</td>
								</tr>
								<tr>
									<th>????????????</th>
									<td>
										<div class="input-group mb-2">
											<input type="password" name="userPwd" class="form-control" id="pass1"
												placeholder="???????????? ??????????????????.">
										</div>
									</td>
								</tr>
								<tr>
									<th>??????????????????</th>
									<td>
										<div class="input-group mb-2">
											<input type="password" class="form-control" id="pass2"
												placeholder="???????????? ??????????????????.">
										</div>
									</td>
								</tr>
								<tr>
									<th style="width: 130px;">??????</th>
									<td>
										<div class="input-group mb-2">
											<input type="text" class="form-control" id="newName" name="userName"
												placeholder="????????? ??????????????????.">
										</div>
									</td>
								</tr>
								<tr>
									<th>????????????</th>
									<td>
										<div class="input-group mb-2">
											<select class="form-select"
												aria-label="Default select example">
												<option selected>???????????? +82</option>
												<option value="1">?????? +233</option>
												<option value="2">?????? +241</option>
												<option value="3">???????????? +529</option>
												<option value="4">????????? +220</option>
												<option value="5">???????????? +502</option>
												<option value="6">??? +1 671</option>
												<option value="7">???????????? +1 473</option>
												<option value="8">????????? +30</option>
												<option value="9">?????? +224</option>
												<option value="10">??????????????? +245</option>
												<option value="11">???????????? +264</option>
												<option value="12">????????? +674</option>
												<option value="13">??????????????? +234</option>
												<option value="14">??????,??????????????????????????? +672</option>
												<option value="15">???????????????????????? +27</option>
												<option value="16">???????????? +31</option>
												<option value="17">???????????????????????? +599</option>
												<option value="18">???????????????????????? +297</option>
												<option value="19">?????? +977</option>
												<option value="20">???????????? +47</option>
												<option value="21">???????????? +64</option>
												<option value="22">???????????????????????? +683</option>
												<option value="23">????????????????????????????????? +690</option>
												<option value="24">????????? +227</option>
												<option value="25">???????????? +505</option>
												<option value="26">???????????? +82</option>
												<option value="27">????????? +45</option>
												<option value="28">???????????????????????? +299</option>
												<option value="29">???????????????????????? +298</option>
												<option value="30">????????????????????? +1 809</option>
												<option value="31">????????????????????? 2 +1 829</option>
												<option value="32">????????????????????? 3 +1 849</option>
												<option value="33">?????? +49</option>
												<option value="34">???????????? +670</option>
												<option value="35">????????? +856</option>
												<option value="36">??????????????? +231</option>
												<option value="37">???????????? +371</option>
												<option value="38">?????????/??????????????? +7</option>
												<option value="39">????????? +961</option>
												<option value="40">????????? +266</option>
												<option value="41">???????????? +40</option>
												<option value="42">??????????????? +352</option>
												<option value="43">????????? +250</option>
												<option value="44">????????? +218</option>
												<option value="45">??????????????? +370</option>
												<option value="46">?????????????????? +423</option>
												<option value="47">?????????????????? +261</option>
												<option value="48">????????????????????? +692</option>
												<option value="49">??????????????????????????? +691</option>
												<option value="50">????????? +853</option>
												<option value="51">???????????????????????? +389</option>
												<option value="52">????????? +265</option>
												<option value="53">??????????????? +60</option>
												<option value="54">?????? +223</option>
												<option value="55">????????? +52</option>
												<option value="56">????????? +377</option>
												<option value="56">????????? +212</option>
												<option value="56">???????????? +230</option>
											</select>
										</div>
										<div class="input-group mb-2">
											<input type="tel" class="form-control"
												placeholder="'-' ?????? ??????????????????." id="newPhone" name="phone">
											<button class="btn btn-outline-secondary" type="button"
												id="send">???????????? ??????</button><br>												
										</div>										
										<div class="input-group mb-2">
											<input type="text" class="form-control" id="userNum" placeholder="???????????? ??????">
											<button class="btn btn-outline-secondary" type="button"
												id="enterBtn">??????</button>
											<input type="hidden" name="text" id="text"> 		<!-- ??????????????? ???????????? ???????????? ????????? -->																				
										</div>
									</td>
								</tr>
								<tr>
									<th>??????</th>
									<td>
										<div class="input-group mb-2">
											<input type="text" class="form-control postalAddr" name="postCode"
												id="postalAddr" placeholder="????????????"
												aria-label="Recipient's username"
												aria-describedby="basic-addon2">
											<button class="btn btn-outline-secondary" type="button"
												id="findPostalAddr" onclick="DaumPostcode()">????????????
												??????</button>
										</div>
										<div class="input-group mb-1">
											<input type="text" class="form-control addr1" name="address"
												id="addr1" placeholder="??????">
										</div> <!-- ????????? / ???????????? ?????? ????????? -->
										<div class="row">
											<div class="col-md-7" style="height: 42px;">
												<input type="text" class="form-control addr2" name="address"
													id="addr2" placeholder="????????????">
											</div>
											<div class="col-md-5">
												<input type="text" class="form-control addr3" name="address"
													id="addr3" placeholder="????????????" readonly>
											</div>
										</div>
										<%if(userType.equals("ROLE_PARTNER")){%>
										<p class="text-danger">* ??????????????? ?????? ????????? ????????? ????????? ?????????.</p>
										<%}%>	
									</td>
								</tr>
							</table>
						</div>
						<div class="input-group mb-1 row flex-column">
							<%if(userType.equals("ROLE_MEMBER")){%>
							<p class="col-md-12 text-center my-5" style="font-size: 20px;">
									<br> * ???????????? ?????? ?????? ????????? ??? ????????? ????????????. 
							</p>
							<%}%>
							
							<%if(userType.equals("ROLE_PARTNER")){%>
							<p class="col-md-12 text-center my-5" style="font-size: 20px;">
									<br> * ????????????(?????????)??? ?????? ?????? ??? ???????????? ????????? ??????????????????.
							</p>
							<%}%>
							
							<%if(userType.equals("ROLE_DRIVER")){%>
							<p class="col-md-12 text-center my-5" style="font-size: 20px;">
									<br> * ??????????????? ?????? ?????? ??? ???????????? ????????? ??????????????????.
							</p>
							<%}%>
							
							<div class="col-12 row d-flex justify-content-center p-3">
								<button type="submit" id="enrollSubmit" class="col-2 btn btn-outline-info">
					                ??????
					            </button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		<br>
	</section>
	<jsp:include page="../common/footer.jsp" />
	<script>
		function DaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// ???????????? ???????????? ????????? ??????????????? ????????? ????????? ???????????? ??????.
							// ??? ????????? ?????? ????????? ?????? ????????? ????????????.
							// ???????????? ????????? ?????? ?????? ????????? ??????('')?????? ????????????, ?????? ???????????? ?????? ??????.
							var addr = ''; // ?????? ??????
							var extraAddr = ''; // ???????????? ??????
							//???????????? ????????? ?????? ????????? ?????? ?????? ?????? ?????? ????????????.
							if (data.userSelectedType === 'R') { // ???????????? ????????? ????????? ???????????? ??????
								addr = data.roadAddress;
							} else { // ???????????? ?????? ????????? ???????????? ??????(J)
								addr = data.jibunAddress;
							}
							// ???????????? ????????? ????????? ????????? ???????????? ??????????????? ????????????.
							if (data.userSelectedType === 'R') {
								// ??????????????? ?????? ?????? ????????????. (???????????? ??????)
								// ???????????? ?????? ????????? ????????? "???/???/???"??? ?????????.
								if (data.bname !== ''
										&& /[???|???|???]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// ???????????? ??????, ??????????????? ?????? ????????????.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// ????????? ??????????????? ?????? ??????, ???????????? ????????? ?????? ???????????? ?????????.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// ????????? ??????????????? ?????? ????????? ?????????.
								document.querySelector(".addr3").value = extraAddr;

							} else {
								document.querySelector(".addr3").value = '';
							}
							// ??????????????? ?????? ????????? ?????? ????????? ?????????.
							document.querySelector(".postalAddr").value = data.zonecode;
							document.querySelector(".addr1").value = addr;
							// ????????? ???????????? ????????? ????????????.
							document.querySelector(".addr2").focus();
						}
					}).open();
		}
		
		$(document).ready(() => {
		      $("#pass2").blur((e) => {
		         let pass1 = $("#pass1").val();
		         let pass2 = $(e.target).val();
		         if(pass1.trim() != pass2.trim()){
		            alert("??????????????? ???????????? ????????????.");
		            $("#pass1").val("");
		            $(e.target).val("");
		            $("#pass1").focus();
		         }
		      });      
		      
		      $("#enrollSubmit").on("click", () => {
		         var id = $("#newId").val();
		         var pass1 = $("#pass1").val();
		         var pass2 = $("#pass2").val();
		         var name = $("#newName").val();
		         var phone = $("#newPhone").val();
		         var userNum = $("#userNum").val();
		         var addr = $("#addr2").val();
		         var sysNum = $("#text").val(); 
		         
		         if(id.length == 0) {
		        	 alert("???????????? ????????? ?????????");
		        	 $("#newId").focus();
		        	 /* return false; */
		         }
		         if(pass1.length == 0) {
		        	 alert("??????????????? ????????? ?????????");
		        	 $("#pass1").focus();
		        	 return false;
		         }
		         if(pass2.length == 0) {
		        	 alert("???????????? ????????? ????????? ?????????.");
		        	 $("#pass2").focus();
		        	 return false;
		         }
		         if(name.length == 0) {
		        	 alert("????????? ??????????????????");
		        	 $("#newName").focus();
		        	 return false;
		         }
		         if(phone.length == 0) {
		        	 alert("??????????????? ??????????????????");
		        	 $("#newPhone").focus();
		        	 return false;
		         }
		         if(userNum.length == 0) {
		        	 alert("??????????????? ?????? ??????????????????");
		        	 $("#userNum").focus();
		        	 return false;
		         }
		         if(addr.length == 0) {
		        	 alert("????????? ??????????????????");
		        	 $("#addr2").focus();
		        	 return false;
		         }
		         
		         if(userNum.trim() != sysNum.trim()){
			            alert("??????????????? ?????? ??????????????? ????????????.");		      
			            $("#userNum").focus();
			        	 return false;
			     } 
		         //return false;
		      });
		      
		      // ????????? ????????? ?????? ?????? ????????????
		      $("#button-addon2").on("click", () => {
		    	  let id = $("#newId").val().trim();
		    	  
		          $.ajax({
		        	  type: "get",
		        	  url: "${path}/member/idCheck",
		        	  dataType: "json",
		        	  data: {
		        		  id
		        	  },
		        	  success: function(data) {
		        		  console.log(data);
		        		  
		        		  if(data.validate !== true) {
		        			  alert("?????? ????????? ????????? ?????????.")
		        		  } else {
		        			  alert("?????? ???????????? ????????? ?????????.")        			  
		        		  }
		        	  },
		        	  
		        	  error: function(e) {
		        		  console.log(e);
		        	  }
		       	  });
		       });
		   	});
		
		
		
	</script>
	
	<script>
	  var count = 0; /* ?????? ????????? ?????? ?????? ???????????? */
	   
	 $(document).ready(function() {
	
	    $("#send").click(function() {
	       
	       var number = Math.floor(Math.random() * 100000) + 100000;
	          if(number>100000){
	             number = number - 10000;
	          }
	
	          $("#text").val(number);      /* ????????? ????????? ??????????????? hidden name : text ??? ????????? */
	       
	       var to = $("#newPhone").val();
	       
	       if(to == "" || to == null){
	          alert("???????????? ????????? ???????????????");
	       } else {
	       var con_test = confirm("??????????????? ??????????????? ?????????????????????????");   /* ????????? ???????????? ???????????? */
	          
	          if(con_test == true){
	               
	             if(count < 10){      /* ?????? ????????????????????? ?????? ?????? ???????????? count ?????? ?????? ??? ?????? */
	                 
	               $.ajax({
	                   url:"${path }/sendSms.do",
	                   type:"post",
	                   data:{to: $("#newPhone").val(),
	                        text: $("#text").val()
	                        },
		               success:function(){
		                   alert("?????? ??????????????? ??????????????? ??????????????????");
		                   count++;
		                   
		                  // alert(count);
		               },
	                   error(){
	                      
	                   }
	                   
	                });
	             } else {
	                alert("????????? ?????? ???????????????")
	             }
	          
	          } else if(con_test == false){
	                
	          }
	      }   
	 })
	 
    $("#enterBtn").click(function() {   /* ?????? ????????? ????????? ??????????????? ???????????? */
       //alert($("#text").val());
    
       var userNum = $("#userNum").val();
       
       var sysNum = $("#text").val();         
       
       if(userNum == null || userNum == ""){
          alert("??????????????? ????????? ??????????????? ??????????????????");
       } else {     
          if(userNum.trim() == sysNum.trim()){
              alert("???????????? ???????????????.");
           }
           else {
              alert("??????????????? ??????????????????.");
           }          
       }
    });
  });
  </script>

	
</body>

</html>