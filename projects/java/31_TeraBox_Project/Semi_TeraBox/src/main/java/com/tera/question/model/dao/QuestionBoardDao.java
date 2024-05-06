package com.tera.question.model.dao;

import static com.tera.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tera.common.util.PageInfo;
import com.tera.question.model.vo.Question;

public class QuestionBoardDao {

	public List<Question> findAll(Connection connection, PageInfo pageinfo) {
		List<Question> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String query = "SELECT ROWNUM QUEST_NO,QUEST_TITLE,QUEST_CONTENT,QUEST_PASS_NO,QUEST_PHONE,QUEST_NAME,QUEST_DIVISION,QUEST_EMAIL,"
				+ "QUEST_TYPE,PICTR_FILE,VISIT_NUM,RENTAL_DATE,RENTAL_TIME,MEMBER_ID,ANSW_CHECK,CINEMA_ID,ANSW_CONTENT,ANSW_REG_DTTM,ANSW_MEMBER_ID,DEL_YN "
				+ "FROM QUESTION, WHERE ROWNUM BETWEEN ? and ?";

		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, pageinfo.getStartList());
			pstmt.setInt(2, pageinfo.getEndList());

			rs = pstmt.executeQuery();

			while (rs.next()) {

				Question question = new Question();

				question.setNo(rs.getString("QUEST_NO"));
				question.setTitle(rs.getString("QUEST_TITLE"));
				question.setContent(rs.getString("QUEST_CONTENT"));
				question.setPassNo(rs.getInt("QUEST_PASS_NO"));
				question.setPhone(rs.getString("QUEST_PHONE"));
				question.setName(rs.getString("QUEST_NAME"));
				question.setDivision(rs.getString("QUEST_DIVISION"));
				question.setEmail(rs.getString("QUEST_EMAIL"));
				question.setType(rs.getString("QUEST_TYPE"));
				question.setFile(rs.getString("PICTR_FILE"));
				question.setNum(rs.getInt("VISIT_NUM"));
				question.setRentDate(rs.getString("RENTAL_DATE"));
				question.setRentTime(rs.getString("RENTAL_TIME"));
				question.setId(rs.getString("MEMBER_ID"));
				question.setCheck(rs.getString("ANSW_CHECK"));
				question.setCinemaId(rs.getString("CINEMA_ID"));
				question.setAnswContent(rs.getString("ANSW_CONTENT"));
				question.setAnswRegDttm(rs.getDate("ANSW_REG_DTTM"));
				question.setAnswMemberId(rs.getString("ANSW_MEMBER_ID"));
				question.setQuestMoive(rs.getString("QUEST_MOVIE"));
				question.setLostPlace(rs.getString("LOSTPLACE"));
				question.setDelYn(rs.getString("DEL_YN"));

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

	public int insertBoard(Connection connection, Question question) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String query = " INSERT INTO QUESTION " + "( QUEST_NO" + ", QUEST_TITLE" + ", QUEST_CONTENT" + ", QUEST_PASS_NO"
				+ ", QUEST_PHONE" + ", QUEST_NAME" + ", QUEST_EMAIL" + ", QUEST_TYPE" + ", QUEST_DIVISION" + ", PICTR_FILE"
				+ ", CINEMA_ID" + ", ANSW_CHECK" + ", ANSW_REG_DTTM" + ")" + "VALUES(" + "SEQ_QT_NO.NEXTVAL" + ", ?"
				+ ", ?" + ", ?" + ", ?" + ", ?" + ", ?" + ", ?" + ", ?" + ", ?" + ", DEFAULT" + ", DEFAULT"
				+ ", DEFAULT" + ")";

		try {

			pstmt = connection.prepareStatement(query);

			pstmt.setString(1, question.getTitle());
			pstmt.setString(2, question.getContent());
			pstmt.setInt(3, question.getPassNo());
			pstmt.setString(4, question.getPhone());
			pstmt.setString(5, question.getName());
			pstmt.setString(6, question.getEmail());
			pstmt.setString(7, question.getType());
			pstmt.setString(8, question.getDivision());
			pstmt.setString(9, question.getFile());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return result;

	}

	public int insertrentBoard(Connection connection, Question question) {
		int result = 0;
		PreparedStatement rentpstmt = null;
		ResultSet rs = null;

		String query = " INSERT INTO QUESTION" + "( QUEST_NO" + ", LOSTPLACE" + ", QUEST_NAME" + ", QUEST_PHONE"
				+ ", QUEST_EMAIL" + ", QUEST_TITLE" + ", QUEST_CONTENT" + ", QUEST_PASS_NO" + ", QUEST_DIVISION"
				+ ", CINEMA_ID" + ", ANSW_CHECK" + ", ANSW_REG_DTTM" + ")" + "VALUES(" + "SEQ_QT_NO.NEXTVAL" + ", ?"
				+ ", ?" + ", ?" + ", ?" + ", ?" + ", ?" + ", ?" + ", ?" + ", DEFAULT" + ", DEFAULT" + ", DEFAULT" + ")";

		try {

			rentpstmt = connection.prepareStatement(query);

			rentpstmt.setString(1, question.getLostPlace());
			rentpstmt.setString(2, question.getName());
			rentpstmt.setString(3, question.getPhone());
			rentpstmt.setString(4, question.getEmail());
			rentpstmt.setString(5, question.getTitle());
			rentpstmt.setString(6, question.getContent());
			rentpstmt.setInt(7, question.getPassNo());
			rentpstmt.setString(8, question.getDivision());

			result = rentpstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rentpstmt);
			close(rs);
		}

		return result;

	}

	public int insertLostBoard(Connection connection, Question question) {
		int result = 0;
		PreparedStatement Lostpstmt = null;
		ResultSet rs = null;

		String query = " INSERT INTO QUESTION" + "( QUEST_NO" + ", CINEMA_ID" + ", RENTAL_DATE" + ", QUEST_MOVIE"
				+ ", VISIT_NUM" + ", QUEST_NAME" + ", QUEST_PHONE" + ", QUEST_EMAIL" + ", QUEST_TITLE"
				+ ", QUEST_CONTENT" + ", QUEST_PASS_NO" + ", QUEST_DIVISION" + ", ANSW_CHECK" + ", ANSW_REG_DTTM" + ")"
				+ "VALUES(" + "SEQ_QT_NO.NEXTVAL" + ", DEFAULT" + ", ?" + ", ?" + ", ?" + ", ?" + ", ?" + ", ?" + ", ?"
				+ ", ?" + ", ?" + ", ?" + ", DEFAULT" + ", DEFAULT" + ")";

		try {

			Lostpstmt = connection.prepareStatement(query);

			Lostpstmt.setString(1, question.getRentDate());
			Lostpstmt.setString(2, question.getQuestMoive());
			Lostpstmt.setInt(3, question.getNum());
			Lostpstmt.setString(4, question.getName());
			Lostpstmt.setString(5, question.getPhone());
			Lostpstmt.setString(6, question.getEmail());
			Lostpstmt.setString(7, question.getTitle());
			Lostpstmt.setString(8, question.getContent());
			Lostpstmt.setInt(9, question.getPassNo());
			Lostpstmt.setString(10, question.getDivision());

			result = Lostpstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(Lostpstmt);
			close(rs);
		}

		return result;

	}

}
