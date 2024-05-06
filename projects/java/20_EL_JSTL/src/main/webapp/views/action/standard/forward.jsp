<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>jsp:forward</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common.css">
</head>
<body>
    <h3>jsp:forward</h3>
    <p>
        forward 액션 태그는 다른 페이지로 요청을 전달할 때 사용하는 액션 태그이다.
    </p>
    <%
        request.setAttribute("userName", "홍길동");
        request.setAttribute("userAge" , 24);
    %>
    <jsp:forward page="forwardPage.jsp"></jsp:forward>
</body>
</html>