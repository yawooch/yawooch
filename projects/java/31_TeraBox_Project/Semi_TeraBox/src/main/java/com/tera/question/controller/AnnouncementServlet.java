package com.tera.question.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tera.common.util.PageInfo;
import com.tera.question.model.service.AnnouncementService;
import com.tera.question.model.vo.Notice;

@WebServlet(name = "announcement", urlPatterns = { "/question/announcement" })
public class AnnouncementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AnnouncementServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	PageInfo pageInfo = null;
    	int page = 0;
    	int listCount = 0;
    	List<Notice> list = null;
    	
    	try {
			
    		page = Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			page = 1;
		
		}
    	
    	listCount = new AnnouncementService().getListCount();
    	
    	pageInfo = new PageInfo(page, 10, listCount, 10);
    	
    	list = new AnnouncementService().findAll(pageInfo);
    	
    	request.setAttribute("list", list);
    	request.setAttribute("pageInfo", pageInfo);
    	
    	request.getRequestDispatcher("/views/question/announcement.jsp").forward(request, response);
    	
    	
    	
    	
	}

    
    
    
    
    
    
    
}
