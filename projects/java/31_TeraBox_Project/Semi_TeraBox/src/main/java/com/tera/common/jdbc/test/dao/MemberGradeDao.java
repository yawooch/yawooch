package com.tera.common.jdbc.test.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tera.common.jdbc.test.vo.MemberGrade;

/**
 * <MEMBER_GRADE 테이블>
 * ┏-----------┳---------┳-----------┓
 * ┃COLUMN_NAME┃DATA_TYPE┃DATA_LENGTH┃
 * ┣-----------╋---------╋-----------┫
 * ┃GRADE_CODE ┃NUMBER   ┃         22┃
 * ┃GRADE_NAME ┃VARCHAR2 ┃         20┃
 * ┖-----------┸---------┸-----------┚
 */
public class MemberGradeDao
{
    
    
    /**
     * MEMBER_GRADE 테이블에 있는 모든 데이터를 불러와 List<MemberGrade>에 넣어준다.
     * @return
     */
    public List<MemberGrade> findAll()
    {
        List<MemberGrade> grades = new ArrayList<MemberGrade>();

        Connection connection = null;
        Statement stmt        = null;
        ResultSet rs          = null;
        
        try
        {
            Class.forName("oracle.jdbc.driver.OracleDriver");// 오라클 드라이버
            
            connection = DriverManager.getConnection("jdbc:oracle:thin:@2.156.11.186:8087:xe", "C##TERA", "TERA");
            stmt       = connection.createStatement();
            rs         = stmt.executeQuery("SELECT * FROM MEMBER");
            
            while(rs.next())
            {
                MemberGrade grade = new MemberGrade();
                
                grade.setGradeCode(rs.getInt("GRADE_CODE"));
                grade.setGradeName(rs.getString("GRADE_NAME"));
                grade.setCreateDate(rs.getDate("CREATE_DATE"));
                grades.add(grade);
            } 
        }
        catch (ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        finally
        {
            try
            {
                rs.close();
                stmt.close();
                connection.close();
            } catch (SQLException e)
            {
                e.printStackTrace();
            }
        }
        
        return grades;
    }
    
    /**
     * int 형인 code를 넣어주면 조건문으로 조회하여 데이터를 가져온다.
     * @param code
     * @return
     */
    public MemberGrade findByCode(int code)
    {
        MemberGrade grade       = null;
        Connection connection   = null;
        PreparedStatement pstmt = null;
        ResultSet rs            = null;
        
        try
        {
            Class.forName("oracle.jdbc.driver.OracleDriver");// 오라클 드라이버
            String query = "SELECT * FROM MEMBER_GRADE WHERE GRADE_CODE = ?";
            
            connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "C##KH", "KH");
            pstmt      = connection.prepareStatement(query);

            pstmt.setInt(1, code);

            rs = pstmt.executeQuery();
            
            if(rs.next())
            {
                grade = new MemberGrade();
//                grade.setGradeCode(rs.getInt("GRADE_CODE"));
//                grade.setGradeName(rs.getString("GRADE_NAME"));
//                grade.setCreateDate(rs.getDate("CREATE_DATE"));
                grade.setGradeCode(rs.getInt(1));
                grade.setGradeName(rs.getString(2));
                grade.setCreateDate(rs.getDate(3));
            }
        }
        catch (ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        finally
        {
            try
            {
                rs.close();
                pstmt.close();
                connection.close();
            } catch (SQLException e)
            {
                e.printStackTrace();
            }
        }
        
        return grade;
    }



    /**
     * gradeName 을 입력받아 MEMBER_GRADE 테이블에 insert 한다
     * @param gradeName
     */
    public int insert(String gradeName)
    {
        int result = 0;
        
        Connection connection   = null;
        PreparedStatement pstmt = null;
        String query = "INSERT INTO MEMBER_GRADE VALUES(SEQ_GCODE.NEXTVAL, ?, DEFAULT)";
        
        try
        {
            Class.forName("oracle.jdbc.driver.OracleDriver");// 오라클 드라이버
            
            connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "C##KH", "KH");
            pstmt      = connection.prepareStatement(query);

            pstmt.setString(1, gradeName);

            result = pstmt.executeUpdate();
            
        }
        catch (ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        finally
        {
            try
            {
                pstmt.close();
                connection.close();
            } catch (SQLException e)
            {
                e.printStackTrace();
            }
        }
        
        return result;
    }

    /**
     * gradeName와, createDate 을 입력받아 MEMBER_GRADE 테이블에 update 한다
     * @param gradeName
     * @param createDate
     */
    public int update(int gradeCode ,String gradeName, String createDate)
    {
        int result = 0;
        
        Connection connection   = null;
        PreparedStatement pstmt = null;
        String query = "UPDATE MEMBER_GRADE SET GRADE_NAME = ? , CREATE_DATE = ? WHERE GRADE_CODE = ?";
        
        try
        {
            Class.forName("oracle.jdbc.driver.OracleDriver");// 오라클 드라이버
            
            connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "C##KH", "KH");
            pstmt      = connection.prepareStatement(query);

            pstmt.setString(1, gradeName);
            pstmt.setString(2, createDate);
            pstmt.setInt(3, gradeCode);

            result = pstmt.executeUpdate();
            
        }
        catch (ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        finally
        {
            try
            {
                pstmt.close();
                connection.close();
            } catch (SQLException e)
            {
                e.printStackTrace();
            }
        }
        
        return result;
    }

    /**
     * gradeName와, createDate 을 입력받아 MEMBER_GRADE 테이블에 delete 한다
     * @param gradeName
     * @param createDate
     */
    public int delete(int gradeCode)
    {
        int result = 0;
        
        Connection connection   = null;
        PreparedStatement pstmt = null;
        String query = "DELETE MEMBER_GRADE WHERE GRADE_CODE = ?";
        
        try
        {
            Class.forName("oracle.jdbc.driver.OracleDriver");// 오라클 드라이버
            
            connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "C##KH", "KH");
            pstmt      = connection.prepareStatement(query);

            pstmt.setInt(1, gradeCode);

            result = pstmt.executeUpdate();
            
        }
        catch (ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        finally
        {
            try
            {
                pstmt.close();
                connection.close();
            } catch (SQLException e)
            {
                e.printStackTrace();
            }
        }
        
        return result;
    }
}