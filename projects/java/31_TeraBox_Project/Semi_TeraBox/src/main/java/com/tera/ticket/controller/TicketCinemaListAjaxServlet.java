package com.tera.ticket.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.tera.cinema.model.service.CinemaService;
import com.tera.cinema.model.vo.Cinema;

/**
 * 영화관 목록을 가져오는 Ajax Servlet
 */
@WebServlet(name = "ticketCinameListAjax", urlPatterns = { "/ticket/cinema.ajax" })
public class TicketCinemaListAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TicketCinemaListAjaxServlet() {}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        List<Cinema> cinemas = new CinemaService().getCinemaListAll();
        
        response.setContentType("application/json;charset=UTF-8");
        new Gson().toJson(cinemas, response.getWriter());
    }

}
