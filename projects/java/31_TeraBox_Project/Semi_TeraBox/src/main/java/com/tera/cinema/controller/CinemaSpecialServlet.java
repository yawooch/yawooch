package com.tera.cinema.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 극장 특별관 화면으로 넘어가는 Servlet
 */
@WebServlet(name = "cinemaSpecial", urlPatterns = { "/cinema/special" })
public class CinemaSpecialServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CinemaSpecialServlet() {}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/cinema/special.jsp").forward(request, response);
    }
}
