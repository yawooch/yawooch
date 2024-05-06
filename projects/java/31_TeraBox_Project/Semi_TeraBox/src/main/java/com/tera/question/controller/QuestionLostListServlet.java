package com.tera.question.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


// 병만: 이 서블릿이 왜 있는지 모르겠어요
// write라는 url로 요청하면 작성폼이 나와야하는데 포워딩은 나의 문의 내역으로 넘어가는 걸로 보이네요.
// 
/**
 * 문의하기 이동하는 처리하는  Servlet
 */
@WebServlet(name = "questionWrite", urlPatterns = { "/question/write" })
public class QuestionLostListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public QuestionLostListServlet() {}

	/**
	 * 주소 요청을 받아 해당 JSP 파일에 response해준다
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/mypage/myquestion.jsp").forward(request, response);
	}

	

}
