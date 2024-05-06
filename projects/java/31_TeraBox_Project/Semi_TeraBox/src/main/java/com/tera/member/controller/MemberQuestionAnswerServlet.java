package com.tera.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tera.member.model.service.MyQuestionService;
import com.tera.question.model.vo.Question;

@WebServlet(name = "memberQuestionAnswer", urlPatterns = { "/mypage/questionanswer" })
public class MemberQuestionAnswerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberQuestionAnswerServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. 데이터 조회
		int no = Integer.parseInt(request.getParameter("no"));
		
		System.out.println(no);
		
		Question question = new MyQuestionService().getQuestionByNo(no);
		
		System.out.println(question);
		
		// 2. request 영역에 담아 포워딩
		
		request.setAttribute("question", question);
		
		request.getRequestDispatcher("/views/question/myquestionawnser.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
