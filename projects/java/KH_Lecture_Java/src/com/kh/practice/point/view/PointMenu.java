package com.kh.practice.point.view;

import java.util.Scanner;
import com.kh.practice.point.controller.CircleController;
import com.kh.practice.point.controller.RectangleController;

/**
 * com.kh.practice.point.view.PointMenu
 * package com.kh.practice.point.view.PointMenu
 * class PointMenu
 * {
 *     -sc:Scanner             = new Scanner(System.in)
 *     -cc:CircleController    = new CircleController
 *     -rc:RectangleController = new RectangleController
 *     + mainMenu()      :void 메인   메뉴 출력, 잘못 입력했을시 다시 받도록 반복
 *     + circleMenu()    :void 원     메뉴 출력, 잘못 입력했을시 메인메뉴로 돌아감
 *     + rectangleMenu() :void 사각형 메뉴 출력, 잘못 입력했을시 메인메뉴로 돌아감
 *     + calcCircum()    :void X, y 좌표와 반지름을 받아 원의 정보와 원 둘레 출력
 *     + calcCircleArea():void X, y 좌표와 반지름을 받아 원의 정보와 원 넓이 출력
 *     + calcPerimeter() :void X, y 좌표와 높이, 너비를 받아 사각형의 정보와 사각형 둘레 출력
 *     + calcRectArea()  :void X, y 좌표와 높이, 너비를 받아 사각형의 정보와 사각형 넓이 출력
 * }
 */
public class PointMenu
{
    private Scanner             sc = new Scanner(System.in);
    private CircleController    cc = new CircleController();
    private RectangleController rc = new RectangleController();
    

    /** + mainMenu()      :void 메인메뉴 출력, 잘못 입력했을시 다시 받도록 반복 */
    public void mainMenu()
    {
        /*
            ===== 메뉴 =====
            1. 원     ➔ circleMenu()
            2. 사각형 ➔ rectangleMenu()
            9. 끝내기
            메뉴 번호 :
        */
        int menuEnd;
        do
        {
            System.out.println("\n===== 메뉴 =====");
            System.out.println("1. 원");
            System.out.println("2. 사각형");
            System.out.println("9. 끝내기");
            System.out.print("메뉴 번호 :");
            menuEnd = sc.nextInt();
            sc.nextLine();
            
            switch (menuEnd)
            {
            case 1:
            {
                circleMenu();
                break;
            }
            case 2:
            {
                rectangleMenu();
                break;
            }
            case 9:
                System.out.println("종료합니다.");
                break;
            default:
                break;
            }
        }
        while(menuEnd != 9);
    }
    
    /** + circleMenu()    :void 원     메뉴 출력, 잘못 입력했을시 메인메뉴로 돌아감 */
    public void circleMenu()
    {
        /*
        ===== 원 메뉴 =====
        1. 원 둘레 ➔ calcCircum()
        2. 원 넓이 ➔ calcCircleArea()
        9. 메인으로
        메뉴 번호 :
         */

        int menuEnd;
        System.out.println("\n===== 원 메뉴 =====");
        System.out.println("1. 원 둘레");
        System.out.println("2. 원 넓이");
        System.out.println("9. 메인으로");
        System.out.print("메뉴 번호 :");
        menuEnd = sc.nextInt();
        sc.nextLine();
        
        switch (menuEnd)
        {
        case 1:
        {
            calcCircum();
            break;
        }
        case 2:
        {
            calcCircleArea();
            break;
        }
        }
    }
    
    /** + rectangleMenu() :void 사각형 메뉴 출력, 잘못 입력했을시 메인메뉴로 돌아감 */
    public void rectangleMenu()
    {
        /*
        ===== 메뉴 =====
        1. 사각형 둘레 ➔ calcPerimeter()
        2. 사각형 넓이 ➔ calcRectArea()
        3. 메인으로
        메뉴 번호 :
        */
        int menuEnd;
        System.out.println("\n===== 사각형 메뉴 =====");
        System.out.println("1. 사각형 둘레");
        System.out.println("2. 사각형 넓이");
        System.out.println("3. 메인으로");
        System.out.print("메뉴 번호 :");
        menuEnd = sc.nextInt();
        sc.nextLine();
        
        switch (menuEnd)
        {
        case 1:
        {
            calcPerimeter();
            break;
        }
        case 2:
        {
            calcRectArea();
            break;
        }
        }
    }
    
    /** + calcCircum()    :void X, y 좌표와 반지름을 받아 원의 정보와 원 둘레 출력 */
    public void calcCircum()
    {
        /*
        x 좌표 :
        y 좌표 :
        반지름 :
        // 데이터를 CircleController(cc)의 calcCircum()의 매개변수로 보내 반환 값 출력
         */
        int x;
        int y;
        int radius;
        System.out.print("x 좌표 : ");
        x      = sc.nextInt();
        System.out.print("y 좌표 : ");
        y      = sc.nextInt();
        System.out.print("반지름 : ");
        radius = sc.nextInt();
        sc.nextLine();
        
        System.out.println(cc.calcCircum(x, y, radius));
    }
    
    /** + calcCircleArea():void X, y 좌표와 반지름을 받아 원의 정보와 원 넓이 출력 */
    public void calcCircleArea()
    {
        /*
        x 좌표 :
        y 좌표 :
        반지름 :
        // 데이터를 CircleController(cc)의 calcArea()의 매개변수로 보내 반환 값 출력
         */
        int x;
        int y;
        int radius;
        System.out.print("x 좌표 : ");
        x      = sc.nextInt();
        System.out.print("y 좌표 : ");
        y      = sc.nextInt();
        System.out.print("반지름 : ");
        radius = sc.nextInt();
        sc.nextLine();
        
        System.out.println(cc.calcArea(x, y, radius));
    }
    
    /** + calcPerimeter() :void X, y 좌표와 높이, 너비를 받아 사각형의 정보와 사각형 둘레 출력 */
    public void calcPerimeter()
    {
        /*
        x 좌표 :
        y 좌표 :
        높이 :
        너비 :
        // 데이터를 RectangleController(rc) calcPerimeter()의 매개변수로 보내 반환값 출력
         */
        
        int x;
        int y;
        int width;
        int height;
        System.out.print("x 좌표 : ");
        x      = sc.nextInt();
        System.out.print("y 좌표 : ");
        y      = sc.nextInt();
        System.out.print("높이   : ");
        height = sc.nextInt();
        System.out.print("너비   : ");
        width  = sc.nextInt();
        sc.nextLine();
        
        System.out.println(rc.calcPerimeter(x, y, height, width));
    }
    
    /** + calcRectArea()  :void X, y 좌표와 높이, 너비를 받아 사각형의 정보와 사각형 넓이 출력 */
    public void calcRectArea() 
    {
        /*
        x 좌표 :
        y 좌표 :
        높이 :
        너비 :
        // 데이터를 RectangleController(rc) calcArea()의 매개변수로 보내 반환값 출력
         */

        int x;
        int y;
        int width;
        int height;
        System.out.print("x 좌표 : ");
        x      = sc.nextInt();
        System.out.print("y 좌표 : ");
        y      = sc.nextInt();
        System.out.print("높이   : ");
        height = sc.nextInt();
        System.out.print("너비   : ");
        width  = sc.nextInt();
        sc.nextLine();
        
        System.out.println(rc.calcArea(x, y, height, width));
    }
    

    /**
     * @return the sc
     */
    public Scanner getSc()
    {
        return sc;
    }
    /**
     * @param sc the sc to set
     */
    public void setSc(Scanner sc)
    {
        this.sc = sc;
    }
    /**
     * @return the cc
     */
    public CircleController getCc()
    {
        return cc;
    }
    /**
     * @param cc the cc to set
     */
    public void setCc(CircleController cc)
    {
        this.cc = cc;
    }
    /**
     * @return the rc
     */
    public RectangleController getRc()
    {
        return rc;
    }
    /**
     * @param rc the rc to set
     */
    public void setRc(RectangleController rc)
    {
        this.rc = rc;
    }
}
