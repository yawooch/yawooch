package com.kh.ajax.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/jsAjax.do")
public class JavaScriptAjaxServlet extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    public JavaScriptAjaxServlet()
    {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String name = request.getParameter("name");
        String age  = request.getParameter("age");
        
        System.out.println(name);
        System.out.println(age);
        
        
        
        
        
        System.out.println("사용자로 부터 GET 요청을 받음");
                
        //응답 화면 출력
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().printf("<h1>성연님돌아와</h1><h5>%s, %s</h5>", name, age);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        System.out.println("사용자로 부터 POST 요청을 받음");
//        request.setCharacterEncoding("UTF-8");
        doGet(request, response);
    }

}
