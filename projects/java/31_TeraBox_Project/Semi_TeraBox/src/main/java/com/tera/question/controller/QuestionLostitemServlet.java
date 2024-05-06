package com.tera.question.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tera.member.model.service.MyQuestionService;
import com.tera.question.model.vo.Question;

@WebServlet(name = "questionLostitem", urlPatterns = { "/question/lostitem" })
public class QuestionLostitemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QuestionLostitemServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파라미터 조회
		int no = Integer.parseInt(request.getParameter("no"));
		
//		System.out.println(no);
		
		// 데이터 조회
		Question question = new MyQuestionService().getQuestionByNo(no);
		
		System.out.println(question);
		
		// 포워딩
		request.setAttribute("question", question);
		
		request.getRequestDispatcher("/views/question/lostItemreal.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
