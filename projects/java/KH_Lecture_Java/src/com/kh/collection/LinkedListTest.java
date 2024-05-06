package com.kh.collection;

import java.util.LinkedList;

public class LinkedListTest
{
    public static void main(String[] args)
    {
        LinkedList<String> list = new LinkedList<String>();
        
        //데이터 추가 : add({데이터})
        list.add("apple");
        list.add("banana");
        list.add("melon");
        
        System.out.println(list);
        //데이터 추가2: add({위치}, {데이터})
        list.add(1,"kiwi");
        
        System.out.println(list);
        
        //데이터 추가3 : add
        list.addFirst("cherry");
        
        System.out.println(list);
        
        //데이터 삭제
        System.out.println("삭제한 항목 : " + list.removeLast());
        
        list.add("melon");
    }
}
