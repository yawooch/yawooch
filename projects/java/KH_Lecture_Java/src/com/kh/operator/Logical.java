package com.kh.operator;

import java.util.Scanner;

/** 논리연산자(이항연산자) */
public class Logical
{
    /* 
     * 논리연산자(이항연산자)
     * - 두개의 논리값을 연산
     * - 결과도 논리값
     * 
     * - 종류
     *   * 논리값 && 논리값 : 양쪽이 둘다 true 여야 결과도 true 출력
     *     true   && true  => true
     *     true   && false => false
     *     false  && true  => false
     *     false  && false => false
     *   * 논리값 || 논리값 : 둘 중 하나라도 true면 false 출력
     *     true   || true  => true
     *     true   || false => true
     *     false  || true  => true
     *     false  || false => false
     * - 주의할점 (SCE : Short Circuit Evaluation (단락 회로 평가))
     * - 앞의 값으로 결과값을 예측이 가능한 경우 뒤의값의 연산을 실행하지 않는다.
     *   * && 연산자 : 왼쪽(앞) 조건이 false이면 오른쪽(뒤) 조건을 실행하지 않는다.
     *   * || 연산자 : 왼쪽(앞) 조건이 true 이면 오른쪽(뒤) 조건을 실행하지 않는다.
     */
    
    /** 입력 받은 값이 1 ~ 10 사이인지 확인 */
    public void method()
    {
        //입력 받은 값이 1 ~ 10 사이인지 확인
        Scanner sc = new Scanner(System.in);
        
        System.out.print("정수 입력(1 ~ 10): ");
        int num = sc.nextInt();
        
        // 1 <= num <= 10
        // 1 <= num && num <= 10
        
        boolean result = (1 <= num) && (num <= 10);
        
        System.out.printf("입력 받은 값 %d는 1~10 범위에 속합니까? %b", num, result);
        
        sc.close();
       
    }
    /** 입력받은 값이 소문자인지 확인하는 메소드     */
    public void method2()
    {
        Scanner sc = new Scanner(System.in);
        
        System.out.print("문자를 입력 : ");
        char ch = sc.next().charAt(0);
        
        //ASCII a ~ z : 97 ~ 122
        //97 <= ch <= 122 
        boolean result1 = 97  <= ch && ch <= 122;
        boolean result2 = 'a' <= ch && ch <= 'z';
        
        System.out.printf("[결과1] 입력값 %c 는 소문자인가? %b\n", ch, result1);
        System.out.printf("[결과2] 입력값 %c 는 소문자인가? %b"  , ch, result2);
        
        sc.close();
        
    }
    /** 입력받은 값이 x인 경우 종료(출력)하는 메소드    */
    public void method3()
    {
       //입력받은 값이 x인 경우 종료(출력)
        Scanner sc = new Scanner(System.in);
        
        System.out.print("종료를 원할 경우 x를 입력: ");
        char ch = sc.next().charAt(0);
        
        boolean result = 'x' == ch || ch == 'X';
        
        System.out.printf("입력 값 %c 로 종료가 가능한가? %b"  , ch, result);
        
        sc.close();
    }
}
