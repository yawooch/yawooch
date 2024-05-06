package com.kh.condition.practice;

import java.util.Scanner;

public class ControlPractice
{
    /**
     * 정수를 입력 받아 1 ~ 100 사이의 값인 경우 입력 값을 출력하고,
     * 범위를 벗어난 경우 "잘못 입력되었습니다.”를 출력하세요.
     * Class Name : com.kh.practice.ControlPractice
     * 실행 클래스 : com.kh.practice.Run
     * ex.
     * 입력: 55
     * 결과: 55
     */
    public void method1() 
    {
        /* 
         * Class Name : com.kh.practice.ControlPractice
         * 실행 클래스 : com.kh.practice.Run
         * 정수를 입력 받아 1 ~ 100 사이의 값인 경우 입력 값을 출력하고,
         * 범위를 벗어난 경우 "잘못 입력되었습니다.”를 출력하세요.
         * ex.
         * 입력: 55
         * 결과: 55
         */
        Scanner sc = new Scanner(System.in);
        
        System.out.print("입력: ");
        int input = sc.nextInt();
        
        String result = "";
        
        if(input < 1 || input > 100)
        {
            result = "잘못 입력되었습니다.";
        }
        else
        {
            result = "" + input;
            
        }
        System.out.println("결과: " + result);
        
        sc.close();
    }
    
    /**
     * 세 과목 점수 40점 이상이고, 평균이 60점 이상인 경우 "합격" 그렇지 않으면 "불합격"을 출력하세요.
     * 실수형으로 국어, 영어, 수학 세 과목의 점수를 입력 받아 총점과 평균을 출력하고
     * Class Name : com.kh.practice.ControlPractice
     * 실행 클래스 : com.kh.practice.Run
     * ex.
     * 국어 : 90.0
     * 영어 : 90.0
     * 수학 : 90.0
     * 총점은 270점이고, 평균은 90점입니다.
     * 합격입니다.
     */
    public void method2() 
    {
        /* 
         * Class Name : com.kh.practice.ControlPractice
         * 실행 클래스 : com.kh.practice.Run
         * 실수형으로 국어, 영어, 수학 세 과목의 점수를 입력 받아 총점과 평균을 출력하고
         * 세 과목 점수 40점 이상이고, 평균이 60점 이상인 경우 "합격" 그렇지 않으면 "불합격"을 출력하세요.
         * ex.
         * 국어 : 90.0
         * 영어 : 90.0
         * 수학 : 90.0
         * 총점은 270점이고, 평균은 90점입니다.
         * 합격입니다.
         */
        Scanner sc = new Scanner(System.in);
        
        double korScore;
        double engScore;
        double mthScore;
        
        String printStr = "";
        
        System.out.print("국어: ");
        korScore = sc.nextDouble();
        System.out.print("영어: ");
        engScore = sc.nextDouble();
        System.out.print("수학: ");
        mthScore = sc.nextDouble();
        
        int avg = (int)(korScore + engScore + mthScore)/3;
        System.out.printf("총점은 %d점이고, 평균은 %d점입니다.\n",(int)(korScore + engScore + mthScore) ,avg);
        
        if(korScore >= 40 && engScore >= 40 && mthScore >= 40 && avg >= 60)
        {
            printStr = "합격입니다.";
        }
        else
        {
            printStr = "불합격입니다.";
            
        }
        System.out.println(printStr);
        
        sc.close();
    }
    
    /**
     * 키와 몸무게를 입력받아 BMI를 계산하여 저체중/정상체중/과체중/비만을 출력하세요.
     * BMI 계산식 : 몸무게(kg)/(키(m) x 키(m))
     * 저체중: 18.5 이하, 정상체중: 18.5 ~ 22.9, 과체중: 23.0 ~ 24.9, 비만: 25.0 이상
     * Class Name : com.kh.practice.ControlPractice
     * 실행 클래스 : com.kh.practice.Run
     * ex.
     * 키(cm) : 165.2
     * 몸무게(kg) : 55.3
     * BMI는 20.2로 정상입니다.
     */
    public void method3() 
    {
        /* 
         * Class Name : com.kh.practice.ControlPractice
         * 실행 클래스 : com.kh.practice.Run
         * 키와 몸무게를 입력받아 BMI를 계산하여 저체중/정상체중/과체중/비만을 출력하세요.
         * BMI 계산식 : 몸무게(kg)/(키(m) x 키(m))
         * 저체중  : 18.4 이하, 
         * 정상체중: 18.5 ~ 22.9, 
         * 과체중  : 23.0 ~ 24.9, 
         * 비만    : 25.0 이상
         * ex.
         * 키(cm) : 165.2
         * 몸무게(kg) : 55.3
         * BMI는 20.2로 정상입니다.
         */
        Scanner sc = new Scanner(System.in);
        
        double height;
        double weight;
        
        String evalCmmt = "";
        
        System.out.print("키(cm) : ");
        height = sc.nextDouble()/100;
        System.out.print("몸무게(kg) : ");
        weight = sc.nextDouble();
        
        double calcBmi = weight / (height * height) ;
        
        if(calcBmi <= 18.4)
        {
            evalCmmt = "저체중";
        }
        else if (calcBmi >= 18.5 && calcBmi <= 22.9)
        {
            evalCmmt = "정상체중";
        }
        else if (calcBmi >= 23.0 && calcBmi <= 24.9)
        {
            evalCmmt = "과체중";
        }
        else if (calcBmi >= 25.0)
        {
            evalCmmt = "비만";
        }
        System.out.printf("BMI는 %.1f로 %s입니다.",calcBmi, evalCmmt);
        
        sc.close();
    }
    
    /**
     * 사용자로부터 아이디와 비밀번호를 입력받아 미리 저장된 값과 비교하여 같을 경우 "로그인 성공",
     * 그렇지 않은 경우 "로그인 실패"를 출력하세요. (초기값=>아이디: kh_manager, 비밀번호: 1234567)
     * Class Name : com.kh.practice.ControlPractice
     * 실행 클래스 : com.kh.practice.Run
     * ex.
     * 아이디: kh_manager
     * 비밀번호: 1234567
     * 로그인 성공
     */
    public void method4() 
    {
        /* 
         * Class Name : com.kh.practice.ControlPractice
         * 실행 클래스 : com.kh.practice.Run
         * 사용자로부터 아이디와 비밀번호를 입력받아 미리 저장된 값과 비교하여 같을 경우 "로그인 성공",
         * 그렇지 않은 경우 "로그인 실패"를 출력하세요. (초기값=>아이디: kh_manager, 비밀번호: 1234567)
         * ex.
         * 아이디: kh_manager
         * 비밀번호: 1234567
         * 로그인 성공
         */
        Scanner sc = new Scanner(System.in);
        
        String initId = "kh_manager";
        String initPw = "1234567";
        String id; 
        String pw; 
        
        System.out.print("아이디  : ");
        id = sc.nextLine();
        System.out.print("비밀번호: ");
        pw = sc.nextLine();
        
        
        if(initId.equals(id) && initPw.equals(pw))
        {
            System.out.println("로그인 성공");
        }
        else
        {
            System.out.println("로그인 실패");
        }
        
        sc.close();
    }
    
    /**
     * 정수를 2개와 연산 기호를 입력받아 연산 결과를 출력하세요.
     * 연산 기호를 잘못 입력했을 경우 "입력이 잘못되었습니다."라고 출력하세요.
     * Class Name : com.kh.practice.ControlPractice
     * 실행 클래스 : com.kh.practice.Run
     * ex.
     * 피연산자 입력: 10 20
     * 연산기호 입력(+, -, *, /, %) : +
     * 결과: 30
     */
    public void method5() 
    {
        /* 
         * Class Name : com.kh.practice.ControlPractice
         * 실행 클래스 : com.kh.practice.Run
         * 정수를 2개와 연산 기호를 입력받아 연산 결과를 출력하세요.
         * 연산 기호를 잘못 입력했을 경우 "입력이 잘못되었습니다."라고 출력하세요.
         * ex.
         * 피연산자 입력: 10 20
         * 연산기호 입력(+, -, *, /, %) : +
         * 결과: 30
         */
        Scanner sc = new Scanner(System.in);
        
        char op;
        int num1   = 0;
        int num2   = 0;
        
        System.out.print("피연산자 입력                : ");
        num1 = sc.nextInt();
        num2 = sc.nextInt();
        System.out.print("연산기호 입력(+, -, *, /, %) : ");
        op   = sc.next().charAt(0);
        
        switch(op)
        {
            case '+':
                System.out.println("결과: " + (num1 - num2));
                break;
            case '-':
                System.out.println("결과: " + (num1 + num2));
                break;
            case '*':
                System.out.println("결과: " + (num1 * num2));
                break;
            case '/':
                System.out.println("결과: " + (num1 / num2));
                break;
            case '%':
                System.out.println("결과: " + (num1 % num2));
                break;
            default : 
                System.out.println("입력이 잘못되었습니다.");
        }
        
        sc.close();
    }
    
    /**
     * 임의의 값을 입력 받아 가운데 값만 출력하기
     * (단, 입력 받은 값의 길이가 짝수인 경우 가운데 문자 중 앞의 문자의 값을 출력)
     * Class Name : com.kh.practice.ControlPractice
     * 실행 클래스 : com.kh.practice.Run
     * Ex1.
     * 입력: abcde
     * 결과: c
     * ex2.
     * 입력: abcdef
     * 결과: c
     */
    public void method6() 
    {
        /* 
         * Class Name : com.kh.practice.ControlPractice
         * 실행 클래스 : com.kh.practice.Run
         * 임의의 값을 입력 받아 가운데 값만 출력하기
         * (단, 입력 받은 값의 길이가 짝수인 경우 가운데 문자 중 앞의 문자의 값을 출력)
         * Ex1.
         * 입력: abcde
         * 결과: c
         * ex2.
         * 입력: abcdef
         * 결과: c
         */
        Scanner sc = new Scanner(System.in);
        
        String inputStr = "";
        int halfStr     = 0;
        
        System.out.print("입력: ");
        inputStr = sc.nextLine();
        halfStr = (inputStr.length()%2 == 0)?(inputStr.length()/2 -1):(inputStr.length()/2);
        
        System.out.println("결과: " + inputStr.charAt(halfStr));
        
        sc.close();
    }

    /**
     * 두 자리 정수를 입력 받아 10의 자리 수와 1의 자리수가 같은 경우 “10의 자리와 1의 자리의 수가 같습니다.” 출력,
     * 다른 경우 큰 값에서 작은 값을 뺀 결과를 출력
     * Class Name : com.kh.practice.ControlPractice
     * 실행 클래스 : com.kh.practice.Run
     * Ex1.
     * 입력: 55
     * 결과: 10의 자리와 1의 자리의 수가 같습니다.
     * Ex2.
     * 입력 28
     * 결과: 6
     */
    public void method7() 
    {
        /* 
         * Class Name : com.kh.practice.ControlPractice
         * 실행 클래스 : com.kh.practice.Run
         * 두 자리 정수를 입력 받아 10의 자리 수와 1의 자리수가 같은 경우 “10의 자리와 1의 자리의 수가 같습니다.” 출력,
         * 다른 경우 큰 값에서 작은 값을 뺀 결과를 출력
         * Ex1.
         * 입력: 55
         * 결과: 10의 자리와 1의 자리의 수가 같습니다.
         * Ex2.
         * 입력 28
         * 결과: 6
         */
        Scanner sc = new Scanner(System.in);
        
        String str     ;
        char ch1;
        char ch2;
        
        System.out.print("입력: ");
        str = sc.next();
        
        ch1 = str.charAt(0);
        ch2 = str.charAt(1);
        
        if(ch1 == ch2)
        {
            System.out.println("10의 자리와 1의 자리의 수가 같습니다.");
        }
        else
        {
            System.out.println("결과: " + (ch1 > ch2? ch1 - ch2 : ch2-ch1));
        }
        
        sc.close();
    }

    /** 
     * 금액 입력 시 5만원권, 1만원권, 5천원권, 1천원권 개수와 동전 금액을 출력 (사용자의 입력은 정수로 받음)
     * Class Name : com.kh.practice.ControlPractice
     * 실행 클래스 : com.kh.practice.Run
     * Ex.
     * 입금 금액: 53200
     * 5만원권 : 1
     * 1만원권 : 0
     * 5천원권 : 0
     * 1천원권 : 3
     * 동전 금액 : 200
     */
    public void method8() 
    {
        /* 
         * Class Name : com.kh.practice.ControlPractice
         * 실행 클래스 : com.kh.practice.Run
         * 은행에 돈을 맡기기 위해 입금 금액 입력 시
         * 5만원권, 1만원권, 5천원권, 1천원권 개수와 동전 금액을 출력 (사용자의 입력은 정수로 받음)
         * Ex.
         * 입금 금액: 53200
         * 5만원권 : 1
         * 1만원권 : 0
         * 5천원권 : 0
         * 1천원권 : 3
         * 동전 금액 : 200
         */
        Scanner sc = new Scanner(System.in);
        
        int money       = 0;
        System.out.print("입금 금액 : ");
        
        money = sc.nextInt();
        

        //if문을 안쓰고도 결과를 출력할 수 있다.
//        System.out.print("입금 금액 : ");
//        money = sc.nextInt();
//        System.out.println("5만원권   : " + (money/50000));
//        money %= 50000;
//        System.out.println("1만원권   : " + (money/10000));
//        money %= 10000;
//        System.out.println("5천원권   : " + (money/5000));
//        money %= 5000;
//        System.out.println("1천원권   : " + (money/1000));
//        money %= 1000;
//        System.out.println("동전 금액 : " + money      );
        
        //if문 억지로생성 
//        if(money >= 50000)
//        {
//            System.out.println("5만원권   : " + (money/50000));
//            money %= 50000;
//        }
//        if(money >= 10000)
//        {
//            System.out.println("1만원권   : " + (money/10000));
//            money %= 50000;
//        }
//        if(money >= 5000)
//        {
//            System.out.println("5천원권   : " + (money/5000));
//            money %= 50000;
//        }
//        if(money >= 1000)
//        {
//            System.out.println("1천원권   : " + (money/1000));
//        }
//        money %= 1000;
//        System.out.println("동전 금액 : " + money      );
        
        int m = money/10000;
        int m5 = 0;
        if(m >= 5)
        {
            m5 = m/5;
            m  = m - m5 * 5;
        }
        money %= 10000;
        System.out.println("5만원권   : " + m5);
        System.out.println("1만원권   : " + m);
        
        int c = money/1000;
        int c5 = 0;
        if(c >= 5)
        {
            c5 = 1;
            c -= 5;
        }
        money %= 1000;
        System.out.println("5천원권   : " + c5);
        System.out.println("1천원권   : " + c);
        
        System.out.println("동전 금액 : " + money);
        
        sc.close();
    }
}
