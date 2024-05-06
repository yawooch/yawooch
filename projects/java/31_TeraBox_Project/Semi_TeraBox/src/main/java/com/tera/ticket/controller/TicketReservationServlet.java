package com.tera.ticket.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tera.member.model.vo.Member;
import com.tera.ticket.model.service.TicketService;
import com.tera.ticket.model.vo.Ticket;

/**
 * 예매 후 메인 화면으로 가는 페이지를 호출하는 Servlet
 */
@WebServlet(name = "ticketReservation", urlPatterns = { "/ticket/reserve" })
public class TicketReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TicketReservationServlet() {}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		String[] cordinates = request.getParameterValues("selectCord");
		String[] ticketDvs = request.getParameterValues("ticketDv");
		
		int memberCnt = 0;
		int result = 0;
		
		//좌석수와 예매자구분 수가 동일하지 않으면 오류로 간주
		if(cordinates.length !=  ticketDvs.length) {
			request.setAttribute("msg", "오류가 발생했습니다. 다시시도 바랍니다.");
		}
		else memberCnt = cordinates.length;
		
		//로그인 정보가 비어있으면 에러
		if(loginMember == null) {
			request.setAttribute("msg", "로그인 정보가 Beer 있습니다.다시시도 바랍니다.");
		}
		
		//예매 발권 준비
		for (int i = 0; i < memberCnt; i++) {
			Ticket ticket = new Ticket();
			
			ticket.setMeberId2(loginMember.getMemberId());
			ticket.setScrnNo(request.getParameter("scrnNo"));
			ticket.setTicketDV(ticketDvs[i]);
			ticket.setSeatNo(cordinates[i]);
			
			result = new TicketService().saveTicket(ticket);
		}
		
		if(result > 0) {
			request.setAttribute("msg", "예매 성공");
		}
		else {
			request.setAttribute("msg", "예매실패");
		}
		
		response.sendRedirect(request.getContextPath()+ "/");
	}
}