package com.kh.lambda.standard;

import java.util.function.BiFunction;
import java.util.function.Function;

public class C_Function
{
    /*
     * Function 
     *  - Function 함수적 인터페이스는 매개값과 리턴값이 있는 apply() 추상메소드를 가지고 있다.
     *  - apply() 추상 메소드는 주로 매개값을 리턴값으로 매핑(타입변환)하는 역할을 한다.
     */
    
    public void method1() {
        Student student = new Student("홍길동", 20, "남자", 80, 70);
        
        System.out.println("C_Function Student.toString() : " + student.toString());
        
        Function<Student, String> function;
        
        function = s -> s.getName();
        function = Student::getName;
        
        System.out.println("C_Function function.apply(student) : " + function.apply(student));
        
        BiFunction<String, Integer, Student> biFunction ;
        
        biFunction = (name, age) -> new Student(name, age);
        biFunction = Student::new;
        
        System.out.println("C_Function biFunction.apply(\"이몽룡\", 25) : " + biFunction.apply("이몽룡", 25));
        
        
    }
}
