package com.kh.thread.practice;


/** �����带 �����ϴ� ���
    1. Thread Ŭ������ ��ӹ޴� ��� */
public class MyThread extends Thread
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
}
