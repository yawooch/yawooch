package com.kh.stream.practice;

import java.util.Arrays;
import java.util.List;
import java.util.stream.IntStream;
import java.util.stream.Stream;

public class A_Create
{
    /*
     * 스트림의 종류
     *  - java.util.stream 패키지에 존재하고 BaseStream 인터페이스를 
     *      부모로 해서 자식 인터페이스들이 상속관계를 이루고 있다.
     *  - Stream , IntStream, LongStream, DoubleStream
     * 
     * 스트림의 생성
     *  - 숫자 범위로 스트림을 생성하는 방법
     *  - 배열로부터 스트림을 생성하는 방법
     *  - 컬렉션으로부터 스트림을 생성하는 방법
     *  
     */
    // 숫자범위로 스트림을 생성하는 방법
    public void method1() {
        IntStream stream;
        // 첫 번째 매개값 ~ 두번째 매개값 이전까지의 값을 요소로
        //  가지는 스트림 객체를 생성한다.
//        stream = IntStream.range(1, 10);//1~9
        stream = IntStream.rangeClosed(1, 10);//1~10
        System.out.println("A_Create().method1() : " + stream.sum());
//        stream.forEach(value -> System.out.println(value));
    }
    // 배열로부터 스트림을 생성하는 방법
    public void method2() {
        String[] names = {"홍길동", "이몽룡", "성춘향", "이몽룡"};
        
//        Stream<String> stream = Arrays.stream(names);
//        Stream<String> stream = Stream.of("홍길동", "이몽룡", "성춘향", "이몽룡");
        Stream<String> stream = Stream.of(names);
        // parallel() : 병렬처리
        // distinct() : 중복제거
        stream.parallel().distinct().forEach(str -> System.out.println("A_Create().method2() : " + str));
    }
    // 컬렉션으로부터 스트림을 생성하는 방법
    public void method3() {
        List<String> names = Arrays.asList("홍길동", "이몽룡", "성춘향", "이몽룡");
        
        Stream<String> stream = names.stream();
//        Stream<String> stream = names.parallelStream();
        
        stream.distinct().forEach(str -> System.out.println("A_Create().method3() : " + str));
        
    }
}
