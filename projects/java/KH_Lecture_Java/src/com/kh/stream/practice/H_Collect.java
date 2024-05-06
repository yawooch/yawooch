package com.kh.stream.practice;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.Function;
import java.util.stream.Collectors;

public class H_Collect
{
    /*
     * 수집
     *  - 최종 처리 기능으로 필터링 또는 매핑한 요소들을
     *      새로운 컬렉션으로 담아서 리턴 받을 수 있다.
     */
    public void method1() {
        List<Student> students = Arrays.asList(
                new Student("홍길동", 25, "남자", 50, 70),
                new Student("성춘향", 20, "여자", 90, 90),
                new Student("이몽롱", 23, "남자", 10, 80),
                new Student("심청희", 18, "여자", 100, 100),
                new Student("임꺽졍", 28, "남자", 60, 60)
        );
        System.out.println("남학생만 List 컬렉션으로 반환-------------------------------------------------------------- method1() case1");
        //남학생만 List 컬렉션으로 반환
        {
            List<Student> list = students.stream()
                                        .filter(student -> student.getGender().equals("남자"))
                                        .collect(Collectors.toList());
            list.stream().forEach(student -> System.out.println(student.getName()));
        }
        System.out.println("여학생만 Set 컬렉션으로 반환---------------------------------------------------------------- method1() case2");
        //여학생만 Set 컬렉션으로 반환
        {
            Set<Student> set = students.stream()
                    .filter(student -> student.getGender().equals("여자"))
                    .collect(Collectors.toSet());
            
            set.add(new Student("심청희", 18, "여자", 50, 100));
            set.stream().forEach(student -> System.out.println(student.getName()));
        }
        System.out.println("------------------------------------------------------------------------------------------ method1() case3");
        //List를 map 컬렉션으로 반환
        {
            Map<String, Student> map = students.stream()
                    .collect(Collectors.toMap(Student::getName
                                            , Function.identity()));
            
            Set<String> keySet = map.keySet();
            for (String key : keySet)
            {
                System.out.println(map.get(key));
            }
        }
    }
}
