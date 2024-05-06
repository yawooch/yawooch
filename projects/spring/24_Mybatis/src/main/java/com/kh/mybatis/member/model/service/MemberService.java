package com.kh.mybatis.member.model.service;

import java.util.List;

import com.kh.mybatis.member.model.vo.Member;

public interface MemberService
{

    int getMemberCount();

    List<Member> findAll();

    Member findMemberById(String userId);

    int save(Member member);

    int delete(int no);

}
