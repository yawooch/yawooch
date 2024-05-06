package com.tera.common.jdbc.test.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tera.member.model.vo.Member;


/**
 * <MEMBER 테이블>
 */
public class MemberDao
{
    
    
    /**
     * MEMBER 테이블에 있는 모든 데이터를 불러와 List<Member>에 넣어준다.
     * @return
     */
    public List<Member> findAll()
    {
        List<Member> members = new ArrayList<Member>();

        Connection connection = null;
        Statement stmt        = null;
        ResultSet rs          = null;
        
        try
        {
            Class.forName("oracle.jdbc.driver.OracleDriver");// 오라클 드라이버
            
            connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "C##TERA", "TERA");
            stmt       = connection.createStatement();
            rs         = stmt.executeQuery("SELECT * FROM MEMBER");
            
            while(rs.next())
            {
                Member member = new Member();

                member.setMemberId(rs.getString("MEMBER_ID"));
                member.setPassword(rs.getString("PASSWORD"));
                member.setMemberName(rs.getString("MEMBER_NAME"));
                member.setBirth(rs.getString("BIRTH"));
                member.setMemPhone(rs.getString("MEM_PHONE"));
                member.setMemEmail(rs.getString("MEM_EMAIL"));
                member.setMemSsn(rs.getString("MEM_SSN"));
                member.setMktAgreeYn(rs.getString("MKT_AGREE_YN"));
                member.setBnftsMedia(rs.getString("BNFTS_MEDIA"));
                member.setManagerYn(rs.getString("MANAGER_YN"));
                member.setJoinDttm(rs.getDate("JOIN_DTTM"));
                
                members.add(member);
            }
        }
        catch (ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        finally
        {
            try
            {
                rs.close();
                stmt.close();
                connection.close();
            } catch (SQLException e)
            {
                e.printStackTrace();
            }
        }
        
        return members;
    }
}
