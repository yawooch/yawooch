<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/views/common/header.jsp" />

<jsp:include page="/index_video.jsp" />

<jsp:include page="/index_movie.jsp" />

<jsp:include page="/index_notice.jsp" />

<jsp:include page="/views/common/footer.jsp" />