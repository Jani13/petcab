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
    <title>dogInformation</title>
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
            <br />
            <h1 onload="addForm();">반려 동물 등록</h1>
            <br />
            <div>
                <form name="dogInformation" action="${path}/dog/dogInformation/enroll" method="post" enctype="multipart/form-data" >
                <div class="row">
                        <div class="col-md-3"></div>
                        <div class="col-md-6">
                            <table class="table table-borderless"
                                style="text-align:left; margin:auto; border-spacing: 30px;">
                                <tr>
                                    <th style="width: 130px;">등록번호</th>
                                    <td>
                                        <div class="input-group mb-2">
                                            <input type="text" class="form-control" name="animalNo" placeholder="동물등록증 등록번호 입력해주세요."
                                                aria-describedby="button-addon2" required>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>품 종</th>
                                    <td>
                                        <div class="input-group mb-2">
                                            <select class="form-select" aria-label="Default select example" name="dogType">
                                                <option selected> - 선택 - </option>
                                               <option value="골든 리트리버">골든 리트리버</option>
                                               <option value="그레이트 피레니즈">그레이트 피레니즈</option>
                                               <option value="그레이 하운드">그레이 하운드</option>
                                               <option value="그린란드견">그린란드견</option>
                                               <option value="그레이트 데인">그레이트 데인</option>
                                               <option value="뉴펀들랜드">뉴펀들랜드</option>
                                               <option value="닥스훈트">닥스훈트</option>
                                               <option value="도베르만 핀셔">도베르만 핀셔</option>
                                               <option value="달마티안">달마티안</option>
                                               <option value="댄디 딘몬트 테리어">댄디 딘몬트 테리어</option>
                                               <option value="도사견">도사견</option>
                                               <option value="래브라도 리트리버">래브라도 리트리버</option>
                                               <option value="라사압소">라사압소</option>
                                               <option value="로디지안 리지백">로디지안 리지백</option>
                                               <option value="로트바일러">로트바일러</option>
                                               <option value="몰티즈">몰티즈</option>
                                               <option value="미니어처 슈나우져">미니어처 슈나우져</option>
                                               <option value="미니어처 푸들">미니어처 푸들</option>
                                               <option value="미니어처 핀션/미니핀">미니어처 핀션/미니핀</option>
                                               <option value="믹스견">믹스견</option>
                                               <option value="맨체스터 테리어">맨체스터 테리어</option>
                                               <option value="마스티프">마스티프</option>
                                               <option value="비글">비글</option>
                                               <option value="비숑 프리제">비숑 프리제</option>
                                               <option value="보스턴 테리어">보스턴 테리어</option>
                                               <option value="베들링턴 테리어">베들링턴 테리어</option>
                                               <option value="불 테리어">불 테리어</option>
                                               <option value="불도그">불도그</option>
                                               <option value="보더콜리">보더콜리</option>
                                               <option value="브리트니">브리트니</option>
                                               <option value="비즐라">비즐라</option>
                                               <option value="바센지">바센지</option>
                                               <option value="블러드하운드">블러드하운드</option>
                                               <option value="바셋하운드">바셋하운드</option>
                                               <option value="복서">복서</option>
                                               <option value="보르조이">보르조이</option>
                                               <option value="벨지안 시프도그">벨지안 시프도그</option>
                                               <option value="비어디드 콜리">비어디드 콜리</option>
                                               <option value="버니즈 마운틴 도그">버니즈 마운틴 도그</option>
                                               <option value="부비에 데 플랑드르">부비에 데 플랑드르</option>
                                               <option value="불마스티프">불마스티프</option>
                                               <option value="시츄">시츄</option>
                                               <option value="스피츠">스피츠</option>
                                               <option value="샤페이">샤페이</option>
                                               <option value="스탠다드 푸들">스탠다드 푸들</option>
                                               <option value="스탠다드 슈나우져">스탠다드 슈나우져</option>
                                               <option value="시바견">시바견</option>
                                               <option value="사모예드">사모예드</option>
                                               <option value="시베리안허스키">시베리안허스키</option>
                                               <option value="삽살개">삽살개</option>
                                               <option value="스코티시 테리어">스코티시 테리어</option>
                                               <option value="실키 테리어">실키 테리어</option>
                                               <option value="스키퍼키">스키퍼키</option>
                                               <option value="스태퍼드셔 불 테리어/스태피">스태퍼드셔 불 테리어/스태피</option>
                                               <option value="스코티시 디어하운드">스코티시 디어하운드</option>
                                               <option value="살루키">살루키</option>
                                               <option value="세인트버나드">세인트버나드</option>
                                               <option value="셔틀랜드 시프도그">셔틀랜드 시프도그</option>
                                               <option value="요크셔 테리어">요크셔 테리어</option>
                                               <option value="웰시 코기">웰시 코기</option>
                                               <option value="아메리칸 코카 스패니얼">아메리칸 코카 스패니얼</option>
                                               <option value="잉글리쉬 코카 스패니얼">잉글리쉬 코카 스패니얼</option>
                                               <option value="아이리시 워터 스패니얼">아이리시 워터 스패니얼</option>
                                               <option value="아키타견">아키타견</option>
                                               <option value="웰시 테리어">웰시 테리어</option>
                                               <option value="아이리시 테리어">아이리시 테리어</option>
                                               <option value="웨스트 하일랜드 테리어">웨스트 하일랜드 테리어</option>
                                               <option value="아펜핀셔">아펜핀셔</option>
                                               <option value="이탈리안 그레이하운드">이탈리안 그레이하운드</option>
                                               <option value="에어데일 테리어">에어데일 테리어</option>
                                               <option value="웰시 스프링어 스패니얼">웰시 스프링어 스패니얼</option>
                                               <option value="잉글리쉬 스프링거 스파니얼">잉글리쉬 스프링거 스파니얼</option>
                                               <option value="아이리시 세터">아이리시 세터</option>
                                               <option value="와이마라너">와이마라너</option>
                                               <option value="잉글리쉬 포인터">잉글리쉬 포인터</option>
                                               <option value="알래스칸 맬러뮤트">알래스칸 맬러뮤트</option>
                                               <option value="잉글리쉬 폭스하운드">잉글리쉬 폭스하운드</option>
                                               <option value="아프간 하운드">아프간 하운드</option>
                                               <option value="아이리시 울프하운드">아이리시 울프하운드</option>
                                               <option value="아자와크">아자와크</option>
                                               <option value="오스트레일리안 캐틀도그">오스트레일리안 캐틀도그</option>
                                               <option value="올드 잉글리쉬 시프도그">올드 잉글리쉬 시프도그</option>
                                               <option value="진돗개">진돗개</option>
                                               <option value="자이언트 슈나우저">자이언트 슈나우저</option>
                                               <option value="잭 러셀 테리어">잭 러셀 테리어</option>
                                               <option value="치와와">치와와</option>
                                               <option value="차우차우">차우차우</option>
                                               <option value="차이니스 크레스티드">차이니스 크레스티드</option>
                                               <option value="채서피크 베이 리트리버">채서피크 베이 리트리버</option>                                               
                                               <option value="카발리에 킹 찰스 스패니얼">카발리에 킹 찰스 스패니얼</option>
                                               <option value="킹 찰스 스페니얼">킹 찰스 스페니얼</option>
                                               <option value="컬러 코티드 리트리버">컬러 코티드 리트리버</option>
                                               <option value="캉갈">캉갈</option>
                                               <option value="콜리">콜리</option>
                                               <option value="코몬도르">코몬도르</option>
                                               <option value="토이 푸들">토이 푸들</option>
                                               <option value="티베탄 테리어">티베탄 테리어</option>
                                               <option value="티베탄 마스티프">티베탄 마스티프</option>
                                               <option value="파피용">파피용</option>
                                               <option value="퍼그">퍼그</option>
                                               <option value="페키니즈">페키니즈</option>
                                               <option value="포메리안">포메리안</option>
                                               <option value="프렌치 불도그">프렌치 불도그</option>
                                               <option value="핏불 테리어">핏불 테리어</option>
                                               <option value="풀리">풀리</option>
                                               <option value="풍산개">풍산개</option>
                                               <option value="폭스 테리어">폭스 테리어</option>
                                               <option value="플랫 코티드 리트리버">플랫 코티드 리트리버</option>
                                               <option value="파라오 하운드">파라오 하운드</option>                                            
                                               <option value="해리어">해리어</option>
                                               <option value="휘핏">휘핏</option>
                                            </select>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                <th style="width: 130px;">애 견 명</th>
                                <td>
                                    <div class="input-group mb-2">
                                        <input type="text" class="form-control" name="dogName" placeholder="이름 입력해주세요.">
                                    </div>
                                </td>
                                </tr>
                                <tr>
                                    <th style="width: 130px;">애견 사진</th>
                                    <td>
                                        <div class="input-group mb-2">
                                            <input type="file" class="form-control" name="upfile" id="inputGroupFile02" onchange="checkFile(this)">
                                            
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th style="width: 130px;">나이</th>
                                    <td>
                                        <div class="input-group mb-2">
                                            <input type="text" class="form-control" name="age" placeholder="숫자만 입력해주세요."
                                                aria-describedby="button-addon2" required>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>예방접종 확인 </th>
                                    <td>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="checkbox" id="inlineCheckbox1" name="vacc"
                                                value="DHPPL">
                                            <label class="form-check-label" for="inlineCheckbox1">DHPPL</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="checkbox" id="inlineCheckbox2"
                                                value="Coronavirus" name="vacc">
                                            <label class="form-check-label" for="inlineCheckbox2">Coronavirus
                                            </label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="checkbox" id="inlineCheckbox3"
                                                value="KennelCough" name="vacc">
                                            <label class="form-check-label" for="inlineCheckbox3">Kennel
                                                Cough</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="checkbox" id="inlineCheckbox4"
                                                value="광견병" name="vacc">
                                            <label class="form-check-label" for="inlineCheckbox4">광견병</label>
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
                                    <textarea name="disorder" id="" rows="5" cols="80"
                                        placeholder="질병이 있을 경우 작성해주세요~"></textarea>
                                </div>
                            </div>
                            <p style="font-size: 20px;"><br>
                                기타 사항
                            </p>
                            <div class="editor-box">
                                <div class="editor-box__editor">
                                    <textarea name="other" id="" rows="5" cols="80" placeholder="이용시 반영됩니다."></textarea>
                                </div>
                            </div>
                            <br>
                        </div>
                    </div> 
                    	 <input type="hidden" name="count" value="0">
                         <div id="addedFormDiv"></div><BR> <!-- 폼을 삽입할 DIV -->
                        <div style="text-align:center;">
                    	<!-- <button type="button" class="btn btn-outline-info" data-bs-toggle="collapse"
                   			 data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample" style="margin-right: 200px;" onclick="addForm();">등록추가</button> -->
                   		  <button type="submit" class="btn btn-outline-info" onclick="fnFileChk();">확인</button>
                  		 <input type="hidden" name="userId" value="${loginMember.userId}" readonly>
         	       		</div>
                  </form>
         
           </div>
        </div>
        <br>
    </section>
  <jsp:include page="../common/footer.jsp" />
      <!-- <script>
            var count = 0;
            function addForm() {

                var addedFormDiv = document.getElementById("addedFormDiv");

                var str = "";
                str+="<br><h3>애견등록</h3>"+count+"<div class='row'>"+
                            "<div class='col-md-3'></div>"+
                            "<div class='col-md-6'>"+
                                "<table class='table table-borderless'style='text-align:left; margin:auto; border-spacing: 30px;'>"+
                                    "<tr>"+
                                        "<th style='width: 130px;''>등록번호</th>"+
                                        "<td>"+
                                            "<div class='input-group mb-2'>"+
                                                "<input type='text' class='form-control' name='animalNo'+count placeholder='동물등록증 등록번호 입력해주세요.'aria-describedby='button-addon2' required>"+
                                            "</div>"+
                                        "</td>"+
                                    "</tr>"+
                                    "<tr>"+
                                        "<th>품 종</th>"+
                                        "<td>"+
                                            "<div class='input-group mb-2'>"+
                                                "<select class='form-select' aria-label='Default select example' name='dogType'+count>"+
                                                   "<option selected> - 선택 - </option>"+
                                                   "<option value='골든 리트리버'>골든 리트리버</option>"+
                                                   "<option value='그레이트 피레니즈'>그레이트 피레니즈</option>"+
                                                   "<option value='그레이 하운드'>그레이 하운드</option>"+
                                                   "<option value='그린란드견'>그린란드견</option>"+
                                                   "<option value='그레이트 데인'>그레이트 데인</option>"+
                                                   "<option value='뉴펀들랜드'>뉴펀들랜드</option>"+
                                                   "<option value='닥스훈트'>닥스훈트</option>"+
                                                   "<option value='도베르만 핀셔'>도베르만 핀셔</option>"+
                                                   "<option value='달마티안'>달마티안</option>"+
                                                   "<option value='댄디 딘몬트 테리어'>댄디 딘몬트 테리어</option>"+
                                                   "<option value='도사견'>도사견</option>"+
                                                   "<option value='래브라도 리트리버'>래브라도 리트리버</option>"+
                                                   "<option value='라사압소'>라사압소</option>"+
                                                   "<option value='로디지안 리지백'>로디지안 리지백</option>"+
                                                   "<option value='로트바일러'>로트바일러</option>"+
                                                   "<option value='몰티즈'>몰티즈</option>"+
                                                   "<option value='미니어처 슈나우져'>미니어처 슈나우져</option>"+
                                                   "<option value='미니어처 푸들'>미니어처 푸들</option>"+
                                                   "<option value='미니어처 핀션/미니핀'>미니어처 핀션/미니핀</option>"+
                                                   "<option value='맨체스터 테리어'>맨체스터 테리어</option>"+
                                                   "<option value='마스티프'>마스티프</option>"+
                                                   "<option value='비글'>비글</option>"+
                                                   "<option value='비숑 프리제'>비숑 프리제</option>"+
                                                   "<option value='보스턴 테리어'>보스턴 테리어</option>"+
                                                   "<option value='베들링턴 테리어'>베들링턴 테리어</option>"+
                                                   "<option value='불 테리어'>불 테리어</option>"+
                                                   "<option value='불도그'>불도그</option>"+
                                                   "<option value='보더콜리'>보더콜리</option>"+
                                                   "<option value='브리트니'>브리트니</option>"+
                                                   "<option value='비즐라'>비즐라</option>"+
                                                   "<option value='바센지'>바센지</option>"+
                                                   "<option value='블러드하운드'>블러드하운드</option>"+
                                                   "<option value='바셋하운드'>바셋하운드</option>"+
                                                   "<option value='복서'>복서</option>"+
                                                   "<option value='보르조이'>보르조이</option>"+
                                                   "<option value='벨지안 시프도그'>벨지안 시프도그</option>"+
                                                   "<option value='비어디드 콜리'>비어디드 콜리</option>"+
                                                   "<option value='버니즈 마운틴 도그'>버니즈 마운틴 도그</option>"+
                                                   "<option value='부비에 데 플랑드르'>부비에 데 플랑드르</option>"+
                                                   "<option value='불마스티프'>불마스티프</option>"+
                                                   "<option value='시츄'>시츄</option>"+
                                                   "<option value='스피츠'>스피츠</option>"+
                                                   "<option value='샤페이'>샤페이</option>"+
                                                   "<option value='스탠다드 푸들'>스탠다드 푸들</option>"+
                                                   "<option value='스탠다드 슈나우져'>스탠다드 슈나우져</option>"+
                                                   "<option value='시바견'>시바견</option>"+
                                                   "<option value='사모예드'>사모예드</option>"+
                                                   "<option value='시베리안허스키'>시베리안허스키</option>"+
                                                   "<option value='삽살개'>삽살개</option>"+
                                                   "<option value='스코티시 테리어'>스코티시 테리어</option>"+
                                                   "<option value='실키 테리어'>실키 테리어</option>"+
                                                   "<option value='스키퍼키'>스키퍼키</option>"+
                                                   "<option value='스태퍼드셔 불 테리어/스태피'>스태퍼드셔 불 테리어/스태피</option>"+
                                                   "<option value='스코티시 디어하운드'>스코티시 디어하운드</option>"+
                                                   "<option value='살루키'>살루키</option>"+
                                                   "<option value='세인트버나드'>세인트버나드</option>"+
                                                   "<option value='셔틀랜드 시프도그'>셔틀랜드 시프도그</option>"+
                                                   "<option value='요크셔 테리어'>요크셔 테리어</option>"+
                                                   "<option value='웰시 코기'>웰시 코기</option>"+
                                                   "<option value='아메리칸 코카 스패니얼'>아메리칸 코카 스패니얼</option>"+
                                                   "<option value='잉글리쉬 코카 스패니얼'>잉글리쉬 코카 스패니얼</option>"+
                                                   "<option value='아이리시 워터 스패니얼'>아이리시 워터 스패니얼</option>"+
                                                   "<option value='아키타견'>아키타견</option>"+
                                                   "<option value='웰시 테리어'>웰시 테리어</option>"+
                                                   "<option value='아이리시 테리어'>아이리시 테리어</option>"+
                                                   "<option value='웨스트 하일랜드 테리어'>웨스트 하일랜드 테리어</option>"+
                                                   "<option value='아펜핀셔'>아펜핀셔</option>"+
                                                   "<option value='이탈리안 그레이하운드'>이탈리안 그레이하운드</option>"+
                                                   "<option value='에어데일 테리어'>에어데일 테리어</option>"+
                                                   "<option value='웰시 스프링어 스패니얼'>웰시 스프링어 스패니얼</option>"+
                                                   "<option value='잉글리쉬 스프링거 스파니얼'>잉글리쉬 스프링거 스파니얼</option>"+
                                                   "<option value='아이리시 세터'>아이리시 세터</option>"+
                                                   "<option value='와이마라너'>와이마라너</option>"+
                                                   "<option value='잉글리쉬 포인터'>잉글리쉬 포인터</option>"+
                                                   "<option value='알래스칸 맬러뮤트'>알래스칸 맬러뮤트</option>"+
                                                   "<option value='잉글리쉬 폭스하운드'>잉글리쉬 폭스하운드</option>"+
                                                   "<option value='아프간 하운드'>아프간 하운드</option>"+
                                                   "<option value='아이리시 울프하운드'>아이리시 울프하운드</option>"+
                                                   "<option value='아자와크'>아자와크</option>"+
                                                   "<option value='오스트레일리안 캐틀도그'>오스트레일리안 캐틀도그</option>"+
                                                   "<option value='올드 잉글리쉬 시프도그'>올드 잉글리쉬 시프도그</option>"+
                                                   "<option value='진돗개'>진돗개</option>"+
                                                   "<option value='자이언트 슈나우저'>자이언트 슈나우저</option>"+
                                                   "<option value='잭 러셀 테리어'>잭 러셀 테리어</option>"+
                                                   "<option value='치와와'>치와와</option>"+
                                                   "<option value='차우차우'>차우차우</option>"+
                                                   "<option value='차이니스 크레스티드'>차이니스 크레스티드</option>"+
                                                   "<option value='채서피크 베이 리트리버'>채서피크 베이 리트리버</option>"+                                               
                                                   "<option value='카발리에 킹 찰스 스패니얼'>카발리에 킹 찰스 스패니얼</option>"+
                                                   "<option value='킹 찰스 스페니얼'>킹 찰스 스페니얼</option>"+
                                                   "<option value='컬러 코티드 리트리버'>컬러 코티드 리트리버</option>"+
                                                   "<option value='캉갈'>캉갈</option>"+
                                                   "<option value='콜리'>콜리</option>"+
                                                   "<option value='코몬도르'>코몬도르</option>"+
                                                   "<option value='토이 푸들'>토이 푸들</option>"+
                                                   "<option value='티베탄 테리어'>티베탄 테리어</option>"+
                                                   "<option value='티베탄 마스티프'>티베탄 마스티프</option>"+
                                                   "<option value='파피용'>파피용</option>"+
                                                   "<option value='퍼그'>퍼그</option>"+
                                                   "<option value='페키니즈'>페키니즈</option>"+
                                                   "<option value='포메리안'>포메리안</option>"+
                                                   "<option value='프렌치 불도그'>프렌치 불도그</option>"+
                                                   "<option value='핏불 테리어'>핏불 테리어</option>"+
                                                   "<option value='풀리'>풀리</option>"+
                                                   "<option value='풍산개'>풍산개</option>"+
                                                   "<option value='폭스 테리어'>폭스 테리어</option>"+
                                                   "<option value='플랫 코티드 리트리버'>플랫 코티드 리트리버</option>"+
                                                   "<option value='파라오 하운드'>파라오 하운드</option>"+                                            
                                                   "<option value='해리어'>해리어</option>"+
                                                   "<option value='휘핏'>휘핏</option>"+
                                                "</select>"+
                                            "</div>"+
                                        "</td>"+
                                    "</tr>"+
                                    "<th style='width: 130px;'>애 견 명</th>"+
                                    "<td>"+
                                        "<div class='input-group mb-2'>"+
                                            "<input type='text' class='form-control' name='dogName'+count placeholder='이름 입력해주세요.'>"+
                                        "</div>"+
                                    "</td>"+
                                    "</tr>"+
                                    "<tr>"+
                                        "<th style='width: 130px;'>애견 사진</th>"+
                                        "<td>"+
                                            "<div class='input-group mb-2'>"+
                                                "<input type='file' class='form-control' name='upfile'+count id='inputGroupFile02'>"+
                                            "</div>"+
                                        "</td>"+
                                    "</tr>"+
                                    "<tr>"+
                                        "<th style='width: 130px;'>나이</th>"+
                                        "<td>"+
                                            "<div class='input-group mb-2'>"+
                                                "<input type='text' class='form-control' name='age'+count placeholder='숫자만 입력해주세요.'aria-describedby='button-addon2' required>"+
                                            "</div>"+
                                        "</td>"+
                                    "</tr>"+
                                    "<tr>"+
                                        "<th>예방접종 확인 </th>"+
                                        "<td>"+
                                            "<div class='form-check form-check-inline'>"+
                                                "<input class='form-check-input' type='checkbox' id='inlineCheckbox1' name='vacc'+count value='DHPPL'>"+
                                                "<label class='form-check-label' for='inlineCheckbox1'>DHPPL</label>"+
                                            "</div>"+
                                            "<div class='form-check form-check-inline'>"+
                                                "<input class='form-check-input' type='checkbox' id='inlineCheckbox2' value='Coronavirus' name='vacc'+count>"+
                                                "<label class='form-check-label' for='inlineCheckbox2'>Coronavirus</label>"+
                                            "</div>"+
                                            "<div class='form-check form-check-inline'>"+
                                                "<input class='form-check-input' type='checkbox' id='inlineCheckbox1'value='KennelCough' name='vacc'+count>"+
                                                "<label class='form-check-label' for='inlineCheckbox1'>Kennel Cough</label>"+
                                            "</div>"+
                                            "<div class='form-check form-check-inline'>"+
                                                "<input class='form-check-input' type='checkbox' id='inlineCheckbox2' value='광견병' name='vacc'+count>"+
                                                "<label class='form-check-label' for='inlineCheckbox2'>광견병</label>"+
                                            "</div>"+
                                        "</td>"+
                                    "</tr>"+
                                "</table>"+
                            "</div>"+

                            "<div class='input-group mb-1' style='display: flex; align-items: center; justify-content: center; flex-direction: column;'>"+
                                "<p style='font-size: 20px;'><br> 애견 질병 작성 </p>"+
                                "<div class='editor-box'>"+
                                    "<div class='editor-box__editor'>"+
                                        "<textarea name='disorder'+count id='' rows='5' cols='80' placeholder='질병이 있을 경우 작성해주세요~'></textarea>"+
                                    "</div>"+
                                "</div>"+
                                "<p style='font-size: 20px;'><br> 기타 사항 </p>"+
                                "<div class='editor-box'>"+
                                    "<div class='editor-box__editor'>"+
                                        "<textarea name='other'+count id='' rows='5' cols='80' placeholder='이용시 반영됩니다.'></textarea>"+
                                    "</div>"+
                                "</div>"+
                                "<br>"+
                            "</div>";

                var addedDiv = document.createElement("div"); // 폼 생성

                addedDiv.id = "added_" + count; // 폼 Div에 ID 부여 (삭제를 위해)

                addedDiv.innerHTML = str; // 폼 Div안에 HTML삽입

                addedFormDiv.appendChild(addedDiv); // 삽입할 DIV에 생성한 폼 삽입



                count++;

                document.baseForm.count.value = count;

                // 다음 페이지에 몇개의 폼을 넘기는지 전달하기 위해 히든 폼에 카운트 저장

            }



           /*  function delForm() {

                var addedFormDiv = document.getElementById("addedFormDiv");



                if (count > 1) { // 현재 폼이 두개 이상이면

                    var addedDiv = document.getElementById("added_" + (--count));

                    // 마지막으로 생성된 폼의 ID를 통해 Div객체를 가져옴

                    addedFormDiv.removeChild(addedDiv); // 폼 삭제 

                } else { // 마지막 폼만 남아있다면

                    document.baseForm.reset(); // 폼 내용 삭제

                }

            } */
    </script> -->
    <script>
    function checkFile(f){
    	var file = f.files;

    	if(!/\.(gif|jpg|jpeg|png)$/i.test(file[0].name)) alert('gif, jpg, png 파일만 선택해 주세요.\n\n현재 파일 : ' + file[0].name);

    	else return;
    	f.outerHTML = f.outerHTML;
    }
    </script>
</body>
</html>