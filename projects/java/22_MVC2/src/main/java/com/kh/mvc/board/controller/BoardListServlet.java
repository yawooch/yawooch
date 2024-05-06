package com.kh.mvc.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.board.model.service.BoardService;
import com.kh.mvc.board.model.vo.Board;
import com.kh.mvc.common.util.PageInfo;

@WebServlet(name = "boardList", urlPatterns = {"/board/list"})
public class BoardListServlet extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    public BoardListServlet(){}

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        PageInfo pageInfo = null;
        int page = 0;
        int listCount = 0;
        List<Board> list = null;
        
        try
        {
            page = Integer.parseInt(request.getParameter("page"));
        }
        catch (NumberFormatException e)
        {
            page = 1;
        }
        listCount = new BoardService().getBoardCount(); 
        
        pageInfo  = new PageInfo(page, 10,  listCount, 10);
        list      = new BoardService().getBoardList(pageInfo);
        
        System.out.println("page : " + page + "\nlistCount : " + listCount);
        System.out.println("list : " + list);
        System.out.println("list.size() : " + list.size());
        
        request.setAttribute("pageInfo", pageInfo);
        request.setAttribute("list", list);
        
        request.getRequestDispatcher("/views/board/list.jsp").forward(request, response);
    }
}