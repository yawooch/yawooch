package com.tera.question.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tera.common.util.PageInfo;
import com.tera.question.model.service.LostService;
import com.tera.question.model.vo.Question;


/**
 * 분실물 문의 페이지로  가는 페이지를 호출하는 Servlet
 */

@WebServlet(name = "questionLost", urlPatterns = { "/question/lost" })
public class QuestionLost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QuestionLost() {
    }
    
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	// 분실물 문의 게시글 불러오는 기능
    	PageInfo pageInfo = null;
    	int page = 0;
    	int listCount = 0;
    	List<Question> list = null;
    	
    	try {
    		page = Integer.parseInt(request.getParameter("page"));
		} catch (NumberFormatException e) {
			page = 1;
		}
    	
    	listCount = new LostService().getLostCount();
    	pageInfo = new PageInfo(page, 5, listCount, 5);
    	list = new LostService().getLostList(pageInfo);
    	
    	request.setAttribute("pageInfo", pageInfo);
    	request.setAttribute("list", list);
    	
    	
		request.getRequestDispatcher("/views/question/lostItem.jsp").forward(request, response);
	}

}
