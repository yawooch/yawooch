package com.kh.loop;

import java.util.Scanner;

/** 반복문 For 실습예제 */
public class For
{
    /* 
     * 반복문 : 프로그램 흐름을 제어하는 제어문 중 하나로 어떤 실행코드를 반복적으로 수행
     * 
     * [표현법]
     * for(초기식; 조건식;증감식)
     * {
     *   //반복적으로 수행할 코드
     * }
     * 
     * * 초기식 : 반복문이 수행될 떄 "최초 한번만 실행되는 구문"
     * * 조건식 : "반복문이 수행될 조건"을 작성하는 구문
     *           - 조건식이 true  이면 반복할 코드를 수행
     *           - 조건식이 false 이면 반복문 종료 
     * * 증감식 : 반복문을 제어하는 변수값을 증감 시키는 구문
     * => 보통 초기식, 조건식, 증감식에서 사용하는 변수가 동일하다
     * 
     * * for문 실행 순서
     * 초기식 -> 조건식 -> [true일때]반복할 코드를 수행 -> 증감식
     *        -> 조건식 -> [true일때]반복할 코드를 수행 -> 증감식
     *        -> 조건식 -> [false일때] for문을 종료
     * * 조기식, 조건식, 증감식 생략 가능
     *      :  ; 필수로 입력
     *      for(초기식; 조건식;) {}// 조건식 생략
     *      for(; 조건식;증감식) {}// 조건식 생략
     *      for(초기식; ;증감식) {}// 조건식 생략
     */
    
    /** "Happy" 5번 출력 */
    public void method1()
    {
        // "Happy" 5번 출력
        System.out.println("Happy");
        System.out.println("Happy");
        System.out.println("Happy");
        System.out.println("Happy");
        System.out.println("Happy");
        System.out.println("************************");
        
        // for문을 사용해서 출력함수를 1번만 사용
        int i;
        for(i = 0; i <5; i++)
        {
            System.out.println("Happy " + i);
        }
        System.out.println("최종" + i);
    }
    
    /** 반복문을 사용해서 10 ~ 1 출력 */
    public void method2()
    {
        //반복문을 사용해서 10 ~ 1 출력
        // ex 1)
//      for(int i = 10; i > 0; i--)
//      {   
//          System.out.println(i);
//      }
        // ex 2) 
        for(int i = 10; i > 0; i--)
        {   
          //반복문을 사용해서 10 ~ 1 출력
          //10 9 8 7 ...  3 2 1
          System.out.print(i);
          if(i != 1)
          {
              System.out.print(" ");
          }
        }
    }
    
    /** 1 ~ 10 까지의 총 합을 구하여 출력 */
    public void method3()
    {
        // ex 1)
        //1 ~ 10 까지의 총 합을 구하여 출력
//        int result = 0;
//        for(int i = 1; i < 11; i ++) 
//        {
//            System.out.println("현재 i      : " + i);
//            System.out.println("현재 result : " + result);
//            result += i;
//            System.out.println("result += i : " + result);
//            System.out.println("----------------------------------------");
//        }
//        System.out.println(result);
        // ex 2) 
        //1 ~ 10 까지의 총 합을 구하여 출력 + 
        //1 ~ 10 까지의 정수 중에 사용자에게 입력 받은 값까지의 총 합을 구하여 출력
        Scanner sc = new Scanner(System.in);
        
        int input  = 0;
        int result = 0;
        
        System.out.print("정수 입력(1 ~ 10) : ");
        input = sc.nextInt();
        
        if(input > 10 || input < 1)
        {
            System.out.print("1 ~ 10까지의 정수를 입력하세요");
        }
        else
        {
            for(int i = 1; i <= input; i ++) 
            {
                result += i;
            }
            System.out.println("1~"+ input +"총합           : " + result);
        }
        sc.close();
    }
    
    /** 1 ~ 랜덤으로 입력받은 값까지의 총합을 구하여 출력 */
    public void method4()
    {
        //랜덤값까지의 총합을 구하여 출력
        //1 ~ 10 
        /* 랜덤값 구하는 방법
         * - Math : java.lang.Math
         * - method : random();
         * * Math.random() //호출
         *      범위 : 0.0 ~ 0.9999999 (0.0 <=  < 1.0) 랜덤값
         */
        int input  = (int)(Math.random() * 10 + 1);
        int result = 0;

        for(int i = 1; i <= input; i ++) 
        {
            result += i;
        }
        System.out.println("1 ~ "+ input +" 총합           : " + result);
        
    }
    
    /** 각 인덱스(위치) 별 문자를 한줄 씩 출력 */
    public void method5()
    {
        final String STR = "Story";
        //각 인덱스(위치) 별 문자를 한줄 씩 출력
        // S
        // t
        // o
        // r
        // y
        for(int i = 0; i < STR.length(); i++)
        {
            System.out.println(STR.charAt(i));
        }
    }
    
    /** 구구단 출력하기 */
    public void method6()
    {
        //ex 1
        //구구단 3단 출력하기
        // 3 x 1 = 3
        // 3 x 1 = 3
        // 3 x 3 = 27
//        for(int i = 1; i < 10; i++)
//        {
//            System.out.println("3 x " + i + " = " + (3 * i));
//        }
        
        //ex 2
        //구구단 단수 입력하여 출력하기
//        Scanner sc =new Scanner(System.in);
//        
//        System.out.print("출력하고자 하는 단수 입력 : ");
//        int dan = sc.nextInt();
//        
//        for(int i = 1; i < 10; i++)
//        {
//            System.out.println(dan + " x " + i + " = " + (dan*i));
//        }
//        
//        sc.close();
        //구구단 단수 입력하여 출력하기
        for(int i = 1; i < 10; i++)
        {
            for(int j = 1; j < 10; j++)
            {
                System.out.println(j + " x " + i + " = " + (j*i));
            }
        }
        
        //for 문 한개 사용기
//        int j = 1;
//        for(int i = 1; i < 10; i++)
//        {
//            System.out.println(j + " x " + i + " = " + (j*i));
//            
//            if(i == 9 && j != 9)
//            {
//                i = 1;
//                j++;
//            }
//            if(j == 10) break;
//        }
      
    }
    
    /** 구구단 2단 ~ 9단 출력 중첩반복문 사용 */
    public void method7()
    {
        //ex 1)
        //구구단 2단 ~ 9단 출력
        //중첩반복문 사용.
        // for(초기식1; 조건식1; 증감식1)
        // {
        //      for(초기식2; 조건식2; 증감식2)
        //      {
        //      }
        // }
//        for(int i = 2; i < 10; i ++)
//        {
//            for(int j = 1; j < 10; j ++)
//            {
//                System.out.printf("%d x %d = %d\n", i , j ,(j*i));
//            }
//            System.out.println();
//        }
        
        //ex 2) 구구단을 가로로 출력되도록 수정
        for(int i = 1; i < 10; i ++)
        {
            for(int j = 2; j < 10; j ++)
            {
                System.out.printf("%d x %d = %d\t ", j , i ,(j*i));
            }
            System.out.println();
        }
    }
}
