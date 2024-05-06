package com.tera.movie.model.dao;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tera.common.util.PageInfo;
import com.tera.movie.model.vo.Movie;
import com.tera.movie.model.vo.MovieComment;

import static com.tera.common.jdbc.JDBCTemplate.*;

public class MovieDao {
	
	
	// 영화 부분 메소드
	public List<Movie> findMovieAll(Connection connection) {
		List<Movie> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "SELECT * FROM MOVIE ORDER BY MV_OPEN_DATE";
		
		try {
			pstmt = connection.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Movie movie = new Movie();
				
				movie.setNo(rs.getInt("MOVIE_NO"));
				movie.setKorName(rs.getString("MV_KOR_NAME"));
				movie.setEngName(rs.getString("MV_ENG_NAME"));
				movie.setPoster(rs.getString("MV_POSTER"));
				movie.setSynopsis(rs.getString("MV_SYNOPSIS"));
				movie.setType(rs.getString("MV_TYPE"));
				movie.setDirector(rs.getString("MV_DIRECTOR"));
				movie.setGenre(rs.getString("MV_GENRE"));
				movie.setGrade(rs.getString("MV_GRADE"));
				movie.setOpenDate(rs.getDate("MV_OPEN_DATE"));
				movie.setActors(rs.getString("MV_CASTINGS"));
				
				list.add(movie);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	

	// 영화 단일 객체 불러오기
	public Movie findByNo(Connection connection, int no) {
		Movie movie = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT * FROM MOVIE WHERE MOVIE_NO = ?";
		

		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				movie = new Movie();
				
				movie.setNo(rs.getInt("MOVIE_NO"));
				movie.setKorName(rs.getString("MV_KOR_NAME"));
				movie.setEngName(rs.getString("MV_ENG_NAME"));
				movie.setPoster(rs.getString("MV_POSTER"));
				movie.setSynopsis(rs.getString("MV_SYNOPSIS"));
				movie.setType(rs.getString("MV_TYPE"));
				movie.setDirector(rs.getString("MV_DIRECTOR"));
				movie.setGenre(rs.getString("MV_GENRE"));
				movie.setGrade(rs.getString("MV_GRADE"));
				movie.setOpenDate(rs.getDate("MV_OPEN_DATE"));
				movie.setActors(rs.getString("MV_CASTINGS"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return movie;
	}



	
	// 영화 관람평 부분 메소드 3가지
	// 관람평 갯수 세기
	public int getMovieCommentCount(Connection connection, Movie movie) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		
		String query = "SELECT COUNT(*) FROM MOVIE_EVAL WHERE MOVIE_NO = ?";
		
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, movie.getNo());
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

	// 관람평 출력
	public List<MovieComment> findCommentAll(Connection connection, PageInfo pageInfo, Movie movie) {
		List<MovieComment> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MovieComment movieComment = null;
		
		// 우선 부수적인것 제외하고 불러오기만
		String query = "SELECT RNUM, TICKET_NO, EVAL_POINT, EVAL_COMMENT, EVAL_REG_DTTM, VIW_PNT_CONTENT, MOVIE_NO "
				+ "FROM ( "
				+ 	"SELECT ROWNUM AS RNUM, TICKET_NO, EVAL_POINT, EVAL_COMMENT, EVAL_REG_DTTM, VIW_PNT_CONTENT, MOVIE_NO "
				+ 	"FROM ( "
				+ 		"SELECT TICKET_NO, EVAL_POINT, EVAL_COMMENT, EVAL_REG_DTTM, VIW_PNT_CONTENT, MOVIE_NO "
				+ 		"FROM MOVIE_EVAL "
				+ 		"ORDER BY TO_NUMBER(TICKET_NO) DESC "
				+ 	") "
				+ " WHERE MOVIE_NO = ?"
				+ ") "
				+ "WHERE RNUM BETWEEN ? AND ?";
		
				
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, movie.getNo());
			pstmt.setInt(2, pageInfo.getStartList());
			pstmt.setInt(3, pageInfo.getEndList());
			rs = pstmt.executeQuery();
			
			
			while (rs.next()) {
				movieComment = new MovieComment();
				
				movieComment.setRowNum(rs.getInt("RNUM"));
				movieComment.setTicketNo(rs.getString("TICKET_NO"));
				movieComment.setScore(rs.getInt("EVAL_POINT"));
				movieComment.setComment(rs.getString("EVAL_COMMENT"));
				movieComment.setCreateDate(rs.getDate("EVAL_REG_DTTM"));
				movieComment.setPoint(rs.getString("VIW_PNT_CONTENT"));
				movieComment.setMovieNo(rs.getInt("MOVIE_NO"));
				
				list.add(movieComment);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		return list;
	}

	
	// 관람평 입력
	public int insertMovieComment(Connection connection, MovieComment movieComment) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO MOVIE_EVAL VALUES (SEQ_TK_NO.NEXTVAL, ?, ?, SYSDATE, ?, ?)";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, movieComment.getScore());
			pstmt.setString(2, movieComment.getComment());
			pstmt.setString(3, movieComment.getPoint());
			pstmt.setInt(4, movieComment.getMovieNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}



	public List<Movie> findMovieByDate(Connection connection, String selectDate) {

		List<Movie> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "SELECT MOVIE_NO"
				     + "     , MV_KOR_NAME"
				     + "     , MV_ENG_NAME"
				     + "     , MV_POSTER"
				     + "     , MV_SYNOPSIS"
				     + "     , MV_TYPE"
				     + "     , MV_DIRECTOR"
				     + "     , MV_GENRE"
				     + "     , MV_GRADE"
				     + "     , MV_OPEN_DATE"
				     + "     , MV_CASTINGS"
				     + "  FROM MOVIE"
				     + " WHERE MOVIE_NO IN ("
				     + "SELECT MOVIE_NO"
				     + "  FROM TIME_TABLE"
				     + " WHERE TO_CHAR(SCRN_STR_DTTM, 'YYYY-MM-DD')  = ?)";
		
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1 , selectDate);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Movie movie = new Movie();
				
				movie.setNo(rs.getInt("MOVIE_NO"));
				movie.setKorName(rs.getString("MV_KOR_NAME"));
				movie.setEngName(rs.getString("MV_ENG_NAME"));
				movie.setPoster(rs.getString("MV_POSTER"));
				movie.setSynopsis(rs.getString("MV_SYNOPSIS"));
				movie.setType(rs.getString("MV_TYPE"));
				movie.setDirector(rs.getString("MV_DIRECTOR"));
				movie.setGenre(rs.getString("MV_GENRE"));
				movie.setGrade(rs.getString("MV_GRADE"));
				movie.setOpenDate(rs.getDate("MV_OPEN_DATE"));
				movie.setActors(rs.getString("MV_CASTINGS"));
				
				list.add(movie);
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
