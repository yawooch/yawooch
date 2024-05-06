package com.kh.mybatis.member.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.mybatis.member.model.vo.Member;

public class MemberDao
{
    public int getMemberCount(SqlSession session)
    {
        return session.selectOne("memberMapper.selectCount");
    }

    public List<Member> findAll(SqlSession session)
    {
        return session.selectList("memberMapper.selectAll");
    }

    public Member findMemberById(SqlSession session, String userId)
    {
        return session.selectOne("memberMapper.selectMemberById", userId);
    }

    public int insertMember(SqlSession session, Member member)
    {
        return session.insert("memberMapper.insertMember", member);
    }

    public int updateMember(SqlSession session, Member member)
    {
        return session.update("memberMapper.updateMember", member);
    }

    public int delete(SqlSession session, int no)
    {
        return session.delete("memberMapper.deleteMember", no);
    }
}
