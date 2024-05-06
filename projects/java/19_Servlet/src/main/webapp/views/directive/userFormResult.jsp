<%@page import="java.util.Arrays"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
    String userName   = request.getParameter("userName");
    String userAge    = request.getParameter("userAge");
    String userGender = request.getParameter("userGender");
    String[] userFoods= request.getParameterValues("userFood");
    
    System.out.println(userName);
    System.out.println(userAge);
    System.out.println(userGender);
    Arrays.stream(userFoods).forEach(System.out::println);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>개인정보 출력</title>
</head>
<body>
    <h2>개인정보 출력</h2>
    <%= userName%>님 안녕하세요 <br>
    <%= userName%>님은 <%= userAge%> 세, <%= userGender%> 입니다.<br>
    좋아하는 음식은,
    <ul>
    <%
    for(String food : userFoods){
        out.write("<li>" + food + "</li>\r\n");
    }
    %>
    </ul> 
    입니다.
</body>
</html>