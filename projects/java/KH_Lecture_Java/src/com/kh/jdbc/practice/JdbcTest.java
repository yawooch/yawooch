package com.kh.jdbc.practice;

import java.util.List;

import com.kh.jdbc.dao.EmployeeDao;
import com.kh.jdbc.dao.MemberGradeDao;
import com.kh.jdbc.vo.Employee;
import com.kh.jdbc.vo.MemberGrade;

/**
 * JDBC Test �ϴ� Ŭ����
 */
public class JdbcTest
{

    /**
     * ��� MEMBER_GRADE ���̺��� ��ȸ�ؼ� �����ش�.
     */
    public static void findAll()
    {
        //�����ͺ��̽��� �����ؼ� �����͸� �������� Ŭ������ ����
        List<MemberGrade> grades = new MemberGradeDao().findAll();
        
        for (MemberGrade grade : grades)
        {
            System.out.println(grade);
        }
    }

    /**
     * code �� �Է¹޾� MEMBER_GRADE ���̺��� ������ �־� ��ȸ�Ѵ�.
     * @param code
     */
    public static void findByGradeCode(int code)
    {
        MemberGrade grade = new MemberGradeDao().findByCode(code);
     
        System.out.println(grade);
    }

    /**
     * ��� EMPLOYEE ���̺��� ��ȸ�ؼ� �����ش�.
     */
    public static void findAllEmployee()
    {
        //�����ͺ��̽��� �����ؼ� �����͸� �������� Ŭ������ ����
        List<Employee> employees = new EmployeeDao().findAll();
        
        for (Employee employee : employees)
        {
            System.out.println(employee);
        }
    }

    /**
     * gradeName �� �Է¹޾� MEMBER_GRADE ���̺� insert �Ѵ�
     * @param gradeName
     */
    public static void insert(String gradeName)
    {
        int result = new MemberGradeDao().insert(gradeName);
        
        if(result == 1)
        {
            System.out.println("���������� insert �Ǿ����ϴ�.");
        }
    }

    /**
     * gradeCode�� gradeName , createDate �� �Է¹޾� MEMBER_GRADE ���̺� update �Ѵ�
     * @param gradeCode
     * @param gradeName
     * @param createDate
     */
    public static void update(int gradeCode ,String gradeName, String createDate)
    {
        MemberGradeDao dao = new MemberGradeDao();
        int result = dao.update(gradeCode ,gradeName, createDate);

        System.out.println("Result : " + result);
        
        if(result >= 0)
        {
            System.out.println("���������� update �Ǿ����ϴ�.");
        }
    }

    /**
     * gradeCode �� �Է¹޾� MEMBER_GRADE ���̺� delete �Ѵ�
     * @param gradeCode
     */
    public static void delete(int gradeCode)
    {
        int result = new MemberGradeDao().delete(gradeCode); 

        System.out.println("Result : " + result);
        
        if(result >= 0)
        {
            System.out.println("���������� delete �Ǿ����ϴ�.");
        }
    }
}
