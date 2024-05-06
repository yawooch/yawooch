package com.tera.movie.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tera.common.util.PageInfo;
import com.tera.movie.model.service.MovieService;
import com.tera.movie.model.vo.Movie;
import com.tera.movie.model.vo.MovieComment;

@WebServlet(name = "movieComment", urlPatterns = { "/movie/comment" })
public class MovieCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MovieCommentServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	PageInfo pageInfo = null;
    	int page = 0;
    	int listCount = 0;
    	List<MovieComment> list = null;
    	
    	// 영화 객체 저장 부분
    	int no = Integer.parseInt(request.getParameter("no"));
//		System.out.println("영화 번호: " + no);
		
		Movie movie = new MovieService().getMovieByNo(no);
		
		request.setAttribute("movie", movie);
    	
		// 관람평 부분
    	try {
    		page = Integer.parseInt(request.getParameter("page"));
			
		} catch (NumberFormatException e) {
			page = 1;
		}
    	
    	listCount = new MovieService().getMovieCommentCount(movie);
    	pageInfo = new PageInfo(page, 5, listCount, 5);
    	list = new MovieService().getMovieCommentList(pageInfo, movie);
    	
    	request.setAttribute("pageInfo", pageInfo);
    	request.setAttribute("list", list);
    	
   
    	request.getRequestDispatcher("/views/movie/movieComment.jsp").forward(request, response);
    }
    
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	MovieComment movieComment = new MovieComment();
    	movieComment.setComment(request.getParameter("comment"));
    	movieComment.setPoint(request.getParameter("ele"));
    	movieComment.setScore(Integer.parseInt(request.getParameter("score")));
    	movieComment.setMovieNo(Integer.parseInt(request.getParameter("movieNo")));
    	
    	int result = new MovieService().save(movieComment);
    	
    	request.getRequestDispatcher("/views/movie/movieComment.jsp").forward(request, response);
//    	response.sendRedirect("/views/movie/movieComment.jsp");
    	
//    	if (result > 0) {
//    		
//    	} else {
//    		
//    	}
    	
    }
}
