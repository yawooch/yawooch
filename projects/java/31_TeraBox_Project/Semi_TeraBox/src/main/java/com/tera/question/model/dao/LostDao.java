package com.tera.question.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.tera.common.jdbc.JDBCTemplate.*;
import com.tera.common.util.PageInfo;
import com.tera.question.model.vo.Question;

public class LostDao {

	public int getLostCount(Connection connection) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) FROM QUESTION WHERE QUEST_DIVISION = '분실물'";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				count = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return count;
	}

	
	
	public List<Question> findLostAll(Connection connection, PageInfo pageInfo) {
		List<Question> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Question question = null;
		String query = "SELECT RNUM, QUEST_NO, QUEST_TITLE, QUEST_CONTENT, QUEST_PASS_NO, QUEST_PHONE, QUEST_NAME, QUEST_DIVISION, "
				+ 				"QUEST_EMAIL, MEMBER_ID, ANSW_CHECK, CINEMA_ID, ANSW_CONTENT, ANSW_REG_DTTM, ANSW_MEMBER_ID "
				+ 		"FROM ( "
				+ 				"SELECT ROWNUM AS RNUM, QUEST_NO, QUEST_TITLE, QUEST_CONTENT, QUEST_PASS_NO, QUEST_PHONE, QUEST_NAME, QUEST_DIVISION, "
				+ 						"QUEST_EMAIL, MEMBER_ID, ANSW_CHECK, CINEMA_ID, ANSW_CONTENT, ANSW_REG_DTTM, ANSW_MEMBER_ID "
				+ 				"FROM QUESTION "
				+ 				"WHERE QUEST_DIVISION = '분실물' "
				+ 				"ORDER BY QUEST_NO DESC) "
				+ 		"WHERE RNUM BETWEEN ? AND ?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, pageInfo.getStartList());
			pstmt.setInt(2, pageInfo.getEndList());
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				question = new Question();
				
				question.setNo(rs.getString("QUEST_NO"));
				question.setTitle(rs.getString("QUEST_TITLE"));
				question.setContent(rs.getString("QUEST_CONTENT"));
				question.setPassNo(rs.getInt("QUEST_PASS_NO"));
				question.setPhone(rs.getString("QUEST_PHONE"));
				question.setName(rs.getString("QUEST_NAME"));
				question.setDivision(rs.getString("QUEST_DIVISION"));
				question.setEmail(rs.getString("QUEST_EMAIL"));
				question.setId(rs.getString("MEMBER_ID"));
				question.setCheck(rs.getString("ANSW_CHECK"));
				question.setCinemaId(rs.getString("CINEMA_ID"));
				question.setAnswContent(rs.getString("ANSW_CONTENT"));
				question.setAnswRegDttm(rs.getDate("ANSW_REG_DTTM"));
				question.setAnswMemberId(rs.getString("ANSW_MEMBER_ID"));
				
				list.add(question);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

}
