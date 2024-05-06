package com.kh.aop.character;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(
        locations="classpath:spring/root-context.xml"
)
class CharacterTest
{
    @Autowired
    private Character character;
    
    @Test
    @Disabled
    void test()
    {
    }
    
    @Test
    @Disabled
    void create() {
        System.out.println(character);
        
        assertThat(character).isNotNull();
    }
    
    @Test
    void questTest() {
        System.out.println("레츠 기!!!");
//        character.quest("||도토리 50개 줍줍||");
//        System.out.println(character.quest("||도토리 50개 줍줍||"));
        assertThat(character.quest("||도토리 50개 줍줍||"))
        .isNotNull().contains("도토리");
        
        
//        character.quest("도토리 25개 줍줍");
    }
}
