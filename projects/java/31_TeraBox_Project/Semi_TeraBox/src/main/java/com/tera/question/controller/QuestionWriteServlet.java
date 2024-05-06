package com.tera.question.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 병만: 이 서블릿도 조금 이해가 안가는 부분이 있어요
// lost라는 url로 요청받으면 분실물 목록으로 이동하는 걸로 만들어놔서
// url 패턴이 겹치는 걸로 보이므로
// url 패턴을 lostwrite로 바꿔주시면 좋을 거 같아요


/**
 * 분실물 목록을 화면을 처리하는  Servlet
 */
@WebServlet(name = "questionLost", urlPatterns = { "/question/lost" })
public class QuestionWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public QuestionWriteServlet() {}

	/**
	 * 주소 요청을 받아 해당 JSP 파일에 response해준다
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/question/questionWriteLost.jsp").forward(request, response);
	}
}
