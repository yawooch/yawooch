package com.kh.practice.point.model.vo;

/**
 * com.kh.practice.point.model.vo.Circle
 * package com.kh.practice.point.model.vo.Circle
 * class Circle
 * {
 *     - radius : int
 *     + Circle()                           : 기본 생성자
 *     + Circle()                           : 매개변수 생성자
 *     + getter/setter()
 *     + toString()                         : String 필드에 담긴 데이터를 반환하는 메소드
 * }
 */
public class Circle extends Point
{
    private int radius;

    /** 기본 생성자 */
    public Circle()
    {
        
    }
    /** 매개변수 생성자 */
    public Circle(int x, int y, int radius)
    {
        super(x, y);
        this.radius = radius;
    }
    
    @Override
    /** + toString() : String 필드에 담긴 데이터를 반환하는 메소드 */
    public String toString()
    {
        return super.toString() + ",  " + radius;
    }
    
    /** @return the radius */
    public int getRadius()
    {
        return radius;
    }
    /** @param radius the radius to set */
    public void setRadius(int radius)
    {
        this.radius = radius;
    }
}
