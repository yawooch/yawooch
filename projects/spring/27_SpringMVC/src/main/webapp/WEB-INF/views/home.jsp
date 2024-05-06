<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
   <title>Home</title>
</head>
<body>
<h1>
   What The Hell! world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<p>
	<a href="${path}/board/list">개시끌 조회</a>
</p>
<c:if test="${empty loginMember}">
	<form action="${path}/login" method="POST">
	<label>아이디 : </label>
	<input type="text" id="userId" name="userId">
	<br>
	<label for="userPwd"> 비밀번호 : </label>
	<input type="password" id="userPwd" name="userPwd">
	<br><br>
	<input type="button" value="회원가입"
		onclick="location.href='${path}/member/enroll'">
	<input type="submit" value="로그인">
	</form>
</c:if>
<c:if test="${not empty loginMember}">
<%-- 	${loginMember.name}님 안녕하세요 --%>
	
	<a href="${path}/member/myPage" > ${loginMember.name}</a>님 안녕하세요
	<button onClick="location.replace('${path}/logout')">로그아웃</button>
</c:if>
</body>
</html>