package com.kh.operator;

import java.util.Scanner;

/** 비교연산자(이항 연산자) */
public class Comparison
{
    /* 
     * 비교연산자(이항 연산자) 
     * - 두값을 비교하는 연산자
     * - 조건을 마족하면 결과가 true, 그렇지 않으면 false
     * 
     * - 종류
     *   * 대소비교연산자 : < > <= >=
     *   * 동등비교연산자 : == !=
     */
    /** 입력받은 두 정수의 값을 비교하기 */
    public void method()
    {
        //입력받은 두 정수의 값을 비교하기
        Scanner sc = new Scanner(System.in);
        
        int num1, num2;
        
        System.out.print("정수num1 값을 입력해주세요 : ");
        num1 = sc.nextInt();
        
        System.out.print("정수num2 값을 입력해주세요 : ");
        num2 = sc.nextInt();
        
        sc.nextLine();// 버퍼를 비워주기위한 실행
        
        System.out.printf("입력값 : %d, %d\n", num1, num2);
        
        System.out.println("첫번째 값이 두번째 값보다 큰가 ? " + (num1 > num2));
        System.out.println("첫번째 값이 짝수인가 ? " + (num1 %2 ==0));
        
        System.out.println((num1 == 'A'));
        
        sc.close();
    }
}
