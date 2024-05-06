package com.tera.question.model.service;

import java.sql.Connection;
import java.util.List;

import static com.tera.common.jdbc.JDBCTemplate.getConnection;
import static com.tera.common.jdbc.JDBCTemplate.close;

import com.tera.common.util.PageInfo;
import com.tera.question.model.dao.AnnouncementDao;
import com.tera.question.model.vo.Notice;

public class AnnouncementService {

	public List<Notice> findAll(PageInfo pageInfo) {
		List<Notice> list = null;
		
		Connection connection = getConnection();
		
		list = new AnnouncementDao().findAll(connection, pageInfo);
		
		close(connection);
		return list;
	}

	public int getListCount() {
		int count = 0;
		
		Connection connection = getConnection();
		
		count = new AnnouncementDao().getListCount(connection);
		
		close(connection);
		return count;
	}

	public List<Notice> findSeoul(PageInfo pageInfo) {
		
		Connection connection = getConnection();
		
		List<Notice> list = new AnnouncementDao().findSeoul(connection, pageInfo);
		
		close(connection);
		
		return list;
	}

	public int getSeoulCount() {
		int count = 0;
		
		Connection connection = getConnection();
		
		count = new AnnouncementDao().getSeoulCount(connection);
		
		close(connection);
		
		return count;
	}

	public List<Notice> findTera(PageInfo pageInfo) {
		
		Connection connection = getConnection();
		
		List<Notice> list = new AnnouncementDao().findTera(connection, pageInfo);
		
		close(connection);
		return list;
	}

	public int getTeraCount() {
		int count = 0;
		
		Connection connection = getConnection();
		
		count = new AnnouncementDao().getTeraCount(connection);
		
		close(connection);
		
		return count;
		
	}




}
