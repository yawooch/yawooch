package com.kh.di.character;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.kh.di.weapon.Weapon;

import lombok.Getter;
import lombok.ToString;

//@Component
//@ToString
//@Getter
//3-2. 생성자를 통해서 Bean을 주입받는 방법 - lombok을 이용한 주입
//@RequiredArgsConstructor//@NoneNull 이 있거나 final 이 붙은 필드에대한 값으로 생성자를 추가해주는 lombok
//public class Character
//{
//    @Value("이몽룡")
//    private String name;
    
//    @Value("15")
//    private int level;

    //1. 필드에 직접 주입
//    @Autowired(required=false)
//    @Qualifier("sword")
//    private Weapon weapon;

    //2-1. setter를 이용한 주입
    //@Autowired 생략 X(메소드 위에만 지정가능)
//    @Autowired
//    @Qualifier("sword")
//    public void setWeapon(Weapon weapon) {
//        this.weapon = weapon;
//    }
    
    //2-2. setter를 이용한 주입 - lombok을 이용한 주입
//    @Setter(onMethod_ = @Autowired)
//    private Weapon weapon;

    //3-1. 생성자를 통해서 Bean을 주입받는 방법
//    private Weapon weapon;
//    public Character(@Qualifier("sword") Weapon weapon) {//@Autowired 생략 가능
//    public Character(@Autowired @Qualifier("sword") Weapon weapon) {
//        this.weapon = weapon;
//    }
    //3-2. 생성자를 통해서 Bean을 주입받는 방법 - lombok을 이용한 주입
//    private final Weapon weapon;
    
//}
@Component
@ToString
@Getter
/*
 * 4. properties 파일의 값을 읽어오는 방법
 * 
 * 4-1. @PropertySource 를 사용하는 방법
 *      - Environment 객체를 통해서 character.properties 에 설정된 값을 읽어올 수 있다.
 *      - 스프링 프로퍼티 플레이스 홀더를 통해서 character.properties에 설정된 값을 읽어온다.
 * 4-2. @PropertySource 를 생략하는 방법
 *      - xml 설정 파일을 사용하는 경우
 *        <context:property-placeholder/> 요소를 추가한다.
 *      - 자바 설정 파일을 사용하는 경우
 *        PropertySourcesPlaceholderConfigurer 빈을 생성한다.
 */
//@PropertySource("classpath:character.properties")
public class Character
{
//    4-1-2. @Value("${}")(=Spring PropertyPlaceholder) 를 통해 .properties에 설정된 값을 읽어올 수 있다.
//    @Value("${character.name}")
    @Value("${character.name:이몽룡}")//기본값 설정
    private String name;
    
//    4-1-2. @Value("${}")(=Spring PropertyPlaceholder) 를 통해 .properties에 설정된 값을 읽어올 수 있다.
//    @Value("${character.level}")
    @Value("${character.level:15}")//기본값 설정
    private int level;
    
    @Autowired(required=false)
    @Qualifier("sword")
    private Weapon weapon;
}
