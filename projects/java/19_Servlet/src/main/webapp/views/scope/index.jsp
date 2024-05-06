<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>영역 객체</title>
</head>
<body>
    <h2 style="font-size:50px;margin:0;">영역 객체</h2>

    <h3 style="font-size:30px;">1) Session 영역과 Application 영역의 비교</h3>
    
    <% 
    session.setAttribute("address","서울특별시");
    
    application.setAttribute("name", "홍길동");
    %>
    
    <a href="scopeTest1.jsp" style="font-size:50px;margin:0;font-weight:900;">View Details</a><br>
    
    <h3 style="font-size:30px;">2) Page 영역과 Request 영역</h3>
    
    <a href="scopeTest2.jsp" style="font-size:50px;margin:0;font-weight:900;">View Details</a><br>
</body>
</html>