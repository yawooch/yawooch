package com.kh.classes;

public class Person
{
    //이름 나이 핸드폰 번호
    //데이터(인스턴스 변수)
    private String name = "";
    private int age;
    private String phone;
    private String ssn;
    

    public String getSsn()
    {
        return ssn;
    }

    public void setSsn(String ssn)
    {
        this.ssn = ssn;
    }

    public int getAge()
    {
        return age;
    }

    public void setAge(int age)
    {
        this.age = age;
    }

    public String getPhone()
    {
        return phone;
    }

    public void setPhone(String phone)
    {
        this.phone = phone;
    }
    
    //기능(인스턴스메소드)
    //생성자 : 초기화
    //public Person(){}
    public Person(String name, int age, String phone)
    {
        this.name = name;
        this.age = age;
        this.phone = phone;
    }

    public Person()
    {
    }
    //getter , setter
    //name 변수의 값을 확인
    public String getName()
    {
        return name;
    }
    
    //name 변수의 값을 대입
    public void setName(String name)
    {
        this.name = name;
    }
    
    //기능(인스턴스 메소드)
    public void printInfo()
    {
        System.out.printf("%s, %d, %s\n", name,age,phone);
    }
}
