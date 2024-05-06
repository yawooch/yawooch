package com.kh.aop.pet;

public abstract class Pet
{
    protected String name;
    
    public abstract String bark();


    public Pet()
    {
        super();
    }
    
    public Pet(String name)
    {
        super();
        this.name = name;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }
}
