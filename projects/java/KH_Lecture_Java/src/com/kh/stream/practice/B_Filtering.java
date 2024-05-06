package com.kh.stream.practice;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Stream;

public class B_Filtering
{
    /*
     * 필터링
     *  - 중간처리 기능으로 특정 요소를 걸러내는 역할을 한다.
     *  - distinct()
     *     - 요소의 중복을 제거하는 메소드이다.
     *  - filter(Predicate)
     *     - 매개값으로 전달되는 Predicate false를 리턴하는 요소를 제거한다.
     */
    /** 중복제거 */
    public void method1() {
        List<String> names = Arrays.asList("홍길동", "이몽룡", "성춘향", "이몽룡");
        
        Stream<String> stream = names.stream();
        
        stream.forEach(name -> System.out.println("method1() .forEach() : " + name));
        
        //이미 최종처리된 메소드까지 호출된 스트림은 다시 사용할 수 없다.
        //새로운 스트림을 다시 얻어와야한다.
        names.stream().distinct().forEach(name -> System.out.println("method1() .distinct().forEach() : " + name));
        
        List<Student> students = Arrays.asList(
                new Student("홍길동", 25),
                new Student("이몽룡", 20),
                new Student("성춘향", 20, "여자", 80, 90),
                new Student("이몽룡", 20)
                );
        
//        students.stream().filter(null);
        students.stream().forEach(System.out::println);
        students.stream().distinct().forEach(student -> System.out.println("method1() .forEach() : " + student));
    }

    /** 필터 메소드 */
    public void method2() {
        System.out.println("method2() : 실행테스트");
        
        List<String> names = Arrays.asList("홍길동", "이몽룡", "성춘향", "이몽룡", "이순신");
        //성이 "이"씨인 이름만 출력하기
        System.out.println("------------------------------------------------------------------------------------------ 성이 \"이\"씨인 이름만 출력하기");
        names.stream().forEach(name -> System.out.println("List<String> names : " + name));
        //.distinct()는 filter()전 후로 선언해도 된다.
        names.stream()
             .filter(name -> name.startsWith("이"))
             .distinct()
             .forEach(name -> System.out.println("List<String> names .distinct().filter() : " + name));
        
        //성별로 사람찾기
        System.out.println("------------------------------------------------------------------------------------------ 성별로 사람찾기");
        List<Student> students = Arrays.asList(
                new Student("홍길동", 25, "남자", 70, 70),
                new Student("이몽룡", 20),
                new Student("성춘향", 20, "여자", 80, 90),
                new Student("이몽룡", 20)
        );
        students.stream()
//             .filter(student -> student.getGender().equals("남자"))
//             .filter(student -> student.getGender().equals("여자"))
             .filter(student -> !student.getGender().equals("여자"))
             .distinct()
             .forEach(student -> System.out.println("student.getGender().equals(\"남자\") : " + student.getName()));
        
        // 수학점수, 영어점수가 60점 이상인 학생만 출력
        System.out.println("------------------------------------------------------------------------------------------ 수학점수, 영어점수가 60점 이상인 학생만 출력");
        students.stream()
//               .filter(student -> student.getMathScore() >= 60 && student.getEnglishScore() >= 60)
               .filter(student -> student.getEnglishScore() >= 60)
               .filter(student -> student.getMathScore()    >= 60)
               .forEach(student -> System.out.println("student.getMathScore() >= 60 && student.getEnglishScore() >= 60 : " + student.getName()));
        
    }
}
