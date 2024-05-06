package com.tera.movie.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tera.movie.model.service.MovieService;
import com.tera.movie.model.vo.Movie;

// 영화 세부페이지로 이동하는 서블릿
@WebServlet(name = "movieDetail", urlPatterns = { "/movie/detail" })
public class MovieDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MovieDetailServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 영화 객체에서 영화의 no를 파라미터로 받아서 사용함
		
		if (request.getParameter("no") != null) {
			int no = Integer.parseInt(request.getParameter("no"));
			System.out.println("영화 번호: " + no);
			
			Movie movie = new MovieService().getMovieByNo(no);
			
			request.setAttribute("movie", movie);
			
			request.getRequestDispatcher("/views/movie/movieDetail.jsp").forward(request, response);
		} else {
			// location을 "/movie" 로 가게 이동
//			request.getRequestDispatcher("/views/movie/movie.jsp").forward(request, response);
			
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
