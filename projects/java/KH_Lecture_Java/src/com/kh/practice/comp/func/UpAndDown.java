package com.kh.practice.comp.func;

import java.util.Scanner;

public class UpAndDown
{
    /** 1부터 100 사이의 정수 중 임의의 난수가 정해지고 사용자는 정해진 난수를 맞추는데 몇 번 만에 맞췄는지 출력하세요. */
    public void upDown()
    {
        /*
         * 메소드 명 : public void upDown(){}
         * 1부터 100 사이의 정수 중 임의의 난수가 정해지고 사용자는 정해진 난수를 맞추는데
         * 몇 번 만에 맞췄는지 출력하세요.
         * ex.
         * 난수를 입력하세요: 90
         * 1~100 사이의 임의의 난수를 맞춰보세요 : 0
         * 1~100 사이의 숫자를 입력해주세요.
         * 1~100 사이의 임의의 난수를 맞춰보세요 : 101
         * 1~100 사이의 숫자를 입력해주세요.
         * 1~100 사이의 임의의 난수를 맞춰보세요 : 50
         * UP !
         * 1~100 사이의 임의의 난수를 맞춰보세요 : 75
         * UP !
         * 1~100 사이의 임의의 난수를 맞춰보세요 : 83
         * UP !
         * 1~100 사이의 임의의 난수를 맞춰보세요 : 93
         * DOWN !
         * 1~100 사이의 임의의 난수를 맞춰보세요 : 89
         * UP !
         * 1~100 사이의 임의의 난수를 맞춰보세요 : 92
         * DOWN !
         * 1~100 사이의 임의의 난수를 맞춰보세요 : 90
         * 정답입니다 !!
         * 7회만에 맞추셨습니다.
         */
        Scanner sc = new Scanner(System.in);
        
//        System.out.print("난수를 입력하세요: ");
//        int random = sc.nextInt();
        int random = (int)(Math.random() * 100 + 1) ;
        
//        System.out.println("난수 : " + random);
        
        int count = 0;
        
        while(true) 
        {
            System.out.print("1~100 사이의 임의의 난수를 맞춰보세요 : ");
            int answer = sc.nextInt();
            if(answer < 1 || answer > 100)
            {
                System.out.println("1~100 사이의 숫자를 입력해주세요.");
                continue;
            }
            if(random < answer)
            {
                System.out.println("DOWN !");
                count ++ ;
            }
            else if(random > answer)
            {
                System.out.println("UP !");
                count ++ ;
            }
            else if(random == answer)
            {
                System.out.println("정답입니다아!!!!!!!!!!!!!!!!!!!!!!!!!!");
                System.out.println("* "+ count +"회만에 맞추셨습니다.!!!!!");
                break;
            }
        }
        
        sc.close();
    }
    
    /** 사용자의 이름을 입력하고 컴퓨터와 가위바위보를 하세요. */
    public void rps()
    {
        /*
         * 메소드 명 : public void rps(){}
         * 사용자의 이름을 입력하고 컴퓨터와 가위바위보를 하세요.
         * 컴퓨터가 가위인지 보인지 주먹인지는 랜덤한 수를 통해서 결정하도록 하고,
         * 사용자에게는 직접 가위바위보를 받으세요.
         * 사용자가 "exit"를 입력하기 전까지 가위바위보를 계속 진행하고 
         * "exit"가 들어가면 반복을 멈추고
         * 몇 번의 승부에서 몇 번 이기고 몇 번 비기고 몇 번 졌는지 출력하세요.'
         * ex)
         * 당신의 이름을 입력해주세요 : 박신우
         * 가위바위보 : 가위
         * 컴퓨터 : 가위
         * 박신우 : 가위
         * 비겼습니다.
         * 
         * 가위바위보 : 가위
         * 컴퓨터 : 바위
         * 박신우 : 가위
         * 졌습니다 ㅠㅠ
         * 
         * 가위바위보 : 보
         * 컴퓨터 : 보
         * 박신우 : 보
         * 비겼습니다.
         * 
         * 가위바위보 : 바위
         * 컴퓨터 : 바위
         * 박신우 : 바위
         * 비겼습니다.
         * 
         * 가위바위보 : 가위
         * 컴퓨터 : 바위
         * 박신우 : 가위
         * 졌습니다 ㅠㅠ
         * 
         * 가위바위보 : 보
         * 컴퓨터 : 바위
         * 박신우 : 보
         * 이겼습니다!
         * 
         * 가위바위보 : 보
         * 컴퓨터 : 바위
         * 박신우 : 보
         * 이겼습니다!
         * 
         * 가위바위보 : 안ㅇㄹ
         * 잘못 입력하셨습니다.
         * 가위바위보 : 가위
         * 컴퓨터 : 가위
         * 박신우 : 가위
         * 비겼습니다.
         * 
         * 가위바위보 : exit
         * 8전 2승 4무 2패
         */
        

        
        Scanner sc = new Scanner(System.in);
//        sc.close();
        
        System.out.print("당신의 이름을 입력해주세요 : ");
        String userNm = sc.nextLine();

        int win  = 0;
        int fail = 0;
        int draw = 0;
        
        while(true)
        {
            System.out.print("가위바위보 : ");
            String userRps = sc.nextLine();
            String resultStr = "";
            
//            int rpsSystemNum = (int)(Math.random() * 10)%3;
//            String rpsSystemStr = "";
//            if(rpsSystemNum == 0) rpsSystemStr = "가위";
//            if(rpsSystemNum == 1) rpsSystemStr = "바위";
//            if(rpsSystemNum == 2) rpsSystemStr = "보";
//            System.out.println(rpsSystemNum + " : " + rpsSystemStr);
            int rpsSystemNum = 2; 
            String rpsSystemStr = "보";
            
            String gameResult = "";
            
            if(userRps.equals("exit")) 
            {
                System.out.println((win + fail + draw)+ "전 "+ win +"승 " + draw + "무 " + fail + "패");
                sc.close();
                break;
            }
            if(!(userRps.equals("가위") ||userRps.equals("바위") ||userRps.equals("보"))) 
            {
                System.out.println("잘못 입력하셨습니다.");
                continue;
            }
            switch(rpsSystemNum) 
            {
            //컴퓨터 : 가위
            case 0 :
                if(userRps.equals("가위")) gameResult = "draw";
                if(userRps.equals("바위")) gameResult = "win";
                if(userRps.equals("보"))   gameResult = "fail";
                break;
            //컴퓨터 : 바위
            case 1 :
                if(userRps.equals("가위")) gameResult = "fail";
                if(userRps.equals("바위")) gameResult = "draw";
                if(userRps.equals("보"))   gameResult = "win";
                break;
            //컴퓨터 : 보
            case 2 :
                if(userRps.equals("가위")) gameResult = "win";
                if(userRps.equals("바위")) gameResult = "fail";
                if(userRps.equals("보"))   gameResult = "draw";
                break;
            }
            
            switch(gameResult)
            {
            case "win" :
                win++;
                resultStr = "이겼습니다!";
                break;
            case "fail" :
                fail++;
                resultStr = "졌습니다 ㅠㅠ";
                break;
            case "draw" :
                draw++;
                resultStr = "비겼습니다.";
                break;
            }
            System.out.println("컴퓨터 : " + rpsSystemStr);
            System.out.println(userNm + " : " + userRps);
            System.out.println(resultStr);
        }
        
    }
}
