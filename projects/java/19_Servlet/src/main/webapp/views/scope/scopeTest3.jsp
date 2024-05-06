<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h3 style="font-size:30px;">2) Page 영역과 Request 영역</h3>

    현재 Page 영역에 저장된 데이터 : <span style="font-size:30px;font-weight:700;">
    <%= pageContext.getAttribute("age") %></span><br>
    현재 Request 영역에 저장된 데이터 : <span style="font-size:30px;font-weight:700;">
    <%= request.getAttribute("gender") %></span><br>
    
</body>
</html>