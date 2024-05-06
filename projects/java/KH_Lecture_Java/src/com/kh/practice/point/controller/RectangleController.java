package com.kh.practice.point.controller;

import com.kh.practice.point.model.vo.Rectangle;

/**
 * com.kh.practice.point.controller.RectangleController
 * package com.kh.practice.point.controller.RectangleController
 * class RectangleController
 * {
 *     - r:Rectangle = new Rectangle()
 *     + calcArea(x:int, y:int, height:int, width:int)       :String 받은 매개변수를 이용하여 필드들을 초기 화하고 초기화한 정보와 면적 반환 // 면적 : 너비 * 높이
 *     + calcPerimeter( x:int, y:int, height:int, width:int) :String 받은 매개변수를 이용하여 필드들을 초기 화하고 초기화한 정보와 둘레 반환 // 둘레 : 2 * (너비 + 높이)
 * }
 */
public class RectangleController
{
    private Rectangle r = new Rectangle();
    
    /** + calcArea(x:int, y:int, height:int, width:int) String
     *    받은 매개변수를 이용하여 필드들을 초기 화하고 초기화한 정보와 면적 반환 
     *    면적 = 너비 * 높이        
     */
    public String calcArea(int  x, int y, int height, int width)
    {
        r.setX(x);
        r.setY(y);
        r.setHeight(height);
        r.setWidth(width);
        return r.toString() + ",  " + height * width;
    }
    
    /** + calcPerimeter( x:int, y:int, height:int, width:int) String
     *    받은 매개변수를 이용하여 필드들을 초기 화하고 초기화한 정보와 둘레 반환 
     *    둘레 = 2 * (너비 + 높이)  
     */
    public String calcPerimeter(int  x, int y, int height, int width)
    {
        r.setX(x);
        r.setY(y);
        r.setHeight(height);
        r.setWidth(width);
        return r.toString() + ",  " + 2 * (height + width);
    }
}
