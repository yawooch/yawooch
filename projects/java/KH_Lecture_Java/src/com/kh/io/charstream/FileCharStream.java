package com.kh.io.charstream;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class FileCharStream
{
    
    public void fileSave() 
    {
        char[] arr = new char[] {'a', 'p', 'p', 'l','e'};
        
        //try - catch 문이 종료되면 등록한 리소스를 정리(close())해준다. 1.7이상부터 사용가능(try-with-resource구문)
        try(FileWriter fw = new FileWriter("b_char.txt"))
        {
            fw.write("안녕하세요\n");
            fw.write("만반다\n");
            fw.write(44032);
            fw.write("\n");
            fw.write(55203);
            fw.write(50000);
            fw.write("\n");
//            fw.write({'a', 'p', 'p', 'l','e'});// => arr = {'a', 'p', 'p', 'l','e'};
//            fw.write(new char[] {'a', 'p', 'p', 'l','e'});
            fw.write(arr);
            fw.write("\n");
            fw.write(arr, 1, 2);
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
    }
    
    public void fileRead() 
    {
        try(FileReader fr = new FileReader("b_char.txt"))
        {
            int value = 0;
            
            
            while((value = fr.read() ) != -1)
            {
                System.out.print((char)value);
            }
            fr.read();
        } 
        catch (IOException e)
        {
            e.printStackTrace();
        }
        
    }
    
    //가변인자.
    public <T> int sum(T ... t)
    {
        int i = 0;
        
        for (int j = 0; j < t.length; j++)
        {
            i += (int)t[j];
        }
        return i;
    }
}

