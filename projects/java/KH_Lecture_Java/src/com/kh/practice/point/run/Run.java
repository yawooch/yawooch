package com.kh.practice.point.run;

import com.kh.practice.point.view.PointMenu;

/**
 * com.kh.practice.point.run.Run
 * package com.kh.practice.point.run;
 * 
 * class Run
 * {
 *     + main(args:String[]) : void
 * }
 */ 
public class Run
{
    public static void main(String[] args)
    {
        // PointMenu의 mainMenu() 실행
        PointMenu pm = new PointMenu();
        pm.mainMenu();
    }
}