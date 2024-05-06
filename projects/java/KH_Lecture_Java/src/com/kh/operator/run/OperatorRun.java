package com.kh.operator.run;

import com.kh.operator.*;

/** com.kh.operator.* 에 있는 예제들을 실행하기위한 Run Class */
public class OperatorRun
{
    /*
     * 연산자 : 프로그램이 실행될 때 연산을 도와주는 것들 - 우선순위, 연산방향 중요 1) 직접 접근 연산자 : . [] () {} 2) 단항
     * 연산자 : 부호 연산자(+, -), !(부정), 증감연산자(++, --), (자료형) - 형변환 3) 산술 연산자 : +, -, *, /,
     * % 4) 쉬프트 연산자 : >> << >>> 5) 비교 연산자 : > < >= <= == != 6) 논리 연산자 : %% || & ^ |
     * 7) 삼항 연산자 : (조건식) ? (True 값) : (False 값); 8) 대입 연산자 : = += -= *= /- %= <<=
     * >>= >>>= 7= ^= 9) 나열 연산자 : , (a, b, c)
     */
    public static void main(String[] args)
    {
//        LogicalNegation ln = new LogicalNegation();
//        ln.method();
//        InDecrease id = new InDecrease();
//        id.method1();
//        id.method2();
//        id.method3();
        
        Arithmetic am = new Arithmetic();
//        am.method1();
        am.method2();
        
//        Comparison cp = new Comparison();
//        cp.method();
        
//        Logical lg = new Logical();
//        lg.method();
//        lg.method2();
//        lg.method3();
        
//        Triple tp = new Triple();
//        tp.method1();
//        tp.method2();
        
        
    }
}
