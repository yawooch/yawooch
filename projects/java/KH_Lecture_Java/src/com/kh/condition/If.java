package com.kh.condition;

import java.util.Scanner;

/** 조건문 연습 클래스 */
public class If
{
    /* 
     * 조건문 if
     * 
     * - 기본적으로 프로그램 진행은 순차적으로 진행
     * - 순차적인 흐름 바꿀때 제어문(조건문, 반복문..)을 사용하여 제어가능
     * 
     * * 조건문 :조건에 따라 선택적으로 실행할 때
     * * 반복문 : 반복적으로 실행할 떄
     * 
     * - "조건식" 을 통해 참인지 거짓인지 판단해서 그에 해당하는 코드를 생성
     *      * 조건식의 결과 :true, false
     *      * 연산자 : 비교연산자(대소, 동등), 논리연산자(&&, ||)를 주로 사용
     * 
     * - 종류 : if , switch
     *  * if 
     *      [1] 단독 if
     *          if(조건식) {
     *              //조건식이 참인경우 수행할 코드
     *          }
     *          => 조건식이 거짓이면 아무것도 실행되지 않음
     *          
     *      [2] if ~ else문
     *          if(조건식) {
     *              //조건식이 참인경우 수행할 코드
     *          }
     *          else{
     *              //조건식이 거짓인경우 수행할 코드
     *          }
     *      [3]  if ~ else if ~ else문
     *          if(조건식1) {
     *              //조건식1이 참인경우 수행할 코드
     *          }
     *          else if(조건식2){
     *              //조건식1이 참인경우 수행할 코드
     *          }
     *          else{
     *              //조건식1, 조건식2 가 모두 거짓인경우 수행할 코드
     *          }
     *          
     */
    /** 입력한 값이 1 ~ 10 사이의 값 확인하여 "범위를 벗어났습니다." 입력값 출력 */
    public void method1()
    {
        //사용자가 입력한 값이 1 ~ 10 사이의 값인지 확인하여 
        //범위를 벗어난 경우 "범위를 벗어났습니다." 출력, 범위에 해당되는 경우 입력값 출력
        Scanner sc = new Scanner(System.in);
        
        System.out.println("정수 입력 : ");
        int num = sc.nextInt();
        
        if(num >= 1 && num <= 10)
        {
            System.out.println("결과 : " + num);
        }
        else
        {
            System.out.println("범위를 벗어났습니다.");
        }
        
        
        sc.close();
    }
    
    /** 문자를 입력받아서 소문자면 "소문자", 대문자면 "대문자" 출력하기 */
    public void method2()
    {
        //문자를 입력받아서 소문자면 "소문자", 대문자면 "대문자" 출력하기
        Scanner sc = new Scanner(System.in);
        
        System.out.println("입력 : ");
        char ch = sc.next().charAt(0);
        
        if(ch >='a' && ch <='z')
        {
            System.out.println("소문자");
        }
        else if(ch >='A' && ch <='Z')
        {
            System.out.println("대문자");
        }
        else
        {
            System.out.println("알파벳이 아닙니다.");
        }

        sc.close();
        
    }
    
    /** 주민번호 입력 받아서 남자인지 여자인지 출력하기 */
    public void method3()
    {
        //주민번호 입력 받아서 남자인지 여자인지 출력하기
        //(단, - 포함해서 입력받은 값을 길이가 14가 아닌경우 "잘못입력되었습니다." 출력
        // 문자열 길이 확인 메소드 : length()
        Scanner sc = new Scanner(System.in);
        
        System.out.println("주민번호입력('-'포함) : ");
        String citizenNum = sc.nextLine();
        char ch = citizenNum.charAt(7);
        String result ="";
        
//        if(citizenNum.length() != 14)
//        {
//            System.out.println("잘못입력되었습니다");
//        }
//        else if(ch =='1' || ch =='3')
//        {
//            System.out.println("남자");
//        }
//        else if(ch =='2' || ch =='4')
//        {
//            System.out.println("여자");
//        }
//        else
//        {
//            System.out.println("주민번호인지 확인필요");
//        }

        if(citizenNum.length() == 14)
        {
            switch(ch)
            {
            case '1':
            case '3':
                result = "남자";
                break;
            case '2':
            case '4':
                result = "여자";
                break;
            default: 
                result = "알수없음";
            }
        }
        else
        {
            result = "잘못입력되었습니다";
        }
        System.out.println(result);

        sc.close();
    }
}
