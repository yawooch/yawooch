package com.kh.di.owner;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.kh.di.config.RootConfig;
import com.kh.di.pet.Cat;
import com.kh.di.pet.Dog;

/*
 * JUnit에서 스프링을 사용할 수 있도록 SpringExtention 을 사용하여 확장한다.
 * @ContextConfiguration()을 통해서 설정 파일을 읽고 애플리케이션 컨텍스트를 생성할 수 있다.
 */
@ExtendWith(SpringExtension.class)
// 1. xml로 설정할때
//@ContextConfiguration(locations= {"classpath:spring/root-context.xml"})
// 2. java 설정으로 config를 설정할때
@ContextConfiguration(classes= {RootConfig.class})
class OwnerTest
{
    @Autowired
//    @Qualifier("hong")
//    @Qualifier("lee")
    @Qualifier("lim")
    private Owner owner;
    
    
    @BeforeEach
    void setUp() throws Exception
    {
    }

    @Test
    @Disabled
    void create()
    {
        //생성자를 통한 의존성 주입
        // 기존에 자바 애플리케이션에서는 다형성을 통해 객체간의 결합도를 느슨하게 만들었다.
        Owner owner = new Owner("홍길동", 25, new Dog("댕댕이"));
        
        owner.setName("이몽룡");
        owner.setAge(22);
        owner.setPet(new Dog("복희"));
        
        System.out.println(owner);
        
        owner = new Owner("홍길동", 25, new Cat("애옹이"));
        System.out.println(owner);
        
        assertThat(owner).isNotNull();
        assertThat(owner.getPet()).isNotNull();
    }
    
    @Test
//    @Disabled
    void autowiredTest() {
        System.out.println(owner);
        
        assertThat(owner).isNotNull();
        assertThat(owner.getPet()).isNotNull();
    }
    
    @Test
    @Disabled
    void xmlApplicationContextTest() {
        
        //1. xml설정파일로 application container를 만드는 방법
//        스프링은 애플리케이션 컨텍스트를 활용하여 객체간의 결합도를 더욱 느슨하게 만든다.
//         기본적으로 클래스 패스를 기준으로 파일을 찾는다.
        ApplicationContext context  = new GenericXmlApplicationContext("spring/root-context.xml");
//        ApplicationContext context  = new GenericXmlApplicationContext("classpath:spring/root-context.xml");
        //직접 파일의 경로를 지정해서 찾는다.
//        ApplicationContext context  = new GenericXmlApplicationContext("file:C:/workspace/6_framework/02_SpringDI/src/main/resources/spring/root-context.xml");

        Owner owner   = (Owner)context.getBean("hong", Owner.class);

        System.out.println(owner);
        
        Owner ownerLee = (Owner)context.getBean("lee", Owner.class);
        
        System.out.println(ownerLee);
        assertThat(context).isNotNull();
        assertThat(owner).isNotNull();
        assertThat(ownerLee).isNotNull();
        assertThat(owner.getPet()).isNotNull();
        
    }
    
    @Test
    void annotationApplicationContextTest() {
        
        ApplicationContext context = new AnnotationConfigApplicationContext(RootConfig.class);
        
        Owner owner = context.getBean("lim", Owner.class);
        
        System.out.println(owner);
        
        Owner kim= context.getBean("kim", Owner.class);
        
        System.out.println(kim);
        
        assertThat(owner).isNotNull();
        assertThat(kim).isNotNull();
        assertThat(owner.getPet()).isNotNull();
        assertThat(kim.getPet()).isNotNull();
    }
}
