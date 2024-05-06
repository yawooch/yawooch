package com.kh.io.bytestream;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Arrays;

public class FileByteStream
{
    public void fileSave()
    {
        FileOutputStream fos = null;
        byte[] arr = new byte[3];
//        byte[] arr = new byte[] {100,101,102};
//        byte[] arr = {100,101,102};
        
        arr[0] = 99;
        arr[1] = 100;
        arr[2] = 101;
        
        System.out.println(Arrays.toString(arr));
        
        try
        {
//            fos = new FileOutputStream("a_byte.txt");
            fos = new FileOutputStream("a_byte.txt", true);
            
            fos.write(97);
            fos.write('b');
            fos.write(10);//줄바꿈 문자가 저장
            fos.write('c');
            fos.write(10);//줄바꿈 문자가 저장
            fos.write(arr);
            fos.write(10);//줄바꿈 문자가 저장
            fos.write(arr, 1, 2);
            fos.write(10);//줄바꿈 문자가 저장
            fos.write('가');
            fos.flush();
            
//            fos.close();
        }
        catch (FileNotFoundException e)
        {
            e.printStackTrace();
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
        finally
        {
            try
            {
                fos.close();
            } catch (IOException e)
            {
                e.printStackTrace();
            }
        }
    }
    
    public void fileRead()
    {
        FileInputStream fis = null;
        byte[] arr = new byte[100];
        
        try
        {
            //파일이 존재하지 않으면
            //FileNotFoundException 이 발생한다.
            fis = new FileInputStream("a_byte.txt");
            
            //read() 가 두번 호출되기때문에 정상적으로 출력할수 있다.
//            while(fis.read() != -1)
//            {
//                System.out.print((char)fis.read());
//            }
//            
//            int value = 0;
//            while((value = fis.read()) != -1)
//            {
//                System.out.println(value);
//            }
            int value = fis.read(arr);
//            int value = fis.read(arr, 5, 10);
            System.out.println("읽어온 byte 수 : " + value);
            System.out.println(Arrays.toString(arr));
            
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
        finally
        {
            try
            {
                fis.close();
            } 
            catch (IOException e)
            {
                e.printStackTrace();
            }
        }
    }
}
