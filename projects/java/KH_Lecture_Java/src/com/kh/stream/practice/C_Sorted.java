package com.kh.stream.practice;

import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.stream.IntStream;

public class C_Sorted
{
    /*
     * 정렬
     *  - 스트림의 요소들이 최종 처리가 되기 전에 중간단계에서 
     *      요소들을 정렬해서 최종 처리 순서를 변경할 수 있다.
     *  - IntStream LongStream DoubleStream 은 요소들을 오름차순으로 정렬한다.
     *  - Stream<T> 은 요소 객체가 Comparable 
     *      인터페이스를 구현해야 정렬할 수 있다.
     *      (구현하지 않으면 예외가 발생한다.)
     */
    public void method1() {
        List<Student> students = Arrays.asList(
                new Student("홍길동", 25),
                new Student("이몽룡", 23),
                new Student("성춘향", 20, "여자", 80, 80)
        );
        
        System.out.println("------------------------------------------------------------------------------------------ students.forEach()");
        students.stream()
                .forEach(System.out::println);
        System.out.println("------------------------------------------------------------------------------------------ students.sorted().forEach()");
        students.stream()
                .sorted()
                .forEach(System.out::println);
        System.out.println("------------------------------------------------------------------------------------------ students.sorted(compare()).forEach()");
        students.stream()
                .sorted((s1, s2) -> {return s2.getAge() - s1.getAge();})
//                .sorted(Comparator.naturalOrder())//
//                .sorted(Comparator.reverseOrder())//
                .forEach(System.out::println);
    }

    public void method2() {
        int[] array = {4,6,2,5, 1,3};
        
        System.out.println("------------------------------------------------------------------------------------------ 배열 오름차순");
        Arrays.stream(array)
              .sorted()
              .forEach(value -> System.out.print(value + " "));
        System.out.println();
        System.out.println("------------------------------------------------------------------------------------------ 배열 내림차순");
        Arrays.stream(array)
              .boxed()
              .sorted(Comparator.reverseOrder())
              .forEach(value -> System.out.print(value + " "));
        System.out.println();
        
        
    }
}
