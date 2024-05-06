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
    <div>
    <h2 ><font color="red">에러가 발생했습니다. 관리자에게 문의해 주세요</font></h2>
    <img src="<%= request.getContextPath()  %>/views/common/error_txt1.png" alt=""><br>
    <button onClick="history.go(-1);">이전 페이지로</button>
    </div>
    <br>
    
    
<%--     <%= exception %> --%>
<%--     <%= exception.getMessage() %> --%>
<%--     <%= exception.getClass().getName() %> --%>
</body>
</html>