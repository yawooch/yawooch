package com.kh.practice.chap02.loop;

import java.util.Scanner;

public class LoopPractice
{
    /** 사용자로부터 한 개의 값을 입력 받아 1부터 그 숫자까지의 모든 숫자를 거꾸로 출력하세요. */
    public void practice3()
    {
        /*
         * 메소드 명 : public void practice3(){}
         * 사용자로부터 한 개의 값을 입력 받아 1부터 그 숫자까지의 모든 숫자를 거꾸로 출력하세요.
         * 단, 입력한 수는 1보다 크거나 같아야 합니다.
         * ex 1).
         * 1이상의 숫자를 입력하세요 : 4 
         * 4 3 2 1
         * ex 2)
         * 1이상의 숫자를 입력하세요 : 0
         * 이상의 숫자를 입력해주세요.
        */
        Scanner sc = new Scanner(System.in);
        int input ;
        System.out.print("1이상의 숫자를 입력하세요 : ");
        input = sc.nextInt();
        
        if(input < 1)
        {            
            System.out.println("1 이상의 숫자를 입력해주세요.");
        }
        else
        {
            for(int i = input; i >= 1; i --) 
            {
                System.out.print(i + "  ");
            }
        }
        
        sc.close();
    }
    
    /** “1 이상의 숫자를 입력해주세요”가 출력되면서 다시 사용자가 값을 입력하도록 하세요. */
    public void practice2() 
    {
        /*
         * 메소드 명 : public void practice2(){}
         * 위 문제와 모든 것이 동일하나, 1 미만의 숫자가 입력됐다면
         * “1 이상의 숫자를 입력해주세요”가 출력되면서 다시 사용자가 값을 입력하도록 하세요.
         * ex.
         * 1이상의 숫자를 입력하세요 : 4 
         * 1 2 3 4 
         * 1이상의 숫자를 입력하세요 : 0
         * 1 이상의 숫자를 입력해주세요.
         * 1이상의 숫자를 입력하세요 : 8
         * 1 2 3 4 5 6 7 8
        */ 

        int input ;
        Scanner sc = new Scanner(System.in);
        
        //방법1 while(true) + 분기문 사용
//        while(true)
//        {
//            System.out.print("1이상의 숫자를 입력하세요 : ");
//            input = sc.nextInt();
//            
//            if(input < 1)
//            {
//                System.out.println("1 이상의 숫자를 입력해주세요.");
//                continue;
//            }
//            else 
//            {
//                for(int i = 1; i <= input; i++) 
//                {
//                    System.out.print(i + "  ");
//                }
//                sc.close();
//                break;
//            }
//        }
        
        //방법2 do ~ while 사용
        do
        {
            System.out.print("1이상의 숫자를 입력하세요 : ");
            input = sc.nextInt();
            
            if(input < 1)
            {
                System.out.println("1 이상의 숫자를 입력해주세요.");
                continue;
            }
            else 
            {
                for(int i = 1; i <= input; i++) 
                {
                    System.out.print(i + "  ");
                }
                sc.close();
            }
        }
        while(input < 1);
        
    }
    
    /** 사용자로부터 두 개의 값을 입력 받아 그 사이의 숫자를 모두 출력하세요. */
    public void practice6() 
    {
        /*
         * 메소드 명 : public void practice6(){}
         * 사용자로부터 두 개의 값을 입력 받아 그 사이의 숫자를 모두 출력하세요.
         * 만일 1 미만의 숫자가 입력됐다면 “1 이상의 숫자를 입력해주세요“를 출력하세요.
         * ex 1)
         * 첫 번째 숫자 : 8
         * 두 번째 숫자 : 4
         * 4 5 6 7 8
         * ex 2)
         * 첫 번째 숫자 : 4
         * 두 번째 숫자 : 8
         * 4 5 6 7 8
         * ex 3)
         * 첫 번째 숫자 : 9
         * 두 번째 숫자 : 0
         * 1 이상의 숫자를 입력해주세요. 
         */
        Scanner sc = new Scanner(System.in);
        
        System.out.print("첫 번째 숫자 : ");
        int num1 = sc.nextInt();
        System.out.print("두 번째 숫자 : ");
        int num2 = sc.nextInt();
        
        int strtI;
        int endI  = num1 > num2?num1:num2;
        
        sc.close();
        if(num1 < 1 || num2 < 1) 
        {
            System.out.println("1 이상의 숫자를 입력해주세요.");
        }
        else
        {
            //방법 1
//            for(strtI = num1 > num2?num2:num1 ; strtI <= endI; strtI ++) 
//            {
//                System.out.print(strtI + " ");
//            }
            //방법 2 - 생략
            strtI = num1 > num2?num2:num1;
            for(;;)
            {
                if(strtI > endI)
                {
                    break;
                }
                System.out.print(strtI + " ");
                strtI++;
            }
            
        }
    }

    /** 사용자로부터 시작 숫자와 공차를 입력 받아
     *  일정한 값으로 숫자가 커지거나 작아지는 프로그램을 구현하세요.
     */
    public void practice11()
    {
        /*
         * 메소드 명 : public void practice11(){}
         * 사용자로부터 시작 숫자와 공차를 입력 받아
         * 일정한 값으로 숫자가 커지거나 작아지는 프로그램을 구현하세요.
         * 단, 출력되는 숫자는 총 10개입니다.
         * * ‘공차’는 숫자들 사이에서 일정한 숫자의 차가 존재하는 것을 말한다.
         * ex) 2, 7, 12, 17, 22 …
         * 
         * 5 5 5 5 => 여기서 공차는 5
         * ex.
         * 시작 숫자 : 4
         * 공차 : 3
         * 4 7 10 13 16 19 22 25 28 31
         * 
         * +) 
         * 0, 1 을 랜덤 값으로 받아 0일때 감소하도록, 1일때 증가하도록
         * 0, 1 : (Math.random() * 10 +1) % 2
         */
        Scanner sc = new Scanner(System.in);
        
        System.out.print("시작 숫자 : ");
        int startNum  = sc.nextInt();
        System.out.print("공차      : ");
        int tolerance = sc.nextInt();
        
        int random = ((int)Math.random() * 10 + 1) % 2;
        
        for(int i = 0; i < 10; i++)
        {
//            startNum = (startNum + (i == 0? 0: tolerance));
            System.out.print(startNum + "  ");
            if(random == 1)
                startNum += tolerance;
            else
                startNum -= tolerance;
            
        }
        sc.close();
    }

    /** 정수 두 개와 연산자를 입력 받고 입력된 연산자에 따라 알맞은 결과를 출력하세요. */
    public void practice12()
    {
        /*
         * 메소드 명 : public void practice12(){}
         * 정수 두 개와 연산자를 입력 받고 입력된 연산자에 따라 알맞은 결과를 출력하세요.
         * 단, 해당 프로그램은 연산자 입력에 “exit”라는 값이 들어올 때까지 무한 반복하며
         * exit가 들어오면 “프로그램을 종료합니다.”를 출력하고 종료합니다.
         * 또한 연산자가 나누기이면서 두 번째 정수가 0으로 들어오면
         * “0으로 나눌 수 없습니다. 다시 입력해주세요.”를 출력하며,
         * 없는 연산자가 들어올 시 “없는 연산자입니다. 다시 입력해주세요.”라고 출력하고
         * 두 경우 모두 처음으로 돌아가 사용자가 다시 연산자부터 입력하도록 하세요.
         * 
         * 1) 무한 반복
         * 2) exit가 들어오면 “프로그램을 종료합니다.”를 출력하고 종료합니다.
         * 3) 연산자가 나누기이면서 두 번째 정수가 0으로 들어오면 “0으로 나눌 수 없습니다. 다시 입력해주세요.”를 출력하고 처음부터
         * 4) 없는 연산자가 들어올 시 “없는 연산자입니다. 다시 입력해주세요.”라고 출력하고 처음부터
         * 
         * ex1 )
         * 연산자(+, -, *, /, %) : +
         * 정수1 : 10
         * 정수2 : 4
         * 10 + 4 = 14
         * ex2 )
         * 연산자(+, -, *, /, %) : /     
         * 정수1 : 10                    
         * 정수2 : 4                     
         * 10 / 4 = 2                    
         * ex3 )
         * 연산자(+, -, *, /, %) : ^     
         * 정수1 : 10                    
         * 정수2 : 4
         * 없는 연산자입니다. 다시 입력해주세요.
         * ex4 )
         * 연산자(+, -, *, /, %) : /
         * 정수1 : 10
         * 정수2 : 0
         * 0으로 나눌 수 없습니다. 다시 입력해주세요.
         * ex5 )
         * 연산자(+, -, *, /, %) : exit
         * 프로그램을 종료합니다.
         */
        
        while(true)
        {
            Scanner sc = new Scanner(System.in);
            
            String inputStr = "";
            
            System.out.print("연산자(+, -, *, /, %) : ");
            inputStr = sc.next();
            if(inputStr.equals("exit"))
            {
                System.out.println("프로그램을 종료합니다.");
                break;
            }
            System.out.print("정수1                 : ");
            int num1 = sc.nextInt();
            System.out.print("정수2                 : ");
            int num2 = sc.nextInt();
            
            char op          = inputStr.charAt(0);
            String resultStr = "";
            
            sc.close();
            switch(op)
            {
            case '+':
                resultStr = num1 + " " + op + " " + num2 + " = " + (num1 + num2);
                break;
            case '-':
                resultStr = num1 + " " + op + " " + num2 + " = " + (num1 - num2);
                break;
            case '*':
                resultStr = num1 + " " + op + " " + num2 + " = " + (num1 * num2);
                break;
            case '/':
                if(num2 ==0)
                {
                    resultStr = "0으로 나눌 수 없습니다. 다시 입력해주세요.";
                    break;
                }
                resultStr = num1 + " " + op + " " + num2 + " = " + (num1 / num2);
                break;
            case '%':
                if(num2 ==0)
                {
                    resultStr = "0으로 나눌 수 없습니다. 다시 입력해주세요.";
                    break;
                }
                resultStr = num1 + " " + op + " " + num2 + " = " + (num1 % num2);
                break;
            default : 
                resultStr = "없는 연산자입니다. 다시 입력해주세요.";
                continue;
            }
            System.out.println(resultStr);
            
//            String err = "";
//            int result = 0;
//            switch(op)
//            {
//            case '+':
//                resultStr = num1 + " " + op + " " + num2 + " = " + (num1 + num2);
//                break;
//            case '-':
//                resultStr = num1 + " " + op + " " + num2 + " = " + (num1 - num2);
//                break;
//            case '*':
//                resultStr = num1 + " " + op + " " + num2 + " = " + (num1 * num2);
//                break;
//            case '/':
//            case '%':
//                if(num2 ==0)
//                {
//                    err = "0으로 나눌 수 없습니다. 다시 입력해주세요.";
//                    break;
//                }
//                resultStr = num1 + " " + (op == '/'?'/' : '%') + " " + num2 + " = " + (op == '/'?(num1 / num2) : (num1 % num2));
//                break;
//            default : 
//                err = "없는 연산자입니다. 다시 입력해주세요.";
//                continue;
//            }
//            if(!err.isEmpty())
//            {
//                System.out.println(err);
//            }
//            else
//            {
//                System.out.println(resultStr);
//            }
            
            /*
             * sc.close();없이 실행했을때 발생한 이슈
             * 
             * 없는 연산자를 입력했을시 연산자 입력 부분이 건너뛰어지는 이슈
             *  : nextLine()과 nextInt(), next()의 차이 
             *  
             *  버퍼에 남아 있는 \n 이 두번째 연산자 입력 부분에서 건너뛰어진다.
             *  
             *  * 따라가기
             *  1) 두번째 정수 입력 받은후 버퍼 ex)              : 10\n
             *  2) 두번째 정수 입력 받은후 nextInt() 후 버퍼 ex) : \n
             *  3) 두번째 반복문 처음 nextLine() 실행전 버퍼 ex) : \n
             *  4) 두번째 반복문 처음 nextLine() 실행후 버퍼 ex) : 
             *  
             *  * 해결방법
             *   => 1) nextLine()을 한번 입력해주어 버퍼를 비워준다.
             *      2) Scanner를 close()와 같이 같이 사용해주어 버퍼가 비워지도록한다.
             *   
             *   궁금한점
             *   
             *   1) 버퍼의 내용을 확인할수 있을까?
             *   
             *   
             */
            /*
             * 문자열 관련 메소드
             * 1) charAt([index])      : 문자열에서 index에 문자값, 반환자료형 : 문자형(char)
             *                         // index : 정수(int), 문자열에서 위치, 0번부터 시작
             * 2) length()             : 문자열 길이, 반환자료형 : 정수(int)
             * 3) equals([비교할대상]) : 문자열 비교, 반환자료형 : 논리형(boolean, true false)
             * 4) isEmpty()            : 문자열이 빈값인지 확인, 반환자료형 : 논리형(boolean, true false)
             * 
             */
            
            
        }
    }
    
    /** 입력받은 값으로 * 피라미드 만들기 */
    public void practice13()
    {
        Scanner sc = new Scanner(System.in);
        
        System.out.print("정수 입력 : ");
        int num = sc.nextInt();

        //방법 1
        for(int i = 0; i < num; i++)
        {
            for(int j = 0; j < num-i; j ++)
            {
                System.out.print("*");
            }
            System.out.println();
        }
        
        //방법2
//        String inputStr = "*";
//        for(int i =0; i < num; i ++)
//        {
//            System.out.println(inputStr);
//            inputStr += "*";
//        }
        
        sc.close();
    }
    
    /** 입력받은 값으로 * 피라미드 만들기 */
    public void practice14()
    {
        Scanner sc = new Scanner(System.in);
        
        System.out.print("정수 입력 : ");
        int num = sc.nextInt();

        //방법 1
        for(int i = 0; i < num; i++)
        {
            for(int j = num; num-i <= j; j --)
            {
                System.out.print("*");
            }
            System.out.println();
        }
        
        //방법2 - for 문을 연속으로 사용하게되면 Case by Case 이지만 실행성능이 내려갈수 있다.
//        String inputStr = "";
//        for(int i = 0; i < num; i++)
//        {
//            inputStr += "*";
//        }
//        for(int i = 0; i < num; i ++)
//        {
//            System.out.println(inputStr.substring(0,inputStr.length()-i));
//        }
        
        sc.close();
    }
}
