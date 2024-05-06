package com.kh.operator;

public class LogicalNegation
{

    /*
     * 논리 부정연산자 ( 단항연산자, 값을 하나만 가지고 연산수행) - ! - 논리값 (true 또는 false)을 반대로 바꿔주는 연산자 -
     * 우선순위 2째로 높은편!
     */
    public void method()
    {
        System.out.println("true  부정 : " + !true);
        System.out.println("false 부정 : " + !false);

        boolean b1 = true;
        System.out.println("b1 부정    : " + !b1);

        boolean b2 = !b1;
        System.out.println("b2 부정    : " + b2);// 연산순서 1) -> ! -> 2) =
                                                 // b2 = false
        boolean b3 = (5 > 3);
        System.out.println("b3 : " + b3);
    }
}
