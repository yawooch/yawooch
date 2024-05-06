package com.kh.exception;

public class PWFormatException extends Exception
{
    private static final long serialVersionUID = 1L;

    //예외클래스 작성
    // [1] Exception 클래스를 상속한다
    
    //[2] 생성자 정의 문자열 매개변수를 하나 받는다
    //             => 예외발생시 표시할 내용
    //                  부모클래스의 생성자를 호출
    //                      전달받은 값을 인자값으로 전달
    public PWFormatException(String txt)
    {
        super(txt); // msg : 인자값
    }
}
