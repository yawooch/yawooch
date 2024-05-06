package com.tera.ticket.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tera.movie.model.service.MovieService;
import com.tera.movie.model.vo.Movie;
import com.tera.ticket.model.service.TicketService;
import com.tera.ticket.model.vo.TimeTable;

/**
 * 예매 좌석선택 화면으로 이동하는 Servlet
 */
@WebServlet(name = "ticketSeat", urlPatterns = { "/ticket/seat" })
public class TicketSeatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TicketSeatServlet() {}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String scrnNo = request.getParameter("scrnNo");
		
		TimeTable timeTableInfo = new TicketService().getScrnInfoByScrnNo(scrnNo);
		
		Movie movie = new MovieService().getMovieByNo(Integer.parseInt(timeTableInfo.getMovieNo()));
		
		request.setAttribute("timeTable", timeTableInfo);
		request.setAttribute("movie"    , movie);
		
		request.getRequestDispatcher("/views/ticket/bookingSeat2.jsp").forward(request, response);
	}
}