package com.kh.lambda.standard;

import java.util.function.BinaryOperator;
import java.util.function.IntBinaryOperator;
import java.util.function.IntUnaryOperator;

public class D_Operator
{
    /*
     * Operator
     *  - Operater 함수적 인터페이스는 매개값과 리턴값이 있는 apply() 추상메소드를 가지고 있다;
     *  - apply() 추상메소드 주로 매개값을 이용해서 연산하고 동일한 타입으로 결과를 리턴하는 역할을 한다.
     */
    public void method1() 
    {
        IntBinaryOperator intBinaryOperator;
        
        intBinaryOperator = (a, b)-> a + b;
        
        System.out.println("D_Operator IntBinaryOperator.applyAsInt : " + intBinaryOperator.applyAsInt(10, 20));
        
        IntUnaryOperator intUnaryOperator ;
        
        intUnaryOperator = a -> a * a;
        
        System.out.println("D_Operator IntUnaryOperator.applyAsInt(10) : " + intUnaryOperator.applyAsInt(10));
        
        BinaryOperator<Student> binaryOperator ;
        
        binaryOperator = (Student a, Student b) -> a.getMathScore() > b.getMathScore()? a : b;
        
        Student student1 = new Student("홀닐동", 20, "남장", 70, 80);
        Student student2 = new Student("오몽롱", 25, "여장", 50, 90);
        
        System.out.println("D_Operator binaryOperator.apply(student1, student2) : " + binaryOperator.apply(student1, student2));
        
    }
}
