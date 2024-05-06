package com.tera.member.model.service;

import java.sql.Connection;
import java.util.List;

import static com.tera.common.jdbc.JDBCTemplate.*;

import com.tera.common.util.PageInfo;
import com.tera.member.model.dao.MyQuestionDao;
import com.tera.question.model.vo.Question;

public class MyQuestionService {

	
	public int getQuestionCount() {
		int count = 0;

		Connection connection = getConnection();
		
		count = new MyQuestionDao().getQuestionCount(connection);
		
		close(connection);
		
		return count;
	}

	
	
	public List<Question> getQuestionList(PageInfo pageInfo) {
		List<Question> list = null;
		
		Connection connection = getConnection();

		list = new MyQuestionDao().findQuestionAll(connection, pageInfo);
		
		close(connection);

		return list;
	}


	
	// no를 통해서 question 객체 얻어옴
	public Question getQuestionByNo(int no) {
		Question question = null;
		Connection connection = getConnection();
		
		question = new MyQuestionDao().findQuestionByNo(connection, no);
		
		close(connection);
		
		return question;
	}

}
