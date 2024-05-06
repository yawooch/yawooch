package com.kh.classes;

public class BookNumber
{
    /*
     * static - 싱글톤 패턴
     * 인스턴스를 단 하나만 생성하는 디자인 패턴
     * [1] 생성자를 private로 지정
     * [2] 클래스 내부에 static 인스턴스 생성
     * [3] 외부에서 접근 가능한 public 메소드 생성
     */
    int number = 1;
    
    //[1] 생성자를 private로 지정
    //static 인스턴스생성
    private static BookNumber bn = new BookNumber();
    
    //[1] 생성자를 private로 지정
    //private 생성자
    private BookNumber() {};
    
    //[2] 클래스 내부에 static 인스턴스 생성
    public BookNumber getInstance()
    {
        return bn;
    }
    
    //[3] 외부에서 접근 가능한 public 메소드 생성
    public int addNumber()
    {
        return number++;
    }
}
