package com.tera.ticket.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 예매 화면으로 가는 페이지를 호출하는 Servlet
 */
@WebServlet(name = "ticketReserve", urlPatterns = { "/ticket/seat/isused" })
public class TicketSelectSeatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TicketSelectSeatServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/ticket/tk.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String seatNo = request.getParameter("seatNo");
		
//		int result = new TicketService().save(seatNo); 
		
		
	
		request.getRequestDispatcher("/views/ticket/bookingSeat2.jsp").forward(request, response);
		
	}
	
}
