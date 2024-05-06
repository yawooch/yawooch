package com.kh.di.character;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.kh.di.weapon.Weapon;

import lombok.Getter;
import lombok.ToString;

@Component
@ToString
@Getter
public class Character
{
    @Value("${character.name:이몽룡}")//기본값 설정
    private String name;
    
    @Value("${character.level:15}")//기본값 설정
    private int level;
    
    @Autowired(required=false)
    @Qualifier("sword")
    private Weapon weapon;
}
