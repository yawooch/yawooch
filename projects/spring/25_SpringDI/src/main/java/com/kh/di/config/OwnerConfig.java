package com.kh.di.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.kh.di.owner.Owner;
import com.kh.di.pet.Cat;
import com.kh.di.pet.Pet;

@Configuration
public class OwnerConfig
{

    @Bean(name="lim")
    public Owner owner(@Autowired Cat cat) {
//        return new Owner("임꺽정", 30, cat());
        return new Owner("임꺽정", 30, cat);
    }
    
    
    @Bean
    // @Qualifier를 이용하여 Bean을 명확히 할 수도 있고,
//    public Owner kim(@Autowired @Qualifier("dog") Pet pet) {
    // PetConfig.java에서 @Primary 를 주면 기본 Bean을 지정이 가능하다
    public Owner kim(@Autowired Pet pet) {
//    public Owner kim(Pet pet) {
        Owner owner = new Owner();
        
        owner.setName("김철수");
        owner.setAge(27);
//        owner.setPet(dog());
        owner.setPet(pet);
        
        return owner;
    }
}
