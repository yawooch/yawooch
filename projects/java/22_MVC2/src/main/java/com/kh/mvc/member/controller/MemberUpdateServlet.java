package com.kh.mvc.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.mvc.member.model.service.MemberService;
import com.kh.mvc.member.model.vo.Member;

@WebServlet(name = "memberUpdate", urlPatterns = {"/member/update"})
public class MemberUpdateServlet extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    public MemberUpdateServlet(){}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        HttpSession session = request.getSession();
        
        Member loginMember = (Member)session.getAttribute("loginMember");
        int result = 0;
        
        if(loginMember != null)
        {
            //회원정보 수정
            Member member = new Member();
            
            member.setNo(      loginMember.getNo());
            member.setId(      request.getParameter("userId"  ));
            member.setPassword(request.getParameter("userPwd" ));
            member.setName(    request.getParameter("userName"));
            member.setPhone(   request.getParameter("phone"   ));
            member.setEmail(   request.getParameter("email"   ));
            member.setAddress( request.getParameter("address" ));
            String hobby = request.getParameterValues("hobby") != null? String.join(",",request.getParameterValues("hobby")) : null;
            member.setHobby(hobby);
            
            //3. 회원 정보 수정
            result = new MemberService().save(member);
            
            if(result> 0 ) 
            {
                //회원 정보 수정 성공
                //세션을 갱신한다.
                session.setAttribute("loginMember", new MemberService().findMemberById(loginMember.getId()));
                request.setAttribute("msg", "회원 정보 수정 완료.");
                request.setAttribute("location", "/");
            }
            else 
            {
                //회원 정보 수정 실패
                request.setAttribute("msg", "회원 정보 수정 실패.");
                request.setAttribute("location", "/");
            }
        }
        else {
            request.setAttribute("msg", "로그인 후 수정해 주세요");
            request.setAttribute("location", "/");
        }
        request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    }
}
