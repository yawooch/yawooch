package com.kh.io.assiststream;

import java.io.Serializable;

public class Member implements Serializable
{
    private static final long serialVersionUID = -6275623530066323127L;
    
    private String id;
    private transient String password;
    private String name;
    private int    age;
    private char   gender;
    transient private double point;
    
    
    public Member(){}
    public Member(String id, String password, String name, int age, char gender, double point)
    {
        this.id       = id;
        this.password = password;
        this.name     = name;
        this.age      = age;
        this.gender   = gender;
        this.point    = point;
    }
    
    @Override
    public String toString()
    {
        return getClass().getName() + " [id=" + id + ", password=" + password + ", name=" + name + ", age=" + age + ", gender=" + gender + ", point=" + point + "]";
    }
    
    /** @return the id */
    public String getId()
    {
        return id;
    }
    
    /** @param id the id to set */
    public void setId(String id)
    {
        this.id = id;
    }
    
    /** @return the password */
    public String getPassword()
    {
        return password;
    }
    
    /** @param password the password to set */
    public void setPassword(String password)
    {
        this.password = password;
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
    
    /** @return the age */
    public int getAge()
    {
        return age;
    }
    
    /** @param age the age to set */
    public void setAge(int age)
    {
        this.age = age;
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
    
    /** @return the point */
    public double getPoint()
    {
        return point;
    }
    
    /** @param point the point to set */
    public void setPoint(double point)
    {
        this.point = point;
    }
}
