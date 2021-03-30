<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${pageContext.request.contextPath }"/>
<header class="header-wrap">
<div class="d-flex justify-content-between container">
  <div>
    <img id="logo" src="${path}/images/logo.png" alt="" />
  </div>
  <div class="p-5">
    <span class="h5"> Welcome! XXXXXXX </span>
    <button class="mx-4 btn btn-outline-info">logout</button>
  </div>
</div>
</header>
