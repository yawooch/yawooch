package com.tera.cinema.model.dao;

import static com.tera.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tera.cinema.model.vo.Cinema;
import com.tera.cinema.model.vo.Theater;

public class CinemaDao {

	public List<Theater> getTheaterList(Connection connection) 
	{
		List<Theater> theaters  = new ArrayList<Theater>();
		PreparedStatement pstmt = null;
		ResultSet rs            = null;
		String query = "SELECT THEATER_NO"
				+ "          , CINEMA_ID"
				+ "          , THEATER_TYPE"
				+ "          , SPECIAL_YN"
				+ "          , VIDEO_QUALITY"
				+ "       FROM CINEMA "
				+ "      ORDER BY CINEMA_NAME";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			rs    = pstmt.executeQuery();
			
			while(rs.next()) {
				Theater theater = new Theater();
				
				theater.setTheaterNo(rs.getString("THEATER_NO"));
				theater.setCinemaId (rs.getString("CINEMA_ID"));
				theater.setTheaterType(rs.getString("THEATER_TYPE"));
				theater.setSpecialYn(rs.getString("SPECIAL_YN"));
				theater.setVideoQuality(rs.getString("VIDEO_QUALITY"));
				
				theaters.add(theater);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		}
		
		return theaters;
	}

	public List<Cinema> getCinemaList(Connection connection) {

		List<Cinema> cinemas    = new ArrayList<Cinema>();
		PreparedStatement pstmt = null;
		ResultSet rs            = null;
		String query = "SELECT CINEMA_ID"
				+ "          , CINEMA_AREA"
				+ "          , CINEMA_NAME"
				+ "          , TO_CHAR(CINEMA_OPEN_DATE, 'YYYY-MM-DD HH24:MI') AS CINEMA_OPEN_DATE"
				+ "       FROM CINEMA "
				+ "      ORDER BY CINEMA_NAME";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			rs    = pstmt.executeQuery();
			
			while(rs.next()) {
				Cinema cinema = new Cinema();
				
				cinema.setCinemaId(rs.getString("CINEMA_ID"));
				cinema.setCinemaArea (rs.getString("CINEMA_AREA"));
				cinema.setCinemaName(rs.getString("CINEMA_NAME"));
				cinema.setCinemaOpenDate(rs.getString("CINEMA_OPEN_DATE"));
				
				cinemas.add(cinema);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		}
		
		return cinemas;
	}
	
}
