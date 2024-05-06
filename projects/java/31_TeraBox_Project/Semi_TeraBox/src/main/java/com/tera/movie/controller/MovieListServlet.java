package com.tera.movie.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tera.movie.model.service.MovieService;
import com.tera.movie.model.vo.Movie;

/**
 * 전체영화 화면으로 넘어가는 Servlet
 */
@WebServlet(name = "movieList", urlPatterns = { "/movie" })
public class MovieListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MovieListServlet() {}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	List<Movie> list = null;
    	
    	list = new MovieService().getMovieList();
    			
    	request.setAttribute("list", list);
    	System.out.println(list.size());
    	
        request.getRequestDispatcher("/views/movie/movie.jsp").forward(request, response);
    }
}
