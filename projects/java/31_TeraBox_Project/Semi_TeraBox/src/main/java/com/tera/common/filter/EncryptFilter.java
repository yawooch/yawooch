package com.tera.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import com.tera.common.wrapper.EncryptPasswordWrapper;

//@WebFilter(filterName = "encryptFilter", servletNames = {"memberEnroll", "MemberLogin"})
public class EncryptFilter implements Filter
{
    public EncryptFilter(){}
    
    public void init(FilterConfig fConfig) throws ServletException
    {
        
    }
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException
    {
        //기본적으로 사용자가 보낸 요청 ,응답 객체를 임의로
        // 수정할수 없지만 요청, 응답 객체를 감싸는 래퍼 클래스를 만들면 수정할수 있다.
        EncryptPasswordWrapper wrapper = new EncryptPasswordWrapper((HttpServletRequest)request);
        
        System.out.println("암호화필터 실행");
        
        //request 대신에 생성한 wrapper 넘겨준다
        chain.doFilter(wrapper, response);
    }
    public void destroy()
    {
        
    }

}