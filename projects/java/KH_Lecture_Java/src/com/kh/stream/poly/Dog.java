package com.kh.stream.poly;

public class Dog extends Animal
{
    public Dog(String name)
    {
        super(name);
    }

    @Override
    public void eat()
    {
        System.out.println(this.name + "이 고구마를 먹는다.");
    }
}
