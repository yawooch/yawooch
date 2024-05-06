package com.kh.lambda.practice.functional;


/**
 * 매개변수 ,반환값이 없는 추상메소드가 있는 함수적인터페이스
 */
@FunctionalInterface
public interface A_FunctionalInterface
{   
    final static int HELLO = 200;// B_Functional.method4() 를 위한 상수 선언
    // 매개변수 ,반환값이 없는 추상메소드
    public abstract void method();
//    public abstract void method1();
}
