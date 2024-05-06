<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h3 style="font-size:30px;">1) Session 영역과 Application 영역의 비교</h3>
    현재 Session 영역에 저장된 데이터 : <span style="font-weight:700;font-size:30px;">
    <%= session.getAttribute("address") %></span><br>
    현재 Application 영역에 저장된 데이터 : <span style="font-weight:700;font-size:30px;">
    <%= application.getAttribute("name") %></span><br>
    
</body>
</html>