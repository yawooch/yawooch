package com.tera.cinema.model.service;

import static com.tera.common.jdbc.JDBCTemplate.close;
import static com.tera.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.tera.cinema.model.dao.CinemaDao;
import com.tera.cinema.model.vo.Cinema;
import com.tera.cinema.model.vo.Theater;

public class CinemaService {


	public List<Theater> getTheatersAll() 
	{
		List<Theater> theaters = null;
		Connection connection = getConnection();
		
		theaters = new CinemaDao().getTheaterList(connection);
		
		close(connection);
		
		return theaters;
	}

	public List<Cinema> getCinemaListAll() {
		List<Cinema> cinema = null;
		Connection connection = getConnection();
		
		cinema = new CinemaDao().getCinemaList(connection);
		
		close(connection);
		
		return cinema;
	}

}
