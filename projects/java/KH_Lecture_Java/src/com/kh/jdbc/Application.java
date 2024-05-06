package com.kh.jdbc;

import com.kh.jdbc.practice.JdbcTest;

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
        JdbcTest.findAll();
//      JdbcTest.findByGradeCode(40);
//        JdbcTest.findAllEmployee();
//      JdbcTest.insert("일반화원");
//        JdbcTest.update(50,"그냥회원","2023/11/15");
        JdbcTest.delete(70);
    }
}
