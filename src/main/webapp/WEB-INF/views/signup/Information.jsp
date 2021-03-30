<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Information</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous" />
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
            <div class="row text-center">
                <div class="col-sm-3" style="display: flex; align-items: center;
                    justify-content: center;
                    flex-direction: column;">
                    <img src="${path }/images/one.png">
                    <div class="card border-info mb-3" style="max-width: 8rem">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title" style="font-size: 20px;">약관동의</h5>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3" style="display: flex; align-items: center;
                    justify-content: center;
                    flex-direction: column;">
                    <img src="${path }/images/two.png">
                    <div class="card border-info mb-3" style="max-width: 8rem">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title" style="font-size: 20px;">가입유형</h5>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3" style="display: flex; align-items: center;
                    justify-content: center;
                    flex-direction: column;">
                    <img src="${path }/images/three.png">
                    <div class="card border-info mb-3" style="max-width: 8rem">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title" style="font-size: 20px;">정보입력</h5>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3" style="display: flex; align-items: center;
                    justify-content: center;
                    flex-direction: column;">
                    <img src="${path }/images/for.png">
                    <div class="card border-dark mb-3" style="max-width: 8rem">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title" style="font-size: 20px;">가입완료</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <hr />
            <br />
            <h1>정보입력</h1>
            <br />
            <div>
                <form action="" method="POST">
                    <div>
                        <div class="row">
                            <div class="col-md-3"></div>
                            <div class="col-md-6">
                                <table class="table table-borderless"
                                    style="text-align:left; margin:auto; border-spacing: 30px;">
                                    <tr>
                                        <th style="width: 130px;">아이디</th>
                                        <td>
                                            <div class="input-group mb-2">
                                                <input type="text" class="form-control" placeholder="아이디 입력해주세요."
                                                    aria-describedby="button-addon2" required>
                                                <button class="btn btn-outline-secondary" type="button"
                                                    id="button-addon2">중복확인</button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>비밀번호</th>
                                        <td>
                                            <div class="input-group mb-2">
                                                <input type="password" class="form-control" placeholder="비밀번호 입력해주세요.">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>재확인</th>
                                        <td>
                                            <div class="input-group mb-2">
                                                <input type="password" class="form-control" placeholder="비밀번호 입력해주세요.">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th style="width: 130px;">이름</th>
                                        <td>
                                            <div class="input-group mb-2">
                                                <input type="text" class="form-control" placeholder="이름 입력해주세요.">
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
                                                <input type="tel" class="form-control" placeholder="'-' 빼고 입력해주세요.">
                                                <button class="btn btn-outline-secondary" type="button"
                                                    id="button-addon2">인증번호 받기</button>
                                            </div>
                                            <div class="input-group mb-1">
                                                <input type="text" class="form-control" placeholder="인증번호 입력">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>주소</th>
                                        <td>
                                            <div class="input-group mb-2">
                                                <input type="text" class="form-control" name="postalAddr"
                                                    id="postalAddr" placeholder="우편번호" aria-label="Recipient's username"
                                                    aria-describedby="basic-addon2">
                                                <button class="btn btn-outline-secondary" type="button"
                                                    id="findPostalAddr" onclick="DaumPostcode()">우편번호 검색</button>
                                            </div>
                                            <div class="input-group mb-1">
                                                <input type="text" class="form-control" name="addr1" id="addr1"
                                                    placeholder="주소">
                                            </div>
                                            <!-- 동이름 / 빌딩이름 등이 나온다 -->
                                            <div class="row">
                                                <div class="col-md-7" style="height: 42px;">
                                                    <input type="text" class="form-control" name="addr2" id="addr2"
                                                        placeholder="상세주소">
                                                </div>
                                                <div class="col-md-5">
                                                    <input type="text" class="form-control" name="addr3" id="addr3"
                                                        placeholder="참고항목" readonly>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>

                                   
                                </table>
                            </div>
                                
                                <div class="input-group mb-1" style="display: flex; align-items: center;
                                justify-content: center;
                                flex-direction: column;" >
                                    <p style="font-size: 20px;"><br>
                                        * 애완견이 있을 경우 등록을 해주세요~ <br>
                                        * 제휴업체(파트너) 또는 드라이버 지원 인  경우 확인을 눌러주세요~
                                        </p><br><br>
                                    <div style="text-align:center;">
                                        <button type="button" class="btn btn-outline-info" style="margin-right: 200px;">애완견 등록</button>
                                        <button type="button" class="btn btn-outline-info" style="margin-left: 200px;" >확인</button>
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
            new daum.Postcode({
                oncomplete: function (data) {
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
                    if (data.userSelectedType === 'R') {
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if (data.buildingName !== '' && data.apartment === 'Y') {
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if (extraAddr !== '') {
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("addr3").value = extraAddr;

                    } else {
                        document.getElementById("addr3").value = '';
                    }
                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('postalAddr').value = data.zonecode;
                    document.getElementById("addr1").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("addr2").focus();
                }
            }).open();
        }
    </script>
</body>

</html>