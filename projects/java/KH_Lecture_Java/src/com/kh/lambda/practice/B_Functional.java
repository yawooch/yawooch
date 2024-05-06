package com.kh.lambda.practice;

import com.kh.lambda.practice.functional.A_FunctionalInterface;
import com.kh.lambda.practice.functional.B_FunctionalInterface;
import com.kh.lambda.practice.functional.C_FunctionalInterface;

public class B_Functional
{
    private int num = 100;
    
    public void method1()
    {
        A_FunctionalInterface fi;

        // 실행문이 한 줄이라면 중괄호를 생략가능
        fi = () -> System.out.println("B_Functional.method1() : 매개변수와 반환값이 없는 람다식");

        fi.method();
    }

    public void method2()
    {
        B_FunctionalInterface fi;

        // 실행문이 한 줄이라면 중괄호를 생략가능
        // 매개변수의 자료형을 생략가능
        fi = (a) -> System.out.println("B_Functional.method2() : 매개변수가 " + (a * a) + "이고, 반환값이 없는 람다식");
        // 매개변수가 하나면 괄호 생략가능
        fi = a -> System.out.println("B_Functional.method2() : 매개변수가 " + (a * a) + "이고, 반환값이 없는 람다식");

        fi.method(10);

    }

    public void method3()
    {
        C_FunctionalInterface fi;
        String resultStr = "";

        // 실행문이 한 줄이라면 중괄호를 생략가능
        // 매개변수의 자료형을 생략가능
        fi = (a, b) ->
        {
            return (a + b);
        };
        // 매개변수의 자료형, return 구문, 중괄호 생략 가능
        fi = (a, b) -> (a + b);

        resultStr = "B_Functional.method3() : 매개변수가 " + 10 + ", " + 20 + "이고, ";
        resultStr += "반환값이 " + fi.method(10, 20) + "인 람다식";

        System.out.println(resultStr);
    }

    /** 람다식에서 필드(멤버변수)와 지역변수 사용하기 */
    public void method4(int arg)
    {
        int num = 10;
        // 람다식에서 필드(멤버변수)와 지역변수 사용하기
        System.out.println("B_Functional.method4() local Variable: " + num);
        System.out.println("B_Functional.method4() field : " + this.num);
        
        A_FunctionalInterface fi;
        
//        this.num = 300;
        
        // 람다식에서 사용되는 this는 람다식을 실행하는 인스턴스의 참조이다.
        // 람다식에서 지역변수를 이용할 때는 지역변수가 final,
        // effectively final 이어야 한다.
        fi = () -> {

//            num = 500;
//            arg = 800;
            System.out.println("B_Functional.method4() A_FunctionalInterface.method("+ arg +") Lambda local num : " + num);
            System.out.println("B_Functional.method4() A_FunctionalInterface.method("+ arg +") Lambda argum arg : " + arg);
            System.out.println("B_Functional.method4() A_FunctionalInterface.method("+ arg +") Lambda field num : " + this.num);
        };
        fi.method();
        
        System.out.println("----------------------------------------------------------------------------------");
        // 익명 구현 객체에서 사용되는 this는 
        // 익명 구현 객체로 생성된 인스턴스의 참조이다.
        fi = new A_FunctionalInterface()
        {
            
            @Override
            public void method()
            {
//                num = 500;
//                arg = 800;
                System.out.println("B_Functional.method4() A_FunctionalInterface.method("+ arg +") Anonymous local num : " + num);
                System.out.println("B_Functional.method4() A_FunctionalInterface.method("+ arg +") Anonymous argum arg : " + arg);
                System.out.println("B_Functional.method4() A_FunctionalInterface.method("+ arg +") Anonymous field num : " + this.HELLO);
            }
        };
        fi.method();
    }
}
