package com.kh.jdbc;

import com.kh.jdbc.practice.JdbcTest;

/**
 * ORACLE OJDBC �׽�Ʈ ���� ���� 
 *                      ��-----<JDBC>-----��
 *                      �� ��-----------������-----------��
 *                  ��--��-��Oracle JDBC������Oracle DBMS��
 *                  ��  �� ��Driver     ������-----------��
 *                  ��  �� ��-----------�æ�
 *��--------------����  �� ��-----------������-----------��
 *�� ���ø����̼� ����--��-��MySQL JDBC ������MySQL DBMS ��
 *��--------------�æ�  �� ��Driver     ������-----------��
 *                  ��  �� ��-----------�æ�
 *                  ��  �� ��-----------������-----------��
 *                  ��--��-��Sybase JDBC������Sybase DBMS��
 *                      �� ��Driver     ������-----------��
 *                      �� ��-----------�æ�
 *                      ��----------------��
 */
public class Application
{
    public static void main(String[] args)
    {
        JdbcTest.findAll();
//      JdbcTest.findByGradeCode(40);
//        JdbcTest.findAllEmployee();
//      JdbcTest.insert("�Ϲ�ȭ��");
//        JdbcTest.update(50,"�׳�ȸ��","2023/11/15");
        JdbcTest.delete(70);
    }
}
