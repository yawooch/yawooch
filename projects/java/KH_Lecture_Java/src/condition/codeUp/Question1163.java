package condition.codeUp;

import java.util.Scanner;
import java.io.*;

public class Question1163
{
    public static void main(String[] args) throws Exception
    {
        /*
         * 태어난 해, 월, 일을 입력받아 사주팔자를 보는 프로그램을 작성하시오.
         * 사주를 보는 방법
         * 세 수(년,월,일)가 주어지면,  (년 + 월 + 일)에 100의 자리 숫자가 짝수이면 "대박"을 출력, 그렇지 않으면 "그럭저럭"을 출력하세요.
         * ex)
         * 1502 2 10
         * 대박
         */
//        BufferedReader br = new BufferedReader(new InputStreamReader(System.in, "utf-8")); //입력
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out, "utf-8")); //출력
        Scanner sc = new Scanner(System.in);
        
        int y = sc.nextInt();
        int m = sc.nextInt();
        int d = sc.nextInt();
        
        String saju = (y - m + d)+"";
        
        if((saju.charAt(1)%2) == 0)
        {
//            System.out.println("\ub300\ubc15");
            bw.write("대박"); //print와 같음
        }
        else
        {
//            System.out.println("\uadf8\ub7ed\uc800\ub7ed");
            bw.write("그럭저럭"); //print와 같음
        }

        bw.flush();
        sc.close();
    }
}
