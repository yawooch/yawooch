package com.kh.di.pet;

public class Dog extends Pet
{
    public Dog(){}

    public Dog(String name)
    {
        super.name = name;
    }

    @Override
    public String bark()
    {
        return "멍멍";
    }

    @Override
    public String toString()
    {
        return "Dog [name=" + name + "]";
    }
}
