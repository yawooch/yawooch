package com.kh.inherit;

public class GoldCustomer extends Customer
{
    //Customer 클래스로부터 상속을 받고
    //고객등급 : "GOLD", 적립율 : 0.02, 할인률 : 0.1 초기화
    //할인률을 계산해서 결과를 돌려주는 기능
    // (적립금도 계산)
    // 메소드명: calcPrice
    
    private double dscnRate; //할인률
    double pointAccumRate;      //포인트적립율
    
    public void setDscnRate(double dscnRate)
    {
        this.dscnRate = dscnRate;
    }
    public double getDscnRate()
    {
        return dscnRate;
    }
    
    public GoldCustomer()
    {
        super.customerGr = "GOLD";     //고객등급 : "GOLD"
        super.setPointAccumRate(0.02); //적립율 : 0.02
        this.dscnRate = 0.1;           //할인률 : 0.1

        super.pointAccumRate = 0.2;
        this.pointAccumRate = 0.3;
        System.out.println("super.pointAccumRate : " + super.pointAccumRate);
        System.out.println("this.pointAccumRate  : " + this.pointAccumRate );
    }
    //고객ID, 고객이름을 전달받아서 초기화
    public GoldCustomer(String customerId, String customerNm)
    {
        super(customerId, customerNm);
        super.customerGr = "GOLD";     //고객등급 : "GOLD"
        super.setPointAccumRate(0.02); //적립율 : 0.02
        this.dscnRate = 0.1;          //할인률 : 0.1

        super.pointAccumRate = 0.4;
        this.pointAccumRate = 0.5;
        System.out.println("super.pointAccumRate : " + super.pointAccumRate);
        System.out.println("this.pointAccumRate  : " + this.pointAccumRate );
    }    

    public void init()
    {
        System.out.println("GoldCustomer init()~");
    }
    
    /** 할인률을 계산해서 결과를 돌려주는 기능
     *  (적립금도 계산)
     *  메소드명: calcPrice */
    @Override
    public int calcPrice(int price)
    {
        point += price*pointAccumRate;
        return price - (int)(price*dscnRate);
    }

    /** 할인률을 계산해서 결과를 돌려주는 기능
     *  (적립금도 계산)
     *  메소드명: calcPrice */
    public void affectParent()
    {
        System.out.println("엄마는 이런거 못하지?");
    }
}
