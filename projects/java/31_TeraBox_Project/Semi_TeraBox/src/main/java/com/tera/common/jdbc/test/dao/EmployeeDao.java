package com.tera.common.jdbc.test.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tera.common.jdbc.test.vo.Employee;

/**
 * <EMPLOYEE 테이블>
 * ┏-----------┳---------┳-----------┓
 * ┃COLUMN_NAME┃DATA_TYPE┃DATA_LENGTH┃
 * ┣-----------╋---------╋-----------┫
 * ┃EMP_ID     ┃VARCHAR2 ┃          3┃
 * ┃EMP_NAME   ┃VARCHAR2 ┃         20┃
 * ┃EMP_NO     ┃CHAR     ┃         14┃
 * ┃EMAIL      ┃VARCHAR2 ┃         25┃
 * ┃PHONE      ┃VARCHAR2 ┃         12┃
 * ┃DEPT_CODE  ┃CHAR     ┃          2┃
 * ┃JOB_CODE   ┃CHAR     ┃          2┃
 * ┃SALARY     ┃NUMBER   ┃         22┃
 * ┃BONUS      ┃NUMBER   ┃         22┃
 * ┃MANAGER_ID ┃VARCHAR2 ┃          3┃
 * ┃HIRE_DATE  ┃DATE     ┃          7┃
 * ┃ENT_DATE   ┃DATE     ┃          7┃
 * ┃ENT_YN     ┃CHAR     ┃          1┃
 * ┖-----------┸---------┸-----------┚
 */
public class EmployeeDao
{
    
    
    /**
     * EMPLOYEE 테이블에 있는 모든 데이터를 불러와 List<Employee>에 넣어준다.
     * @return
     */
    public List<Employee> findAll()
    {
        List<Employee> employees = new ArrayList<Employee>();

        Connection connection = null;
        Statement stmt        = null;
        ResultSet rs          = null;
        
        try
        {
            Class.forName("oracle.jdbc.driver.OracleDriver");// 오라클 드라이버
            
            connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "C##KH", "KH");
            stmt       = connection.createStatement();
            rs         = stmt.executeQuery("SELECT * FROM EMPLOYEE");
            
            while(rs.next())
            {
                Employee employee = new Employee();

                employee.setEmpId(rs.getString("EMP_ID"));
                employee.setEmpName(rs.getString("EMP_NAME"));
                employee.setEmpNo(rs.getString("EMP_NO"));
                employee.setEmail(rs.getString("EMAIL"));
                employee.setPhone(rs.getString("PHONE"));
                employee.setDeptCode(rs.getString("DEPT_CODE"));
                employee.setJobCode(rs.getString("JOB_CODE"));
                employee.setSalary(rs.getInt("SALARY"));
                employee.setBonus(rs.getInt("BONUS"));
                employee.setManagerId(rs.getString("MANAGER_ID"));
                employee.setHireDate(rs.getDate("HIRE_DATE"));
                employee.setEntDate(rs.getDate("ENT_DATE"));
                employee.setEntYn(rs.getString("ENT_YN"));
                
                employees.add(employee);
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
        
        return employees;
    }
}
