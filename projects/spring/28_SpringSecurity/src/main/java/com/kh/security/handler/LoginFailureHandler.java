package com.kh.security.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class LoginFailureHandler implements AuthenticationFailureHandler
{

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
            AuthenticationException exception) throws IOException, ServletException
    {
        if (exception instanceof UsernameNotFoundException)
        {
            request.setAttribute("loginFailMsg", "존재하지 않는 사용자입니다.");
        } 
        else if (exception instanceof BadCredentialsException)
        {
            request.setAttribute("loginFailMsg", "아이디 또는 비밀번호가 틀립니다.");
        } 
        else if (exception instanceof LockedException)
        {
            request.setAttribute("loginFailMsg", "잠긴 계정입니다.");
        } 
        else if (exception instanceof DisabledException)
        {
            request.setAttribute("loginFailMsg", "삭제된 계정입니다.");
        } 
        else if (exception instanceof AccountExpiredException)
        {
            request.setAttribute("loginFailMsg", "만료된 계정입니다.");
        } 
        else if (exception instanceof CredentialsExpiredException)
        {
            request.setAttribute("loginFailMsg", "비밀번호가 만료된 계정입니다.");
        }

        request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
    }

}
