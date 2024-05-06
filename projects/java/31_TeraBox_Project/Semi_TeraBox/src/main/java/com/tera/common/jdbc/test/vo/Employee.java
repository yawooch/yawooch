package com.tera.common.jdbc.test.vo;

import java.util.Date;

public class Employee
{
    private String  empId;
    private String  empName;
    private String  empNo;
    private String  email;
    private String  phone;
    private String  deptCode;
    private String  jobCode;
    private int     salary;
    private int     bonus;
    private String  managerId;
    private Date    hireDate;
    private Date    entDate;
    private String  entYn;
    
    

    @Override
    public String toString()
    {
        return "Employee [empId=" + empId + ", empName=" + empName + ", empNo=" + empNo + ", email=" + email
                + ", phone=" + phone + ", deptCode=" + deptCode + ", jobCode=" + jobCode + ", salary=" + salary
                + ", bonus=" + bonus + ", managerId=" + managerId + ", hireDate=" + hireDate + ", entDate=" + entDate
                + ", entYn=" + entYn + "]";
    }
    
    /**
     * @return the empId
     */
    public String getEmpId()
    {
        return empId;
    }
    
    /**
     * @param empId the empId to set
     */
    public void setEmpId(String empId)
    {
        this.empId = empId;
    }
    /**
     * @return the empName
     */
    public String getEmpName()
    {
        return empName;
    }
    /**
     * @param empName the empName to set
     */
    public void setEmpName(String empName)
    {
        this.empName = empName;
    }
    /**
     * @return the empNo
     */
    public String getEmpNo()
    {
        return empNo;
    }
    /**
     * @param empNo the empNo to set
     */
    public void setEmpNo(String empNo)
    {
        this.empNo = empNo;
    }
    /**
     * @return the email
     */
    public String getEmail()
    {
        return email;
    }
    /**
     * @param email the email to set
     */
    public void setEmail(String email)
    {
        this.email = email;
    }
    /**
     * @return the phone
     */
    public String getPhone()
    {
        return phone;
    }
    /**
     * @param phone the phone to set
     */
    public void setPhone(String phone)
    {
        this.phone = phone;
    }
    /**
     * @return the deptCode
     */
    public String getDeptCode()
    {
        return deptCode;
    }
    /**
     * @param deptCode the deptCode to set
     */
    public void setDeptCode(String deptCode)
    {
        this.deptCode = deptCode;
    }
    /**
     * @return the jobCode
     */
    public String getJobCode()
    {
        return jobCode;
    }
    /**
     * @param jobCode the jobCode to set
     */
    public void setJobCode(String jobCode)
    {
        this.jobCode = jobCode;
    }
    /**
     * @return the salary
     */
    public int getSalary()
    {
        return salary;
    }
    /**
     * @param salary the salary to set
     */
    public void setSalary(int salary)
    {
        this.salary = salary;
    }
    /**
     * @return the bonus
     */
    public int getBonus()
    {
        return bonus;
    }
    /**
     * @param bonus the bonus to set
     */
    public void setBonus(int bonus)
    {
        this.bonus = bonus;
    }
    /**
     * @return the managerId
     */
    public String getManagerId()
    {
        return managerId;
    }
    /**
     * @param managerId the managerId to set
     */
    public void setManagerId(String managerId)
    {
        this.managerId = managerId;
    }
    /**
     * @return the hireDate
     */
    public Date getHireDate()
    {
        return hireDate;
    }
    /**
     * @param hireDate the hireDate to set
     */
    public void setHireDate(Date hireDate)
    {
        this.hireDate = hireDate;
    }
    /**
     * @return the entDate
     */
    public Date getEntDate()
    {
        return entDate;
    }
    /**
     * @param entDate the entDate to set
     */
    public void setEntDate(Date entDate)
    {
        this.entDate = entDate;
    }
    /**
     * @return the entYn
     */
    public String getEntYn()
    {
        return entYn;
    }
    /**
     * @param entYn the entYn to set
     */
    public void setEntYn(String entYn)
    {
        this.entYn = entYn;
    }
    
    
}