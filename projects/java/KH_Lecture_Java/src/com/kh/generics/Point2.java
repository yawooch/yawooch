package com.kh.generics;

//제네릭 클래스 <K, V, T, E, M,..>
public class Point2<T,V>// 타입 매개변수 2개(T, V)
{
    //멤버변수의 타입을 타입  매개변수를 사용하여 선언
    T x;  // T타입의 x변수
    V y;  // V타입의 y변수
    
    public Point2(T x, V y) // T타입의 x, V타입의 y 매개변수 정의
    { 
        this.x = x;        // 전달받은 x값을 멤버변수 x에 대입
        this.y = y;        // 전달받은 y값을 멤버변수 y에 대입
    }
    
    //getter 메소드
    public T getX()
    {
        return x;
    }
    public V getY()
    {
        return y;
    }
    //setter 메소드
    public void setX(T x)
    {
        this.x = x;
    }
    public void setY(V y)
    {
        this.y = y;
    }
}
