package com.tera.question.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tera.common.util.PageInfo;
import com.tera.question.model.service.AnnouncementService;
import com.tera.question.model.vo.Notice;

@WebServlet(name = "announcementSeoul", urlPatterns = { "/question/announcementSeoul" })
public class AnnouncementSeoulServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AnnouncementSeoulServlet() {
    }
    
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PageInfo pageInfo = null;
		int page = 0;
		int listCount = 0; 
		List<Notice> list = null;
		
		
		try {
			page = Integer.parseInt(request.getParameter("page"));
			
		} catch (NumberFormatException e) {
			page = 1;
		}
		
		listCount = new AnnouncementService().getSeoulCount();
		
		pageInfo = new PageInfo(page, 5, listCount, 10);
		
		list = new AnnouncementService().findSeoul(pageInfo);
		
		System.out.println(list);
		
		
		request.setAttribute("list", list);
		
		request.setAttribute("pageInfo", pageInfo);
	request.getRequestDispatcher("/views/question/announcementSeuel.jsp").forward(request, response);
	}

}
