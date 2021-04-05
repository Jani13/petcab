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
    <title>비밀번호 수정</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" 
            rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" 
            crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" 
            crossorigin="anonymous"></script>

    <style>

        /* div{
            border: 1px solid red;
        } */
    </style>

</head>
<body>
    
    <br><br>
    
    <div class="row">
        <div class="col-lg-4"></div>
        <div class="col-lg-4">
            <h4 class="text-center">비밀번호 수정</h4>
            <br>
            
            <div class="form-floating mb-3">
                <input type="password" class="form-control form-control-sm" id="floatingPassword1" placeholder="새 비밀번호">
                <label for="floatingPassword1">변경할 비밀번호</label>
            </div>
            <div class="form-floating">
                <input type="password" class="form-control" id="floatingPassword2" placeholder="비밀번호 확인">
                <label for="floatingPassword2">비밀번호 확인</label>               
            </div>
            <br>
            <div style="text-align: center;">
                <button type="button" class="btn btn-outline-info justify-content-center btn-sm" >확인</button>
            </div>
        </div>
        <div class="col-lg-4"></div>
    </div>

    <br>

</body>
</html>