package com.kh.collection;

// * Set에서 사용하려면 Comparable(인터페이스)를 구현해야함
public class Member// implements Comparable<Member>
{
    private int    memberId;   //회원고유번호
    private String memberName; //회원 이름
    
    //생성자, 회원 번호와 이름을 전달받아 저장
    public Member(int memberId, String memberName)
    {
        this.memberId   = memberId;
        this.memberName = memberName;
    }

    // 멤버변수 캡슐화 getter / setter 
    
    /**  @return the memberId */
    public int getMemberId()
    {
        return memberId;
    }

    /** @param memberId the memberId to set */
    public void setMemberId(int memberId)
    {
        this.memberId = memberId;
    }

    /**  @return the memberName */
    public String getMemberName()
    {
        return memberName;
    }

    /** @param memberName the memberName to set */
    public void setMemberName(String memberName)
    {
        this.memberName = memberName;
    }

    @Override
    public String toString()
    {
        return "[" +memberId + "] " + memberName;
    }

    //정렬 관련된 메소드 : compareTo
//    @Override
//    public int compareTo(Member o)
//    {
////        회원번호 기준으로 정렬(오름차순)
//        return (this.memberId - o.memberId);
////        회원번호 기준으로 정렬(내림차순)
////        return (this.memberId - o.memberId) * (-1);
//    }

    @Override
    public int hashCode()
    {
        // set...?
        return memberId;
    }

    @Override
    public boolean equals(Object obj)
    {
        // 클래스 인스턴스 타입 체크 : instanceof
        if(obj instanceof Member)
        {
            Member member = (Member)obj;
            if(this.memberId == member.memberId)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        return super.equals(obj);
    }
}
