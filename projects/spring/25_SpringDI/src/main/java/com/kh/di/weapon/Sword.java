package com.kh.di.weapon;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class Sword extends Weapon
{
    //4-2
    public Sword(@Value("${character.weapon.name:강철검}") String name)
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
