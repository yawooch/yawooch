package com.kh.exception;

import java.util.Scanner;

public class IDFormatTest
{
    //변수 : 사용자 ID(문자열, '-' -> 클래스내부에서만 접근)
    //       비밀번호 (문자열, '-' -> 클래스내부에서만 접근)
    private String userId; 
    private String userPw; 
    
    //사용자ID getter 메소드
    public String getUserId()
    {
        return userId;
    }
    //사용자ID setter 메소드
    public void setUserId(String userId) throws IDFormatException
    {
//        if(userId == null)
//        {
//            System.out.println("아이디는 null일 수 없습니다.");
//            return;
//        }
//        if(userId.length() < 8 || userId.length() > 20)
//        {
//            System.out.println("아이디는 8자 이상 20자 이하로 쓰세요");
//            return;
//        }
        
        //조건에 맞지 않은 경우 IDFormatException 예외 발생시키기
        //throw new 예외클래스명(userId);
        try
        {
            if(userId == null)
            {
                throw new IDFormatException("아이디는 null일 수 없습니다.");
//            System.out.println("아이디는 null일 수 없습니다.");
//            System.out.println("userId.length() : " + userId.length());
            }
            else if(userId.length() < 8 || userId.length() > 20)
            {
                throw new IDFormatException("아이디는 8자 이상 20자 이하로 쓰세요");
            }
            this.userId = userId;
        }
        catch (Exception e)
        {
            System.out.println("단비꺼으야~~~~~~~");
            System.out.println("[IDFormatException] : " + e.getMessage());
            System.out.println("[IDFormatException] : " + e.getClass());
        }
//        System.out.println("[Exception] : " + e.getMessage());
    }
    
    //비밀번호 getter 메소드
    //비밀번호 setter 메소드
    //  - 길이 제한 : 8자 이상 ~ 20자 이하
    //    범위를 벗어나면, "비밀번호 길이는 8자 이상 20자 이하여야합니다" 
//          내용과 함께 예외 발생
    //  - 문자랑 숫자가 포함된 경우 저장
    //    그렇지 않으면 "비밀번호는 문자와 숫자를 포함해야합니다" 예외처리
    // 예외 클래스 추가 : PWFormatException 
    // throw new PWFormatException();

    public String getUserPw()
    {
        return userPw;
    }
    
    
    public void setUserPw(String userPw) throws PWFormatException
    {
        if(!checkChar(userPw) || !checkNumber(userPw))
        {
            throw new PWFormatException("비밀번호는 문자와 숫자를 포함해야합니다");
        }
        if(userPw.length() < 8 || userPw.length() > 20)
        {
            throw new PWFormatException("비밀번호는 8자 이상 20자 이하로 쓰세요");
        }
        this.userPw = userPw;
//        try
//        {
//        }
//        catch (PWFormatException e)
//        {
//            System.out.println("[PWFormatException] : " + e.getMessage());
//        }
//        this.userPw = userPw;
    }
    
    private boolean checkChar(String userPw)
    {
        boolean bContains = false;
        for (int i = 0; i < userPw.length(); i++)
        {
            if(userPw.charAt(i) >= 'a' && userPw.charAt(i) <= 'z')
            {
                bContains = true;
                break;
            }
            else if(userPw.charAt(i) >= 'A' && userPw.charAt(i) <= 'Z')
            {
                bContains = true;
                break;
            }
        }
        return bContains;
    }

    private boolean checkNumber(String userPw)
    {
        boolean bContains = false;
        for (int i = 0; i < userPw.length(); i++)
        {
            if(userPw.charAt(i) >= '0' && userPw.charAt(i) <= '9')
            {
                bContains = true;
                break;
            }
        }
        return bContains;
    }
    
    //[1]전달받은 값이 null인 경우에 저장하지 않고
    //      "아이디는 null일 수 없습니다." 출력
    //[2] 전달받은 값의 길이가 8 이상 20 이하만 저장
    //      범위를 벗어날 경우 "아이디는 8자 이상 20자 이하로 쓰세요" 출력
    public static void main(String[] args)
    {
        Scanner sc        = new Scanner(System.in);
        IDFormatTest test = new IDFormatTest();
        
        String userId = null;
        String userPw = null;
        
        try
        {
            System.out.print("아이디 : ");
            userId = sc.nextLine();
            System.out.print("비밀번호 : ");
            userPw = sc.nextLine();
            test.setUserId(userId);
            test.setUserPw(userPw);
        }
        catch (IDFormatException | PWFormatException e)
        {
            System.out.println("[Exception] : " + e.getMessage());
            System.out.println("[Exception] : " + e.getClass());
        }
//        do
//        {
//        } while (test.getUserId() == null);
//        try
//        {
//            System.out.println("======================== Test1 =============================\n");
//            IDFormatTest ift = new IDFormatTest();
//            System.out.println(ift.getUserId());
//            
//            System.out.println("======================== Test2 =============================\n");
//            ift.setUserId(null);
//            System.out.println(ift.getUserId());
//            
//            System.out.println("======================== Test3 =============================\n");
//            ift.setUserId("안녕하세요 감사해요 잘있어요 다시만나요 #아따맘마#동동이#단비꺼야#추억의만화");
//            System.out.println(ift.getUserId());
//            
//            System.out.println("======================== Test4 =============================\n");
//            ift.setUserId("#단비꺼야#지랄병");
//            System.out.println(ift.getUserId());
//        } 
//        catch (IDFormatException e)
//        {
//            System.out.println("[IDFormatException main] : " + e.getMessage());
//        }
        
        sc.close();        
    }
}
