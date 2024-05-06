package com.kh.io.assiststream;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

/** 기본 타입 입출력 보조 스트림 예제 */
public class C_DataStream
{
    public void fileSaveAndRead()
    {
        try
        (
            DataOutputStream dos = new DataOutputStream(new FileOutputStream("d_data.txt"));
            DataInputStream  dis = new DataInputStream( new FileInputStream( "d_data.txt"))
        )
        {
            dos.writeUTF("홍길동");
            dos.writeChar('\n');
            dos.writeInt(24);
            dos.writeChar('\n');
            dos.writeDouble(173.5);
            dos.writeChar('\n');
            dos.writeChar('M');
            dos.writeChar('\n');
            dos.writeBoolean(false);
            dos.writeChar('\n');
            
            int length = 8;
            
            System.out.print(rpad("이름은",length," ")    + " : " + dis.readUTF());
            System.out.print(dis.readChar());
            System.out.print(rpad("나이는",length," ")    + " : " + dis.readInt());
            System.out.print(dis.readChar());
            System.out.print(rpad("키는",length," ")      + " : " + dis.readDouble());
            System.out.print(dis.readChar());
            System.out.print(rpad("성별은",length," ")    + " : " + dis.readChar());
            System.out.print(dis.readChar());
            System.out.print(rpad("결혼여부",length," ")  + " : " + dis.readBoolean());
            System.out.print(dis.readChar());
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
    }

    /**
     * 입력된 문자열을 입력된 길이에 맞게 입력된 문자로 공백을 채우는 메소드
     * @param target     : 채울 문자열
     * @param strLength  : 채울 문자열 길이
     * @param replaceExp : 채울 문자
     * @return
     */
    public static String rpad(String target, int strLength, String replaceExp)
    {
        String rstStr = target;
        if(target.length() >= strLength)
        {
            return target;
        }
        
        int hangeulInt = 0;
        for(int i = 0; i < strLength; i ++)
        {
            int charInt;

            if(i < target.length())
            {
                charInt = (int)target.charAt(i);
                //12593 ~ 12643 : ㄱ ~ ㅣ 까지 char형의 int
                //44032 ~ 55203 : 가 ~ 힣 까지 char형의 int
                if(((charInt >= 12593 && charInt <= 12643)|| (charInt >= 44032 && charInt <= 55203)) && replaceExp.equals(" "))
                {
                    //한글은 공백을 2개로 처리한다.
                    hangeulInt++;
                }
            }
                else if(i >= target.length()+hangeulInt)
            {
                    rstStr += replaceExp;
            }
        }
//        System.out.println("target.length : " + target.length());
//        System.out.println("rstStr.length : " + rstStr.length());
        return rstStr;
        
    }
}
