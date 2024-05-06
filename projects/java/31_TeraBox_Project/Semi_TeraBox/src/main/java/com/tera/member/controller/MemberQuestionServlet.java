package com.tera.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tera.common.util.PageInfo;
import com.tera.member.model.service.MyQuestionService;
import com.tera.question.model.vo.Question;

/**
 * 나의 문의 내역 화면으로 가는 페이지를 호출하는 Servlet
 */
@WebServlet(name = "memberQuestion", urlPatterns = { "/mypage/question" })
public class MemberQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberQuestionServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PageInfo pageInfo = null;
    	int page = 0;
    	int listCount = 0;
    	List<Question> list = null;
		
    	try {
    		page = Integer.parseInt(request.getParameter("page"));
			
		} catch (NumberFormatException e) {
			page = 1;
		}
    	
    	
    	
    	listCount = new MyQuestionService().getQuestionCount();
    	pageInfo = new PageInfo(page, 5, listCount, 5);
		list = new MyQuestionService().getQuestionList(pageInfo);
		
		System.out.println(list); // 리스트에 객체가 담기지 않는 문제 발생 -> // Dao의 ROWNUM을 RNUM으로 별칭화 시켜서 사용해야 1번이 아닌 순서부터 출력할 수 있음
		
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/views/mypage/myquestion.jsp").forward(request, response);
	}
}
