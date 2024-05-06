package com.kh.generics;

public class GenericMethod
{

    //제네릭 메소드 
    // Point 제네릭클래스 타입의 변수를 2개
    public static <T, E> double makeRectangle(Point<T, E> p1, Point2<T, E> p2)
    {
        double left   = ((Number)p1.getX()).doubleValue();
        double right  = ((Number)p2.getX()).doubleValue();
        double top    = ((Number)p1.getY()).doubleValue();
        double bottom = ((Number)p2.getY()).doubleValue();

        double width  = right  - left;
        double height = bottom - top;
        
        return width * height;
    }
    
    public static void main(String[] args)
    {
    }
}
