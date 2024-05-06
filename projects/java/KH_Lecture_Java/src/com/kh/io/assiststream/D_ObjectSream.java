package com.kh.io.assiststream;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

/** 객체 입출력 보조 스트림 */
public class D_ObjectSream
{
    public void fileSave()
    {
        Member member = new Member("yawooch", "1234", "양우찬", 20, '남', 1200.5);
        
        ObjectOutputStream oos = null;
        try
        {
            oos = new ObjectOutputStream(new FileOutputStream("e_object.txt"));
            System.out.println("객체 입력전 : ");
            oos.writeObject(member);
            System.out.println("객체 입력후 : ");
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
                oos.close();
            }
            catch(IOException e)
            {
                e.printStackTrace();
            }
        }
    }
    
    public void fileRead()
    {
        try(ObjectInputStream ois = new ObjectInputStream(new FileInputStream("e_object.txt")))
        {
            System.out.println("객체 입력전 : ");
            Member member = (Member)ois.readObject();
            System.out.println("객체 입력후 : ");
            System.out.println(member);
        }
        catch(FileNotFoundException e)
        {
            e.printStackTrace();
        }
        catch(IOException e)
        {
            e.printStackTrace();
        }
        catch(ClassNotFoundException e)
        {
            e.printStackTrace();
        }
    }
}
