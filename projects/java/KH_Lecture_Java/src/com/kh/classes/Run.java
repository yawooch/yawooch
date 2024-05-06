package com.kh.classes;

public class Run
{
    public static void main(String[] args)
    {
        //이름, 나이 핸드폰 번호
        
//        Person kim = new Person();
        Person kim = new Person("김아무개", 35, "010-0000-0000");
//        kim.name   = "김아무개";
//        kim.setName("김아무개");
//        kim.setAge(35);
//        kim.setPhone("010-0000-0000");

        System.out.println("이름 : " + kim.getName());
        
        kim.printInfo();
        
        
//        Person lee = new Person();
        Person lee = new Person("이아무개", 48, "010-1111-1111");
//        lee.setName("이아무개");
//        lee.setAge(48);
//        lee.setPhone("010-1111-1111");

        lee.printInfo();
        
    }
}
