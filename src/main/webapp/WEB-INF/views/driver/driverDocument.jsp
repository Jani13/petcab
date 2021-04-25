<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>    
<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:set var="addr" value="${fn:split(loginMember.address,',')}"/>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>드라이버 지원서 - 데려다줄개</title>
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
    <script
      src="https://kit.fontawesome.com/7eaa61533c.js"
      crossorigin="anonymous"
    ></script>
    <link rel="stylesheet" href="${path}/css/driverdocument.css" />
    <script src="//code.jquery.com/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>

    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <!-- header footer include시 밑에 소스 2줄-->
    <!-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ -->
    <link rel="stylesheet" href="${ path }/css/headerfooter.css" />
   	<script src="${ path }/js/jquery-3.5.1.js"></script>
    <!-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ -->

    <style>
        .myDogs {
            width: 200px;
            height: 200px;
        }

        .successCall {
            width: 300px;
            height: 300px;
        }

    </style>

  </head>
  <body class="body-wrap">
    <jsp:include page="../common/header.jsp" />
    <jsp:include page="../common/nav.jsp" />
    <section>
        <div class="dirver-document__intro">
          <c:if test="${driver.userNo == null}">
          <span class="driver-document__title">드라이버 지원서</span>
          <div class="diver-documnet__textbox">
            <h5>모집부문 및 담당업무 :  애견 콜 택시 & 안전운행<br><br />
            자격요건 : 20살 이상, 전업주부, 회사원 (투잡가능)<br> <br />
            우대사항 : 자차 차량소지 필수!<br> <br />
            근무조건 : 예약시간 선택 후 운행해주시면 됩니다. <br><br />
            특징 :  (시간대 자유!!)★★★★★<br /></h5>
          </div>
          </c:if>
          <c:if test="${driver.userNo != null}">
          <span class="driver-document__title" style="margin-bottom : 40px">드라이버 정보 수정</span>
          </c:if>
          <c:if test="${driver.userNo == null}">
              <div class="driver-document__information">
                <form action="${path}/driver/apply/enroll" method="post" class="information" enctype="multipart/form-data">
                  <div>
                    <h5 class="information__title">이름</h5>
                    <input type="text" class="form-control" name="userName" value="${loginMember.userName}"style="width: 300px; height: 30px; padding: 0px 10px;"  readonly>
                  </div>
                  <div>
                    <h5 class="information__title">전화번호</h5>
                    <input type="text" class="form-control" name="phone" value="${loginMember.phone}" style="  width: 300px; height: 30px; padding: 0px 10px;"  readonly>
                  </div>
                  <div>
                    <h5 class="information__title">보유차종</h5>
                    <input type="text" class="form-control" name="carType" id="carType" style="  width: 300px; height: 30px; padding: 0px 10px;"  placeholder="차종을 입력해주세요(K3,아반떼,소나타)">
                  </div>
                  <div>
                    <h5 class="information__title">차량번호</h5>
                    <input type="text" class="form-control" name="carNo" id="carNo" style="  width: 300px; height: 30px; padding: 0px 10px;"  placeholder="OOO가 OOOO형태로 입력해주세요.">
                  </div>
                  <button type="button" id="carNoCheckBtn" class="btn btn-info" style="width: 300px; font-size: 15px; color: white;  margin-left: 200px">
                      차량번호확인
                  </button>
                  <div>
                    <h5 class="information__title">자기<br>소개</h5>
                    <textarea name="about" id="" cols="28" rows="10"></textarea>
                  </div>
                  <div>
                    <h5 class="information__title">프로필사진</h5>
                    <input type="file" name="upfile" class="information__input file" onchange="checkFile(this)"/>
                  </div>
                  <button type="submit" id="infoBtn" class="btn btn-info" style="  margin: 20px 0; font-size: 15px; color: white; height: 40px; border: none;">제출하기</button>
                     <input type="hidden" name="userNo" 
                  value="${loginMember.userNo}" readonly>
                </form>
              </div>
          </c:if>
          <c:if test="${driver.userNo != null}">
              <div class="driver-document__information">
                <form action="${path}/driver/update" method="post" class="information" enctype="multipart/form-data">
                  <div>
                    <h5 class="information__title">이름</h5>
                    <input type="text" class="form-control" name="userName" value="${loginMember.userName}"style="width: 300px; height: 30px; padding: 0px 10px;"  readonly>
                  </div>
                  <div>
                    <h5 class="information__title">전화번호</h5>
                    <input type="text" class="form-control" name="phone" value="${loginMember.phone}" style="  width: 300px; height: 30px; padding: 0px 10px;"  readonly>
                  </div>
                  <div>
                    <h5 class="information__title">보유차종</h5>
                    <input type="text" class="form-control" name="carType" id="carType" style="  width: 300px; height: 30px; padding: 0px 10px;"  value="${driver.carType}">
                  </div>
                  <div>
                    <h5 class="information__title">차량번호</h5>
                    <input type="text" class="form-control" name="carNo" id="carNo" style="  width: 300px; height: 30px; padding: 0px 10px;"  value="${driver.carNo }">
                  </div>
                  <div>
                    <h5 class="information__title">자기<br>소개</h5>
                    <textarea name="about" id="" cols="28" rows="10"> <c:out value="${driver.about}"/></textarea>
                  </div>
                  <div>
                    <h5 class="information__title">프로필사진</h5>
                    <input type="file" name="upfile" class="information__input file" onchange="checkFile(this)"/>
                  </div>
                  <button type="submit" id="infoBtn" class="btn btn-info" style="  margin: 20px 0; font-size: 15px; color: white; height: 40px; border: none;">제출하기</button>
                     <input type="hidden" name="userNo" 
                  value="${loginMember.userNo}" readonly>
                </form>
              </div>
          </c:if>
        </div>
      </section>
    <jsp:include page="../common/footer.jsp" />
    
    <script>
        $(document).ready(() => {
            
            $("#infoBtn").on("click", () => {
                var carType = $("#carType").val();
                var carNo = $("#carNo").val();
                
                if(carType.length == 0) {
                    alert("차종을 입력해 주세요");
                  $("#carType").focus();
                  
                  return false;
                }
                
                if(carNo.length == 0) {
                    alert("차량번호 입력 후 중복체크를 해주세요");
                  $("#carNo").focus();
                  
                  return false;
                }
            });
            
            $("#carNoCheckBtn").on("click", () => {
                let carNo = $("#carNo").val().trim();
                
                $.ajax({
                    type: "get",
                    url: "${path}/driver/carNoCheck",
                    dataType: "json",
                    data: {
                        carNo
                    },
                    success: function(data) {
                        console.log(data);
                        
                        if(data.carNoCheck !== true) {
                            alert("차량 번호 중복 체크가 완료되었습니다.")
                        } else {
                            alert("이미 등록된 차량번호 입니다.")     			  
                        }
                    },
                    
                    error: function(e) {
                        console.log(e);
                    }
                   });
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