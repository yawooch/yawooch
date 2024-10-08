<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ path }/resources/css/style.css">
<script src="${ path }/resources/js/jquery-3.7.1.js"></script>
</head>
<body>
    <header>
        <h1>Hello MVC</h1>
        <div class="login-container">
        <c:if test="${empty sessionScope.loginMember}">
            <form id="loginFrm" action="${ path }/login" method="post">
                <table>
                    <tr>
                        <td>
                            <input type="text" name="userId" id="userId" placeholder="아이디" required value="${cookie.saveId.value}">
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>
                            <input type="password" name="userPwd" id="userPwd" placeholder="비밀번호" required>
                        </td>
                        <td>
                            <input type="submit" value="로그인">                       
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <label><input type="checkbox" name="saveId"
                            ${empty cookie.saveId.value ? "" : "checked"}>아이디 저장</label>
                            <input type="button" value="회원가입" onclick="location.href = '${ path }/member/enroll';"> 
                        </td>
                    </tr>
                </table>
            </form>
        </c:if>
        <c:if test="${not empty sessionScope.loginMember}">
        <table>
            <tr>
                <td colspan="2">${loginMember.name}님 안녕하세요.</td>
            </tr>
            <tr>
                <td><button onClick="location.href = '${path}/member/myPage';">내 정보</button></td>
                <td>
                    <button onClick="location.replace('${path}/logout');">로그아웃</button>
                </td>
            </tr>
        </table>
        </c:if>
        </div>
        <nav>
            <ul class="main-nav">
                <li class="home"><a href="${ path }/">Home</a></li>
                <li id="board"><a href="${ path }/board/list">게시판</a></li>
                <li id="admin-member"><a href="${ path }/">회원관리</a></li>
            </ul>
        </nav>
    </header> 