package com.kh.security.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.kh.security.member.model.mapper.MemberMapper;
import com.kh.security.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class MemberDetailsService implements UserDetailsService
{
    @Autowired
    private MemberMapper mapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException
    {
        Member member = mapper.selectMemberById(username);
        
        if(member == null) {
            throw new UsernameNotFoundException(username + "is not found");
        }
        
        log.info("username : " + member.getId());
        
        return member;
    }

}
