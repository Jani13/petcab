<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath }" />

<nav class="navbar navbar-expand-md navbar-light sticky-top"
	style="background-color: #86f3ff">
	<div class="container">
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse justify-content-md-end"
			id="collapsibleNavbar">
			<ul class="navbar-nav mynav-nav">
				<li class="nav-item">
					<c:choose>
						<c:when test="${loginMember.userType eq 'ROLE_DRIVER'}">
							<a class="nav-link text-center" href="${path}/call/driver/confirm">예약보기</a>
						</c:when>
						<c:otherwise>
							<a class="nav-link text-center" href="${ path }/call/book">예약하기</a>
						</c:otherwise>
					</c:choose>
				</li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle text-center" href="#"
					id="navbarDarkDropdownMenuLink" data-bs-toggle="dropdown"
					aria-expanded="false">제휴업체</a>
					<ul class="dropdown-menu"
						aria-labelledby="navbarDarkDropdownMenuLink">
						<li><a class="dropdown-item text-center"
							href="${path}/partner/partnerMain">제휴업체보기</a></li>
						<li><a class="dropdown-item text-center"
							href="${path}/partner/">제휴업체등록</a></li>
					</ul></li>
				<li class="nav-item"><a class="nav-link text-center"
					href="${path}/driver/">드라이버지원</a></li>
				<li class="nav-item"><a class="nav-link text-center"
					href="${path}/review/list">리뷰공간</a></li>
				<li class="nav-item"><a class="nav-link text-center"
					href="${path}/ques/list">문의하기</a></li>

				<c:if test="${loginMember  == null}">
					<li class="nav-item"><a class="nav-link text-center"
						href="${path}/signup/agreement">회원가입</a></li>
					<li class="nav-item"><a class="nav-link text-center"
						href="${path}/login">로그인</a></li>
				</c:if>

				<c:if test="${loginMember != null}">
					<li class="nav-item"><c:choose>
							<c:when test="${loginMember.userType eq 'ROLE_ADMIN'}">
								<a class="nav-link text-center" href="${path}/admin/adminMain">관리자페이지</a>
							</c:when>
							<c:when test="${loginMember.userType eq 'ROLE_MEMBER'}">
								<a class="nav-link text-center" href="${path}/user/mypage">마이페이지</a>
							</c:when>
							<c:when test="${loginMember.userType eq 'ROLE_DRIVER'}">
								<a class="nav-link text-center" href="${path}/driver/mypage">마이페이지</a>
							</c:when>
							<c:otherwise>
								<a class="nav-link text-center" href="${path}/partner/mypage">마이페이지</a>
							</c:otherwise>
						</c:choose></li>
				</c:if>

			</ul>
		</div>
	</div>
</nav>
