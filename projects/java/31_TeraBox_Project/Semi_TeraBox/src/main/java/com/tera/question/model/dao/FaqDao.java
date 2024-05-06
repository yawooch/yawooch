package com.tera.question.model.dao;

import static com.tera.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tera.common.util.PageInfo;
import com.tera.question.model.vo.Faq;

public class FaqDao {

	public List<Faq> findAll(Connection connection, PageInfo pageInfo) {
		List<Faq> list = new ArrayList<>();  //받아줘야하는게 리스트 타입인데 그중에 많이 사용하는게 어레이리스트 !
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// 쿼리생성
		String query = "SELECT * FROM  "
				+ "(SELECT ROWNUM AS RNUM, "
				+ "FAQ.FAQ_NO, "
				+ "FAQ_TITLE, "
				+ "FAQ.FAQ_CONTENT, "
				+ "FAQ.FAQ_CATEGORY, "
				+ "FAQ.MEMBER_ID "
				+ "FROM FAQ ) "
				+ "WHERE RNUM BETWEEN ? AND ? ";
		
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, pageInfo.getStartList());
			pstmt.setInt(2, pageInfo.getEndList());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				Faq faq = new Faq();
						
				// faq 하나 하나가 한 행이 된다.
				
				faq.setFaqNo(rs.getString("FAQ_NO"));
				faq.setFaqTitle(rs.getString("FAQ_TITLE"));
				faq.setFaqContent(rs.getString("FAQ_CONTENT"));
				faq.setFaqCategory(rs.getString("FAQ_CATEGORY"));
				faq.setMemberId(rs.getString("MEMBER_ID"));
//				System.out.println(faq);
				
				
				// list<Faq>로 받는다.
				list.add(faq);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {		
			//pstmt, rs 사용하고 클로즈까지.
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	public int getFaqCount(Connection connection) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) FROM FAQ";
		
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

	
	
	public int getCategoryCount(Connection connection, String category) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		String query = "SELECT COUNT(*) FROM FAQ WHERE FAQ_CATEGORY = ?";
		
		try {
			pstmt = connection.prepareStatement(query);

			pstmt.setString(1, category);
			
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
	};
	
	
	
	public List<Faq> findCategory(Connection connection, String category, PageInfo pageInfo) {
		List<Faq> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT RNUM, "
				     + "       FAQ_NO, "
				     + "       FAQ_TITLE, "
				     + "       FAQ_CONTENT, "
				     + "       FAQ_CATEGORY, "
				     + "       MEMBER_ID "
				     + "  FROM (SELECT ROWNUM AS RNUM, "
				     + "               FAQ.FAQ_NO, "
				     + "               FAQ_TITLE, "
				     + "               FAQ.FAQ_CONTENT, "
				     + "               FAQ.FAQ_CATEGORY, "
				     + "               FAQ.MEMBER_ID "
				     + "          FROM ( "
				     + "                SELECT * "
				     + "                  FROM FAQ "
				     + "               WHERE FAQ_CATEGORY = ? "
				     + "                ORDER BY "
				     + "                    FAQ_NO DESC "
				     + "               ) FAQ "
				     + "        ORDER BY "
				     + "              FAQ_NO DESC) "
				     + "  WHERE RNUM BETWEEN ? AND ? ";
		
		try {
			pstmt = connection.prepareStatement(query);

			pstmt.setString(1, category);
			pstmt.setInt(2, pageInfo.getStartList());
			pstmt.setInt(3, pageInfo.getEndList());
					
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Faq faq = new Faq();
				
				faq.setFaqNo(rs.getString("FAQ_NO"));
				faq.setFaqTitle(rs.getString("FAQ_TITLE"));
				faq.setFaqContent(rs.getString("FAQ_CONTENT"));
				faq.setFaqCategory(rs.getString("FAQ_CATEGORY"));
				faq.setMemberId(rs.getString("MEMBER_ID"));
				
				list.add(faq);
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		return list;
	}

	public List<Faq> findHome(Connection connection) {
		List<Faq> list = new ArrayList<>();
		ResultSet rs = null;
		String query = "SELECT * FROM FAQ WHERE ROWNUM <= 4"; 
		PreparedStatement pstmt = null;
		
		
		try {
			pstmt = connection.prepareStatement(query);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Faq faq = new Faq();
				
				faq.setFaqNo(rs.getString("FAQ_NO"));
				faq.setFaqTitle(rs.getString("FAQ_TITLE"));
				faq.setFaqContent(rs.getString("FAQ_CONTENT"));
				faq.setFaqCategory(rs.getString("FAQ_CATEGORY"));
				faq.setMemberId(rs.getString("MEMBER_ID"));
				
				list.add(faq);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	};

	
	
	
	
	
	
	
	
	
	
}
