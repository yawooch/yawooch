package com.tera.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tera.member.model.service.MemberService;
import com.tera.member.model.vo.Member;


@WebServlet(name = "memberAgree", urlPatterns = { "/member/agree" })
public class MemberAgreeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public MemberAgreeServlet() {
    	
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
    	Member member = new Member();
    	
    	member.setMemberName(request.getParameter("cm_name"));
    	member.setMemSsn(request.getParameter("cm_security1")+"-" +request.getParameter("cm_security2"));
    	member.setMemPhone(request.getParameter("cm_phone"));
//    	System.out.println(request.getParameter("cm_phone"));
//    	System.out.println(request.getParameter("cm_security1"));
//    	System.out.println(request.getParameter("cm_security2"));
    	
    	HttpSession session = request.getSession();
    	session.setAttribute("member", member); //왼쪽멤버는 문자열멤버, 오른쪽은 member객체
    	
    	System.out.println(member);
    	
    	
		request.getRequestDispatcher("/views/common/signup_2.jsp").forward(request, response);
		
	}

}
