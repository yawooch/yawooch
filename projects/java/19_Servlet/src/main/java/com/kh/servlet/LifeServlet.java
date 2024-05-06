package com.kh.servlet;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/life.do")
public class LifeServlet extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    public LifeServlet()
    {
        System.out.println("LifeServlet 생성");
    }

    @Override
    public void init(ServletConfig config) throws ServletException
    {
        System.out.println("config : " + config);
        System.out.println("init() 메소드 호출");
    }

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        System.out.println("service() 메소드 호출");
        //요청 방식에 따라 doGet(), doPost() 메소드 호출
        super.service(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        System.out.println("doGet() 메소드 호출!!");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        System.out.println("doPost() 메소드 호출");
    }

    @Override
    public void destroy()
    {
        System.out.println("destroy() 메소드 호출");
    }

}
