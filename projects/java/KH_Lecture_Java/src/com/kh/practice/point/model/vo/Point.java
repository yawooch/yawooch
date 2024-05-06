package com.kh.practice.point.model.vo;
/**
 * com.kh.practice.point.model.vo.Point
 * package com.kh.practice.point.model.vo.Point
 * class Point
 * {
 *     - x : int
 *     - y : int
 *     + Point()              : 기본 생성자
 *     + Point(x:int, y:int)  : 매개변수 생성자
 *     + getter/setter()
 *     + toString() : String  : String 필드에 담긴 데이터를 반환하는 메소드
 * }
 */
public class Point
{
    private int x;
    private int y;

    /** 기본 생성자 */
    public Point()
    {
        
    }
    /** 매개변수 생성자 */
    public Point(int x, int y)
    {
        this.x = x;
        this.y = y;
    }
    
    @Override
    /** + toString() : String  : String 필드에 담긴 데이터를 반환하는 메소드 */
    public String toString()
    {
        return x + ",  " + y;
    }
    
    /** @return the x */
    public int getX()
    {
        return x;
    }
    /** @param x the x to set */
    public void setX(int x)
    {
        this.x = x;
    }
    /** @return the y */
    public int getY()
    {
        return y;
    }
    /** @param y the y to set */
    public void setY(int y)
    {
        this.y = y;
    }    
}
