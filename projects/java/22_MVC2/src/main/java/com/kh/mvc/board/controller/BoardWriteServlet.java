package com.kh.mvc.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.mvc.board.model.service.BoardService;
import com.kh.mvc.board.model.vo.Board;
import com.kh.mvc.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet(name = "boardWrite", urlPatterns = { "/board/write" })
public class BoardWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardWriteServlet() {}

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        Member loginMember = (Member)session.getAttribute("loginMember");
        
        if (loginMember != null)
        {
            request.getRequestDispatcher("/views/board/write.jsp").forward(request, response);
        } 
        else
        {
            request.setAttribute("msg", "로그인 후 작성해 주세요");
            request.setAttribute("location", "/");
            request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        //mulipart/form-data 형식의 요청을 처리할때는 cos.jar 파일이 필요하다
        //http://www.servlets.com/cos/
        HttpSession session = request.getSession();
        Member loginMember = (Member)session.getAttribute("loginMember");

        if (loginMember != null)
        {
            //파일이 저장될 경로
            String path =  getServletContext().getRealPath("/resources/upload/board");
            //파일의 최대 사이즈 지정
            int maxSize = 10485760;//(10MB)
            
            //파일 인코딩 설정
            String encoding = "UTF-8";
            
            //DefaultFileRenamePolicy : 중복되는 파일 이름 뒤에 1 ~ 9999 붙인다
            MultipartRequest mr = new MultipartRequest(request, path , maxSize, encoding, new DefaultFileRenamePolicy());
            
            Board board = new Board();

            //게시글 작성자의 no 값
            board.setWriterNo(loginMember.getNo());
            //폼 파라미터로 넘어온 값들 
            board.setTitle (mr.getParameter("title"));
            board.setContent(mr.getParameter("content"));

            //파일에 대한 정보들
            board.setOriginalFilename(mr.getOriginalFileName("upfile"));
            board.setRenamedFilename(mr.getFilesystemName("upfile"));

            int result = new BoardService().save(board);
            
            if (result > 0)
            {
                //게시글 등록 성공
                request.setAttribute("msg", "게시글 등록 성공");
                request.setAttribute("location", "/board/list");
            }
            else
            {
                //게시글 등록 실패
                request.setAttribute("msg", "게시글 등록 실패");
                request.setAttribute("location", "/board/write");
            }
        } 
        else
        {
            request.setAttribute("msg", "로그인 후 작성해 주세요");
            request.setAttribute("location", "/");
        }
        request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    }
}
