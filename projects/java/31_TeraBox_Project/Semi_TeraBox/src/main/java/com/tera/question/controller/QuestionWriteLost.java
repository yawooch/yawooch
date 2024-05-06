package com.tera.question.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tera.member.model.vo.Member;
import com.tera.question.model.service.QuestionBoardService;
import com.tera.question.model.vo.Question;

/**
 * 분실물 문의 하기 작성페이지로 이동하는 서블릿
 */
@WebServlet(name = "questionWriteLost", urlPatterns = { "/question/writeLost" })
public class QuestionWriteLost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QuestionWriteLost() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 분실물 문의하기 입력폼을 요청해서 보여준다 
		 * 
		 * 
		 */
		
		HttpSession session = request.getSession();

		Member loginMember = (Member) session.getAttribute("loginMember");
		System.out.println(loginMember);

		if (loginMember != null) {
			request.getRequestDispatcher("/views/question/questionWriteLost.jsp").forward(request, response);

		} else {
			request.setAttribute("msg", "로그인 후 작성해 주세요.");
			request.setAttribute("location", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int no =0;
		Question question = new Question();

//		question.setPassNo Integer.parseInt(((request.getParameter("nonMbInqPwd")));
		
		question.setLostPlace(request.getParameter("theaters"));
		question.setName(request.getParameter("inqurNm"));
		question.setPhone(request.getParameter("hpNum1") + "-"+ request.getParameter("hpNum2")+ "-" + request.getParameter("hpNum3"));
		question.setEmail(request.getParameter("rpstEmail"));
		question.setTitle(request.getParameter("custInqTitle"));
		question.setContent(request.getParameter("custInqCn"));
		question.setPassNo(Integer.parseInt((request.getParameter("lstrtclInqPwd"))));
		question.setDivision("분실물"); 

		
		
		no = new QuestionBoardService().Lostsave(question);
	
		response.sendRedirect("/mypage/question");
	}

}
