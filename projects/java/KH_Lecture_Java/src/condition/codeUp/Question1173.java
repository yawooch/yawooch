package condition.codeUp;

import java.util.Scanner;
import java.io.*;

public class Question1173
{
    public static void main(String[] args) throws Exception
    {
        /*
         * 수호는 30분 전으로 돌아가고 싶은 1人 이다.
         * 공백을 기준으로 시간과 분이 주어진다.
         * 그러면 이 시간을 기준으로 30분전의 시간을 출력하시오.
         * 예)
         * 12 35  =====> 12 5
         * 12 0 ======> 11 30
         * 11 5 ======> 10 35
         */
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out, "utf-8")); //출력
        Scanner sc        = new Scanner(System.in);
        
        int h = sc.nextInt();
        int m = sc.nextInt();
        
        if(m >= 30) 
        {
            bw.write(h + " " + (m-30));
        }
        else
        {
            h = h == 0? 23: (h-1);
            m = 60+(m-30);
            bw.write(h + " " + m);
        }
        bw.flush();
        sc.close();
    }
}
