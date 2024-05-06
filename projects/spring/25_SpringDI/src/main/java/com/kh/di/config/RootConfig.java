package com.kh.di.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.core.io.ClassPathResource;

@Configuration
@Import(value = {OwnerConfig.class, PetConfig.class})
@ComponentScan("com.kh.di")
public class RootConfig
{
    @Bean
    public PropertySourcesPlaceholderConfigurer placeholderConfigurer() 
    {
        PropertySourcesPlaceholderConfigurer configurer = null;
        configurer = new PropertySourcesPlaceholderConfigurer();
        //스프링에서 리소스를 더 쉽게 가져오기 위해
        // Resource 인터페이스의 구현체인 ClassPathResource 객체를 사용한다.
        configurer.setLocation(new ClassPathResource("character.properties"));
        //여러개의 properties 파일을 등록하는 경우
//        configurer.setLocations(
//                new ClassPathResource("character.properties"),
//                new ClassPathResource("driver.properties"),
//                new ClassPathResource("pet.properties")
//        );
        
        return configurer;
    }
}