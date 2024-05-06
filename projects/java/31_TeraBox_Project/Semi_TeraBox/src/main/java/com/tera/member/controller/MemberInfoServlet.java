package com.tera.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 회원정보 수정으로 가는 페이지를 호출하는 Servlet
 */
@WebServlet(name = "memberInfo", urlPatterns = { "/mypage/myinfo" })
public class MemberInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberInfoServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/mypage/myInfo.jsp").forward(request, response);
	}
}
