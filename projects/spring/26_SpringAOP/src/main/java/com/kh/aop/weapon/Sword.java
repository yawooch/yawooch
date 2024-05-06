package com.kh.aop.weapon;

public class Sword extends Weapon
{
    public Sword(){}
    public Sword(String name)
    {
        super(name);
    }

    @Override
    public String attack()
    {
        return "검을 휘두른닼";
    }

    @Override
    public String toString()
    {
        return "Sword [name=" + name + "]";
    }
}
