package com.kh.stream.practice;

import java.util.Arrays;
import java.util.OptionalDouble;
import java.util.OptionalInt;

public class G_Aggregate
{
    /*
     * 기본 집계
     *   - 최종 처리 기능으로 요소들의 개수, 합계, 평균 등과 같이
     *     하나의 값으로 산출하는 역할을 한다.
     *   - count()
     *     - 요소들의 개수를 리턴한다.
     *   - sum()
     *     - 요소들의 합계를 리턴한다.
     *   - average()
     *     - 요소들의 평균을 리턴한다.
     *   - max()
     *     - 최대 요소를 리턴한다.
     *   - min()
     *     - 최소 요소를 리턴한다.
     *   - findFirst()
     *     - 첫 번째 요소를 리턴한다.
     * 
     * 커스텀 집계
     *  - 스트림에서 기본집계 메소드를 제공하지만 다양한 
     *     집계 결과물을 만들수 있도록 reduce() 메소드를 제공한다.
     */
    public void method1() {
        {
            int[] values = {1,2,3,4,5,6};
            
            // 2의 배수
            long count = Arrays.stream(values)
                    .filter(value -> value%2 ==0)
                    .count();
            System.out.println("2의 배수의 개수 : " + count);
            
            // 2의 배수의 합계
            long sum = Arrays.stream(values)
                    .filter(value -> value%2 ==0)
                    .sum();
            System.out.println("2의 배수의 합계 : " + sum);
            /*
             * Optional
             *  - 스트림의 최종 결과 값을 저장하는 객체이다
             *  - 단순히 값만 저장하는 것이 아니라, 값의 존재여부를 확인하고
             *      값이 존재하지 않을 경우 기본값을 설정할 수 있는 객체이다.
             */
            // 2의 배수의 평균
            OptionalDouble average = Arrays.stream(values)
                    .filter(value -> value%2 ==0)
                    .average();
            // Optional 객체에서 저장된 값을 가져온다.
            System.out.println("2의 배수의 평균 : " + average.getAsDouble());
        }
        System.out.println("------------------------------------------------------------------------------------------ method1 - case2");
        {
            int[] values = {1,3,5};
//            int[] values = {1,2,3,4,5,6};
            // 2의 배수의 평균
            OptionalDouble  average = Arrays.stream(values)
                    .filter(value -> value%2 ==0)
                    .average();
            //값의 존재 여부를 확인하고 Optional 객체에서 값을 가져온다. 
            if(average.isPresent()) {
                System.out.println("2의 배수의 평균 : " + average.getAsDouble());
            }
            else {
                System.out.println("2의 배수의 평균 : 0");
            }
        }
        System.out.println("------------------------------------------------------------------------------------------ method1 - case3");
        {
//            int[] values = {1,3,5};
            int[] values = {1,2,3,4,5,6};
            OptionalDouble  average = Arrays.stream(values)
                    .filter(value -> value%2 ==0)
                    .average();
            //값이 존재하면 실행될 Consumer를 등록한다.
            average.ifPresent(value -> System.out.println("2의 배수의 평균 : " + value));
        }
        System.out.println("------------------------------------------------------------------------------------------ method1 - case4");
        {
            int[] values = {1,3,5};
//            values = {1,2,3,4,5,6};
            OptionalDouble average = Arrays.stream(values)
                    .filter(value -> value%2 ==0)
                    .average();
            //Optional 객체에서 값이 저장되어 있지 않을 경우 기본값을 지정한다.
            System.out.println("2의 배수의 평균 : " + average.orElse(0.0));
        }
        
        System.out.println("------------------------------------------------------------------------------------------ method1 - case5");
        {
            //2의 배수의 최댓값
//            int[] values = {1,3,5};
//            int[] values = {1,2,3,4,5,6};
            int[] values = {1,6,4,3,5,2};
            OptionalInt max = Arrays.stream(values)
                                    .filter(value -> value%2 ==0)
                                    .max();
            System.out.println("2의 배수의 최댓값 : " + max.getAsInt());
            System.out.println("2의 배수의 최댓값 : " + max.orElse(-1));
            
            //2의 배수의 최솟값
            OptionalInt min = Arrays.stream(values)
                                    .filter(value -> value%2 ==0)
                                    .min();
            
            System.out.println("2의 배수의 최솟값 : " + min.getAsInt());
        }
        System.out.println("------------------------------------------------------------------------------------------ method1 - case6");
        {
            //2의 배수의 최댓값
//            int[] values = {1,3,5};
//            int[] values = {1,2,3,4,5,6};
            int[] values = {1,6,4,3,5,2};
            
            //2의 배수의 첫번째 요소
            OptionalInt findFirst = Arrays.stream(values)
                    .filter(value -> value%2 ==0)
                    .findFirst();
            
            System.out.println("2의 배수의 첫번째 요소 : " + findFirst.getAsInt());
        }
    }
    public void method2() 
    {
        System.out.println("------------------------------------------------------------------------------------------ method2 - case1");
        {
            int[] values = {1,2,3,4,5,6};
            
            Arrays.stream(values)
            .filter(value -> value % 2 == 0)
            .reduce((int left, int right) -> left * right)
            .ifPresent(value -> System.out.println("2의 배수의 곱 .ifPresent(): " + value));
            // 2 * 4 * 6 = 48
        }
        System.out.println("------------------------------------------------------------------------------------------ method2 - case2");
        {
            int[] values = {};
            
            int result = Arrays.stream(values)
                    .filter(value -> value % 2 == 0)
                    .reduce(0, (int left, int right) -> left * right);
            System.out.println("2의 배수의 곱 .reduce(1, ... ): " + result);
        }
    }
}