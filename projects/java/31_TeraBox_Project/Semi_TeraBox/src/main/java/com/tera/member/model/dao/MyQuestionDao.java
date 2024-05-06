package com.tera.member.model.dao;

import static com.tera.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tera.common.util.PageInfo;
import com.tera.question.model.vo.Question;

public class MyQuestionDao {

	public int getQuestionCount(Connection connection) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) FROM QUESTION WHERE QUEST_DIVISION IS NOT NULL";

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

	
	
	public List<Question> findQuestionAll(Connection connection, PageInfo pageInfo) {
		List<Question> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Question question = null;
		String query = "SELECT RNUM, QUEST_NO, QUEST_TITLE, QUEST_CONTENT, QUEST_PASS_NO, QUEST_PHONE, QUEST_NAME, QUEST_DIVISION, "
				+ 				"QUEST_EMAIL, MEMBER_ID, ANSW_CHECK, CINEMA_ID, ANSW_CONTENT, ANSW_REG_DTTM, ANSW_MEMBER_ID "
				+ 		"FROM ( "
				+ 				"SELECT ROWNUM AS RNUM, QUEST_NO, QUEST_TITLE, QUEST_CONTENT, QUEST_PASS_NO, QUEST_PHONE, QUEST_NAME, QUEST_DIVISION, "
				+ 						"QUEST_EMAIL, MEMBER_ID, ANSW_CHECK, CINEMA_ID, ANSW_CONTENT, ANSW_REG_DTTM, ANSW_MEMBER_ID "
				+ 				"FROM ( "
				+ 						"SELECT QUEST_NO, QUEST_TITLE, QUEST_CONTENT, QUEST_PASS_NO, QUEST_PHONE, QUEST_NAME, QUEST_DIVISION, "
				+ 								"QUEST_EMAIL, MEMBER_ID, ANSW_CHECK, CINEMA_ID, ANSW_CONTENT, ANSW_REG_DTTM, ANSW_MEMBER_ID "
				+ 						"FROM QUESTION "
				+ 						"WHERE QUEST_DIVISION IS NOT NULL "
				+ 						"ORDER BY QUEST_NO DESC"
				+ 				") "
				+ 		") "
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



	public Question findQuestionByNo(Connection connection, int no) {
		Question question = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "SELECT QUEST_NO, "
				+ 				"QUEST_TITLE, "
				+ 				"QUEST_CONTENT, "
				+ 				"QUEST_PHONE, "
				+ 				"QUEST_DIVISION, "
				+ 				"QUEST_TYPE, "
				+ 				"QUEST_EMAIL, "
				+ 				"ANSW_CHECK, "
				+ 				"CINEMA_ID, "
				+ 				"ANSW_CONTENT, "
				+ 				"ANSW_REG_DTTM "
				+		"FROM QUESTION "
				+ 		"WHERE QUEST_NO = ?";
		
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				question = new Question();
				
				question.setNo(rs.getString("QUEST_NO"));
				question.setTitle(rs.getString("QUEST_TITLE"));
				question.setContent(rs.getString("QUEST_CONTENT"));
				question.setPhone(rs.getString("QUEST_PHONE"));
				question.setDivision(rs.getString("QUEST_DIVISION"));
				question.setType(rs.getString("QUEST_TYPE"));
				question.setEmail(rs.getString("QUEST_EMAIL"));
				question.setCheck(rs.getString("ANSW_CHECK"));
				question.setCinemaId(rs.getString("CINEMA_ID"));
				question.setAnswContent(rs.getString("ANSW_CONTENT"));
				question.setAnswRegDttm(rs.getDate("ANSW_REG_DTTM"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		return question;
	}

}
