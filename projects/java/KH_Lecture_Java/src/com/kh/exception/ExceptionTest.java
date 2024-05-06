package com.kh.exception;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.InputMismatchException;
import java.util.Scanner;

public class ExceptionTest
{
    public static void main(String[] args)
    {
//        arithmeticTest();
//        inputMismatchTest();
//        arrayIndexOutOfBoundsTest();
//        nullPointerTest();

        try
        {
            System.out.println("[1]");
            fileNotFoundTest();
            System.out.println("[2]");
        }
        catch(FileNotFoundException e)
        {
            System.out.println("[3]");
//            e.printStackTrace();
            System.out.println("[Exception] : " + e.getMessage());
        }
        finally
        {
            System.out.println("[4]");
        }
        System.out.println("[5]");
        
    }

    /** ArithmeticException 산술 관련 예외 */
    public static void arithmeticTest()
    {
        //ArithmeticException 산술 관련 예외
        int n1 = 10;
        int n2 = 0;
        System.out.println("=================== ArithmeticException Test ===================");
        System.out.println(n1/n2);
        System.out.println("================================================================");
    }
    
    /** InputMisMatchException : 입력이 잘못된 경우 */
    public static void inputMismatchTest()
    {
        //InputMisMatchException : 입력이 잘못된 경우
        Scanner sc = new Scanner(System.in);
        boolean bCheck = false;
        int n1;
        
        System.out.println("=================== InputMisMatchException Test ===================");
        while(!bCheck)
        {
            try
            {
                System.out.print("정수 입력 : ");
                n1 = sc.nextInt();
                System.out.print(n1);
            }
            catch(InputMismatchException e)
            {
                System.out.println("입력이 잘못되었습니다.");
                System.out.println(e.getMessage());
            }
        }
        System.out.println("===================================================================");
        sc.close();
    }
    
    /** ArrayIndexOutOfBoundsException */
    public static void arrayIndexOutOfBoundsTest()
    {
        //ArrayIndexOutOfBounds
        int[] arr = {10,20, 30};
        
        System.out.println("=============== ArrayIndexOutOfBoundsException Test ===============");
        try
        {
            for(int i = 0; i<4; i++)
            {
                System.out.println(arr[i]);
            }
        }
        catch(ArrayIndexOutOfBoundsException e)
        {
            System.out.println("[Exception] : " + e.getMessage());
        }
        System.out.println("===================================================================");
    }
    
    /** NullPointerException : null 관련 예외 */
    public static void nullPointerTest() throws NullPointerException
    {
        //NullPointerException : null 관련 예외
        String str = null;

        System.out.println("==================== NullPointerException Test ====================");
        System.out.println(str);
//        if(str != null)
//        {
//            int len = str.length();
//        }
        // try ~ catch 문 사용한 예외처리
        try 
        {
//            int len = str.length();
        }
        catch(NullPointerException e)
        {
            System.err.println("[Exception] : " + e.getMessage());
        } 
       
        System.out.println("===================================================================");
    }
    
    /** FileNotFoundException : 파일 관련된 예외 */
    public static void fileNotFoundTest() throws FileNotFoundException
    {
        //FileNotFoundException : 파일 관련된 예외
        FileInputStream fis = null;

        System.out.println("=================== FileNotFoundException Test ====================");
//        try
//        {
            fis = new FileInputStream("C:/Users/user1/Desktop/KH/강의/231020.KH.강의.txt");
            
            System.out.println(fis);//노란줄 제거를 위한 변수 사용
            System.out.println("FileNotFoundException [1]");
//        } catch (FileNotFoundException e)
//        {
            System.out.println("FileNotFoundException [2]");
//            e.printStackTrace();
//        }
        System.out.println("===================================================================");
    }
}
