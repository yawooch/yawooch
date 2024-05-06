
<%@page import="java.util.Arrays"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <title>JSP 내장객체</title>
    <style>
        td{
            word-break: break-word;
        }
    </style>
</head>
<body>
    <h2 class="display-3">JSP 내장객체</h2>

    <h3 class="display-4">1. request</h3>
    <h4 class="display-5">1) 헤더와 관련된 메소드</h4>

    <div>
        <%--
        String userAgent=request.getHeader("User-Agent");
        System.out.println(userAgent);
        --%>
        <table class="table table-bordered table-hover table-dark" style="width:80%;margin:auto;">
            <tr>
                <th class="bg-success">번호</th>
                <th class="bg-success">헤더이름</th>
                <th class="bg-success">헤더값</th>
            </tr>
            <%
            //요청 헤더의 name 속성들을 읽어온다.
                Enumeration<String> names = request.getHeaderNames();
            int no = 1;
            while(names.hasMoreElements()){
                
                String name = names.nextElement();
                out.write("<tr><td>"+ (no++) +"</td><td>"+ name +"</td><td>"+ request.getHeader(name) +"</td></tr>");
            }
            
            %>
        </table>

    </div>
    <h4 class="display-5">2) URL /URI, 요청 방식과 관련된 메소드</h4>
    <div>
    <table class="table table-bordered table-hover" style="width:80%;margin:auto;">
        <tr>
            <th class="bg-light">구분</th>
            <th class="bg-light">값</th>
        </tr>
        <tr>
            <th>프로토콜</th>
            <td><%= request.getProtocol()  %></td>
        </tr>
        <tr>
            <th>URL</th>
            <td><%= request.getRequestURL()  %></td>
        </tr>
        <tr>
            <th>URI</th>
            <td><%= request.getRequestURI()  %></td>
        </tr>
        <tr>
            <th>요청방식</th>
            <td><%= request.getMethod()  %></td>
        </tr>
        <tr>
            <th>요청쿼리</th>
            <td><%= request.getQueryString()  %></td>
        </tr>
        <tr>
            <th>웹 애플리케이션 경로</th>
            <td><%= request.getContextPath()  %></td>
        </tr>
    </table>
    </div>
    
    <h3 class="display-4">2. response</h3>
    <h4 class="display-5">1) Redirect</h4>
    <a  class="display-1" href="redirect.jsp" style="font-weight:900;">Redirect 테스트</a>
    
    <h3 class="display-4">3. pageContext</h3>
    <h4 class="display-5">1) Forward</h4>
    <a class="display-1" href="forward.jsp" style="font-weight:900;">Forward 테스트</a>
    
    <h3 class="display-4">4. Session</h3>
    <p>
        웹 브라우저의 정보를 유지하기 위한 세션 정보를 저장하고 있는 객체이다.
    </p>
    
    <% 
        session.setAttribute("userId", "woochan");
        // 클라dl언트의 요청이 없더라도
        // 세션을 유지할 시간을 초 단위로 지정한다.
        session.setMaxInactiveInterval(10);
        
    %>
    세션 테스트 <br>
    세션 Id : <%= session.getId() %><br>
    isNew() : <%= session.isNew() %><br>
    <% 
        String createTime  = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date(session.getCreationTime()));
        String lastAccTime = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date(session.getLastAccessedTime()));
    %>
    생성시간 : <%= createTime %><br>
    최종접속시간 : <%= lastAccTime %><br>

<%
// 서버에서 쿠키 생성 후 클라이언트로 전송하는 방법
Cookie cookie = new Cookie("userId", "Yang");
Cookie cookie2 = new Cookie("userAge", "23");
response.addCookie(cookie);
response.addCookie(cookie2);

// 클라이언트에서 전송한 쿠키를 얻어오는 방법
Cookie[] cookies = request.getCookies();
Arrays.stream(cookies).forEach(cookiee -> {
    System.out.println(cookiee.getName()+ " :  " + cookiee.getValue());
    
});
%>   
    
    <table class="table table-bordered" style="width:80%;margin:auto;">
        <tr><th>No.</th><th>SessionAttribute</th></tr>
        <% 
            Enumeration<String> sessionNames = session.getAttributeNames();
        
            while (sessionNames.hasMoreElements()) {
                String name = sessionNames.nextElement();
                
                System.out.println(name);
                out.write("<tr><td>" + name + "</td><td>" + session.getAttribute(name) + "</td></tr>");
                
            }
        
        int i = 1;
//         Arrays.stream(sessionNames);
        
        
        
//         for(Iterable nameIter : sessionNames.asIterator()){
//             out.write("<tr><td>" + (i++) + "</td><td>" + name + "</td></tr>");
//         }
        %>
    </table>
    
    <h3 class="display-4">5. application</h3>
    <p>
        웹 애플리케이션 (컨텍스트)의 실행 환경을 제공하는 
        서버의 정보와 서버측 자원에 대한 정보를 저장하고 있는 객체이다.
    </p>
    <div>
        <table class="table table-bordered table-hover" style="width:80%;margin:auto;">
            <tr>
                <td>컨테이너 정보</td>
                <td><%= application.getServerInfo()  %></td>
            </tr>
            <tr>
                <td>웹모듈 버전</td>
                    <% 
                    int majorVer = application.getMajorVersion();
                    int minorVer = application.getMinorVersion();
                    %>
                <td>
                    <%= majorVer  %>.<%= minorVer %>
                </td>
            </tr>
            <tr>
                <td colspan="2">웹 애플리케이션의 실제 파일시스템 경로</td>
            </tr>
            <tr>
                <td>application.getRealPath("/")</td>
                <td>
                    <%= application.getRealPath("/")  %>
                </td>
            </tr>
            <tr>
                <td>application.getRealPath("/views/objects/index.jsp")</td>
                <td>
                    <%= application.getRealPath("/views/objects/index.jsp")  %>
                </td>
            </tr>

        </table>
    </div>

</body>
</html>