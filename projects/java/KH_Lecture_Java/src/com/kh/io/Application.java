package com.kh.io;

import com.kh.io.assiststream.D_ObjectSream;

public class Application
{
    public static void main(String[] args)
    {
//        FileTest ft = new FileTest();
//        ft.method1();
//        ft.method2();

        
//        FileInputStream FileOutputStream
//        new FileByteStream().fileSave();
//        new FileByteStream().fileRead();
        
        //FileReader FileWriter
//        new FileCharStream().fileSave();
//        new FileCharStream().fileRead();
        
        //가변인자
//        System.out.println(new FileCharStream().sum(10, 20, 30));
//        System.out.println(new FileCharStream().sum(10, 20));
//        System.out.println(new FileCharStream().sum(10));
//        System.out.println(new FileCharStream().sum());
        
        //문자변환 보조 스트림 테스트
//        new A_ByteToCharStream().input();
//        new A_ByteToCharStream().output();
        
        //성능향상 보조스트림
//        new B_BufferedStream().fileSave();
//        new B_BufferedStream().fileRead();
        
        //기본 타입 입출력 보조 스트림 예제
//        new C_DataStream().fileSaveAndRead();
        
        new D_ObjectSream().fileSave();
        new D_ObjectSream().fileRead();
    }
}

