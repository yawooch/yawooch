package com.tera.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 나의 예매내역 으로 가는 페이지를 호출하는 Servlet
 */
@WebServlet(name = "memberMypage", urlPatterns = { "/mypage" })
public class MemberMypageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberMypageServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/mypage/ticketing.jsp").forward(request, response);
	}
}
