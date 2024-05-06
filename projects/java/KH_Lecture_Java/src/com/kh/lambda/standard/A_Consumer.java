package com.kh.lambda.standard;

import java.util.function.BiConsumer;
import java.util.function.Consumer;
import java.util.function.DoubleConsumer;
import java.util.function.ObjIntConsumer;

/**
 * Consumer 
 *  - Consumer 함수적 인터페이스는 리턴값이 없는 accept() 추상메소드를 가지고 있다.
 *  - accept() 추상메소드는 매개값을 소비하는 역할을 한다.(사용만 하고 리턴하지는 않는다)
 */
public class A_Consumer
{
    /*
     * Consumer 
     *  - Consumer 함수적 인터페이스는 리턴값이 없는 accept() 추상메소드를 가지고 있다.
     *  - accept() 추상메소드는 매개값을 소비하는 역할을 한다.(사용만 하고 리턴하지는 않는다)
     */
    public void method1() {
        Consumer<String> consumer;
        
        consumer = str -> System.out.println("A_Consumer Consumer   : " + str);
        
        consumer.accept("Consumer  는 한 개의 매개값을 받아서 소비한다.");
        
        BiConsumer<String, String> biConsumer;
        
        biConsumer = (str1, str2) -> System.out.println("A_Consumer BiConsumer : " + str1 + str2);
        
        biConsumer.accept("BiConsumer는 ", "두 개의 매개값을 받아서 소비한다");
        
        DoubleConsumer doubleConsumer;
        
        doubleConsumer = value -> System.out.println("A_Consumer DoubleConsumer : " + value);
        doubleConsumer = System.out::println;
        
        doubleConsumer.accept(3.141592);
        
        ObjIntConsumer<String> objIntConsumer;
        
        objIntConsumer = (str, value) -> System.out.println("A_Consumer ObjIntConsumer : " + str + value);
        
        objIntConsumer.accept("Java Version - ", 11);
    };
}
