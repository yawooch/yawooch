<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"   %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL Formatting Tags</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common.css">
</head>
<body>
    <img src="${pageContext.request.contextPath}/img/JSTL2.png" style="width:100%;">
    <h2>JSTL Formatting Tags</h2>

    <fmt:setLocale value="ar-XA"/>
    <h3>톰캣 서버의 Locale : <span>${pageContext.response.locale}</span></h3>
    <h3>1. fmt:formatNumber 태그</h3>
    <p>
        숫자 데이터의 출력 형식을 지정할때 사용하는 태그이다.
    </p>
    <h5>숫자그대로 출력 : </h5>
    <h3><fmt:formatNumber value="123456789" groupingUsed="false"/></h3>
    <h5>세자리마다 구분하여  출력 : </h5>
    <h1><fmt:formatNumber value="123456789"/></h1>
    <h5>세자리마다 구분하여  출력 : </h5>
    <h2><fmt:formatNumber value="123456789" groupingUsed="true"/></h2>
    <br>
    <h4>숫자 :   <span><fmt:formatNumber value="50000.6"/></span>                </h4>
    <h4>숫자 :   <span><fmt:formatNumber type="number" value="50000.6"/></span>  </h4>
    <h4>통화 :   <span><fmt:formatNumber type="currency" value="50000.6"/></span></h4>
    <h4>통화 :   <span><fmt:formatNumber type="currency" currencySymbol="$" value="50000.6"/></span></h4>
    <h4>백분율 : <span><fmt:formatNumber type="percent" currencySymbol="%" value="0.456"/></span></h4>
    <h4>0을 이용해서 pattern 지정 : <span><fmt:formatNumber value="0.45" pattern="0.000"/></span></h4>
    <h4>0을 이용해서 pattern 지정 : <span><fmt:formatNumber value="0.0456" pattern="0.000"/></span></h4>
    <h4>#을 이용해서 pattern 지정 : <span><fmt:formatNumber value="0.045" pattern="#.###"/></span></h4>
    <h4>#을 이용해서 pattern 지정 : <span><fmt:formatNumber value="0.0456" pattern="#.###"/></span></h4>

    <h3>2. fmt:formatDate 태그</h3>
    <p>
        날짜와 시간의 데이터 포맷을 지정할 때 사용하는 태그이다
    </p>
    <c:set var="date" value="<%= new Date() %>"/>
    <h4>${date}</h4>
    <h3>                    <span><fmt:formatDate value="${date}"/></span></h3>
    <h3>type="date" :       <span><fmt:formatDate type="date"                                       value="${date}"/></span></h3>
    <h3>type="time" :       <span><fmt:formatDate type="time"                                       value="${date}"/></span></h3>
    <h3>type="both" :       <span><fmt:formatDate type="both"                                       value="${date}"/></span></h3>
    <h3>dateStyle="short" : <span><fmt:formatDate type="both" dateStyle="short"                     value="${date}"/></span></h3>
    <h3>short :             <span><fmt:formatDate type="both" dateStyle="short" timeStyle="short"   value="${date}"/></span></h3>
    <h3>medium :            <span><fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${date}"/></span></h3>
    <h3>long :              <span><fmt:formatDate type="both" dateStyle="long" timeStyle="long"     value="${date}"/></span></h3>
    <h3>full :              <span><fmt:formatDate type="both" dateStyle="full" timeStyle="full"     value="${date}"/></span></h3>
    <h3>pattern :           <span><fmt:formatDate type="both" pattern="yyyy-MM-dd(E) HH:mm:ss(a)"   value="${date}"/></span></h3>
    
    <h3>pattern :           <span><fmt:formatDate type="both" pattern="yyyy-MM-dd(E) HH:mm:ss(a)"   value="${date}"/></span></h3>

</body>
</html>