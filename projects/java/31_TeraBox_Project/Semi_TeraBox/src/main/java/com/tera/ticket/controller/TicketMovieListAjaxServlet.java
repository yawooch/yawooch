package com.tera.ticket.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.tera.movie.model.service.MovieService;
import com.tera.movie.model.vo.Movie;

/**
 * 영화목록을 가져오는 Ajax Servlet
 */
@WebServlet(name = "ticketMovieListAjax", urlPatterns = { "/ticket/movielist.ajax" })
public class TicketMovieListAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TicketMovieListAjaxServlet() {}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
    	String selectDate = request.getParameter("selectDate");
    	
        List<Movie> movies = new MovieService().getMovieListByDate(selectDate);
        
        response.setContentType("application/json;charset=UTF-8");
        new Gson().toJson(movies, response.getWriter());
    }
}
