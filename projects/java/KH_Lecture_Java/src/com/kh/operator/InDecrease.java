package com.kh.operator;

/** 증감 연산자(단항 연산자) */
public class InDecrease
{
    /*
     * 증감 연산자(단항 연산자)
     *  - ++ : 값을 1 증가시켜주는 연산자 
     *         예) ++변수, 변수++ 
     *  - -- : 값을 1 증가시켜주는 연산자
     *         예) --변수, 변수--
     * 
     * - 처리 순서
     *  * (증감 연산자)변수 : 전위연산 => "선증감 후처리" 
     *  * 변수(증감 연산자) : 후위연산 => 선처리 "후증감"
     */
    public void method1()
    {
        int num1 = 10;
        
        System.out.println("초기 num1         : " + num1  );// num1 = 10
        System.out.println("전위연산 1회 수행 : " + ++num1);// num1 = 11
        System.out.println("후위연산 1회 수행 : " + num1++);// num1 = 11
        System.out.println("최종 num1         : " + num1  );// num1 = 12
    }
    public void method2()
    {
        int num1    = 20;
        int result1 = ++num1 * 3;// num1 = 21, result1 = 21 * 3 = 63
        
        int num2    = 20;
        int result2 = num2++ * 3;// num2 = 20, result2 = 20 * 3 = 60
        
        System.out.printf("num1 : %d, result1 : %d\n",num1 , result1  );//먼저 더해주고 곱셈
        System.out.printf("num2 : %d, result2 : %d\n",num2 , result2  );//곱셈 먼저하기 때문에 곱셈대로 진행한 후에 변수를 증가시킨다.
    }
    public void method3()
    {
        // 실행전 결과 예측하기
        int a = 10;
        int b = 20;
        int c = 30;
        
        System.out.println("출력결과 : " + a++);                    //출력결과 :                10
        // a = 11
        // b = 20
        // c = 30
        System.out.println("출력결과 : " + ((++a) + (b++)));        //출력결과 : 12 + 20      = 32
        // a = 12
        // b = 21
        // c = 30
        System.out.println("출력결과 : " + ((a++) + (--b) + (--c)));//출력결과 : 12 + 20 + 29 = 61
        // a = 13
        // b = 20
        // c = 29
        System.out.printf("a : %d\nb : %d\nc : %d\n",a , b, c);     //출력결과 : 13 20 29
    }
}
