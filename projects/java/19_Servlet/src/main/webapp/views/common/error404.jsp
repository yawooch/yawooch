<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
<%--     pageEncoding="UTF-8" isErrorPage="true" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러 페이지</title>
<style>
    html, body{
        padding:0;
        margin:0;
        width:100%;
        height:100%;
    }
    div{
        text-align:center;
    }
</style>
</head>
<body>
    <div style="margin:auto;">
    <h2 ><font color="red">페이지를 찾을 수 없습니다. 경로를 다시 확인해주세요</font></h2>
    <img src="<%= request.getContextPath()  %>/views/common/404.jpg" style="width:400px; height:400px;"><br>
    <button onClick="history.back();">이전 페이지로</button>
    </div>
    <br>
    
    
<%--     <%= exception %> --%>
<%--     <%= exception.getMessage() %> --%>
<%--     <%= exception.getClass().getName() %> --%>
</body>
</html>