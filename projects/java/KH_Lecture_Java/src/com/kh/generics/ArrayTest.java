package com.kh.generics;


//제네릭 클래스
class MyArray<E>
{
    private Object[] array = new Object[10];
    int i;
    
    //[1] 배열에 추가(add), E 타입의 매개변수를 받아 
    // i번째에 대입하고, i값을 증가하는 메소드
    //          메소드명 : add
    public void add(E e)
    {
        array[i] = e;
        i ++;
    }
    
    //[2] 인덱스를 매개변수로 받아서, 배열(array)에서
    //      인덱스 위치의 데이터를 결과 값으로 반환하는 메소드
    //          메소드명 : get
    public Object get(int i)
    {
        Object tp = array[i]; 
        return tp;
    }
    
    
}
public class ArrayTest
{
    public static void main(String[] args)
    {
        // ** MyArray<E> **
        MyArray<String> ma1 = new MyArray<String>();
        
        ma1.add(new String("Hi"));
        String data1 = (String)ma1.get(0);
        System.out.println(data1);
        
        MyArray<Integer> ma2 = new MyArray<Integer>();
        ma2.add(10);
        String data2 = (String)ma2.get(0);
        System.out.println(data2);
    }
}
