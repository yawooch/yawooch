package com.kh.classes;

public class BankAccount00
{
    public static void main(String[] args)
    {
        //인스턴스를 생성했다
        BankAccount kim = new BankAccount();
        
        BankAccount lee = new BankAccount();
        
        //입금 메소드. 5000씩 입금
        int money = kim.deposit(5000);
        System.out.println("kim 의 잔액 : " + money);
        lee.deposit(5000);
        
        
        // 출금 메소드를 사용해서 kim 참조변수에서는 1500출금
        // lee 참조변수에서는 3000 출금
        kim.withdraw(1500);
        lee.withdraw(3000);
        
        //
        System.out.println("kim 의 잔액 : " + kim.checkMyBalance());
        System.out.println("lee 의 잔액 : " + lee.checkMyBalance());
        
        
    }
}
