package com.kh.inherit;

public class Run
{
    public static void main(String[] args)
    {
        Customer cr1 = new Customer();
        System.out.println(cr1.showCustomerInfo());
        
        System.out.println("========================================");
        
        Customer cr2 = new Customer("IDX", "양읒짜");
        System.out.println(cr2.showCustomerInfo());
        
        System.out.println("========================================");
        
        GoldCustomer gc1 = new GoldCustomer();
        System.out.println(gc1.showCustomerInfo());
        System.out.println("========================================");

        GoldCustomer gc2 = new GoldCustomer("IDY", "양읒짠");
        System.out.println(gc2.showCustomerInfo());
        
        
    }
}
