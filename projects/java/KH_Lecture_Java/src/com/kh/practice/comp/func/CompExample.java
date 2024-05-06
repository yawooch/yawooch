package com.kh.practice.comp.func;

import java.util.Scanner;

public class CompExample
{
    
    /** 정수를 입력 받아 양수일 때만 1부터 입력 받은 수까지 홀수/짝수를 나눠서
     * 홀수면 ‘박’, 짝수면 ‘수’를 출력하도록 하세요. */
    public void practice1()
    {
        /*
         * 메소드 명 : public void practice1(){}
         * 정수를 입력 받아 양수일 때만 1부터 입력 받은 수까지 홀수/짝수를 나눠서
         * 홀수면 ‘박’, 짝수면 ‘수’를 출력하도록 하세요.
         * 단, 입력 받은 수가 양수가 아니면 “양수가 아닙니다”를 출력하세요.
         * ex.
         * 정수 : 5
         * 박수박수박
         * 정수 : 10
         * 박수박수박수박수박수
         * 정수 : 0
         * 양수가 아닙니다.
         */
        Scanner sc = new Scanner(System.in);
        
        System.out.print("정수 : ");
        int num       = sc.nextInt();
        String result = "";
        
        if(num < 1) 
        {
            System.out.println("양수가 아닙니다.");
        }
        for(int i = 1; i <= num; i++)
        {
            result += i %2 == 1? "박": "수";
        }
        System.out.println(result);
        
        sc.close();
    }
    
    /** 위 문제와 동일하나, 1 미만의 숫자가 입력됐다면 “양수가 아닙니다.”가 출력되면서 다시 사용자가 값을 입력하도록 하세요. */
    public void practice2()
    {
        /*
         * 메소드 명 : public void practice2(){}
         * 위 문제와 모든 것이 동일하나, 1 미만의 숫자가 입력됐다면
         * “양수가 아닙니다.”가 출력되면서 다시 사용자가 값을 입력하도록 하세요.
         * ex.
         * 정수 : 4
         * 박수박수
         * 정수 : 0
         * 양수가 아닙니다.
         * 정수 : -3
         * 양수가 아닙니다.
         * 정수 : 6
         * 박수박수박수
         */
        int num;
        
        do 
        {
            Scanner sc = new Scanner(System.in);
            
            System.out.print("정수 : ");
            num           = sc.nextInt();
            String result = "";
            if(num < 1) 
            {
                System.out.println("양수가 아닙니다.");
            }
            else
            {
                for(int i = 1; i <= num; i++)
                {
                    result += i %2 == 1? "박": "수";
                }
                System.out.println(result);
                sc.close();
            }
        }
        while(num < 1);
    }
    
    /** 사용자로부터 문자열을 입력 받고 문자열에서 검색될 문자를 입력 받아 해당 문자열에 그 문자가 몇 개 있는지 개수를 출력하세요. */
    public void practice3()
    {
        /*
         * 메소드 명 : public void practice3(){}
         * 사용자로부터 문자열을 입력 받고 문자열에서 검색될 문자를 입력 받아 해당 문자열에 그 문자가
         * 몇 개 있는지 개수를 출력하세요.
         * ex.
         * 문자열 : banana
         * 문자   : a
         * banana 안에 포함된 a 개수 : 3
         */
        Scanner sc = new Scanner(System.in);
        
        System.out.print("문자열 : ");
        String inputStr  = sc.nextLine();
        System.out.print("문자   : ");
        char cont        = sc.next().charAt(0);
        String result    = inputStr + " 안에 포함된" + "개수 : ";
        int num = 0;
        
        for(int i = 0; i < inputStr.length(); i++)
        {
            if(cont == inputStr.charAt(i))
            {
                num ++;
            }
        }
        System.out.println(result + num);
        
        sc.close();
    }    
    
    /** practice3() + "더 하시겠습니까?"라고 추가 */
    public void practice4()
    {
        /*
         * 메소드 명 : public void practice4(){}
         * 위 문제와 모든 것이 동일하고, 
         * "더 하시겠습니까?"라고 추가
         * N 또는 n : 프로그램을 끝내고
         * Y 또는 y : 계속 진행
         * 다른 문자를 입력했을 경우 : "잘못된 대답입니다. 다시 입력해주세요."출력 후 "더 하시겠습니까?"
         * ex.
         * 문자열 : application       
         * 문자 : a                   
         * 포함된 개수 : 2            
         * 더 하시겠습니까? (y/n) : y 
         * 문자열 : business          
         * 문자 : s                   
         * 포함된 개수 : 3            
         * 더 하시겠습니까? (y/n) : k
         * 잘못된 대답입니다. 다시 입력해주세요.
         * 더 하시겠습니까? (y/n) : Y
         * 문자열 : ant
         * 문자 : b
         * 포함된 개수 : 0
         * 더 하시겠습니까? (y/n) : N
         */
        
//        boolean bigAsk = true;
//        
//        while(bigAsk)
//        {
//            Scanner sc = new Scanner(System.in);
//            System.out.print("문자열 : ");
//            String inputStr  = sc.nextLine();
//            System.out.print("문자   : ");
//            char cont        = sc.next().charAt(0);
//            String result    = "포함된 개수 : ";
//            int num = 0;
//            
//            for(int i = 0; i < inputStr.length(); i++)
//            {
//                if(cont == inputStr.charAt(i))
//                {
//                    num ++;
//                }
//            }
//            System.out.println(result + num);
//            boolean smallAsk = true;
//            do
//            {
//                System.out.print("더 하시겠습니까? (y/n) : ");
//                char chAsk        = sc.next().charAt(0);
//                if(chAsk == 'Y' || chAsk == 'y')
//                {
//                    bigAsk   = true;
//                    smallAsk = false;
//                }
//                else if(chAsk == 'N' || chAsk == 'n')
//                {
//                    bigAsk   = false;
//                    smallAsk = false;
//                    sc.close();
//                }
//                else
//                {
//                    System.out.println("잘못된 대답입니다. 똑띠 입력해주세요.");
//                    smallAsk = true;
//                }
//            }while(smallAsk);
//        }
        
        
//        boolean initBool = false;
//        while(true)
//        {
//            Scanner sc = new Scanner(System.in);
//            
//            char chAsk;
//            
//            if(initBool)
//            {
//                System.out.print("더 하시겠습니까? (y/n) : ");
//                chAsk        = sc.next().charAt(0);
//                if(chAsk == 'N' || chAsk == 'n')
//                {
//                    sc.close();
//                    break;
//                }
//                else if(!(chAsk == 'Y' || chAsk == 'y'))
//                {
//                    System.out.println("잘못된 대답입니다. 똑띠 입력해주세요.");
//                    continue;
//                }
//                sc.nextLine();
//            }
//            
//            System.out.print("문자열 : ");
//            String inputStr  = sc.nextLine();
//            System.out.print("문자   : ");
//            char cont        = sc.next().charAt(0);
//            String result    = "포함된 개수 : ";
//            int num = 0;
//            
//            for(int j = 0; j < inputStr.length(); j++)
//            {
//                if(cont == inputStr.charAt(j))
//                {
//                    num ++;
//                }
//            }
//            System.out.println(result + num);
//            initBool = true;
//        }
        
        char chAsk ;
        Scanner sc = new Scanner(System.in);
        do
        {
            System.out.print("문자열 : ");
            String inputStr  = sc.nextLine();
            System.out.print("문자   : ");
            char cont        = sc.next().charAt(0);
            String result    = inputStr + " 안에 포함된 " + cont + " 개수 : ";
            int num = 0;
            
            for(int i = 0; i < inputStr.length(); i++)
            {
                if(cont == inputStr.charAt(i))
                {
                    num ++;
                }
            }
            System.out.println(result + num);
            do
            {
                System.out.print("더 하시겠습니까? (y/n) : ");
                chAsk        = sc.next().charAt(0);
                sc.nextLine();
            }
            while(chAsk != 'Y' && chAsk != 'y' && chAsk != 'N' && chAsk != 'n');
        }while(chAsk != 'Y' && chAsk != 'y');
        sc.close();
    }
}
