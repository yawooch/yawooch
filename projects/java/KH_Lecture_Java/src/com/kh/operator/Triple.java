package com.kh.operator;

import java.util.Scanner;

/** 삼항연산자(항이 3개인 연산) */
public class Triple
{
    /* 
     * 삼항연산자(항이 3개인 연산) 
     * 
     *  - 표현방법
     *  (조건식) ? (조건이 참일 경우 결과 값) : (조건이 거짓일 경우 결과 같)
     */

    /** 종료 의사를 입력 받아 결과 출력하는 메소드 */
    public void method1() 
    {
        //종료 의사를 입력 받아 결과 출력
        Scanner sc = new Scanner(System.in);

        System.out.print("종료를 원할 경우 x 를 입력: ");
        char ch = sc.next().charAt(0);
        
        
        //입력받은 값이 x 또는 X인 경우 "종료합니다." 출력하고
        //그렇지 않은경우 "계속 진행합니다." 출력
        String result = "";
        
        result = ('x' == ch || ch == 'X')? "종료합니다." : "계속 진행합니다.";
        
        System.out.printf(result);
        
        sc.close();
    }
    /**
     * 사용자에게 두개의 정수와 + 또는 - 값을 입력받아
     * 연산결과 출력
     * 입력 예) 10 20 +
     * 
     * 단, + 또는 - 외의 문자 입력시 입력이 잘못되었습니다. 출력 
     */
    public void method2() 
    {
        /* 사용자에게 두개의 정수와 + 또는 - 값을 입력받아
         * 연산결과 출력
         * 입력 예) 10 20 +
         * 
         * 단, + 또는 - 외의 문자 입력시 입력이 잘못되었습니다. 출력
         */
        Scanner sc = new Scanner(System.in);
        
        System.out.print("입력's : ");
        String[] input = sc.nextLine().split("\s");
        int num1       = Integer.parseInt(input[0]);
        int num2       = Integer.parseInt(input[1]);
        char ch        = input[2].charAt(0);
        
        //조건식1 : + - 부호구분 
        //         (ch =='+' || ch =='-')?() : "입력이 잘못되었습니다."
        
        //조건식2 : 부호로 계산
        //         ch == '+'?(num1 + num2): (num1 - num2)
        
        //결과 자료형 : String
        //결과 조건식
        //(ch =='+' || ch =='-')?('+'?(num1 + num2): (num1 - num2)) : "입력이 잘못되었습니다."
        String result = (ch =='+' || ch =='-')?(ch == '+'?(num1 + num2)+ "": (num1 - num2)+ "") : "입력이 잘못되었습니다.";
        
        System.out.println("연산결과 : "+ result);
        
        
        /*
         * Teacher's Answer
         * 
         * System.out.print("아래와 같이 입력하면 연산 결과를 확인할 수 있습니다. ");
         * System.out.print("예) 10 20 + => 10+");
         * int num1       = sc.nextInt();
         * int num2       = sc.nextInt();
         * char op        = sc.next().charAt(0);
         * 
         * String result = (op =='+')?"" + (num1 + num2): ((op =='-')?"" + (num1 - num2):"입력이 잘못되었습니다.") ;
         * 
         * System.out.println("연산결과 : "+ result);
        */
        
        sc.close();
    }
}
