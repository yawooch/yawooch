package com.kh.classes.object;

public class Run
{
    public static void main(String[] args)
    {
        //Car 객체생성
        Car car1 = new Car();
//        car1.singingBell();
        car1.setMelody("AAA!");
        car1.singingBell();
    }
}