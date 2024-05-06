package com.kh.aop.owner;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.kh.aop.config.RootConfig;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(classes=RootConfig.class)
class OwnerTest
{
    @Autowired
    private Owner owner;
    
    @Test
    @Disabled
    void test(){}
    
    @Test
    @Disabled
    void create() {
        
        System.out.println(owner);
        assertThat(owner).isNotNull();
    }
    
    @Test
    void barkTest() {
        assertThat(owner.getPet().bark()).isNotNull();
    }
}
