package com.kh.lambda.practice;

public class A_Lambda
{
    public void method1() {
        Runnable runnable;
        Thread thread ;
        runnable = new Runnable() {
            public void run() {
                System.out.println("A_Lambda : 익명 구현 객체를 사용한 스레드 생성");
            }
        };
        
        thread = new Thread(runnable);
        
        thread.start();
        
        runnable = () -> System.out.println("A_Lambda : 람다식을 사용한 스레드 생성");

        thread = new Thread(runnable);
        
        thread.start();
    }
}
