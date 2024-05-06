package com.kh.mybatis;

import static org.assertj.core.api.Assertions.assertThat;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import com.kh.mybatis.common.template.SqlSessionTemplate;

//하나이상의 @Test 애노테이션을 포함한 메소드를 가지고 있는 클래스를 테스트 클래스라고 한다.
@DisplayName("첫번째 테스트 클래스 작성")
public class AppTest 
{
    @Test//(=테스트메소드)
    @Disabled //테스트 메소드를 비활성화 한다
    public void nothing()
    {
        //현재프로젝트가 테스트 가능한 환경인지 확인한다
    }
    
    
    @Test
    @DisplayName("SqlSession 생성 테스트")
    public void create() {
        int count = 0 ;
        SqlSession session = SqlSessionTemplate.getSession();

        count = session.selectOne("memberMapper.selectCount");
        
        assertThat(session).isNotNull();
        assertThat(count).isGreaterThanOrEqualTo(3);
        
    }
}
