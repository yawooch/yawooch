package com.kh.mvc.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import static com.kh.mvc.common.jdbc.JDBCTemplate.close;
import com.kh.mvc.member.model.vo.Member;

public class MemberDao
{
    public Member findMemberById(Connection connection, String userId)
    {
        Member member          = null;
        PreparedStatement psmt = null;
        ResultSet rs           = null;
        String query           = "SELECT * FROM MEMBER WHERE ID=? AND STATUS='Y'";

        try
        {
            psmt = connection.prepareStatement(query);
            psmt.setString(1, userId);
            rs = psmt.executeQuery();
            if(rs.next()){
                member = new Member();
                member.setNo(        rs.getInt(   "NO"         ));
                member.setId(        rs.getString("ID"         ));
                member.setPassword(  rs.getString("PASSWORD"   ));
                member.setRole(      rs.getString("ROLE"       ));
                member.setName(      rs.getString("NAME"       ));
                member.setPhone(     rs.getString("PHONE"      ));
                member.setEmail(     rs.getString("EMAIL"      ));
                member.setAddress(   rs.getString("ADDRESS"    ));
                member.setHobby(     rs.getString("HOBBY"      ));
                member.setStatus(    rs.getString("STATUS"     ));
                member.setEnrollDate(rs.getDate(  "ENROLL_DATE"));
                member.setModifyDate(rs.getDate(  "MODIFY_DATE"));
            }
        }
        catch (SQLException e){e.printStackTrace();}
        finally 
        {
            close(rs);
            close(psmt);
        }
        return member;
    }
    
    public int insertMember(Connection connection, Member member)
    {
        int result = 0;
        PreparedStatement pstmt = null;
        
        String query = "INSERT INTO MEMBER VALUES(SEQ_UNO.NEXTVAL,?,?,DEFAULT,?,?,?,?,?,DEFAULT,DEFAULT,DEFAULT)";
        
        try
        {
            pstmt = connection.prepareStatement(query);
            
            pstmt.setString(1, member.getId());
            pstmt.setString(2, member.getPassword());
            pstmt.setString(3, member.getName());
            pstmt.setString(4, member.getPhone());
            pstmt.setString(5, member.getEmail());
            pstmt.setString(6, member.getAddress());
            pstmt.setString(7, member.getHobby());
            
            result = pstmt.executeUpdate();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        finally {
            close(pstmt);
        }
        
        return result;
    }

    public int updateMember(Connection connection, Member member)
    {
        int result = 0;
        PreparedStatement pstmt = null;
        String query = "UPDATE MEMBER SET NAME=?,PHONE=?,EMAIL=?,ADDRESS=?,HOBBY=?,MODIFY_DATE=SYSDATE WHERE NO=?";
        
        try
        {
            pstmt = connection.prepareStatement(query);
            pstmt.setString(1, member.getName());
            pstmt.setString(2, member.getPhone());
            pstmt.setString(3, member.getEmail());
            pstmt.setString(4, member.getAddress());
            pstmt.setString(5, member.getHobby());
            pstmt.setInt(   6, member.getNo());
            
            result = pstmt.executeUpdate();
            
        } catch (SQLException e)
        {
            e.printStackTrace();
        }
        finally {
            close(pstmt);
        }
        
        return result;
    }

    /** STATUS를 N으로 변경시켜 회원 탈퇴 처리한다. */
    public int updateStatus(Connection connection, int no, String status)
    {
        int result = 0;
        PreparedStatement pstmt = null;
        String query = "UPDATE MEMBER SET STATUS=? WHERE NO=?";
//        String query = "DELETE FROM MEMBER WHERE NO=?";
        
        try
        {
            pstmt = connection.prepareStatement(query);
            pstmt.setString(1,  status);
            pstmt.setInt(   2,  no);
//            pstmt.setInt(   1,  no);
            result = pstmt.executeUpdate();
        }
        catch (SQLException e){e.printStackTrace();}
        finally{ close(pstmt); }
        
        
        return result;
    }
}