package com.kh.loop;

import java.util.Scanner;

public class Break
{
    /*
     * 분기문 break
     *  : 반복문 안에서 사용되는 분기문
     *   break; 실행되면 즉시 반복문 종료
     */
    
    /** 랜덤값(1 ~ 100) 을 발생시켜 출력 */
    public void method1()
    {
        // 랜덤값(1 ~ 100) 을 발생시켜 출력
        // 해당 랜덤 값이 짝수일때 반복문을 종료, 이후 "종료"라고 출력
        
        
        int i = 0 ;
        
        while(true)
        {
            int random = (int)(Math.random() * 100 +1);
            System.out.println(++i);
            System.out.println("random : " + random);
            if(random%2 == 0) break;
        }
    }
    public void method2()
    {
        // 사용자에게 문자를 입력 받아 정수값으로 출력
        // 출력 ) A unicode : 65
        // 단, 'x' 또는 'X' 입력시 종료
        Scanner sc = new Scanner(System.in);
        
        char input;
        int i = 0 ;
        
        while(true)
        {
            System.out.println("문자 입력하세요");
            input = sc.next().charAt(0);
            System.out.println(++i);
            System.out.println(input + " unicode : " + (int)input);
            if(input == 'x' || input == 'X') break;
        }
        sc.close();
    }
}
