package com.tera.member.controller;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;

import com.tera.member.model.vo.Member;


@WebServlet(name = "memberInput", urlPatterns = { "/member/input" })
public class MemberInputServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public MemberInputServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	Member member = new Member();
    	String birth1 = null;
//    	String birth = request.getParameter("memSsn"); //변수에 담아줌 2000627142514//
    	
    	 try {
              SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
              SimpleDateFormat sdf2 = new SimpleDateFormat("yyMMdd");
              
              String birth = request.getParameter("memSsn");
              birth1 = sdf.format(sdf2.parse(birth));
              
         } catch (ParseException e) {
            e.printStackTrace();
         }
    	
    	member.setBirth(birth1);
    	
//    	System.out.println("allowPromotions1 : " + request.getParameter("allowPromotions"));
    	String allowPromotions = request.getParameter("allowPromotions")== null? "N":request.getParameter("allowPromotions");
//    	System.out.println("allowPromotions2 : " + allowPromotions);
    	member.setMemberName(request.getParameter("memberName"));
    	member.setMemSsn(request.getParameter("memSsn"));
    	member.setMemPhone(request.getParameter("memPhone"));
    	member.setMktAgreeYn(request.getParameter("allowPromotions"));
    	
    	request.setAttribute("member", member);
    	
    	request.getRequestDispatcher("/views/common/signup_3.jsp").forward(request, response);
		
	}

}
