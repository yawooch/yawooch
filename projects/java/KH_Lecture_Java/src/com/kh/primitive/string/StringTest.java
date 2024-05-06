package com.kh.primitive.string;

public class StringTest
{
    public static void main(String[] args)
    {
        String str1 = new String("Apple");
        String str2 = new String("Apple");
        
        System.out.println(str1 == str2);
        System.out.println(str1.equals(str2));
        
        String str3 = "samsung";
        String str4 = "samsung";
        
        System.out.println(str3 == str4);
        System.out.println(str3.equals(str4));
        System.out.println(System.identityHashCode(str3));
        System.out.println(System.identityHashCode(str4));
        
        String str5 = new String("java");
        String str6 = new String("python");
        
        System.out.println(str5);
        System.out.println("처음 문자열 주소값 : " + System.identityHashCode(str5));
        System.out.println("str6 : " + System.identityHashCode(str6));
        
        
        str5 = str5.concat(str6); //concat : 문자열을 연결해주는 메소드
                                  // javapython
        System.out.println(str5);
        System.out.println("연결 후 문자열 주소값 : " + System.identityHashCode(str5)); // 새로운 주소값으로 생성됨
        // => 문자열값 수정 불가능
    }
}
