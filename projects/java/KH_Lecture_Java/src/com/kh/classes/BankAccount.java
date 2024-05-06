package com.kh.classes;

public class BankAccount
{
    //클래스 데이터 + 기능
    
    // 인스턴스 변수(데이터)
    int balance = 0;
    
    //인스턴스 메소드(기능)
    
    /** 잔액 증가 */
    public int deposit(int amount)
    {
        balance += amount;
        
        return balance;
    }
    /** 잔액 차감 */
    public int withdraw(int amount)
    {
        balance -= amount;
        return balance;
    }
    // CRUD > Create(추가), Read(조회), Update(수정), Delete(삭제)
    
    /** 잔액조회 */
    public int checkMyBalance()
    {
        System.out.println("잔액 : " + balance);
        return balance;
    }
    
    
}
