package com.kh.lambda;

import com.kh.lambda.practice.A_Lambda;
import com.kh.lambda.practice.B_Functional;
import com.kh.lambda.practice.C_MethodReference;
import com.kh.lambda.standard.A_Consumer;
import com.kh.lambda.standard.B_Supplier;
import com.kh.lambda.standard.C_Function;
import com.kh.lambda.standard.D_Operator;
import com.kh.lambda.standard.E_Predicate;

public class Application
{
    public static void main(String[] args)
    {
        System.out.println("Application 시작");
        /*
         * 람다식(Lambda Expressions)
         *      - 자바에서 함수적 프로그래밍을 위해서 자바 8부터 람다식을 지원한다.
         * [표현법]
         * ([자료형 매개변수, ...]) -> {
         *      //실행코드
         *      
         *      [return 반환값;]
         * };
         *  ex) 
         *      (int a) -> { System.out.println(a); };
         *      (a)     -> { System.out.println(a); }; // 자료형 생략가능
         *      a       -> { System.out.println(a); }; // 매개변수 하나면 괄호 생략가능
         *      a       -> System.out.println(a);      // 실행구문이 하나면 중괄호 생략가능
         *      ()      -> { ... };                    // 매개변수가 없으면 대괄호 필수
         *      (a, b)  -> { return a + b };           // 매개변수가 여러개면 대괄호 필수
         *      (a, b)  -> a + b;                      // 실행구문 한개고, return이 있으면 중괄호, return 생략 가능
         *      
         */
        new A_Lambda().method1();
        
        /*
         * 타겟 타입(Target Type)
         *      - 람다식은 단순히 메소드를 선언하는 것이 아니라 람다식으로 선언된
         *          메소드를 가지고 있는 객체를 생성한다.
         *      - 람다식은 인터페이스 타입의 참조변수에 대입되고 람다식은 인터페이스의
         *          익명구현객체를 생성한다.
         *      - 람다식은 대입될 인터페이스의 종류에 따라서 작성 방법이 달라지기 때문에
         *          람다식이 대입될 인터페이스를 타겟타입이라고 한다
         * 함수적 인터페이스(Functional Interface)
         *      - 모든 인터페이스가 타겟 타입으로 사용될 수 없다.
         *      - 하나의 추상메소드가 선언된 인터페이스만 람다식의 타겟이 될 수 있는데
         *          이러한 인터페이스를 함수적 인터페이스라고 한다.
         *      - 함수적 인터페이스를 선언할 때 @FunctionalInterface 붙이면
         *          두개 이상의 추상 메소드가 선언되지 않도록 컴파일러가 체크한다.
         */

        new B_Functional().method1();
        new B_Functional().method2();
        new B_Functional().method3();
        new B_Functional().method4(1000);
        
        /*
         * 표준 함수적 인터페이스
         *      - 자바 8부터 빈번히 사용되는 함수적 인터페이스는 
         *          java.util.function 표준 API 패키지로 제공된다.
         *      - 용도에 따라 크게 
         *          Consumer, Supplier, Function, Operator, Predicate로 구분된다
         */
        new A_Consumer().method1(); 
        new B_Supplier().method1(); 
        new C_Function().method1(); 
        new D_Operator().method1(); 
        new E_Predicate().method1();
        
        /*
         * 메소드 참조(Method Reference)
         *  - 메소드 참조는 메소드를 참조해서 매개변수의 정보 및 리턴 타입을 
         *      알아내고, 람다식에서 불필요한 매개변수를 제거하는 것이 목적이다.
         *  - 참조하는 메소드, 생성자가 존재하지 않으면 오류가 발생한다.
         */
        new C_MethodReference().method1();
        
        System.out.println("Application 끝");
    }
}
