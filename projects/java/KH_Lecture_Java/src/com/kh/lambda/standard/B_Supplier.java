package com.kh.lambda.standard;

import java.util.function.BooleanSupplier;
import java.util.function.LongSupplier;
import java.util.function.Supplier;

/**
 * Supplier
 *  - Supplier 함수적 인터페이스는 매개변수가 없고 리턴값이 있는 get()
 *      추상메소드를 가지고 있다
 *  - get() 추상메소드는 호출한 곳으로 데이터를 리턴(공급)하는 역할을 한다.
 */
public class B_Supplier
{
    /*
     * Supplier
     *  - Supplier 함수적 인터페이스는 매개변수가 없고 리턴값이 있는 get()
     *      추상메소드를 가지고 있다
     *  - get() 추상메소드는 호출한 곳으로 데이터를 리턴(공급)하는 역할을 한다.
     */
    public void method1() {
        Supplier<String> supplier;
        
        supplier = () -> "B_Supplier Supplier : Supplier는 지정된 타입의 객체를 리턴한다";
        
        System.out.println(supplier.get());
        
        BooleanSupplier booleanSupplier;
        
        booleanSupplier = () -> false;
                
        System.out.println("B_Supplier BooleanSupplier 는 boolean " + booleanSupplier.getAsBoolean() + " 타입의 객체를 리턴한다");
        
        LongSupplier longSupplier;
        
        longSupplier = () -> 12345678901L;
                
        System.out.println("B_Supplier LongSupplier 는 Long " + longSupplier.getAsLong() + " 타입의 객체를 리턴한다");
    }
}
