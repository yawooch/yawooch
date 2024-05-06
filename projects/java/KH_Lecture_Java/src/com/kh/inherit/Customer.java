package com.kh.inherit;

public class Customer
{
    // 멤버변수 : 고객ID(-), 고객이름(-), 고객등급(-), 포인트, 포인트적립율
    
    // 생성자   : 고객등급("SILVER"), 할인률(0.01)
    
    /* 메소드   :
     *  1) 금액을 전달 받아서 포인트 적립율 기준으로 포인트 계산후 금액 다시 결과로 반환  
     *      메소드명 : calcPrice()
     *      매개변수명 : price
     *      
     *  2) 고객정보를 결과로 반환
     *      {고객명}님의 등급은 {고객등급} 이고, 보너스 포인트는 {포인트}입니다.
     *      메소드명 : showCustomerInfo
     */
    
    private   String customerId;  //고객ID(-)
    private   String customerNm;  //고객이름(-)
    protected String customerGr;  //고객등급(-)
    int point;                    //포인트
    double pointAccumRate;        //포인트적립율
    
    
    /*
     * 생성자   : 멤버 변수를 초기화하기 위해 사용하는 메소드
     *             기본값은 public 클래스명(){}
     *             초기화할 값을 매개변수로 받아서 초기화할때  
     */
    // 생성자   : 고객등급("SILVER"), 포인트적립율(0.01)
    public Customer()
    {
        init();
    }
    // 고객ID, 고객 이름을 전달 받아서 초기화하는 메소드(생성자)
    public Customer(String customerId, String customerNm)
    {
        this.customerId = customerId;
        this.customerNm = customerNm;
        init();
    }
    public void init()
    {
        customerGr     = "SILVER";
        pointAccumRate = 0.01;
        System.out.println("Customer's init()~");
    }
    
    
    
    /* 메소드   :
     *  1) 금액을 전달 받아서 포인트 적립율 기준으로 포인트 계산후 금액 다시 결과로 반환  
     *      메소드명 : calcPrice()
     *      매개변수명 : price
     *      
     *  2) 고객정보를 결과로 반환
     *      {고객명}님의 등급은 {고객등급} 이고, 보너스 포인트는 {포인트}입니다.
     *      메소드명 : showCustomerInfo
     */
    

    /**  1) 금액을 전달 받아서 포인트 적립율 기준으로 포인트 계산후 금액 다시 결과로 반환  
     *     메소드명 : calcPrice()
     *      매개변수명 : price */
    public int calcPrice(int price)
    {
        point += price*pointAccumRate;
        return point;
    }
    /**  2) 고객정보를 결과로 반환
     *     {고객명}님의 등급은 {고객등급} 이고, 보너스 포인트는 {포인트}입니다.
     *     메소드명 : showCustomerInfo */
    public String showCustomerInfo()
    {
        String rst = customerNm + "님의 등급은 " + customerGr + " 이고, 보너스 포인트는 " + point + "입니다.";
        return rst;
    }
  
    
    
    /**
     * @return the customerId
     */
    public String getCustomerId()
    {
        return customerId;
    }
    
    /**
     * @param customerId the customerId to set
     */
    public void setCustomerId(String customerId)
    {
        this.customerId = customerId;
    }

    /**
     * @return the customerNm
     */
    public String getCustomerNm()
    {
        return customerNm;
    }

    /**
     * @param customerNm the customerNm to set
     */
    public void setCustomerNm(String customerNm)
    {
        this.customerNm = customerNm;
    }

    /**
     * @return the customerGr
     */
    public String getCustomerGr()
    {
        return customerGr;
    }

    /**
     * @param customerGr the customerGr to set
     */
    public void setCustomerGr(String customerGr)
    {
        this.customerGr = customerGr;
    }

    /**
     * @return the point
     */
    public int getPoint()
    {
        return point;
    }

    /**
     * @param point the point to set
     */
    public void setPoint(int point)
    {
        this.point = point;
    }

    /**
     * @return the pointAccumRate
     */
    public double getPointAccumRate()
    {
        return pointAccumRate;
    }

    /**
     * @param pointAccumRate the pointAccumRate to set
     */
    public void setPointAccumRate(double pointAccumRate)
    {
        this.pointAccumRate = pointAccumRate;
    }
    
}
