package com.tera.common.jdbc.test.practice;

import java.util.List;

import com.tera.common.jdbc.test.dao.EmployeeDao;
import com.tera.common.jdbc.test.dao.MemberDao;
import com.tera.common.jdbc.test.dao.MemberGradeDao;
import com.tera.common.jdbc.test.vo.Employee;
import com.tera.common.jdbc.test.vo.MemberGrade;
import com.tera.member.model.vo.Member;

/**
 * JDBC Test 하는 클래스
 */
public class JdbcTest
{

    /**
     * 모든 MEMBER_GRADE 테이블을 조회해서 보여준다.
     */
    public static void findAll()
    {
        //데이터베이스에 접속해서 데이터를 가져오는 클래스를 생성
        List<MemberGrade> grades = new MemberGradeDao().findAll();
        
        for (MemberGrade grade : grades)
        {
            System.out.println(grade);
        }
    }
    /**
     * 모든 member 테이블을 조회해서 보여준다.
     */
    public static void memberFindAll()
    {
        //데이터베이스에 접속해서 데이터를 가져오는 클래스를 생성
        List<Member> members = new MemberDao().findAll();
        
        for (Member member : members)
        {
            System.out.println(member);
        }
    }

    /**
     * code 를 입력받아 MEMBER_GRADE 테이블의 조건을 주어 조회한다.
     * @param code
     */
    public static void findByGradeCode(int code)
    {
        MemberGrade grade = new MemberGradeDao().findByCode(code);
     
        System.out.println(grade);
    }

    /**
     * 모든 EMPLOYEE 테이블을 조회해서 보여준다.
     */
    public static void findAllEmployee()
    {
        //데이터베이스에 접속해서 데이터를 가져오는 클래스를 생성
        List<Employee> employees = new EmployeeDao().findAll();
        
        for (Employee employee : employees)
        {
            System.out.println(employee);
        }
    }

    /**
     * gradeName 을 입력받아 MEMBER_GRADE 테이블에 insert 한다
     * @param gradeName
     */
    public static void insert(String gradeName)
    {
        int result = new MemberGradeDao().insert(gradeName);
        
        if(result == 1)
        {
            System.out.println("성공적으로 insert 되었습니다.");
        }
    }

    /**
     * gradeCode와 gradeName , createDate 을 입력받아 MEMBER_GRADE 테이블에 update 한다
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
            System.out.println("성공적으로 update 되었습니다.");
        }
    }

    /**
     * gradeCode 을 입력받아 MEMBER_GRADE 테이블에 delete 한다
     * @param gradeCode
     */
    public static void delete(int gradeCode)
    {
        int result = new MemberGradeDao().delete(gradeCode); 

        System.out.println("Result : " + result);
        
        if(result >= 0)
        {
            System.out.println("성공적으로 delete 되었습니다.");
        }
    }
}