package com.kh.io.file;

import java.io.File;
import java.io.IOException;

public class FileTest
{
    /** File 클래스 테스트 
     * @throws IOException */
    public void method1()
    {
        try
        {
            // 메모리 상에서만 존재하는 객체
            File file = new File("test.txt");

            System.out.println("파일명          : " + file.getPath());
            System.out.println("경로            : " + file.getAbsolutePath());
            System.out.println("파일 존재 여부  : " + file.exists());
            System.out.println("파일 여부       : " + file.isFile());
            System.out.println("폴더 여부       : " + file.isDirectory());
            
            //createNewFile();을 하게 되면 실제 파일이 만들어진다.
            file.createNewFile();
        } catch (Exception e)
        {
            e.printStackTrace();
        }
    }

    /** 폴더생성후 파일생성 테스트 */
    public void method2()
    {
        try
        {
            File temp = new File("D:/temp/demo");
            
            if (!temp.exists())
            {
                temp.mkdirs();
                System.out.println("폴더 생성 여부 : " + temp.isDirectory());
            }
            File file = new File("D:/temp/demo/text.txt");
            file.createNewFile();
        } 
        catch (IOException e)
        {
            e.printStackTrace();
        }
        
    }
}

