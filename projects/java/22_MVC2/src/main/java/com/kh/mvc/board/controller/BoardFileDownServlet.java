package com.kh.mvc.board.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "boardFileDown", urlPatterns ={"/board/fileDown"})
public class BoardFileDownServlet extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    public BoardFileDownServlet(){}

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String oname = request.getParameter("oname");
        String rname = request.getParameter("rname");
        
        System.out.println(oname);
        System.out.println(rname);
        
        // 1. 클라이언트로 전송할 파일의 경로와 파일명
        String filePath = getServletContext().getRealPath("/resources/upload/board/" + rname);
        
        System.out.println(filePath);
        
        // 2. 물리적인 경로에 저장되어 있는 파일을 메모리로 가져온다.
        File downFile = new File(filePath);
        
        // 3. 메모리로 가져온 파일에 입력 스트림을 생성
        BufferedInputStream bis = new BufferedInputStream(new FileInputStream(downFile));
        
        // 4. 클라이언트로 내보낼 출력 스트림 생성
        BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());

        // 5. 브라우저별 파일명 인코딩 처리
        String downName = null;
        downName = new String(oname.getBytes(), "ISO-8859-1");
        
        
        // 6. 응답 메시지 작성 
        
        // 모든 종류의 2진 데이터를 뜻한다.
        response.setContentType("application/octet-stream");
        //파일 링크를 클릭했을때 다운로드 되도록 처리하는 코드
        response.setHeader("Content-Disposition","attatchment;filename="+ downName);
        
        // 7. 파일을 클라이언트로 출력
        int read = -1;
        
        while((read = bis.read()) != -1) {
            bos.write(read);
        }
        
        bis.close();
        bos.close();
    }
}