package com.kh.network.receiver.server;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

//클라이언트와 통신을 위한 Thread 구현
public class Receiver implements Runnable
{
    private Socket client;
    
    public Receiver(Socket client)
    {
        this.client = client;
    }
    
    @Override
    public void run()
    {
        // 5. 연결된 클라이언트와 입출력 스트림 생성 
        // 6. 보조 스트림을 통해 성능 개선
        try
        (
                BufferedReader br = new BufferedReader(new InputStreamReader(client.getInputStream()));
                PrintWriter    pw = new PrintWriter(client.getOutputStream(),true)
        )
        {
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
                
                System.out.println(client.getInetAddress().getHostAddress() + " 가 보낸 메세지 : " + message);
                
//            pw.print("메시지 받기 성공");
                pw.println(message);
                pw.flush();
            }
        }
        catch(IOException e)
        {
            e.getStackTrace();
        }
        // 8. 통신 종료
//        pw.close();
//        br.close();
//        client.close();
    }
}