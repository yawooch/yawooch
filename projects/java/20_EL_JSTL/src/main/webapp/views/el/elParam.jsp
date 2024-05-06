<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>주문 내역</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common.css">
</head>
<body>
    <h2>주문 내역</h2>
    <p>
        param : 전달된 파라미터 값을 받아올때 사용하는 내장 객체이다.<br>
        paramValues : 전달된 파라미터 값들을 배열로 받아올 때 사용하는 내장 객체이다.
    </p>
    <h6>상품명 : <%= request.getParameter("pName") %></h6>
    <h6>상품명 : ${ param.pName }</h6>
    <h6>수량 : ${ param.pCount }</h6>
    <%--     
        옵션 값은 두개지만 param 내장 객체를 통해서도 접근이 가능하다 
        (단, 첫 번째 옵션 값만 가져올 수 있다.)
    --%>
    <h6>옵션(parma.option) : ${ param.option }</h6>
    <h6>옵션(색상) : ${ paramValues.option[0] }</h6>
    <h6>옵션(용량) : ${ paramValues.option[1] }</h6>
</body>
</html>