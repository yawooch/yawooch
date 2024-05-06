<%@ page import="com.kh.el.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/common.css">
</head>
<body>
    <h2>Expression Language</h2>
    <h3>1. 기존 방식으로 request, session 객체에 담겨있는 데이터를 출력</h3>
    
    <% 
    Student student = (Student) request.getAttribute("student");
    %>
    <h6>강의장 : <%= request.getAttribute("classRoom").toString() %></h6>
    <h6>수강생 : <%= student.getName() %></h6>
    <h6>나이   : <%= student.getAge()  %> </h6>
    <h3>2. EL 방식으로 request, session 객체에 담겨있는 데이터를 출력</h3>
    <!-- 
        1. EL은 영역 객체에 저장된 속성명을 검색해서 존재하는 경우 값을 가져온다.
            - Page영역 -> Request 영역 -> Session 영역 -> Application 영역
        2. EL은 객체의 필드에 직접 접근하는것처럼 보이지만 
            내부적으로는 해당 객체의 Getter 메소드로 접근해서 값을 읽어온다.
    -->
    <h6>강의장 : ${classRoom}   </h6>
    <h6>수강생 : ${student.name}</h6>
    <h6>나이   : ${student.age} </h6>
    <br>
    <h6>강의장 : ${sessionScope.classRoom}   </h6>
    <h6>수강생 : ${sessionScope.student.name}</h6>
    <h6>나이   : ${sessionScope.student.age} </h6>
    <br>
    <h6>강의장 : ${applicationScope.classRoom}   </h6>
    <h6>수강생 : ${applicationScope.student.name}</h6>
    <h6>나이   : ${applicationScope.student.age} </h6>
    
    <h3>3. EL 사용시 영역 객체에 저장된 속성명이 같은 경우</h3>
    <%
        // Page 영역에 데이터를 저장
        pageContext.setAttribute("scope", "Page영역");
    %>
    <h6>scope : ${ scope }</h6>
    <h6>pageScope : ${ pageScope.scope }</h6>
    <h6>requestScope : ${ requestScope.scope }</h6>
    <h6>sessionScope : ${ sessionScope.scope }</h6>
    <h6>applicationScope : ${ applicationScope.scope }</h6>
    
    <h3>4. ContextPath 가져오기</h3>
    <h4>1) 표현식 태그를 사용하는 방법</h4>
    <h6>contextPath : <%= request.getContextPath() %></h6><br>
    <h4>2) EL을 사용하는 방법</h4>
    <h6>contextPath : ${pageContext.request.contextPath}</h6><br>
    
    <h3>5. 헤더에 접근하기</h3>
    <h4>1) 표현식 태그를 사용하는 방법</h4>
    <h6>Host : </h6><%= request.getHeader("Host") %>
    <h6>User-Agent : </h6><%= request.getHeader("User-Agent") %><br>
    <h4>2) EL을 사용하는 방법</h4>
    <h6>Host : </h6>${ header.host}
    <h6>User-Agent : </h6>${ header['User-Agent'] }<br>

</body>
</html>