package com.kh.bookshelf;

import java.util.ArrayList;

public class BookShelf extends Shelf implements Queue
{
    // Shelf 클래스를 상속 
    
    // Queue 인터페이스를 구현
    //  [1] enQueue : shelf 배열에 전달받은 값을 추가
    //  [2] deQueue : shelf 배열에 첫번째 위치의 값을 제거하여 그값을 반환
    //  [3] getSize : getCount() 호출하여 반환

    /* BookShelf 생성하여 사용하기전 메모
     * 과연...
     * Shelf 쪽에 생성할때만 초기화한다고 설정했는데
     * BookShelf를 선언할때 자동으로 초기화가 될 것인가...
     * 
     * 그럼 자식클래스가 객체생성될때 부모도 객체 생성된다는 이야기인데..
     * 
     * 아님, 묵시적 형변환이 될때만 부모쪽 클래스가 생성되는 것인가...
     */
    //new  Shelf()

    public BookShelf()
    {
        System.out.println("BookShelf()");
    }
    @Override
    //  [1] enQueue : shelf 배열에 전달받은 값을 추가
    public void enQueue(String title)
    {
        super.shelf.add(title);
    }

    @Override
    //  [2] deQueue : shelf 배열에 첫번째 위치의 값을 제거하여 그값을 반환
    public String deQueue()
    {
        return super.shelf.remove(0);
    }

    @Override
    //  [3] getSize : getCount() 호출하여 반환
    public int getSize()
    {
        return getCount();
    }
    
}
