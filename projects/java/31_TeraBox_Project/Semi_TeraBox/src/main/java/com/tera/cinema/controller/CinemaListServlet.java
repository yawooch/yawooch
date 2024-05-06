package com.tera.cinema.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 전체극장 화면으로 넘어가는 Servlet
 */
@WebServlet(name = "cinemaList", urlPatterns = { "/cinema" })
public class CinemaListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CinemaListServlet() {}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/cinema/theater.jsp").forward(request, response);
    }
}
