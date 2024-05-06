package com.tera.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tera.member.model.service.MemberService;
import com.tera.member.model.vo.Member;


@WebServlet(name = "memberConfirm", urlPatterns = { "/member/confirm" })
public class MemberConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberConfirmServlet() {
    	
    }
    
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	request.getRequestDispatcher("/views/common/signup_1.jsp").forward(request, response);
	}
    
//    @Override
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//    	request.getRequestDispatcher("/views/common/signup_2.jsp").forward(request, response);
//	}

}
