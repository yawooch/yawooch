package com.tera.movie.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 무비포스트로 넘어가는 Servlet
 */
@WebServlet(name = "moviePostList", urlPatterns = { "/movie/post" })
public class MoviePostListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MoviePostListServlet() {}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/movie/moviePost.jsp").forward(request, response);
    }
}
