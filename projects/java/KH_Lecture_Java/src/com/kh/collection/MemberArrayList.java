package com.kh.collection;

import java.util.ArrayList;

public class MemberArrayList
{
    //ArrayList를 사용해서 Member타입의 배열 변수 선언
    private ArrayList<Member> memberList;
    
    //생성자, memberList배열의 인스턴스 생성
    public MemberArrayList()
    {
        memberList = new ArrayList<Member>();
    }
    
    //(메소드) Member 객체를 매개변수로 받아서,
    // memberList 배열에 데이터를 추가(add())
    public void addMember(Member member)
    {
        memberList.add(member);
    }
    
    //(메소드) 회원 번호를 매개변수로 받아서,
    // memberList 배열에 있는 데이터인 경우 해당 데이터 제거
    // 데이터를 제거한 경우 true반환 그렇지 않은경우 false 반환
    // 제거된 항목이 없는 경우 "{memberId}가 존재 하지 않습니다." 출력
    //  * ArrayList 데이터 제거 : remove()
    //  * ArrayList 데이터 조회 : get()
    public boolean removeAt(int memberId)
    {
        for (int index = 0; index < memberList.size(); index++)
        {
            if(memberList.get(index).getMemberId() == memberId)
            {
                memberList.remove(index);
                return true;
            }
        }
        System.out.println(memberId + "가 존재 하지 않습니다.");
        return false;
    }
    
    //(메소드) 배열에 저장된 데이터 모두 출력
    public void printAll()
    {
        for (Member member : memberList)
        {
//            System.out.println("회원번호 : " + member.getMemberId() + "\t, 회원이름 : " + member.getMemberName());
            System.out.println(member.toString());
        }
    }

    public static void main(String[] args)
    {
        MemberArrayList memberList = new MemberArrayList();
        memberList.addMember(new Member(1, "양우찬")); 
        memberList.addMember(new Member(2, "양읒짜")); 
        memberList.addMember(new Member(3, "홍길동"));
        
        memberList.printAll();
        
        System.out.println(memberList.removeAt(0));
        System.out.println(memberList.removeAt(10));
        System.out.println(memberList.removeAt(1));
        
        memberList.printAll();
    }
}
