package com.kh.mvc.member.model.service;

//import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.mvc.member.model.mapper.MemberMapper;
import com.kh.mvc.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService
{
    @Autowired
    private MemberMapper mapper;
    
    @Autowired
    private BCryptPasswordEncoder encoder;

    @Override
    public Member login(String userId, String userPwd)
    {
        Member member = null;
        
//        member = session.selectOne("memberMapper.selectMemberById",userId);
        member = mapper.selectMemberById(userId);
        
        log.info("encoder.encode(userPwd) : " + encoder.encode(userPwd));
        
        //matches 메소드를사용하면내부적으로 복호화 해서 나온결과값에 솔트값을 땐 나머지 값과 원문을 비교한다.
        log.info("encoder.matches(userPwd, member.getPassword()) : " + encoder.matches(userPwd, member.getPassword()));
        
        System.out.println(member);
        
        if (member == null || !encoder.matches(userPwd, member.getPassword()))
        {
            return null;
        }
        
        return member;
    }

    @Override
    @Transactional
    public int save(Member member)
    {
        int result = 0;
        
        
        if (member.getNo() > 0)
        {
            //update
            result = mapper.updateMember(member);
        }
        else
        {
            //insert
            member.setPassword(encoder.encode(member.getPassword()));
            result = mapper.insertMember(member);
        }
        
        
        return result;
    }

    @Override
    public Boolean isDuplicateId(String userId)
    {
        return mapper.selectMemberById(userId) != null;
    }

    @Override
    public Member findMemberById(String id)
    {
        return mapper.selectMemberById(id);
    }

    @Override
    @Transactional
    public int delete(int no)
    {
        return mapper.updateStatus(no , "N");
    }
}
