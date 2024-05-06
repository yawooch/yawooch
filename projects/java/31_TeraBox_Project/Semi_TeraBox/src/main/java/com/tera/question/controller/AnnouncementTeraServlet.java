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

@WebServlet(name = "announcementTera", urlPatterns = { "/question/announcementTera" })
public class AnnouncementTeraServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AnnouncementTeraServlet() {
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
    	
    	listCount = new AnnouncementService().getTeraCount();
		
    	pageInfo = new PageInfo(page, 10, listCount, 10);
		
		list = new AnnouncementService().findTera(pageInfo);
		
		System.out.println(list);
		System.out.println(listCount);

		
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("list", list);
		
		
		request.getRequestDispatcher("/views/question/announcementTerr.jsp").forward(request, response);
	}

}
