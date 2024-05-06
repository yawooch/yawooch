package com.tera.common.jdbc.test.vo;

import java.util.Date;

public class MemberGrade
{
    private int gradeCode;
    private String gradeName;
    private Date createDate;
    
    
    /**
     * @return the createDate
     */
    public Date getCreateDate()
    {
        return createDate;
    }
    /**
     * @param createDate the createDate to set
     */
    public void setCreateDate(Date createDate)
    {
        this.createDate = createDate;
    }
    /**
     * @return the gradeCode
     */
    public int getGradeCode()
    {
        return gradeCode;
    }
    /**
     * @param gradeCode the gradeCode to set
     */
    public void setGradeCode(int gradeCode)
    {
        this.gradeCode = gradeCode;
    }
    /**
     * @return the gradeName
     */
    public String getGradeName()
    {
        return gradeName;
    }
    /**
     * @param gradeName the gradeName to set
     */
    public void setGradeName(String gradeName)
    {
        this.gradeName = gradeName;
    }
    
    @Override
    public String toString()
    {
        return "MemberGrade [gradeCode=" + gradeCode + ", gradeName=" + gradeName + ", createDate=" + createDate + "]";
    }
    
}