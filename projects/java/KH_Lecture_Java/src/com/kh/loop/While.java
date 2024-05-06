package com.kh.loop;

import java.util.Scanner;

/**  반복문 While 실습예제 */
public class While
{
    /*
     *  반복문 While
     *   [표현법]
     *   //[초기식] // 생략가능
     *   while(조건식)
     *   {
     *   반복적으로 실행할 코드
     *   // [증감식] // 생략가능
     *   }
     *   
     *   - 실행 순서
     *   조건식 검사 -> 조건이 true면 반복할 코드 실행
     *   -> 조건식 검사 -> 조건이 true면 반복할 코드 실행
     *   -> 조건식 검사 -> 조건이 false면 반복문 종료
     */
    
    /** while 문을 사용해서 Happy 5번 출력 */
    public void method1()
    {
        int i = 0;
        while(i <5)
        {
            System.out.println("Happy " + i);
            i++;
        }
    }
    
    /** 사용자가 선택한 값에 따라 1 ~ 10 사이 정수 중 짝수 또는 홀수만 출력 */
    public void method2()
    {
        System.out.println("1) 짝수 출력");
        System.out.println("2) 홀수 출력");
        System.out.println("선택 : ");
        
        Scanner sc = new Scanner(System.in);
        int sel = sc.nextInt();

        //사용자가 선택한 값에 따라 1 ~ 10 사이 정수 중
        //짝수 또는 홀수만 출력
        int i = 1;
        
        while(i <= 10)
        {
            if(sel == 1 && i%2 == 0)
            {
                System.out.println(i);
            }
            else if(sel == 2 && i%2 == 1)
            {
                System.out.println(i);
            }
            i++;
        }
        sc.close();
    }
    
    /** 1에서 랜덤값까지의 총합을 구하여 출력 */
    public void method3()
    {
        //1에서 랜덤값까지의 총합을 구하여 출력
        //1 ~ 10 
        /* 랜덤값 구하는 방법
         * - Math : java.lang.Math
         * - method : random();
         * * Math.random() //호출
         *      범위 : 0.0 ~ 0.9999999 (0.0 <=  < 1.0) 랜덤값
         */
        int input  = (int)(Math.random() * 10 + 1);
        int result = 0;
        
        int i = 1;
        while(i <= input) 
        {
            result += i++;
        }
        System.out.println("1 ~ "+ input +" 총합           : " + result);
    }
    
    /** do ~ while 사용자가 선택한 값에 따라 1 ~ 10 사이 정수 중 짝수 또는 홀수만 출력 */
    public void method4()
    {
        //사용자가 선택한 값에 따라 1 ~ 10 사이 정수 중
        //짝수 또는 홀수만 출력
        Scanner sc = new Scanner(System.in);
        int sel;
        do
        {
            System.out.println("1) 짝수 출력");
            System.out.println("2) 홀수 출력");
            System.out.println("3) 종료");
            System.out.println("선택 : ");
            
            sel = sc.nextInt();
            int i = 1;
            while(i <= 10)
            {
                if(sel == 1 && i%2 == 0)
                {
                    System.out.println(i);
                }
                else if(sel == 2 && i%2 == 1)
                {
                    System.out.println(i);
                }
                i++;
            }
        }
        while(sel != 3);//3이 아니면 계속 실행해라

        sc.close();
    }
}
