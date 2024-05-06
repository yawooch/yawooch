package condition.codeUp;

import java.util.Scanner;
import java.io.*;

public class Question1210
{
    public static void main(String[] args) throws Exception
    {
        /*
         * 보림이는 엄마와 함께 놋데리아에 갔다.
         * 보림이는 먹고 싶은게 많았으나 엄마가 살이 찐다고 2가지만 골라서 먹으라고 했다.
         * 그리고 두 메뉴의 칼로리 합이 500보다 크면 엄마가 화를 내고, 500이하면 화를 내지 않는다.
         * 보림이가 선택할 수 있는 메뉴는 다음과 같다.
         * 
         * 1. 치즈버거 : 400 칼로리
         * 2. 야채버거 : 340 칼로리
         * 3. 우유     : 170 칼로리
         * 4. 계란말이 : 100 칼로리
         * 5. 샐러드   : 70 칼로리
         * 이 메뉴들 중 2가지 메뉴를 선택했을 때 칼로리 합을 계산하고, 그 칼로리 합이 500보다 크면 "angry", 500이하면 "no angry"를 출력하시오.
         * ex)
         * 1 2
         * angry
         */
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out, "utf-8")); //출력
        Scanner sc        = new Scanner(System.in);
        
        int firstFood = 0;
        int seconFood = 0;
        
        int firstNum = sc.nextInt();
        int seconNum = sc.nextInt();
        
        switch(firstNum)
        {
            case 1 : 
                firstFood = 400;
                break;
            case 2 : 
                firstFood = 340;
                break;
            case 3 : 
                firstFood = 170;
                break;
            case 4 : 
                firstFood = 100;
                break;
            case 5 : 
                firstFood = 70;
                break;
        }
        switch(seconNum)
        {
            case 1 : 
                seconFood = 400;
                break;
            case 2 : 
                seconFood = 340;
                break;
            case 3 : 
                seconFood = 170;
                break;
            case 4 : 
                seconFood = 100;
                break;
            case 5 : 
                seconFood = 70;
                break;
        }
        if((firstFood + seconFood) > 500) 
        {
            bw.write("angry");
        }
        else if((firstFood + seconFood) <= 500)
        {
            bw.write("no angry");
        }
        bw.flush();
        sc.close();
    }
}
