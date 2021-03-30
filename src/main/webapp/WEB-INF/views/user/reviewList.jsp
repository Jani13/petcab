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
    <title>리뷰광장</title>

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
        /* div{
            border: 1px solid red;
        } */

        .container {
            width: 1200px;
        }
    </style>

    <link rel="stylesheet" href="${ path }/css/headerfooter.css" />
    <script src="${ path }/js/jquery-3.5.1.js"></script>

</head>
<body>
    <jsp:include page="../common/header.jsp" />
    <jsp:include page="../common/nav.jsp" />
    <section class="content">
        
        <div class="container ">

            <br><br><br>
            <div class="row">
                <div class="col-lg-2"></div>
                <div class="col-lg-8"><img src="${ path }/images/dogs.png" class="img-fluid" alt="..."></div>
                <div class="col-lg-2"></div>
            </div>
            
            <br><br><br><br>

            <div class="row">
                <div class="col-lg-5"></div>
                <div class="col-lg-2"><h2><b>리뷰 광장</b></h2></div>
                <div class="col-lg-5"></div>
            </div>

            <br><br><br>

            <div class="input" align="right">
                
                    <input type="search" name="serchText" size="40px" placeholder="검색할 내용을 입력하세요.">
                    <button type="button" id="btn-add"
                    onclick="location.href =''">글쓰기</button>
              
            </div>

            <br>

            <div class="card" style="width: 75%; align-items: center; margin-left: 150px;">
                <div class="card-body">
                    자유롭게 작성 해주세요. <span style="color: red;">(* 욕설 & 비방 악성 글은 관리자에 의해 삭제될 수 있습니다. )</span>
                </div>
            </div>
       
            <table class="table">
                <thead style="text-align: center;">
                  <tr>
                    <th scope="col">No</th>
                    <th scope="col">제목</th>
                    <th scope="col">글쓴이</th>
                    <th scope="col">평점</th>
                    <th scope="col">날짜</th>
                    <th scope="col">긴급콜</th>
                    <th scope="col">조회</th>
                  </tr>
                </thead>
                <tbody>
                  
                    <tr>
                        <td colspan="7">
                            조회된 게시글이 없습니다.
                        </td>
                    </tr>			
                                      
                    <tr>
                        <td></td>
                        <td>
                            
                        </td>
                        <td></td>
                        <td>@mdo</td>
                        <td></td>
                        <td>@mdo</td>
                        <td></td>
                    </tr>                  
                                
                </tbody>
            </table>
        

            <br>

            <div class="pagination" style="display: flex; justify-content: center;">
                <!-- 맨 처음으로 -->
                <button onclick="location.href=''">&lt;&lt;</button>
                    
                <!-- 이전 페이지로 -->
                <button onclick="location.href=''">&lt;</button>

                <!--  10개 페이지 목록 -->
              
                        <button disabled></button>
                   
                        <button onclick="location.href=''"></button>
                  
                
                <!-- 다음 페이지로 -->
                <button onclick="location.href=''">&gt;</button>
                
                <!-- 맨 끝으로 -->
                <button onclick="location.href=''">&gt;&gt;</button>

            </div>
            <br><br>
        </div>
    </section>
    <jsp:include page="../common/footer.jsp" />
    
</body>
</html>