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
 * 대관 하기 입력을 처리하는 Servlet
 */
@WebServlet(name = "questionWritrenteview", urlPatterns = { "/question/writerentview" })
public class QuestionWriterent extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public QuestionWriterent() {
	}

	/**
	 * 주소 요청을 받아 해당 JSP 파일에 response해준다
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();

		Member loginMember = (Member) session.getAttribute("loginMember");
		System.out.println(loginMember);

		if (loginMember != null) {
			request.getRequestDispatcher("/views/question/questionWriterent.jsp").forward(request, response);

		} else {
			request.setAttribute("msg", "로그인 후 작성해 주세요.");
			request.setAttribute("location", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}

		
	}

	/**
	 * 입력한 폼을 전달받아 DB에 문의 정보를 입력한다.
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int fo =0;
		Question question = new Question();

		
		question.setCinemaId(request.getParameter("theaters"));
		question.setRentDate(request.getParameter("lentDe"));
		question.setQuestMoive(request.getParameter("admisMovieNm"));
		question.setNum(Integer.parseInt((request.getParameter("admisPcntCnt"))));
		question.setName(request.getParameter("inqurNm"));
		question.setPhone(request.getParameter("hpNum1") + "-"+ request.getParameter("hpNum2")+ "-" + request.getParameter("hpNum3"));
		question.setEmail(request.getParameter("rpstEmail"));
		question.setTitle(request.getParameter("custInqTitle"));
		question.setContent(request.getParameter("custInqCn"));
		question.setPassNo(Integer.parseInt((request.getParameter("nonMbInqPwd"))));
		question.setDivision("단체/대관"); 
		
		System.out.println(question);
		
		fo = new QuestionBoardService().rentsave(question);
	

		response.sendRedirect("/mypage/question");
	}
}
