package com.kh.collection;

import java.util.Iterator;
import java.util.Set;
import java.util.TreeMap;

public class MemberTreeMap
{
    //TreeMap : key - value
    //          key 를 기준으로 데이터 정렬할때 주로 사용
    // [멤버변수]
    // TreeMap 컬렉션 클래스타입
    //          key : 정수형, Value : Member
    //          (-) treeMap
    private TreeMap<Integer, Member> treeMap;
    
    //[생성자]
    //  treeMap 인스턴스 생성 및 참조변수 연결
    public MemberTreeMap()
    {
        treeMap = new TreeMap<Integer, Member>();
    }
    
    // [메소드]
    // [1] 데이터 추가. 매개변수 : Member타입데이터
    //                  TreeMap 데이터 추가 : put(Key 값 - 고객번호, Value 값- Member)
    public void addMember(Member member)
    {
        treeMap.put(member.getMemberId(), member);
    }
    
    
    // [2] 데이터 삭제. 매개변수 : 고객번호, Map에 데이터가 있는 경우 삭제
    //      결과 : T(삭제 성공), F(삭제하지 않았을때)
    // TreeMap 도 HashMap 처럼 contrainsKey, remove메소드사용
    public boolean removeMember(int memberId)
    {
        Set<Integer> intSet = treeMap.keySet();
        if(intSet.contains(memberId))
        {
            treeMap.remove(memberId);
            return true;
        }
        return false;
    }
    
    
    // [3] 전체 데이터 출력
    public void printAll()
    {
        Iterator<Integer> itrSet = treeMap.keySet().iterator();
        while(itrSet.hasNext())
        {
            int key = itrSet.next();
            System.out.println(treeMap.get(key));
        }
    }
    
    public static void main(String[] args)
    {
        MemberTreeMap mtm = new MemberTreeMap();
        
        mtm.addMember(new Member(1000,"민트"));
        mtm.addMember(new Member(2000,"블루"));
        mtm.addMember(new Member(3000,"그린"));
        mtm.addMember(new Member(2000,"블루"));
        mtm.removeMember(new Member(2000,"블루").getMemberId());
        mtm.printAll();
    }
}