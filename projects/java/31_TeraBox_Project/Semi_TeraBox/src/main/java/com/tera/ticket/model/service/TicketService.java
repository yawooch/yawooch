package com.tera.ticket.model.service;

import static com.tera.common.jdbc.JDBCTemplate.close;
import static com.tera.common.jdbc.JDBCTemplate.commit;
import static com.tera.common.jdbc.JDBCTemplate.getConnection;
import static com.tera.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.tera.common.jdbc.JDBCTemplate;
import com.tera.ticket.model.dao.TicketDao;
import com.tera.ticket.model.vo.Ticket;
import com.tera.ticket.model.vo.TimeTable;

public class TicketService {
	public int save(String seatNo){
		int result = 0;
		
		Connection connection = getConnection();
		
		//Ticket. = new TicketDao().insertTicket(connection, seatNo);
		

		if (result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}	
		
		
		return result;
	}

	public List<TimeTable> getTimeTableList(String movies, String cinemas) {
		List<TimeTable> timetables = null;
		
		Connection connection = JDBCTemplate.getConnection();
		
		timetables = new TicketDao().getTimeTableList(connection, movies, cinemas);
		
		close(connection);
		
		return timetables;
	}

	public TimeTable getScrnInfoByScrnNo(String scrnNo) {
		TimeTable timetable = null;
		
		Connection connection = getConnection();
		
		timetable = new TicketDao().getScrnInfoByScrnNo(connection, scrnNo);
		
		close(connection);
		
		return timetable;
	}

	public int saveTicket(Ticket ticket) {
		int result = 0;
		
		Connection connection = getConnection();
		
		result = new TicketDao().insertTicket(connection, ticket);
		
		if(result > 0) {
			commit(connection);
		}
		else {
			rollback(connection);
		}
		
		close(connection);
		
		
		return result;
	}

}
