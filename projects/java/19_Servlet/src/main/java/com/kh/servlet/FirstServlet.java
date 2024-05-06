package com.kh.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 서블릿을 실행시키는 방법
 * 
 * 1. 서블릿 클래스를 작성한다. - javax.servlet.http.HttpServlet 상속하는 클래스를 생성한다. 2. 서블릿 등록
 * 및 URL 매핑한다. - web.xml 에 작성한 서블릿 등록 및 URL을 매핑한다. - @WebServlet으로 서블릿 등록 및 URL을
 * 매핑한다.
 */
public class FirstServlet extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        // get 방식의 요청에 응답할 로직을 구현한다.
        // (a 태그, URL입력창, FORM 태그)
        System.out.println("사용자로 부터 GET 요청을 받음");
        
        //할글이 깨지는 것을 방지하기 위해 Constent-Type 응답 헤더를 
        response.setContentType("text/html;charset=UTF-8");
        
        // 응답 화면을 만들기 위한 출력
        PrintWriter out = response.getWriter();
        
        out.write("<html>");
        out.write("<body>");
        out.write("<h2>첫번째 서블릿이 반환한 내용</h2>");
        out.write("</body>");
        out.write("</html>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        // POST 방식의 요청에 응답할 로직을 구현한다.()
    }
}