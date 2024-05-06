package com.tera.question.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tera.question.model.service.FaqService;
import com.tera.question.model.service.QuestionHomeService;
import com.tera.question.model.vo.Faq;
import com.tera.question.model.vo.Notice;

/**
 * 고객센터 홈으로 가는 페이지를 호출하는 Servlet
 */
@WebServlet(name = "questionHome", urlPatterns = { "/question" })
public class QuestionHomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QuestionHomeServlet() {}
    
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Faq> list = null;
		List<Notice> list2 = null;
		
		list = new FaqService().findHome();
		
		list2 = new QuestionHomeService().findHome();
    	
		
    	request.setAttribute("list", list);

    	request.setAttribute("list2", list2);
    	
    	System.out.println(list2);
    	
    	request.getRequestDispatcher("/views/question/question.jsp").forward(request, response);
		
	}
}
