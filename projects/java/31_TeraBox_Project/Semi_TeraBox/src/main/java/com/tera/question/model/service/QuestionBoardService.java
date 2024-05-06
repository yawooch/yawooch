package com.tera.question.model.service;

import static com.tera.common.jdbc.JDBCTemplate.*;
import static com.tera.common.jdbc.JDBCTemplate.getConnection;
import static com.tera.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.tera.common.util.PageInfo;
import com.tera.question.model.dao.QuestionBoardDao;
import com.tera.question.model.vo.Question;



public class QuestionBoardService {

	public int save(Question question) {
		int result = 0;
		Connection connection = getConnection();

		result = new QuestionBoardDao().insertBoard(connection, question);

		if (result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		return result;

	}
	public int rentsave(Question question) {
		int result = 0;
		Connection connection = getConnection();

		result = new QuestionBoardDao().insertrentBoard(connection, question);

		if (result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		return result;

	}
	public int Lostsave(Question question) {
		int result = 0;
		Connection connection = getConnection();

		result = new QuestionBoardDao().insertLostBoard(connection, question);

		if (result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		return result;

	}
	
	
	
	
}

























