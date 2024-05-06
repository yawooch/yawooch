package com.kh.lambda.practice.functional;

/**
 * 매개변수가 있고, 반환값이 없는 추상메소드가 있는 함수적인터페이스
 */
@FunctionalInterface
public interface B_FunctionalInterface
{
    // 매개변수가 있고, 반환값이 없는 추상메소드
    public abstract void method(int a);
}
