<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL Function</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common.css">
</head>
<body>
    <img src="${pageContext.request.contextPath}/img/JSTL2.png" style="width:100%;">
    <h1>JSTL Function</h1>
    <c:set var="str" value="java oracle HTML css Servlet JSP"/>
    <h4>원본 : <span>${str}</span></h4>
    <h4>문자열의 길이 : <span>${fn:length(str)}</span></h4>
    <h4>대문자로 변경 : <span>${fn:toUpperCase(str)}</span></h4>
    <h4>소문자로 변경 : <span>${fn:toLowerCase(str)}</span></h4>
    <h4>CSS의 위치 : <span>${fn:indexOf(str, "css")}</span></h4>
    <h4>JSP를 JSTL로 변경 : <span>${fn:replace(str, "JSP", "JSTL")}</span></h4>
    <h4>원본 : <span>${str}</span></h4>
</body>
</html>