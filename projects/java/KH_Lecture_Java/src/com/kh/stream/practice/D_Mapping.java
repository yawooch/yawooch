package com.kh.stream.practice;

import java.util.Arrays;
import java.util.Comparator;
import java.util.List;

public class D_Mapping
{
    /*
     * 매핑 
     *  스트림의 요소를 다른 요소로 대체하는 역할을 한다.
     *      - map() 
     *          - 스트림의 요소를 대체하는 요소로 구성된 새로운 스트림을 생성한다
     *      - flatMap()
     *          - 하나의 요소를 복수의 요소들로 구성된 새로운 스트림을 생성한다.
     *      - asDoubleStream()
     *          - IntStream, LongStream을 DoubleStream으로 변환한다.
     *      - asLongStream()
     *          - IntStream을 LongStream으로 변환한다.
     *      - boxed()
     *          - int, long, double 요소를 Integer , Long, 
     *              Double 타입의 요소롤 박싱해서 스트림을 생성한다.
     */
    //map()
    public void method1() {
        List<Student> students = Arrays.asList(
                new Student("홍길동", 25, "남자", 80, 80),
                new Student("이몽룡", 23, "남자", 80, 80),
                new Student("성춘향", 20, "여자", 90, 80)
        );
        System.out.println("------------------------------------------------------------------------------------------ .map()");
        students.stream()
                .map(Student::getName)
                .forEach(s -> System.out.println(s));

        System.out.println("------------------------------------------------------------------------------------------ .mapToInt()");
        double avg = students.stream()
                .mapToInt(Student::getMathScore)
                .average()
                .getAsDouble();
        
        System.out.println("수학점수의 평균은 " + avg);
        
    }
    //flatMap()
    public void method2() {
        List<String> list = Arrays.asList(
                "Hello World",
                "Java11 Lambda",
                "StreamAPI Mapping"
        );
        list.stream()
            .forEach(System.out::println);
        System.out.println();
        
        System.out.println("------------------------------------------------------------------------------------------ .flatMap()");
        list.stream()
            .flatMap(str -> Arrays.stream(str.split(" ")))
            .forEach(System.out::println);
    }

    //asDoubleStream(), asLongStream() , boxed()
    public void method3() {
        int[] array1 = {1,2,3,4,5};
        double[] array2 = {1.1,2.2,3.3,4.4,5.5};
        
        Arrays.stream(array1)
//              .asDoubleStream()
              .asLongStream()
              .forEach(value -> System.out.println(value + " "));
        
        System.out.println("------------------------------------------------------------------------------------------ .boxed().sorted()");
        Arrays.stream(array2)
              .boxed()
              .sorted(Comparator.reverseOrder())
//              .mapToDouble(value -> value.doubleValue())
              .mapToDouble(Double::doubleValue)
              .forEach(value -> System.out.println(value + " " ));
    }
}