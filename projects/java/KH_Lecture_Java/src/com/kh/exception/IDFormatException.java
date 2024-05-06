package com.kh.exception;

public class IDFormatException extends Exception
{
    private static final long serialVersionUID = 1L;

    
    //생성자 : 문자열을 전달받아서 , 부모클래스의 생성자 호출할때 전달
    //          멤버변수를 초기화해주는 메소드
    //          매개변수 : 문자열 변수
    //          => 예외 발생시 출력할 내용(오류 내용)
    public IDFormatException(String txt)
    {
        super(txt);
    }
}
