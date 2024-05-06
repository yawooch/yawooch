package com.kh.aop.pet;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class Dog extends Pet
{
    public Dog(@Value("백구")String name)
    {
        super.name = name;
    }

    @Override
    public String bark()
    {
        return "멍멍";
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
        return "Dog [name=" + name + "]";
    }
}
