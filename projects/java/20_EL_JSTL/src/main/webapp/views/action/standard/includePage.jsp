<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% 
    String year = "2024";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>jsp:include</title>
    <style>
        span{
            color:red;
        }
    </style>
    
</head>
<body>
    <h3>include 페이지</h3>
    <span>includePage.jsp의 year 변수의 값은 : <%= year %> 입니다.</span>
</body>
</html>