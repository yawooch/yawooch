package com.kh.classes.object;

public class Vehicle
{
    String melody = "빵빵";   // 경적소리
    boolean isMove;           // 주행상태
    
    //부모클래스로 사용할 Vehicle

    /** 움직이고 있다고 출력 */
    public void move()
    {
        // 주행중 : true
        isMove = true;
    }

    /** 멈췄다고 출력 */
    public void stop()
    {
        // 정지 : false
        isMove = false;
    }

    /** 주행상태 출력 및 주행상태 반환 */
    public boolean checkMove()
    {
        if(isMove)
        {
            System.out.println("주행중 입니다.");
        }
        else
        {
            System.out.println("멈춘상태 입니다.");
        }
        
        return isMove;
    }
    /** 경적소리를 설정 */
    public void setMelody(String melody)
    {
        this.melody = melody;
    }

    /** 경적소리를 출력 */
    public void singingBell()
    {
        System.out.println(melody);
    }
}
