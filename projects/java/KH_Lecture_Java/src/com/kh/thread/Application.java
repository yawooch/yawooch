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
        
        
        //3. �ͷ� ������ü
        //  [ǥ����]
        //      new �������̽�(){��������};
        //      - �ڹٿ����� �ҽ������� ������ �ʰ� ������ü�� ����� �ִ� ����� �����Ѵ�.
        //      - �߰�ȣ({..})���� �������̽��� ����� ��� �߻�޼ҵ���� ������ �ؾ��Ѵ�.
        Thread thread3 = new Thread(new Runnable()
        {
            @Override
            public void run()
            {
                //�۾��ϰ��� �ϴ� �ڵ带 �ۼ��Ѵ�.
                for(int i = 0 ; i <=30 ;  i++)
                {
                    System.out.println(Thread.currentThread().getName() + "[" + i + "]");
                }
            }
        });
        
        thread3.start();

        System.out.println("���� ������ ����");
//        System.out.println(Thread.currentThread().getName());

        //�۾��ϰ��� �ϴ� �ڵ带 �ۼ��Ѵ�.
        for(int i = 0 ; i <=30 ;  i++)
        {
            System.out.println(Thread.currentThread() + "[" + i + "]");
        }
        System.out.println("���� ������ ����");
        
        // 4. ���ٽ��� ���� �ͷ㱸����ü(����)
        Thread thread4 = new Thread(() -> 
        {
            //�۾��ϰ��� �ϴ� �ڵ带 �ۼ��Ѵ�.
            for(int i = 0 ; i <=30 ;  i++)
            {
                System.out.println(Thread.currentThread().getName() + "[" + i + "]");
            }
        });
        
        thread4.start();
     }
}