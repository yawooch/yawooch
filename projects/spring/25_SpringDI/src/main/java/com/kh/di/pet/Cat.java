package com.kh.di.pet;

public class Cat extends Pet
{ 
    public Cat()
    {
    }

    public Cat(String name)
    {
        super.name = name;
    }

    public String bark()
    {
        return "야옹";
    }
    
    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        super.name = name;
    }

    @Override
    public String toString()
    {
        return "Cat [name=" + name + "]";
    }
    
    
}
