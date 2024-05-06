package com.kh.network.tcp.server;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;

/*
 * 서버용 TCP 소켓 프로그래밍 순서
 * 1. 서버의 포트번호 정함
 * 2. 서버용 소켓 객체 생성
 * 3. 클라이언트 쪽에서 접속 요청이 오길 기다림
 * 4. 접속 요청이 오면 요청 수락 후 해당 클라이언트에 대한 소켓 객체 생성
 * 5. 연결된 클라이언트와 입출력 스트림 생성
 * 6. 보조 스트림을 통해 성능 개선
 * 7. 스트림을 통해 읽고 쓰기
 * 8. 통신 종료
 */
public class ServerOld
{
    public void serverStart()
    {
        System.out.println("Server().serverStart(); - 실행테스트");
        // 1. 서버의 포트번호 정함
        // 0    ~ 1023 시스템 포트번호
        // 1024 ~ 65535 의 포트번호를 사용하는 것을 추천
        int port = 30021;
        // 2. 서버용 소켓 객체 생성
        ServerSocket server = null;
        try
        {
            server = new ServerSocket(port);
            
            while(true)
            {
                // 3. 클라이언트 쪽에서 접속 요청이 오길 기다림 + 
                // 4. 접속 요청이 오면 요청 수락 후 해당 클라이언트에 대한 소켓 객체 생성
                System.out.println("클라이언트 대기중...");
                Socket client     = server.accept();
                System.out.println("클라이언트와 연결 됨");
                
                // 5. 연결된 클라이언트와 입출력 스트림 생성 
                InputStream  is   = client.getInputStream();
                OutputStream os   = client.getOutputStream();
                
                // 6. 보조 스트림을 통해 성능 개선
                BufferedReader br = new BufferedReader(new InputStreamReader(is));
                PrintWriter    pw = new PrintWriter(os,true);
                
                // 7. 스트림을 통해 읽고 쓰기
                while(true)
                {
                    // 클라이언트로부터 입력이 있을때까지 대기한다.(= 블로킹된다.)
                    String message = br.readLine();
                    
                    if(message == null || "exit".equals(message))
                    {
                        System.out.println("클라이언트 접속 종료");
                        break;
                    }
                    
                    System.out.println("클라이언트가 보낸 메세지 : " + message);
                    
//                    pw.print("메시지 받기 성공");
                    pw.println(message);
                    pw.flush();
                }
                
                // 8. 통신 종료
                pw.close();
                br.close();
                client.close();
            }
        }
        catch(IOException e)
        {
            e.printStackTrace();
        } 
    }
}