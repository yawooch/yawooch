<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<nav id="qt_sidebar-area_by" class="qt-sidebar-areapoint-by">
	<p class="qt-sidebar-each-by">
		<a href="${ path }/question" title="고객센터">고객센터</a>
	</p>
	<ul>
		<li class="qt-first-area-by"><a class="qt-first-text-by"
			href="${ path }/question">고객센터 홈</a></li>
		<li><a href="${path}/question/announcement">공지사항</a></li>
		<li><a class="qt-second-text-by" href="${ path }/question/faq">자주
				묻는 질문</a></li>
		<li><a href="${ path }/question/writeview">1:1 문의</a></li>
		<li><a href="${path}/question/writerentview">단체관람 및 대관문의</a></li>
		<li><a href="${path}//question/lost">분실물 문의</a></li>
	</ul>
	<div class="qt-info-by">
		<p class="qt-sidebar-each-by">
			테라박스 고객센터 <i class="qt-bar-by"></i> <span>Dream center</span>
		</p>
		<p class="qt-time-by">
			<i class="qt-clock-by qt-iconset-by"></i> "10:00~19:00"
		</p>
	</div>
</nav>

<%-- <jsp:include page="/views/question/questionNavi.jsp" /> --%>
<!-- 클래스가 각각 따로 만들어져 있어서 패스 -->