package com.kh.io.assiststream;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class A_ByteToCharStream
{
    public void input()
    {
//        char[] arr = new char[10];
//        try(InputStreamReader isr = new InputStreamReader(System.in))
//        {
//            System.out.print("문자열 입력 > ");
//            
//            isr.read(arr);
//            
////            System.out.println(Arrays.toString(arr));
//            for (char c : arr)
//            {
//                System.out.print(c);
//            }
//        }
//        catch (IOException e)
//        {
//            e.printStackTrace();
//        }
        
        //성능향상 보조스트림
        try(BufferedReader br = new BufferedReader(new InputStreamReader(System.in)))
        {
            System.out.print("문자열 입력 : ");
            String value = br.readLine();
            System.out.println(value);
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
    }
    
    public void output()
    {
        
        // 콘솔창(System.out)에다 문자를 출력해주는 예제
//        try(OutputStreamWriter osw = new OutputStreamWriter(System.out))
//        {
//            osw.write("Hello World\n");
//            osw.write("여러분 fighting");
//        }
//        catch (IOException e)
//        {
//            e.printStackTrace();
//        }
        
        //성능향상 보조스트림
        // 콘솔창(System.out)에다 문자를 출력해주는 예제
//        try(BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out)))
//        {
//            bw.write("안녕하세요");
//            bw.newLine();
//            bw.write("적당히 바람이 시원해");
//            bw.newLine();
//            bw.write("기분이 너무좋아요");
//            bw.newLine();
//            bw.write("유후~");
//            bw.newLine();
//        }
//        catch (IOException e)
//        {
//            e.printStackTrace();
//        }
    }
}
