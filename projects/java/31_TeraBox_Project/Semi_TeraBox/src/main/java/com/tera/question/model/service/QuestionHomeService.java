package com.tera.question.model.service;

import java.sql.Connection;
import java.util.List;

import static com.tera.common.jdbc.JDBCTemplate.getConnection;
import static com.tera.common.jdbc.JDBCTemplate.close;

import com.tera.question.model.dao.QuestionHomeDao;
import com.tera.question.model.vo.Notice;

public class QuestionHomeService {

	public List<Notice> findHome() {
		
		Connection connection = getConnection();
		
		List<Notice> list2 = new QuestionHomeDao().findHome(connection);
		
		close(connection);
		
		return list2;
	}
	
}
