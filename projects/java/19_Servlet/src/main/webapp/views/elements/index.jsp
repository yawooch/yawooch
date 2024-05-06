<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
        <title>JSP 요소</title>
    </head>
    <body>
        <h2>JSP 요소</h2>
        <pre>
            &lt;!-- HTML 주석 태그 --&gt;
            &lt;%-- JSP 주석 태그 --%&gt;
            &lt;%-- 
                두주석의 차이점 
                    페이지 소스 보기 혹은 개발자 도구에서 HTML 주석은 확인이 가능하고 HTML 주석은 확인이 불가능하다.
            --%&gt;
    
            &lt;%-- 선언문 태그 --%&gt;
            &lt;%! 
                //필드(멤버 변수) 선언
                private String name = "홍길동";
                //메소드 선언
                public String getName(){
                    return this.name;
                }
            %&gt;
    
            &lt;%-- 스크립트릿 태그 --%&gt;
            &lt;% 
                // 자바 코드를 기술할 수 있다.
                int sum = 0;
    
                for(int i = 0; i &lt;= 10; i++){
                    sum += i ;
                    %&gt;
        </pre>
        <!-- HTML 주석 태그 -->
        <%-- JSP 주석 태그 --%>
        <%-- 
            두주석의 차이점 
                페이지 소스 보기 혹은 개발자 도구에서 HTML 주석은 확인이 가능하고 HTML 주석은 확인이 불가능하다.
        --%>

        <%-- 선언문 태그 --%>
        <%! 
            //필드(멤버 변수) 선언
            private String name = "홍길동";
            //메소드 선언
            public String getName(){
                return this.name;
            }
        %>

        <%-- 스크립트릿 태그 --%>
        <% 
            // 자바 코드를 기술할 수 있다.
            int sum = 0;

            for(int i = 0; i <= 10; i++){
                sum += i ;
                %>
        <h5>안녕하세요.</h5>
                <%
            }
            System.out.println(sum);
        %>
        
        <h5>안녕하세요.<%= sum %></h5>
        
        <%-- 표현식 태그 --%>
        <p>
            1부터 10까지의 합은 <% out.print(sum); %><br>
            1부터 10까지의 합은 <%= sum%>
        </p>
    
    </body>
</html>