package com.tera.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

@WebFilter(filterName = "encodingFilter", urlPatterns = {"/*"})
public class EncodingFilter implements Filter
{
    // 서블릿 필터
    //    request 와 response 가 서블렛에 도달하기 전에 필요한 전/후처리작업을 실행한다.
    public EncodingFilter(){}

    public void init(FilterConfig fConfig) throws ServletException
    {
       System.out.println("인코딩필터가 생성되어 초기화 작업 실행");
    }
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException
    {
        //  서블릿 동작전 식행
        System.out.println("서블릿 동작전 실행");
        
        String requestMethod = ((HttpServletRequest) request).getMethod();

        if (requestMethod.equals("POST")) {
            request.setCharacterEncoding("UTF-8");
            
            System.out.println("UTF-8로 인코딩");
        }
        
        //다음 필터를 호출하거나 서블릿을 호출한다.
        chain.doFilter(request, response);
        // 서블릿 동작후 실행        
        System.out.println("서블릿 동작후 실행");
    }
    public void destroy()
    {
        System.out.println("인코딩 필터가 소멸됨");
    }
}