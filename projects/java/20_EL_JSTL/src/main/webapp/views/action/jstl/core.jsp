<%@page import="java.util.List"%>
<%@page import="com.kh.el.Student"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL Core Tags</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common.css">
</head>
<body>
    <h3>JSTL Core Tags</h3>
    
    <h3>1. 변수</h3>
    <h4>1) 변수 선언</h4>

    <%-- <% pageContext.setAttribute("num1", 10); %> --%>
    <c:set var="num1" value="10"/>
    <h6>num1 변수의 값 : <span>${num1} 또는 ${pageScope.num1}</span></h6>
    <c:set var="num2" value="20" scope="request"/>
    <h6>num2 변수의 값 : <span>${num2} 또는 ${requestScope.num2}</span></h6>
    <c:set var="result" value="${num1 + num2}" scope="session"/>
    <h6>result 변수의 값 : <span>${result} 또는 ${sessionScope.result}</span></h6>
    <c:set var="colors" scope="application">
        red, blue, green, yellow, pink
    </c:set>
    <h6>colors 배열의 값 : <span>${colors} 또는 ${applicationScope.colors}</span></h6>
    <br>
    <h4>2) 변수 삭제</h4>
    <c:set var="result" value="9999"/>
    <c:set var="result" value="10000" scope="request"/>
    <h6>삭제 전 : <span>${result}</span></h6>
    <c:remove var="result" scope="page"/>
    <h6>삭제 후 : <span>${result}</span></h6>
    <c:remove var="result"/>
    <h6>삭제 후 : <span>${result}</span></h6>

    <h3>2. 출력</h3>
    <h6>태그를 문자열로 출력 : <span><c:out value="<u>태그로 출력하기</u>" /></span></h6>
    <h6>태그를 문자열로 출력 : <span><c:out value="<u>태그로 출력하기</u>" escapeXml="true"/></span></h6>
    <h6>태그를 해석하여 출력 : <span><c:out value="<u>태그로 출력하기</u>" escapeXml="false"/></span></h6>
    <h6>기본값 출력 : <span><c:out value="${result}" default="값이 없음"/></span></h6>
    <br>
    <h3>3. 조건문</h3>
    <h4>1) c:if 태그</h4>
    <c:set var="song" value="원숭이엉덩이" />
    <h6>${song} = 
    <c:if test="${'원숭이엉덩이' == song}">
        <c:set var="song" value="빨개" />
        <span>${song}</span>
    </c:if>
    </h6>
    <br>
    <c:set var="song" value="빨개" />
    <h4>2) c:choose 태그</h4>
    <h6>${song} = 
    <c:choose>
        <c:when test="${'빨개' == song}">
            <c:set var="song" value="사과" />
            <span>${song}</span>
        </c:when>
        <c:otherwise>
            <c:set var="song" value="맛있어" />
            <span>${song}</span>
        </c:otherwise>
    </c:choose>
    <br>
    <h3>4. 반복문</h3>
    <h4>1) c:forEach 태그</h4>
    <h5>자바의 for 구문처럼 사용하기</h5>
    <c:forEach var="i" begin="1" end="10">
        <span>${i} </span>
    </c:forEach>
    <br>
    <c:forEach var="i" begin="1" end="10" step="2">
        <span>${i} </span>
    </c:forEach>
    <br>
    
    <span> step 속성의 값은 0보다 작거나 같을 수 없다.</span>
    <c:forEach var="i" begin="1" end="6">
        <h${i}>${i} </h${i}>
    </c:forEach>
    <br>
    <span> 반복이 종료되면 반복에 사용했던 변수도 삭제된다.</span>
    ${i}

    <h5>자바의 향상된 for 구문처럼 사용하기</h5>

    <%
        String[] colors2 = {  "pink"  , "yellow"  , "green"  , "blue"  , "red"  }; 
        for(String color : colors2){
    %>
        <h1 style="color:<%= color %>;">우왕ㅋ굳ㅋ</h1>
    <%
        }
    %>

    <c:forEach var="color" items="${colors}">
        <h1 style="color:${color};">우왕ㅋ굳ㅋ</h1>
    </c:forEach>

    <h5>학생목록 조회</h5>
    <%
        List<Student> students = new ArrayList<Student>();
    
        students.add(new Student("홍길동", 30, 70,70));
        students.add(new Student("성춘향", 24, 80,80));
        students.add(new Student("이몽룡", 24, 85,80));
        students.add(new Student("춘향이", 22, 90,90));

        pageContext.setAttribute("students",students);
    %>
    ${students}
    <table>
        <thead><tr><td>이름</td><td>나이</td><td>수학 점수</td><td>영어 점수</td></tr></thead>
        <tbody>
            <tr><td colspan="4" align="center">1번째</td></tr>
            <% for(Student s : students){ %>
            <tr>
                <td><%= s.getName() %></td>
                <td><%= s.getAge() %></td>
                <td><%= s.getMathScore() %></td>
                <td><%= s.getEnglishScore() %></td>
            </tr>
            <% } %>
            
            <tr><td colspan="4" align="center">2번째</td></tr>
            <c:forEach var="student" items="${students}">
            <tr>
                <td>${student.name}</td>
                <td>${student.age}</td>
                <td>${student.mathScore}</td>
                <td>${student.englishScore}</td>
            </tr>
        </c:forEach>
            
        </tbody>
    </table>
    
    <table>
    <thead><tr><th>인덱스</th><th>순번</th><th>First</th><th>Last</th><th>이름</th><th>나이</th><th>수학 점수</th><th>영어 점수</th></tr></thead>
    <tbody>
    <tr><td colspan="8" align="center">첫번째</td></tr>
    <c:forEach var="student" items="${students}" varStatus="status">
        <tr>
            <td>${status.index}</td>
            <td>${status.count}</td>
            <td>${status.first}</td>
            <td>${status.last}</td>
            <td>${student.name}</td>
            <td>${student.age}</td>
            <td>${student.mathScore}</td>
            <td>${student.englishScore}</td>
        </tr>
    </c:forEach>
    <tr><td colspan="8" align="center">2번째</td></tr>
    <c:forEach var="student" items="${students}" varStatus="status">
        <c:if test="${!status.first}">
        <tr>
            <td>${status.index}</td>
            <td>${status.count}</td>
            <td>${status.first}</td>
            <td>${status.last}</td>
            <td>${student.name}</td>
            <td>${student.age}</td>
            <td>${student.mathScore}</td>
            <td>${student.englishScore}</td>
        </tr>
        </c:if>
    </c:forEach>
    </tbody>
    </table>

    <h4>2) c:forTokens</h4>
    <ul>
        <c:forTokens var="color" items="pink red tomato lime aqua" delims=" ">
            <li style="color:${color};"><h1>${color}</h1></li>
        </c:forTokens>
    </ul>

    <h3>5. c:url 태그</h3>
    <c:url var="url" value="/views/el/elParam.jsp">
        <c:param name="pName"  value="아이폰12미니"/>
        <c:param name="pCount" value="12"/>
        <c:param name="option" value="화이트"/>
        <c:param name="option" value="64GB"/>
    </c:url>
    ${url}
    <br>
    <a href="${url}">이동</a>
    
</body>
</html>