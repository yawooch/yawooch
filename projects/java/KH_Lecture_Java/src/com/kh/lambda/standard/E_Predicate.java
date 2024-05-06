package com.kh.lambda.standard;

import java.util.function.BiPredicate;
import java.util.function.Predicate;

public class E_Predicate
{
    /*
     * Predicate
     *  - Predicate 함수적 인터페이스는 매개변수와 논리값을 리턴하는 test()
     *      추상메소드를 가지고 있다.
     *  - test() 추상 메소드는 매개값을 받아서 true/false를 리턴한다.
     */
    public void method1() {
        Student student1 = new Student("홍길동", 20);
        Student student2 = new Student("성춘향", 20, "여자", 90, 90);
        
        Predicate<Student> predicate;
        
        predicate = s -> s.getGender().equals("남자");
        
        System.out.println("E_Predicate predicate.test(student1) : " + predicate.test(student1));
        System.out.println("E_Predicate predicate.test(student2) : " + predicate.test(student2));
        
        BiPredicate<Student, Student> biPredicate;
        
        biPredicate = (s1, s2) -> s1.getGender().equals(s2.getGender());
        
        System.out.println("E_Predicate predicate.test(student1, student2) : " + biPredicate.test(student1, student2));
    }
}
