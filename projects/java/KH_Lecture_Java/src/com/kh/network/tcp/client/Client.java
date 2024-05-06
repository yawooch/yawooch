package com.kh.network.tcp.client;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.Scanner;

public class Client
{
    private String message;

    /*
     * 1. 서버의 IP주소와 서버가 정한 포트번호를 매개변수로 하여 클라이언트용 소켓 객체 생성
     * 2. 서버와의 입출력 스트림 오픈
     * 3. 보조 스트림을 통해 성능 개선
     * 4. 스트림을 통해 읽고 쓰기
     * 5. 통신 종료
     */
    public void clientStart()
    {
        System.out.println("Client().clientStart() - 실행 테스트");
        // 1. 서버의 IP주소와 서버가 정한 포트번호를 매개변수로 하여 클라이언트용 소켓 객체 생성
        // 0    ~ 1023 시스템 포트번호
        // 1024 ~ 65535 의 포트번호를 사용하는 것을 추천
        int    port     = 30021;
        String serverIp = "192.168.40.17";
//        String serverIp = "192.168.40.3";
                
        try
        (
            Socket     socket = new Socket(serverIp, port);
            BufferedReader br = new BufferedReader(new InputStreamReader(socket.getInputStream()));
            PrintWriter    pw = new PrintWriter(socket.getOutputStream(), true);
            Scanner        sc = new Scanner(System.in)
        )
        {
//            socket = new Socket(serverIp, port);
            
            if(socket != null)
            {
                // 2. 서버와의 입출력 스트림 오픈 +
                // 3. 보조 스트림을 통해 성능 개선
//                BufferedReader br = new BufferedReader(new InputStreamReader(socket.getInputStream()));
//                PrintWriter    pw = new PrintWriter(socket.getOutputStream(), true);l
                
                
                // 4. 스트림을 통해 읽고 쓰기
//                Scanner sc = new Scanner(System.in);
                do
                {
                    System.out.print("서버에 보낼내용 : ");
                    message = sc.nextLine();

                    if(message == null || "exit".equals(message))
                    {
                        System.out.println("접속 종료");
                        break;
                    }
                    
                    pw.println(message);
                    
//                    System.out.println("받은 메세지 : " + br.readLine());
                }
                while(true);
                
                // 5. 통신 종료
//                sc.close();
//                pw.close();
//                br.close();
//                socket.close();
            }
        }
        catch(UnknownHostException e){e.printStackTrace();}
        catch(IOException e)         {e.printStackTrace();}
    }
}
