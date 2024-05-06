package com.kh.aop.character;

import com.kh.aop.weapon.Weapon;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Character
{
    private String name;
    
    private int level;
    
    private Weapon weapon;
    
    public String quest(String questName) {
//        System.out.println(questName + " 퀘스트 진행중..");
        
//        if(true)
//        {
//            throw new RuntimeException("존재하지 않는 퀘스트");
//        }
//        System.out.println(questName + " 퀘스트 진행중..");
        
        return questName + " 퀘스트 진행중..";
    }
}
