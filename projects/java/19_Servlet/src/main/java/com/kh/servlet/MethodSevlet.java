package com.kh.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/method.do")
public class MethodSevlet extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    public MethodSevlet()
    {
        
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        System.out.println(request.getCharacterEncoding());
        // 사용자가 보낸 데이터들은 request 객체를 통해서 얻어올 수 있다.
        //get parameter("name 속성의 값")
        // - 해당 name 속성의 값을 가지는 요소의 values 값을 문자열로 얻어온다.
        System.out.println("-------------------------------------클라이언트가 GET 방식으로 요청");
        System.out.println(request.getParameter("userName"));
        System.out.println(request.getParameter("userAge"));
        System.out.println(request.getParameter("userGender"));
//        System.out.println(request.getParameter("userFood"));
        
        //체크박스와 같이 하나의 name 속성에 여러값이 존재하는경우,
//        request.getParameterValues("name" 속성의 값") 메소드를 사용한다.
//        해당 name 속성의 값을 가지는 요소들의 value 값들을 문자열의 배열로 가져온다.
        Arrays.stream(request.getParameterValues("food")).forEach(System.out::println);
        System.out.println("-------------------------------------------------------------------");
                                                        
        //응답 화면 출력
        response.setContentType("text/html;charset=UTF-8");
        
        PrintWriter out = response.getWriter();
        
        out.write("<html>");
        out.write("<head>");
        out.write("<title>개인정보 출력</title>");
        out.write("</head>");
        out.write("<body>");
        out.write("<h2>개인정보 출력</h2>");
        out.printf("%s님은 %s세 , %s입니다. ",request.getParameter("userName"),request.getParameter("userAge"),request.getParameter("userGender") );
        out.write("좋아하는 음식은 ");
        Arrays.stream(request.getParameterValues("food")).forEach(food -> out.write(food + ", "));
        out.write("입니다.");
        out.write("</body>");
        out.write("</html>");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        System.out.println("클라이언트가 POST 방식으로 요청");
        //POST 방식의 경우, 클라이언트에서 보내주는 데이터들을 
        //requestBody에 값들을 포함해서 전달되는데 body에 값들이 
        //기본적으로 ISO-8859-1 로 인코딩 되었다고 간주하기 때문에
        // request에서 parameter 값을 가져오기 전에
        // UTF-8로 인코딩 설정을 해야한다.
        System.out.println(request.getCharacterEncoding());
        request.setCharacterEncoding("UTF-8");
        doGet(request, response);
    }

}
