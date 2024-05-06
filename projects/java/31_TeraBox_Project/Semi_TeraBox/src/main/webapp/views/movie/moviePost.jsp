<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="${path}/views/question/img/TeraBox.ico">
    <title>영화 포스트</title>
    <jsp:include page="/views/common/header.jsp" />
    <script src="${path}/views/movie/js/jquery-3.7.1.js"></script>
</head>
<body>
	<div>
	<img alt="무비포스트" src="${path}/views/movie/image/moviePost.png" style="width: 1100px; margin: auto;
    display: block;" >
        
    </div>
</body>
<jsp:include page="/views/common/footer.jsp" />
</html>