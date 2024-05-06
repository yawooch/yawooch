package com.kh.thread;

import com.kh.thread.practice.MyRunnable;
import com.kh.thread.practice.MyThread;

public class Application
{
    public static void main(String[] args)
    {
        MyThread thread1 = new MyThread();
        
//        thread1.run();
        thread1.start();
        
        Thread thread2 = new Thread(new MyRunnable());
        
        thread2.start();
        
        
        //3. 익룡 구현객체
        //  [표현법]
        //      new 인터페이스(){구현내용};
        //      - 자바에서는 소스파일을 만들지 않고도 구현객체를 만들수 있는 방법을 제공한다.
        //      - 중괄호({..})에는 인터페이스의 선언된 모든 추상메소드들을 재정의 해야한다.
        Thread thread3 = new Thread(new Runnable()
        {
            @Override
            public void run()
            {
                //작업하고자 하는 코드를 작성한다.
                for(int i = 0 ; i <=30 ;  i++)
                {
                    System.out.println(Thread.currentThread().getName() + "[" + i + "]");
                }
            }
        });
        
        thread3.start();

        System.out.println("메인 스레드 실행");
//        System.out.println(Thread.currentThread().getName());

        //작업하고자 하는 코드를 작성한다.
        for(int i = 0 ; i <=30 ;  i++)
        {
            System.out.println(Thread.currentThread() + "[" + i + "]");
        }
        System.out.println("메인 스레드 종료");
        
        // 4. 람다식을 통한 익룔구현객체(참고)
        Thread thread4 = new Thread(() -> 
        {
            //작업하고자 하는 코드를 작성한다.
            for(int i = 0 ; i <=30 ;  i++)
            {
                System.out.println(Thread.currentThread().getName() + "[" + i + "]");
            }
        });
        
        thread4.start();
     }
}