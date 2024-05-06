package com.kh.mybatis.member.model.service;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;
import org.junit.jupiter.params.provider.ValueSource;

import com.kh.mybatis.member.model.vo.Member;

@DisplayName("MemberService Test")
@TestMethodOrder(OrderAnnotation.class)
class MemberServiceTest
{
    private MemberService service;
    
    //모든 테스트 메소드들이 실행되기 전에 실행되는 메소드이다
//    @BeforeAll
//    public static void init() {
//        System.out.println("init() - 호출");
//    }

    //모든 테스트 메소드들이 실행된 후에 실행되는 메소드이다
//    @AfterAll
//    public static void afterAll() {
//        System.out.println("afterAll() - 호출");
//    }

    // 테스트 메소드들이 실행되기 전에 실행되는 메소드이다.
    @BeforeEach
    void setUp() {
        System.out.println("setUp() - 호출");
        service = new MemberServiceImpl();
    }
    // 테스트 메소드들이 실행된 후에 실행되는 메소드이다.
//    @AfterEach
//    void tearDown() {
//        System.out.println("tearDown() - 호출");
//    }
    
    @Test
    @Disabled
    void nothing()
    {
        System.out.println("I have nothing~");
    }
    @Test
    @Disabled
    @DisplayName("MemberService 생성 테스트")
    void create()
    {
//        MemberService service = new MemberServiceImpl();
        
        assertThat(service).isNotNull();
        
    }
    
    @Test
    @Order(1)
    @DisplayName("회원수 조회 테스트")
    void getMemberCountTest() {
        int count = 0;
        
//        MemberService service = new MemberServiceImpl();
        
        count = service.getMemberCount();
        System.out.println("count : "+ count);
        
        assertThat(count).isGreaterThan(0);
    }
    @Test
    @Order(3)
    @DisplayName("모든 회원 조회")
    void findAllTest()
    {
        List<Member> members = null;
//        MemberService service = new MemberServiceImpl();
        
        members = service.findAll();

        System.out.println(members);
        
        members.stream().forEach(System.out::println);
        
        assertThat(members).isNotNull().isNotEmpty();
    }
    
//    @Test
    @ParameterizedTest
    @Order(1)
    @ValueSource(strings = {"yoc0421", "admin"})
    @DisplayName("회원 조회 테스트(ID로 검색)")
    public void findMemberById(String userId) {
        System.out.println("회원 조회 테스트(ID로 검색)");
        Member member = null;
        
        member = service.findMemberById(userId);
        
        System.out.println(member);
        
//        assertThat(member).isNotNull();
//        assertThat(member.getId()).isEqualTo(userId);
        assertThat(member).isNotNull().extracting("id").isEqualTo(userId);//extracting은 Member 객체에 있는 필드명을 입력해야한다.
    }
    
    
//    @Test
    @ParameterizedTest
    @CsvSource(value= {
            "test1, 1234, 임쪙",
            "user1, 5678, James"
            })
    @Order(2)
    @Disabled
    @DisplayName("회원 등록 테스트")
    void insertMemberTest(String id, String password, String name) {
        int result = 0;
        
        Member member = new Member(id,  password, name);
        
        result = service.save(member);

        assertThat(result).isGreaterThan(0);
        assertThat(member.getNo()).isGreaterThan(0);
    }
    
//    @Test
    @ParameterizedTest
    @CsvSource({
        "test1, 9999, 성춘향",
        "user1, 1234, 심청이"
    })
    @Order(5)
    @Disabled
    @DisplayName("회원 정보 수정 테스트")
    void updateMemberTest(String id , String password, String name) 
    {
        Member member = service.findMemberById(id);
        int result = 0;
        
        member.setName(name);
        member.setPassword(password);
        result = service.save(member);
        
        System.out.println(member);
        assertThat(result).isGreaterThan(0);
        //실제로 DB에 Member가 수정되었는지 확인하기 위해서 다시 Member를 조회
        assertThat(service.findMemberById(id).getName()).isEqualTo(name);
        
    }
    

//  @Test
    @ParameterizedTest
    @ValueSource(strings = {"test1","user1"})
    @Order(6)
    @Disabled
    @DisplayName("회원 삭제 테스트")
    void deleteMemberTest(String id) {
        Member member = service.findMemberById(id);
        int result = 0;
        
        result = service.delete(member.getNo());

        System.out.println("회원 삭제 테스트");
        System.out.println(member);
//        assertThat(member);
        assertThat(result).isGreaterThan(0);
        assertThat(service.findMemberById(id)).isNull();
    }
}
