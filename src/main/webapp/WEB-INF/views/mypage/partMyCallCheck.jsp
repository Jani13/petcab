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
    <title>제휴업체 마이페이지 예약요청 내역 확인</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" 
            rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" 
            crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" 
            crossorigin="anonymous"></script>
	<link rel="stylesheet" href="${ path }/css/headerfooter.css" />
	<script src="${ path }/js/jquery-3.5.1.js"></script>
 

</head>
<body>
    <jsp:include page="../common/header.jsp" />
    <jsp:include page="../common/nav.jsp" />
    <section class="content">

        <br><br>
        
        <div class="container">
           <br><br>
            <div class="row">
                <div class="col-lg-2"></div>
                <div class="col-lg-8"><img src="${ path }/images/dogs.png" class="img-fluid" alt="..."></div>
                <div class="col-lg-2"></div>
            </div>
            
            <br><br>
        </div>
        <br><br>

        <br><br>
        <div class="row">
            <div class="col-lg-4"></div>
            <div class="col-lg-4"><h2><b>예약 요청 내역 확인</b></h2></div>
            <div class="col-lg-4"></div>
        </div>

        <br><br><br>

        <div class="container" align="right">
           
                <div class="input-group mb-1" style="width: 300px;">
                    <input type="text" class="form-control" name="" id="" placeholder="입력해주세요." aria-label="Recipient's username" aria-describedby="basic-addon2">
                    <input type="button" class="input-group-text" id="" onclick="location.href =''" value="검색"></input>
                </div> 
          
        </div>

        <br>

        <div class="container">
            <table class="table">
                <thead style="text-align: center;">
                  <tr>
                    <th scope="col">No</th>
                    <th scope="col">고객명</th>
                    <th scope="col">출발지</th>
                    <th scope="col">목적지</th>
                    <th scope="col">날짜</th>
                    <th scope="col">출발시간</th>
                    <th scope="col">도착시간</th>
                    <th scope="col">드라이버</th>
                    <th scope="col">비고</th>
                  </tr>
                </thead>
                <tbody>
                   
                    <tr>
                        <td colspan="7">
                            조회된 게시글이 없습니다.
                        </td>
                    </tr>			
                                    
                    <tr>
                        <td style="text-align: center;"></td>
                        <td style="text-align: center;">
                            <a href="">
                            
                            </a>
                        </td style="text-align: center;">
                        <td style="text-align: center;"></td>
                        <td style="text-align: center;">@mdo</td>
                        <td style="text-align: center;"></td>
                        <td style="text-align: center;">@mdo</td>
                        <td style="text-align: center;"></td>
                        <td style="text-align: center;"></td>
                        <td style="text-align: center;"></td>
                    </tr>   
                    <tr>
                        <td style="text-align: center;">2</td>
                        <td style="text-align: center;">김김김</td>
                        <td style="text-align: center;">강남역 KH학원</td>
                        <td style="text-align: center;">잠실역 KH샵</td>
                        <td style="text-align: center;">2021-02-21</td>
                        <td style="text-align: center;">14:51</td>
                        <td style="text-align: center;">19:31</td>
                        <td style="text-align: center;">오태식</td>
                        <td style="text-align: center;">예약</td>
                    </tr>              
                                    
                </tbody>
            </table>
        </div>

        <br>

        <div aria-label="Page navigation example" class="d-flex justify-content-center">
            <ul class="pagination">
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#">1</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#">2</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#">3</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </div>

    </section>
      <br><br><br>
	  <jsp:include page="../common/footer.jsp" />

  


</body>
</html>