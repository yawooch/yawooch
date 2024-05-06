package com.tera.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tera.member.model.service.MemberService;
import com.tera.member.model.vo.Member;

/**
 * 로그인을 할수 있게 도와주는 Servlet
 */
@WebServlet(name = "memberLogin", urlPatterns = { "/login" })
public class MemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberLoginServlet() {}

	/**
	 * 
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * 
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String userId  = request.getParameter("user_id");
        String userPwd = request.getParameter("user_pw");
        String saveId  = request.getParameter("saveId");
        
        System.out.println(userId +" ,  "+ userPwd);
        System.out.println("saveId : "+ saveId);
        
        if(saveId != null) {
            //전달된 아이디를 쿠키에 저장
            // 1. 쿠키생성
            Cookie cookie = new Cookie("saveId",userId);
            cookie.setMaxAge(259200);//3일동안 유지
            //2.response 객체에 쿠키 추가
            response.addCookie(cookie);
        }else {
            Cookie cookie = new Cookie("saveId","");
            cookie.setMaxAge(0);
            response.addCookie(cookie);
        }
        
        Member loginMember = new MemberService().login(userId, userPwd);
        
        System.out.println(loginMember);

        HttpSession session = request.getSession();
        
        session.setAttribute("loginMember", loginMember);
        response.sendRedirect(request.getContextPath() + "/");
        

//        if(loginMember != null) {
//            HttpSession session = request.getSession();
//            
//            session.setAttribute("loginMember", loginMember);
//            response.sendRedirect(request.getContextPath() + "/");
//        }
//        else
//        {   
//            //로그인 실패에 대한 메시지를 띄워주고 홈 화면으로 이동
//            // 1. 공용으로 사용하는 에러 메시지를 출력할 페이지에 전달할 메시지와 
//            // 메시지 추력 후 이동할 페이지를 request 객체에 저장한다.
//            request.setAttribute("msg", "아이디나 비밀번호가 일치하지 않습니다.");
//            request.setAttribute("location", "/");
//            
//            //2. request 객체의 데이터를 유지해서 에러메시지를 전달하기 위해 forward 를 실행한다.
//            request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
//        }
	}
}
