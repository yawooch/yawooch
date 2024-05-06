package com.tera.question.model.dao;

import java.io.Closeable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.tera.common.jdbc.JDBCTemplate.close;
import com.tera.question.model.vo.Notice;

public class QuestionHomeDao {

	public List<Notice> findHome(Connection connection) {
		List<Notice> list2 = new ArrayList<Notice>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT C.CINEMA_AREA, N.NOTICE_TITLE, N.NOTICE_CONTENT, N.NOTICE_REG_DATE, N.NOTICE_TYPE "
				+ "FROM NOTICE N "
				+ "LEFT JOIN CINEMA C ON (N.CINEMA_ID = C.CINEMA_ID) "
				+ "WHERE ROWNUM <= 4 ";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Notice notice = new Notice();
				
				notice.setCinemaArea(rs.getString("CINEMA_AREA"));
				notice.setNoticeContent(rs.getString("NOTICE_CONTENT"));
				notice.setNoticeTitle(rs.getString("NOTICE_TITLE"));
				notice.setNoticeRegDate(rs.getDate("NOTICE_REG_DATE"));
				notice.setNoticeType(rs.getString("NOTICE_TYPE"));
				
				list2.add(notice);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return list2;
	}

}
