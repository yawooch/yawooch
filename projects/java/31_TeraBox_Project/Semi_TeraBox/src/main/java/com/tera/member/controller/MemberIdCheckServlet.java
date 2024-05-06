package com.tera.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.tera.member.model.service.MemberService;

/**
 * Servlet implementation class MemberIdCheckServlet
 */
@WebServlet(name = "memberIdCheck", urlPatterns = { "/member/idcheck" })
public class MemberIdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberIdCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    @Override
   	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       	// ID 값을 가져와서 DB에 있는 값인지 확인하고 결과(JSON)를 응답한다.
       	String userId = request.getParameter("userId");
       	Map<String, Boolean> map = new HashMap<>();
       	
       	System.out.println(userId);
       	
       	map.put("duplicate", new MemberService().isDuplicateId(userId));
       	
       	response.setContentType("application/json;charset=UTF-8");
       	
       	new Gson().toJson(map, response.getWriter());
   	}
       
}
