package com.kh.collection;

import java.util.Iterator;
import java.util.TreeSet;

public class MemberTreeSet
{
    //TreeSet을 Member 타입으로 사용할 변수
    private TreeSet<Member> treeSet;
    
    //생성자 : treeSetd의 인스턴스를 생성
    public MemberTreeSet()
    {
        treeSet = new TreeSet<Member>();
    }
    
    //treeSet 에 데이터를 추가 : add({데이터})
    // 매개변수 : Member 타입의 데이터
    public void addMember(Member member)
    {
        treeSet.add(member);
    }
    
    //treeSet에서 제거
    // Iterator를 사용해서 데이터를 조회
    public boolean removeMember(int memberId)
    {
        Iterator<Member> ir = treeSet.iterator();
        
        //hasNext() : set 구조에서 다음아이템이 있는지 확인
        while(ir.hasNext())
        {
            Member m  = ir.next();
            if(m.getMemberId() == memberId)
            {
                treeSet.remove(m);
                return true;
            }
        }
        System.out.println(memberId + "값이 없습니다.");
        return false;
    }

    //(메소드) 배열에 저장된 데이터 모두 출력
    public void printAll()
    {
        for (Member m : treeSet)
        {
//            System.out.println("회원번호 : " + member.getMemberId() + "\t, 회원이름 : " + member.getMemberName());
            System.out.println(m.toString());
        }
    }
    
    public static void main(String[] args)
    {
        MemberTreeSet mts = new MemberTreeSet();
        
        mts.addMember(new Member(1000,"민트"));
        mts.addMember(new Member(2000,"블루"));
        mts.addMember(new Member(3000,"그린"));
        
        mts.printAll();
        
        mts.addMember(new Member(2000,"블루"));
        
        System.out.println("---------------------------------");
        
        mts.printAll();
        
        mts.addMember(new Member(2000,"블루123"));
        mts.addMember(new Member(2020,"레드"));
        
        System.out.println("---------------------------------");
        
        mts.printAll();
    }
}