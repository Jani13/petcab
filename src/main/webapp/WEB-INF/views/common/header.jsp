<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${pageContext.request.contextPath }"/>

<header class="header-wrap">
<div class="d-flex justify-content-between container">
  <div>
  	<a href="${path}/">
	    <img id="logo" src="${path}/images/logo.png" alt="" />
  	</a>
  </div>
  <c:if test="${loginMember != null}">
	  <div class="p-5">
	    <span class="fs-5"> Welcome! ${ loginMember.userId } </span>
	    <button type="button" 
	    		class="mx-4 btn btn-outline-info"
	    		onclick="location.replace('${path}/logout')">
	    	logout
	    </button>
	  </div>  
  </c:if>
</div>
</header>
