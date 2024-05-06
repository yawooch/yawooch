package com.tera.common.jdbc.test.vo;

import java.util.Date;

public class Member
{
    private String memberId;       //멤버아이디     MEMBER_ID
    private String password;       //비밀번호       PASSWORD
    private String memberName;     //이름           MEMBER_NAME
    private String birth;          //생년월일       BIRTH
    private String memPhone;       //핸드폰번호     MEM_PHONE
    private String memEmail;       //이메일주소     MEM_EMAIL
    private String memSsn;         //주민등록번호   MEM_SSN
    private String mktAgreeYn;     //마케팅동의여부 MKT_AGREE_YN
    private String bnftsMedia;     //혜택수신매체   BNFTS_MEDIA
    private String managerYn;      //관리자여부     MANAGER_YN
    private Date   joinDttm;       //가입일시       JOIN_DTTM
    public String getMemberId()
    {
        return memberId;
    }
    public void setMemberId(String memberId)
    {
        this.memberId = memberId;
    }
    public String getPassword()
    {
        return password;
    }
    public void setPassword(String password)
    {
        this.password = password;
    }
    public String getMemberName()
    {
        return memberName;
    }
    public void setMemberName(String memberName)
    {
        this.memberName = memberName;
    }
    public String getBirth()
    {
        return birth;
    }
    public void setBirth(String birth)
    {
        this.birth = birth;
    }
    public String getMemPhone()
    {
        return memPhone;
    }
    public void setMemPhone(String memPhone)
    {
        this.memPhone = memPhone;
    }
    public String getMemEmail()
    {
        return memEmail;
    }
    public void setMemEmail(String memEmail)
    {
        this.memEmail = memEmail;
    }
    public String getMemSsn()
    {
        return memSsn;
    }
    public void setMemSsn(String memSsn)
    {
        this.memSsn = memSsn;
    }
    public String getMktAgreeYn()
    {
        return mktAgreeYn;
    }
    public void setMktAgreeYn(String mktAgreeYn)
    {
        this.mktAgreeYn = mktAgreeYn;
    }
    public String getBnftsMedia()
    {
        return bnftsMedia;
    }
    public void setBnftsMedia(String bnftsMedia)
    {
        this.bnftsMedia = bnftsMedia;
    }
    public String getManagerYn()
    {
        return managerYn;
    }
    public void setManagerYn(String managerYn)
    {
        this.managerYn = managerYn;
    }
    public Date getJoinDttm()
    {
        return joinDttm;
    }
    public void setJoinDttm(Date joinDttm)
    {
        this.joinDttm = joinDttm;
    }
    @Override
    public String toString()
    {
        return "Member [memberId=" + memberId + ", password=" + password + ", memberName=" + memberName + ", birth="
                + birth + ", memPhone=" + memPhone + ", memEmail=" + memEmail + ", memSsn=" + memSsn + ", mktAgreeYn="
                + mktAgreeYn + ", bnftsMedia=" + bnftsMedia + ", managerYn=" + managerYn + ", joinDttm=" + joinDttm
                + "]";
    }
    
}
