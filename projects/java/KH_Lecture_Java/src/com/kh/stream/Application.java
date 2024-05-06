package com.kh.stream;

import com.kh.stream.poly.Animal;
import com.kh.stream.poly.Animal2;
import com.kh.stream.poly.Cat;
import com.kh.stream.poly.Dog;
import com.kh.stream.practice.A_Create;
import com.kh.stream.practice.B_Filtering;
import com.kh.stream.practice.C_Sorted;
import com.kh.stream.practice.D_Mapping;
import com.kh.stream.practice.E_Looping;
import com.kh.stream.practice.G_Aggregate;
import com.kh.stream.practice.H_Collect;

public class Application
{
    /*
     * Stream API
     *  - 컬렉션(배열)의 요소들을 하나씩 참조해서 람다식으로 
     *      처리할수 있도록 해주는 반복자이다.
     *  - 스트림은 Iterator와 비슷한 역할을 하지만 람다식으로 
     *      요소들의 처리 코드를 제공 할 수 있고 내부 반복자를 사용해서
     *      병렬처리, 중간처리, 최종처리작업을 수행할 수 있다.
     */
    public static void main(String[] args)
    {
        //Stream 생성

        System.out.println("------------------------------------------------------------------------------------------ A_Create()");
        new A_Create().method1();
        new A_Create().method2();
        new A_Create().method3();
        
        System.out.println("------------------------------------------------------------------------------------------ B_Filtering()");
        System.out.println("------------------------------------------------------------------------------------------ method1()");
        new B_Filtering().method1();
        System.out.println("------------------------------------------------------------------------------------------ method2()");
        new B_Filtering().method2();

        System.out.println("------------------------------------------------------------------------------------------ C_Sorted()");
        System.out.println("------------------------------------------------------------------------------------------ method1()");
        new C_Sorted().method1();
        System.out.println("------------------------------------------------------------------------------------------ method2()");
        new C_Sorted().method2();
        
        System.out.println("------------------------------------------------------------------------------------------ D_Mapping()");
        System.out.println("------------------------------------------------------------------------------------------ method1()");
        new D_Mapping().method1();
        System.out.println("------------------------------------------------------------------------------------------ method2()");
        new D_Mapping().method2();
        System.out.println("------------------------------------------------------------------------------------------ method3()");
        new D_Mapping().method3();
        
        System.out.println("------------------------------------------------------------------------------------------ E_Looping()");
        System.out.println("------------------------------------------------------------------------------------------ method1()");
        new E_Looping().method1();
        
        // 최종처리 메소드
        System.out.println("------------------------------------------------------------------------------------------ G_Aggregate()");
        System.out.println("------------------------------------------------------------------------------------------ method1()");
        new G_Aggregate().method1();
        System.out.println("------------------------------------------------------------------------------------------ method2()");
        new G_Aggregate().method2();
        System.out.println("------------------------------------------------------------------------------------------ H_Collect()");
        System.out.println("------------------------------------------------------------------------------------------ method1()");
        new H_Collect().method1();

        // 다형성
        // 1. 메소드 재정의(Dog, Cat 참고)
        // 2. 객체의 형변환
        // int number = 3.14;
        // int number = (int)3.14;
        System.out.println("------------------------------------------------------------------------------------------ Animal()");
        Animal animal = new Dog("홍길동");
        
        animal.eat();
        animal = new Cat("성춘향");
        animal.eat();
        
        Dog dog = (Dog)animal;//다운캐스팅
        animal.eat();
        
        Animal2 animal2 = new Animal2() {
            @Override
            public void eat()
            {
                System.out.println("홍길동이 츄르를 먹는다.");
            }
        };
        animal2.eat();
        Animal2 animal3 = () -> System.out.println("홍길동이 츄르를 먹는다.");
        animal3.eat();
    }
}
