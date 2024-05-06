package com.tera.common.jdbc.test;

import com.tera.common.util.PageInfo;

/**
 * ORACLE OJDBC 테스트 실행 파일 
 *                      ┏-----<JDBC>-----┓
 *                      ┃ ┏-----------┓┃┏-----------┓
 *                  ┏--╋-┫Oracle JDBC┣╋┫Oracle DBMS┃
 *                  ┃  ┃ ┃Driver     ┃┃┖-----------┚
 *                  ┃  ┃ ┖-----------┚┃
 *┏--------------┓┃  ┃ ┏-----------┓┃┏-----------┓
 *┃ 어플리케이션 ┣╋--╋-┫MySQL JDBC ┣╋┫MySQL DBMS ┃
 *┖--------------┚┃  ┃ ┃Driver     ┃┃┖-----------┚
 *                  ┃  ┃ ┖-----------┚┃
 *                  ┃  ┃ ┏-----------┓┃┏-----------┓
 *                  ┖--╋-┫Sybase JDBC┣╋┫Sybase DBMS┃
 *                      ┃ ┃Driver     ┃┃┖-----------┚
 *                      ┃ ┖-----------┚┃
 *                      ┖----------------┚
 */
public class Application
{
    public static void main(String[] args)
    {
//        JdbcTest.findAll();
//      JdbcTest.findByGradeCode(40);
//        JdbcTest.findAllEmployee();
//      JdbcTest.insert("일반화원");
//        JdbcTest.update(50,"그냥회원","2023/11/15");
//        JdbcTest.delete(70);
//        JdbcTest.memberFindAll();

//    	currentPage 현재 페이지
//    	pageLimit 한 페이지에 보이는 페이지의 수 
//    	listCount 전체 리스트의 수
//    	listLimit 한 페이지에 표시될 리스트의 수
    	PageInfo page = new PageInfo(1, 3, 41, 8);

    	
    	System.out.println(page.getStartList());
    	System.out.println(page.getEndList());
    	
    }
}
