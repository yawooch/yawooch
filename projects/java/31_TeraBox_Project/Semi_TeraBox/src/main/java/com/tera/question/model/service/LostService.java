package com.tera.question.model.service;

import java.sql.Connection;
import java.util.List;

import static com.tera.common.jdbc.JDBCTemplate.*;
import com.tera.common.util.PageInfo;
import com.tera.question.model.dao.LostDao;
import com.tera.question.model.vo.Question;

public class LostService {

	// 전체 분실물 갯수 확인 메소드
	public int getLostCount() {
		int count = 0;
		
		Connection connection = getConnection();
		
		count = new LostDao().getLostCount(connection);
		
		close(connection);
		
		return count;
	}

	
	// 한 페이지에 보여줄 분실물의 리스트 생성
	public List<Question> getLostList(PageInfo pageInfo) {
		List<Question> list = null;
		
		Connection connection = getConnection();
		
		list = new LostDao().findLostAll(connection, pageInfo);
		
		close(connection);
		
		return list;
	}

}
