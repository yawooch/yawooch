package com.kh.practice.point.model.vo;

/**
 * com.kh.practice.point.model.vo.Rectangle
 * package com.kh.practice.point.model.vo.Rectangle
 * class Rectangle
 * {
 *     - width : int
 *     - height : int
 *     + Rectangle()                                      : 기본 생성자
 *     + Rectangle(x:int, y:int, width:int, height:int)  : 매개변수 생성자
 *     + getter/setter()
 *     + toString()                                       : String 필드에 담긴 데이터를 반환하는 메소드
 * }
 */
public class Rectangle extends Point
{
    private int width;
    private int height;
    
    /** + Rectangle() : 기본 생성자 */
    public Rectangle()
    {
        
    }

    /** + Rectangle(x:int, y:int, width:int, height:int)  : 매개변수 생성자 */
    public Rectangle(int x, int y, int width, int height)
    {
        super(x, y);
        this.width  = width;
        this.height = height;
    }
    
    @Override
    /** + toString() : String 필드에 담긴 데이터를 반환하는 메소드  */
    public String toString()
    {
        return super.toString() + ",  " + height + ",  " + width;
    }
    
    /** + getter/setter() */

    /**@return the width */
    public int getWidth()
    {
        return width;
    }

    /** @param width the width to set */
    public void setWidth(int width)
    {
        this.width = width;
    }

    /** @return the height */
    public int getHeight()
    {
        return height;
    }

    /** @param height the height to set */
    public void setHeight(int height)
    {
        this.height = height;
    }
    
    
}
