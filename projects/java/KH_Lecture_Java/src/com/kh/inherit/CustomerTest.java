package com.kh.inherit;

import java.util.ArrayList;

public class CustomerTest
{
    public static void main(String[] args)
    {
        //ArrayList : Customer 클래스 배열 생성
        ArrayList<Customer> arrCust = new ArrayList<Customer>();
        
        //일반 고객(Customer)     : 2명 (ID, 이름) : ("10010", "이순신")
        //                                           ("10020", "신사임당")
        //GOLD 고객(GoldCustomer) : 2명 (ID, 이름) : ("10030", "홍길동")
        //                                           ("10040", "김유신")
        Customer c1  = new Customer(    "10010", "이순신"  );
        Customer c2  = new Customer(    "10020", "신사임당");
        Customer gc1 = new GoldCustomer("10030", "홍길동"  );
        GoldCustomer gc2 = new GoldCustomer("10040", "김유신"  );
        

        System.out.println(c1 ); 
        System.out.println(c2 ); 
        System.out.println(gc1);
        System.out.println(gc2);
        
        // 생성한 인스턴스를 Customer 클래스 배열에 추가
        arrCust.add(c1 ); 
        arrCust.add(c2 ); 
        arrCust.add(gc1);
        arrCust.add(gc2);
        
        for (Customer customer : arrCust)
        {
            System.out.println(customer);
            System.out.println("===================== 고객정보출력 =====================");
            //showCustomerInfo() 활용하여 출력
            System.out.println(customer.showCustomerInfo()+ "\n");
            
            System.out.println("================= 할인율과 적립금 계산 =================");
            int price = 10000;
            
            //할인율과 적립금 계산후
            // "{고객이름} 님이 {price}을 지불했습니다. " 출력
            System.out.println(customer.getCustomerNm() + " 님이 "+ customer.calcPrice(price) +"을 지불했습니다. ");
            // "{고객이름} 님의 현재적립금은 {...}입니다. " 출력
            System.out.println(customer.getCustomerNm() + " 님의 현재 적립금은 "+ customer.getPoint() +"입니다. ");
            System.out.println(customer.getCustomerNm() + " 님의 현재 할인된금액은 "+ customer.calcPrice(price) +"입니다. "+ "\n");
            GoldCustomer gcTemp = (GoldCustomer)customer;
            gcTemp.affectParent();
        }
    }
}
