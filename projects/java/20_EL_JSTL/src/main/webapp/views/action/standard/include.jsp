<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>jsp:include</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common.css">
</head>
<body>
    <h2>jsp:include액션태그</h2>

    <p>
        include 액션태그는 다른 페이지를 포함 시킬때 사용하는 액션 태그이다.
    </p>

    <h3>1. include 지시어</h3>
    <p>
        다른 페이지를 포함하는 JSP 파일이 컴파일 되기 전에 페이지가 포함된다.
    </p>
    <%-- 
    <%@ include file="includePage.jsp" %>

    <!-- includePage.jsp 에서 선언된 변수를 그대로 사용할 수 있다. -->
    <h6>include.jsp의 year 변수의 값은 : <span><%= year %></span> 입니다.</h6>

    <%
        // 변수명이 중복되어 Duplicate local variable 이 발생합니다.
        String year = "";
    %>
    --%>
    <h3>2. include 액션태그</h3>

    <p>
        include 지시자와 다르게 include 액션 태그는 런타임 시에 포함된다
    </p>
    <jsp:include page="includePage.jsp"></jsp:include>
<%--     <h6>include.jsp의 year 변수의 값은 : <span><%= year %></span> 입니다.</h6> --%>
    
    <%
    //includePage.jsp와 변수를공유하지 않아 중복선언해도 에러가 발생하지 않는다.
    String year = "2025";
    %>
    <h6>include.jsp의 year 변수의 값은 : <span><%= year %></span> 입니다.</h6>

    
</body>
</html>