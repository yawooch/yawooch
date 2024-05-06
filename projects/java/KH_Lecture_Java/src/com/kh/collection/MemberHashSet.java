package com.kh.collection;

import java.util.HashSet;
import java.util.Iterator;

public class MemberHashSet
{
    //내부 접근만 허용한 HashSet<Member> 타입의 hashSet 멤버변수 선언
    //      hashSet 멤버변수 선언
    private HashSet<Member> hashSet;
    
    
    // 생성자
    // 선언한 hashSet에인스턴스 생성
    public MemberHashSet()
    {
        hashSet = new HashSet<Member>();
    }
    
    //메소드
    // [1] 멤버 추가 기능 : + addMember
    //          Member 객체를 매개변수로 받아서 hashSet에 추가
    public void addMember(Member member)
    {
        hashSet.add(member);
    }
    
    // [2] 멤버 제거 기능 : + removeMember
    //          저장된 데이터 중 매개변수로 받은 memberId 값이 있는 경우제거
    //          * Iterator : Collection 요소(데이터)를 순회
    //              - boolean hasNext() 이후에 데이터가 더 있는지 체크 메소드
    //              - E next()  다음에 있는 데이터를 반환
    public void removeMember(Member member)
    {
        System.out.println("===================================================");
        Iterator<Member> iter = hashSet.iterator();
        while(iter.hasNext())
        {
            Member mem = iter.next();
            System.out.println(mem.getMemberName());
            int    setMemberId   = mem.getMemberId();
            String setMemberName = mem.getMemberName();
            if(setMemberId == member.getMemberId() && member.getMemberName().equals(setMemberName))
            {
//                iter.remove();
                hashSet.remove(mem);
//                break;
            }
            System.out.println(mem.getMemberId() + ", " + mem.getMemberName());
            System.out.println("===================================================");
        }

    }
    
    // [3] 멤버 데이터 전체 출력
    public void printAll()
    {
        Iterator<Member> iter = hashSet.iterator();
        while(iter.hasNext())
        {
            Member mem = iter.next();
            System.out.println(mem.getMemberId() + ", " + mem.getMemberName());
        }
    }
    
    public static void main(String[] args)
    {
        MemberHashSet mhs = new MemberHashSet();
        mhs.addMember(new Member(10, "홍길동"));
        mhs.addMember(new Member(20, "동길동"));
        mhs.addMember(new Member(30, "백길동"));
        mhs.addMember(new Member(40, "서길동"));
        mhs.addMember(new Member(40, "고길동"));
        
        mhs.removeMember(new Member(20, "동길동"));
//        System.out.println("===================================================");
//        
//        mhs.printAll();
    }
}
