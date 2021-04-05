<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${pageContext.request.contextPath }"/>

<%
Cookie [] cookieArray = request.getCookies();
Cookie cookie = null;
int countNum = 0;
String countStr = "";

if(cookieArray != null) {
	for(int i = 0; i < cookieArray.length; i++) {
		if(cookieArray[i].getName().equals("counter")) {
			cookie = cookieArray[i];
			break;
		}
	}
}

if(cookie != null) {
	countNum = Integer.parseInt(cookie.getValue()) + 1;
	countStr = Integer.toString(countNum);
	cookie.setValue(countStr);
} else {
	cookie = new Cookie("counter", "1");
}

response.addCookie(cookie);
%>
<header class="header-wrap">
<div class="d-flex justify-content-between container">
  <div>
  	<a href="${path}/">
	    <img id="logo" src="${path}/images/logo.png" alt="" />
  	</a>
  </div>
  <c:if test="${loginMember != null}">
	  <div class="p-5">
	    <span class="h5"> Welcome! ${ loginMember.userId } </span>
	    <button type="button" 
	    		class="mx-4 btn btn-outline-info"
	    		onclick="location.replace('${path}/logout')">
	    	logout
	    </button>
	  </div>  
  </c:if>
</div>
</header>
