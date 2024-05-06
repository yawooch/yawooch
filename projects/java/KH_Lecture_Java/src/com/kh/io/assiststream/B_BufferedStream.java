package com.kh.io.assiststream;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class B_BufferedStream
{
    public void fileSave()
    {
        try(BufferedWriter bw = new BufferedWriter(new FileWriter("c_buffer.txt",true)))
        {
            bw.write("안냐세여");
            bw.newLine();
            bw.write("적당히 바람이 불어시원해 ");
            bw.newLine();
            bw.write("기부니가 너무 좋아요");
            bw.newLine();
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
    }
    
    public void fileRead()
    {
        try(BufferedReader br = new BufferedReader(new FileReader("c_buffer.txt")))
        {
            String value = null;
            while((value = br.readLine())!=null)
            {
                System.out.println(value);
            }
        }
        catch (FileNotFoundException e)
        {
            e.printStackTrace();
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
    }
}
