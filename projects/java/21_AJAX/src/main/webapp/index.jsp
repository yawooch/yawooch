<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"       prefix="c"   %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"        prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"  %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AJAX(Asynchronous JavaScript and XML)</title>
<link rel="stylesheet" href="${path}/common.css">
<script src="${path}/resources/js/jquery-3.7.1.js"></script>
<script src="${path}/resources/js/ajax.js"></script>
<style>
    input{
        border: 17px solid #1BC662;
        width: 100%;
        height: 140px;
        font-size: 100px;
        font-weight: 900;
        box-sizing: border-box;
    }
</style>
</head>
<body>
    <h2>AJAX(Asynchronous JavaScript and XML)</h2>
    <h3>1. JavaScript 를 이용한 AJAX 테스트</h3>
    <h4>1) GET 방식으로 서버에 데이터 전송 및 응답</h4>
    <button id="btn1">GET 방식 전송</button>
    <p id="p1">
        
    </p>
    <h4>2) POST 방식으로 서버에 데이터 전송 및 응답 </h4>
    
    <button id="btn2">POST 방식 전송</button>
    
    <p id="p2"></p>
    
    <h3>2. jQuery 를 이용한 AJAX 테스트</h3>
    <h4>1) GET 방식으로 서버에 데이터 전송 및 응답</h4>
    <label for="input">입력 : </label>
    <input type="text" id="input"/>
    
    <br>
    
    <label for="output1">출력 : </label>
    <input type="text" id="output1" readonly>
    
    <button id="btn3">GET 방식 전송</button>
    
    <h4>2) POST 방식으로 여러개의 서버에 데이터 전송 및 응답 </h4>
    <label for="userName">이름 : </label>
    <input type="text" id="userName"/>
    
    <br>
    <label for="userAge">나이 : </label>
    <input type="number" id="userAge">
    
    <label for="output2">출력 : </label>
    <input type="text" id="output2" readonly>
    
    <button id="btn4">POST 방식 전송</button>
    
    <h4>3) 서버에 데이터 전송 후 , 응답을 객체로 받기 </h4>
    <label for="userNo">회원 번호 : </label>
    <input type="text" id="userNo">
    
    <button id="btn5">조회</button>
    
    <p id="p3"></p>
    
    <h4>4) 서버에 데이터 전송 후, 응답을 리스트로 받기</h4>
    
    <label for="gender1" style="font-size: 100px;">
        <input type="radio" name="gender" id="gender1" value="남자" style="width:140px;" checked>남자
    </label>
    <label for="gender2" style="font-size: 100px;">
        <input type="radio" name="gender" id="gender2" value="여자" style="width:140px;" >여자
    </label>
    <br>
    <button id="btn6">전송</button>
    
    <p id="p4"></p>
</body>
</html>