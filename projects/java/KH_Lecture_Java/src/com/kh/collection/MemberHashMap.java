package com.kh.collection;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

public class MemberHashMap
{
    // Map : key-value 한 쌍으로 데이터를 관리하는 구조
    //  HashMap<key로 사용할 데이터 타입, Value로 사용할 데이터 타입>
    
    //멤버 변수 : HashMap 컬렉션 클래스  변수명 hashMap
    // key : 정수형 , value : Member 타입
    private HashMap<Integer, Member> hashMap;
    
    
    //생성자
    // 선언한 변수 hashMap 에 HashMap 컬렉션 클래스의 인스턴스 생성후
    public MemberHashMap()
    {
        hashMap = new HashMap<Integer, Member>();
    }
    
    //[1] 데이터 추가 . + addMember()
    //          매개변수 : Member 타입의 데이터
    //          key : 고객번호를 사용, value : 멤버객체
    //          * Map 컬렉션에서 데이터 추가 : put() 사용
    public void addMember(Member member)
    {
        hashMap.put(member.getMemberId(), member);
    }
    
    //[2] 데이터 제거 + removeMember
    //          매개변수 : 고객번호
    //          Map 에 데이터가 있는 경우 제거 결과 true/false 반환
    //     - key로 데이터를 관리할 수 있음
    //          * constrainsKey(key값) : 해당 Key 값이 있는지 
    //     - Map 컬렉션에서 데이터 삭제 : remove(key 값)사용
    public boolean removeMember(int memberId)
    {
        Set<Integer> intSet = hashMap.keySet();

        if(intSet.contains(Integer.valueOf(memberId)))
        {
            hashMap.remove(memberId);
            return true;
        }
        return false;
    }
    
    //[3] 전체 데이터 출력 (+)
    //      * Iterator 사용시 key를 기준으로 사용
    //          - keySet() : 키 목록을 조회하는 메소드
    //          - get()    : 키 값을 기준으로 데이터를 조회 
    public void printAll()
    {
        Iterator<Integer> iter = hashMap.keySet().iterator();
        
        while(iter.hasNext())
        {
//            Integer key = iter.next(); 
            int key = iter.next(); 
            System.out.println(hashMap.get(key));
//            System.out.println("Key : " + key.intValue() + ", Value : " + hashMap.get(key.intValue()));
        }
    }
    
    public static void main(String[] args)
    {
        MemberHashMap mhm = new MemberHashMap();
        mhm.addMember(new Member(10, "청룡"));
        mhm.addMember(new Member(20, "백호"));
        mhm.addMember(new Member(30, "주작"));
        mhm.addMember(new Member(40, "현무"));

        mhm.removeMember(new Member(30, "주작").getMemberId());
        mhm.printAll();
    }
}
