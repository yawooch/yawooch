package com.kh.di.weapon;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Component;


// Bean 생성시 별도의 ID를 지정하지 않으면
// 클래스 이름에서 앞글자를 소문자로 바꾼 ID 를 갖는다.
@Component
//@Component("빈 ID")
//@Component("Bowow")
@Primary//동일한 타입의 빈이 여러개 존재할 때 기본으로 주입될 빈을 지정한다
public class Bow extends Weapon
{
    public Bow(@Value("오래된활") String name)
    {
        super(name);
    }

    @Override
    public String attack()
    {
        return "활을 쏜닼";
    }

    @Override
    public String toString()
    {
        return "Bow [name=" + name + "]";
    }
}
