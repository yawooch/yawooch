package com.kh.practice.point.controller;

import com.kh.practice.point.model.vo.Circle;

/**
 * com.kh.practice.point.controller.CircleController
 * package com.kh.practice.point.controller.CircleController
 * class CircleController
 * {
 *     - c:Circle = new Circle()
 *     + calcArea(x:int, y:int, radius:int)   :String 받은 매개변수를 이용하여 필드들을 초기 화하고 초기화한 정보와 면적 반환 // 면적 : PI * 반지름 * 반지름
 *     + calcCircum(x:int, y:int, radius:int) :String 받은 매개변수를 이용하여 필드들을 초기 화하고 초기화한 정보와 둘레 반환 // 둘레 : PI * 반지름 * 2
 * }
 */
public class CircleController
{
    private Circle c          = new Circle();

    /** + calcArea(x:int, y:int, radius:int)
     *     String 받은 매개변수를 이용하여 필드들을 초기화하고 초기화한 정보와 면적 반환
     *     면적 : PI * 반지름 * 반지름
     */
    public String calcArea(int x, int y, int radius)
    {
        c.setX(x);
        c.setY(y);
        c.setRadius(radius);
        return c.toString() + ",  " + Double.toString(radius * radius * Math.PI);
    }
    
    /** + calcCircum(x:int, y:int, radius:int)
     *    String 받은 매개변수를 이용하여 필드들을 초기 화하고 초기화한 정보와 둘레 반환
     *    둘레 : PI * 반지름 * 2 
     */
    public String calcCircum(int x, int y, int radius)
    {
        c.setX(x);
        c.setY(y);
        c.setRadius(radius);
        return c.toString() + ",  " + Double.toString(radius * 2 * Math.PI);
    }
}
