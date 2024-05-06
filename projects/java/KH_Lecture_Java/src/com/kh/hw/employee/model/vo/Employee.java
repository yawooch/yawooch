package com.kh.hw.employee.model.vo;

public class Employee
{
    /*
     * com.kh.hw.employee.model.vo.Employee
     * - empNo : int
     * - name : String
     * - gender : char
     * - phone : String
     * - dept : String
     * - salary : int
     * - bonus : double
     * + Employee()                                                                                         : 기본 생성자
     * + Employee(empNo:int, name:String, gender:char, phone:String)                                        : 4개의 초기 값을 받는 생 성자
     * + Employee(empNo:int, name:String, gender:char, phone:String, dept:String, salary:int, bonus:double) : 7개의 초기 값을 받는 생 성자
     * + setter() / getter()
     * + printEmployee()                                                                                    : String 직원 정보 반환
     */

    private int    empNo  ;  // - empNo  : int       
    private String name   ;  // - name   : String    
    private char   gender ;  // - gender : char      
    private String phone  ;  // - phone  : String    
    private String dept   ;  // - dept   : String    
    private int    salary ;  // - salary : int       
    private double bonus  ;  // - bonus  : double    

    // + Employee() : 기본 생성자
    public Employee()
    {
        
    }
    // + Employee(empNo:int, name:String, gender:char, phone:String) : 4개의 초기 값을 받는 생 성자
    public Employee(int empNo, String name, char gender, String phone)
    {
        this.empNo  = empNo  ;
        this.name   = name   ;
        this.gender = gender ;
        this.phone  = phone  ;
    }

    // + Employee(empNo:int, name:String, gender:char, phone:String, dept:String, salary:int, bonus:double) : 7개의 초기 값을 받는 생 성자
    public Employee(int empNo, String name, char gender, String phone, String dept, int salary, double bonus)
    {
        this.empNo  = empNo  ;
        this.name   = name   ;
        this.gender = gender ;
        this.phone  = phone  ;
        this.dept   = dept   ;
        this.salary = salary ;
        this.bonus  = bonus  ;
    }
    // + printEmployee() : String 직원 정보 반환
    public String printEmployee()
    {
        return empNo  + " " + name   + " " + gender + " " + phone  + " " + dept   + " " + salary + " " + bonus;
    }
    
    
    // + setter() / getter()
    /** @return the empNo */
    public int getEmpNo()
    {
        return empNo;
    }
    /** @param empNo the empNo to set */
    public void setEmpNo(int empNo)
    {
        this.empNo = empNo;
    }
    /** @return the name */
    public String getName()
    {
        return name;
    }
    /** @param name the name to set */
    public void setName(String name)
    {
        this.name = name;
    }
    /** @return the gender */
    public char getGender()
    {
        return gender;
    }
    /** @param gender the gender to set */
    public void setGender(char gender)
    {
        this.gender = gender;
    }
    /** @return the phone */
    public String getPhone()
    {
        return phone;
    }
    /** @param phone the phone to set */
    public void setPhone(String phone)
    {
        this.phone = phone;
    }
    /** @return the dept */
    public String getDept()
    {
        return dept;
    }
    /** @param dept the dept to set */
    public void setDept(String dept)
    {
        this.dept = dept;
    }
    /** @return the salary */
    public int getSalary()
    {
        return salary;
    }
    /** @param salary the salary to set */
    public void setSalary(int salary)
    {
        this.salary = salary;
    }
    /** @return the bonus */
    public double getBonus()
    {
        return bonus;
    }
    /** @param bonus the bonus to set */
    public void setBonus(double bonus)
    {
        this.bonus = bonus;
    }
}
