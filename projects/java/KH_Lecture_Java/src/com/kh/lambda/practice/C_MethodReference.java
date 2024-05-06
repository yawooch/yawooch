package com.kh.lambda.practice;

import java.util.function.Consumer;
import java.util.function.Function;
import java.util.function.IntBinaryOperator;
import java.util.function.Supplier;

import com.kh.lambda.standard.Student;

public class C_MethodReference
{
    public void method1() {
        // 정적(Static) 메소드 참조
        IntBinaryOperator intBinaryOperator;
        
        intBinaryOperator = (int a, int b) -> Math.max(a, b);
        intBinaryOperator = Math::max;
        
        System.out.println("C_MethodReference 정적(Static) 메소드 참조 intBinaryOperator : " + intBinaryOperator.applyAsInt(10, 20));
        
        // 인스턴스 메소드 참조
        Consumer<String> consumer;
        
        consumer = str -> System.out.println(str);
        consumer = System.out::println;
        
        consumer.accept("C_MethodReference 인스턴스 메소드 참조 Consumer : 안녕하세요");
        
        // 매개변수의 메소드 참조
        Function<Student, String> function;
        
        function = s -> s.getName();
        function = Student::getName;
        
        System.out.println("C_MethodReference 매개변수의 메소드 참조 Function : " + function.apply(new Student("홍길동", 25)));
        
        // 생성자 참조
        Supplier<Student> supplier;
        supplier = () -> new Student();
        supplier = Student::new;
        
        System.out.println("C_MethodReference 생성자 참조 Function : " + supplier.get());
        
    }
}
