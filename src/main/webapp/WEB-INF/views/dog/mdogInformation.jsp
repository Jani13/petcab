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
    <title>mdogInformation</title>
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
            <h1>반려 동물</h1>
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
                                        <th style="width: 130px;">등록번호</th>
                                        <td>
                                            <div class="input-group mb-2">
                                                <input type="text" class="form-control" placeholder="동물등록증 등록번호 입력해주세요."
                                                    aria-describedby="button-addon2" required>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>품 종</th>
                                        <td>
                                            <div class="input-group mb-2">
                                                <select class="form-select" aria-label="Default select example">
                                                    <option selected> - 선택 - </option>
                                                    <option value="1">몰티즈</option>
                                                    <option value="2">킹 찰스 스페니얼</option>
                                                    <option value="3">파피용</option>
                                                    <option value="4">차이니스 크레스티드</option>
                                                    <option value="5">이탈리안 그레이하운드</option>
                                                    <option value="6">퍼그</option>
                                                    <option value="7">미니어처 핀션/미니핀</option>
                                                    <option value="8">페키니즈</option>
                                                    <option value="9">포메리안</option>
                                                    <option value="10">아펜핀셔</option>
                                                    <option value="11">진돗개</option>
                                                    <option value="12">시츄</option>
                                                    <option value="13">치와와</option>
                                                    <option value="14">요크셔 테리어</option>
                                                    <option value="15">실키 테리어</option>
                                                    <option value="16">스피츠</option>
                                                    <option value="17">카발리에 킹 찰스 스패니얼</option>
                                                    <option value="18">샤페이</option>
                                                    <option value="19">티베탄 테리어</option>
                                                    <option value="20">라사압소</option>
                                                    <option value="21">프렌치 불도그</option>
                                                    <option value="22">보스턴 테리어</option>
                                                    <option value="23">스키퍼키</option>
                                                    <option value="24">불도그</option>
                                                    <option value="25">비숑 프리제</option>
                                                    <option value="26">차우차우</option>
                                                    <option value="27">달마티안</option>
                                                    <option value="28">토이 푸들</option>
                                                    <option value="29">미니어처 푸들</option>
                                                    <option value="30">스탠다드 푸들</option>
                                                    <option value="31">도사견</option>
                                                    <option value="32">시바견</option>
                                                    <option value="33">아키타견</option>
                                                    <option value="34">삽살개</option>
                                                    <option value="35">풍산개</option>
                                                    <option value="36">폭스 테리어</option>
                                                    <option value="37">맨체스터 테리어</option>
                                                    <option value="38">베들링턴 테리어</option>
                                                    <option value="39">불 테리어</option>
                                                    <option value="40">웰시 테리어</option>
                                                    <option value="41">아이리시 테리어</option>
                                                    <option value="42">웨스트 하일랜드 테리어</option>
                                                    <option value="43">스태퍼드셔 불 테리어/스태피</option>
                                                    <option value="44">댄디 딘몬트 테리어</option>
                                                    <option value="45">미니어처 슈나우져</option>
                                                    <option value="46">스코티시 테리어</option>
                                                    <option value="47">에어데일 테리어</option>
                                                    <option value="48">잭 러셀 테리어</option>
                                                    <option value="49">핏불 테리어</option>
                                                    <option value="50">아이리시 워터 스패니얼</option>
                                                    <option value="51">아메리칸 코카 스패니얼</option>
                                                    <option value="52">잉글리쉬 코카 스패니얼</option>
                                                    <option value="53">브리트니</option>
                                                    <option value="54">웰시 스프링어 스패니얼</option>
                                                    <option value="55">잉글리쉬 스프링거 스파니얼</option>
                                                    <option value="56">아이리시 세터</option>
                                                    <option value="56">골든 리트리버</option>
                                                    <option value="56">래브라도 리트리버</option>
                                                    <option value="57">채서피크 베이 리트리버</option>
                                                    <option value="58">컬러 코티드 리트리버</option>
                                                    <option value="59">플랫 코티드 리트리버</option>
                                                    <option value="60">와이마라너</option>
                                                    <option value="61">비즐라</option>
                                                    <option value="62">잉글리쉬 포인터</option>
                                                    <option value="63">파라오 하운드</option>
                                                    <option value="64">로디지안 리지백</option>
                                                    <option value="65">바센지</option>
                                                    <option value="66">닥스훈트</option>
                                                    <option value="67">블러드하운드</option>
                                                    <option value="68">잉글리쉬 폭스하운드</option>
                                                    <option value="69">바셋하운드</option>
                                                    <option value="70">해리어</option>
                                                    <option value="71">비글</option>
                                                    <option value="72">마스티프</option>
                                                    <option value="73">로트바일러</option>
                                                    <option value="74">복서</option>
                                                    <option value="75">자이언트 슈나우저</option>
                                                    <option value="76">스탠다드 슈나우져</option>
                                                    <option value="77">도베르만 핀셔</option>
                                                    <option value="78">그레이트 데인</option>
                                                    <option value="79">불마스티프</option>
                                                    <option value="80">아프간 하운드</option>
                                                    <option value="81">그레이 하운드</option>
                                                    <option value="82">스코티시 디어하운드</option>
                                                    <option value="83">아이리시 울프하운드</option>
                                                    <option value="84">휘핏</option>
                                                    <option value="85">보르조이</option>
                                                    <option value="86">살루키</option>
                                                    <option value="87">아자와크</option>
                                                    <option value="88">세인트버나드</option>
                                                    <option value="89">버니즈 마운틴 도그</option>
                                                    <option value="90">부비에 데 플랑드르</option>
                                                    <option value="91">뉴펀들랜드</option>
                                                    <option value="92">사모예드</option>
                                                    <option value="93">시베리안허스키</option>
                                                    <option value="94">알래스칸 맬러뮤트</option>
                                                    <option value="95">그린란드견</option>
                                                    <option value="96">티베탄 마스티프</option>
                                                    <option value="97">벨지안 시프도그</option>
                                                    <option value="98">오스트레일리안 캐틀도그</option>
                                                    <option value="99">보더콜리</option>
                                                    <option value="100">비어디드 콜리</option>
                                                    <option value="101">웰시 코기</option>
                                                    <option value="102">셔틀랜드 시프도그</option>
                                                    <option value="103">올드 잉글리쉬 시프도그</option>
                                                    <option value="104">풀리</option>
                                                    <option value="105">캉갈</option>
                                                    <option value="106">콜리</option>
                                                    <option value="107">그레이트 피레니즈</option>
                                                    <option value="108">코몬도르</option>
                                                </select>
                                            </div>
                                        </td>
                                    </tr>
                                    <th style="width: 130px;">애 견 명</th>
                                    <td>
                                        <div class="input-group mb-2">
                                            <input type="text" class="form-control" placeholder="이름 입력해주세요.">
                                        </div>
                                    </td>
                                    </tr>
                                    <tr>
                                        <th style="width: 130px;">애견 사진</th>
                                        <td>
                                            <div class="input-group mb-2">
                                                <input type="file" class="form-control" id="inputGroupFile02">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th style="width: 130px;">나이</th>
                                        <td>
                                            <div class="input-group mb-2">
                                                <input type="text" class="form-control" placeholder="나이"
                                                    aria-describedby="button-addon2" required>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>예방접종 확인 </th>
                                        <td>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="inlineCheckbox1"
                                                    value="option1">
                                                <label class="form-check-label" for="inlineCheckbox1">DHPPL</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="inlineCheckbox2"
                                                    value="option2">
                                                <label class="form-check-label" for="inlineCheckbox2">Coronavirus
                                                </label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="inlineCheckbox1"
                                                    value="option1">
                                                <label class="form-check-label" for="inlineCheckbox1">Kennel
                                                    Cough</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="inlineCheckbox2"
                                                    value="option2">
                                                <label class="form-check-label" for="inlineCheckbox2">광견병</label>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>

                            <div class="input-group mb-1" style="display: flex; align-items: center;
                                justify-content: center;
                                flex-direction: column;">
                                <p style="font-size: 20px;"><br>
                                    애견 질병 작성
                                </p>
                                <div class="editor-box">
                                    <div class="editor-box__editor">
                                        <textarea name="" id="" rows="5" cols="80"
                                            placeholder="질병이 있을 경우 작성해주세요~"></textarea>
                                    </div>
                                </div>
                                <p style="font-size: 20px;"><br>
                                    기타 사항
                                </p>
                                <div class="editor-box">
                                    <div class="editor-box__editor">
                                        <textarea name="" id="" rows="5" cols="80"
                                            placeholder="이용시 반영됩니다."></textarea>
                                    </div>
                                </div>
                                <br>
                                <div style="text-align:center;">
                                    <button type="button" class="btn btn-outline-info"
                                        style="margin-right: 50px;">정보 수정</button>
                                    <button type="button" class="btn btn-outline-info"
                                        style="margin-left: 50px;">확인</button>
                                </div>
                            </div>


                        </div>
                </form>
            </div>
        </div>
        <br>
    </section>
  <jsp:include page="../common/footer.jsp" />
</body>

</html>