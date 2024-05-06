package operator.codeUp;

import java.util.Scanner;

public class Question1064
{
    public static void main(String[] args)
    {
        /*
         * 입력된 세 정수 a, b, c 중 가장 작은 값을 출력하는 프로그램을 작성해보자. 단, 조건문을 사용하지 않고 3항 연산자 ? 를
         * 사용한다.
         */
        
        Scanner sc = new Scanner(System.in);
        
        System.out.print("정수 1 입력 : ");
        int num1 = sc.nextInt();
        System.out.print("정수 2 입력 : ");
        int num2 = sc.nextInt();
        System.out.print("정수 3 입력 : ");
        int num3 = sc.nextInt();
        
        int result = (num1 < num2 ? (num1 < num3 ? num1 : num3) : (num2 < num3? num2 : num3));
//        System.out.print("가장작은값은? : ");
        System.out.println(result);
        
        //num1 < num2 
        //true  : num1 < num3
        //      true  : "num1"
        //      false : "num3"
        //num1 < num3 ? num1 : num3
        //false : num2 < num3
        //      true  : "num3"
        //      false : "num2"
        //num2 < num3? num3 : num2
        // num1 < num2 ? (num1 < num3 ? num1 : num3) : (num2 < num3? num3 : num2); 
        
        
        sc.close();
    }
}
