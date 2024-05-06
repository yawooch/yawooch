package com.kh.lambda.practice.functional;

/**
 * 매개변수, 반환값이 있는 추상메소드가 있는 함수적인터페이스
 */
@FunctionalInterface
public interface C_FunctionalInterface
{
    final static int HELLO = 100;
    // 매개변수, 반환값이 있는 추상메소드
    public abstract int method(int a, int b);
}
