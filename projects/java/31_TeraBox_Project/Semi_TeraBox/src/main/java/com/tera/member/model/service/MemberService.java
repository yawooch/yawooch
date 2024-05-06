package com.tera.member.model.service;

import static com.tera.common.jdbc.JDBCTemplate.commit;
import static com.tera.common.jdbc.JDBCTemplate.close;
import static com.tera.common.jdbc.JDBCTemplate.getConnection;
import static com.tera.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;

import com.tera.member.model.dao.MemberDao;
import com.tera.member.model.vo.Member;

public class MemberService {

    /** 중복방지를 위해 메소드 생성 */
    public Member findMemberById(String userId) {
        
        Member member = null;
        
        Connection connection = getConnection();
        
        member = new MemberDao().findMemberById(connection, userId);
        
        close(connection);
        
        return member;
    }
	
	public int save(Member member) {
		int result = 0;
		
		Connection connection = getConnection();
		result = new MemberDao().insertMember(connection,member);
		
		if(result>0) {
			commit(connection);
		}else {
			rollback(connection);
		}
		
		return result;
	}

    /** 입력한 정보로 회원 정보를 불러온다 */
    public Member login(String userId, String userPwd)
    {
        Member member = this.findMemberById(userId);
        
        if(member!=null && member.getPassword().equals(userPwd)){
            
            return member;
        }
        else {
            return null;
        }
    }

	public Boolean isDuplicateId(String userId) {
		return this.findMemberById(userId) != null;
	}


}
