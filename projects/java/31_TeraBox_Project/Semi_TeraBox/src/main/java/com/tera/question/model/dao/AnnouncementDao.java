package com.tera.question.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.tera.common.jdbc.JDBCTemplate.close;

import com.tera.common.util.PageInfo;
import com.tera.question.model.vo.Notice;

public class AnnouncementDao {

	public List<Notice> findAll(Connection connection, PageInfo pageInfo) {
		List<Notice> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT RNUM, NOTICE_NO, CINEMA_AREA, NOTICE_TYPE, NOTICE_TITLE, NOTICE_REG_DATE "
				+ "FROM "
				+ "(SELECT ROWNUM AS RNUM , N.NOTICE_NO, C.CINEMA_AREA, N.NOTICE_TYPE, N.NOTICE_TITLE, N.NOTICE_REG_DATE "
				+ "FROM NOTICE N "
				+ "INNER JOIN CINEMA C ON ( N.CINEMA_ID = C.CINEMA_ID)) "
				+ "WHERE RNUM BETWEEN ? AND ?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			
			pstmt.setInt(1, pageInfo.getStartList());
			pstmt.setInt(2, pageInfo.getEndList());
			
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Notice notice = new Notice();
				
				notice.setNoticeNo(rs.getString("NOTICE_NO"));
				notice.setCinemaArea(rs.getString("CINEMA_AREA"));
				notice.setNoticeType(rs.getString("NOTICE_TYPE"));
				notice.setNoticeTitle(rs.getString("NOTICE_TITLE"));
				notice.setNoticeRegDate(rs.getDate("NOTICE_REG_DATE"));
				
				list.add(notice);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public int getListCount(Connection connection) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		String query = "SELECT COUNT(*) FROM NOTICE";
		
		try {
			pstmt = connection.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
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

	public List<Notice> findSeoul(Connection connection, PageInfo pageInfo) {
		List<Notice> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String quert = "SELECT RNUM, NOTICE_NO, CINEMA_AREA, NOTICE_TYPE, NOTICE_TITLE, NOTICE_REG_DATE "
				+ "FROM "
				+ "(SELECT ROWNUM AS RNUM , N.NOTICE_NO, C.CINEMA_AREA, N.NOTICE_TYPE, N.NOTICE_TITLE, N.NOTICE_REG_DATE "
				+ "FROM NOTICE N "
				+ "INNER JOIN CINEMA C ON ( N.CINEMA_ID = C.CINEMA_ID) "
				+ "WHERE C.CINEMA_AREA != '테라박스') "
				+ "WHERE RNUM BETWEEN ? AND ?";
		
		try {
			pstmt = connection.prepareStatement(quert);
			
			pstmt.setInt(1, pageInfo.getStartList());
			pstmt.setInt(2, pageInfo.getEndList());
		
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Notice notice = new Notice();
				
				notice.setNoticeNo(rs.getString("NOTICE_NO"));
				notice.setCinemaArea(rs.getString("CINEMA_AREA"));
				notice.setNoticeType(rs.getString("NOTICE_TYPE"));
				notice.setNoticeTitle(rs.getString("NOTICE_TITLE"));
				notice.setNoticeRegDate(rs.getDate("NOTICE_REG_DATE"));
		
				list.add(notice);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public int getSeoulCount(Connection connection) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) "
				+ "FROM NOTICE N "
				+ "INNER JOIN CINEMA C ON (N.CINEMA_ID = C.CINEMA_ID) "
				+ "WHERE C.CINEMA_AREA != '테라박스'";
		
		
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

	public List<Notice> findTera(Connection connection, PageInfo pageInfo) {
		List<Notice> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT RNUM, NOTICE_NO, CINEMA_AREA, NOTICE_TYPE, NOTICE_TITLE, NOTICE_REG_DATE "
				+ "FROM "
				+ "(SELECT ROWNUM AS RNUM , N.NOTICE_NO, C.CINEMA_AREA, N.NOTICE_TYPE, N.NOTICE_TITLE, N.NOTICE_REG_DATE "
				+ "FROM NOTICE N "
				+ "INNER JOIN CINEMA C ON ( N.CINEMA_ID = C.CINEMA_ID) "
				+ "WHERE C.CINEMA_AREA = '테라박스') "
				+ "WHERE RNUM BETWEEN ? AND ?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, pageInfo.getStartList());
			pstmt.setInt(2, pageInfo.getEndList());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Notice notice = new Notice();
				
				notice.setNoticeNo(rs.getString("NOTICE_NO"));
				notice.setCinemaArea(rs.getString("CINEMA_AREA"));
				notice.setNoticeType(rs.getString("NOTICE_TYPE"));
				notice.setNoticeTitle(rs.getString("NOTICE_TITLE"));
				notice.setNoticeRegDate(rs.getDate("NOTICE_REG_DATE"));
		
				list.add(notice);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public int getTeraCount(Connection connection) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) "
				+ "FROM NOTICE N "
				+ "INNER JOIN CINEMA C ON (N.CINEMA_ID = C.CINEMA_ID) "
				+ "WHERE C.CINEMA_AREA = '테라박스'";
		
		
		try {
			pstmt = connection.prepareStatement(query);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
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


	
	
	

	

}
