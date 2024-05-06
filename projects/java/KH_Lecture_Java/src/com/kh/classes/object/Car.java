package com.kh.classes.object;

public class Car extends Vehicle
{
    /*
     * 추상화과정 [1] 필요한 데이터 나열
     * 
     * 바퀴수 지붕 : 오픈/ 주유방식 : 기름/전기 기어방식 : 수동/오토 날개 달린다() 멈춘다() 후진한다() 노래를재생한다() 라이트를켠다
     * 
     * [2] 불필요한 정보제거 날개 노래를재생한다() [3] 변수 및 메소드 정의
     * 
     * int wheels; boolean loop; String gasMethod; String gearMethod; public String
     * drive(){} public String stop(){} public String goBack(){}
     * 
     */
//    private int wheels;         // 바퀴수
//    boolean roop;               // 지붕 : 오픈 / 안오픈
//    private String gasMethod;   // 주유방식 : 기름/전기
//    private String gearMethod;  // 기어방식 : 수동/오토
//    
//    /** 바퀴수 getter */
//    public int getWheels()
//    {
//        return wheels;
//    }
//    /** 바퀴수 setter */
//    public void setWheels(int wheels)
//    {
//        this.wheels = wheels;
//    }
//    /** 지붕 getter */
//    public boolean isLoop()
//    {
//        return roop;
//    }
//    /** 지붕 setter */
//    public void setLoop(boolean loop)
//    {
//        this.roop = loop;
//    }
//    /** 주유방식 getter */
//    public String getGasMethod()
//    {
//        return gasMethod;
//    }
//    /** 주유방식 setter */
//    public void setGasMethod(String gasMethod)
//    {
//        this.gasMethod = gasMethod;
//    }
//    /** 기어방식 getter */
//    public String getGearMethod()
//    {
//        return gearMethod;
//    }
//    /** 바기어방식퀴수 setter */
//    public void setGearMethod(String gearMethod)
//    {
//        this.gearMethod = gearMethod;
//    }
//    // 달린다()
//    public void drive()
//    {
//        
//    }    
//    // 멈춘다()
//    public void stop()
//    {
//        
//    }      
//    // 후진한다()
//    public void goBack()
//    {
//        
//    }
    /*
     * 추상화과정 [1] 필요한 데이터 나열
     * 
     * [2] 불필요한 정보제거 [3] 변수 및 메소드 정의 public void move(){//움직이고 있다고 출력} public void
     * setMelody(String Melody){//경적소리를 설정} public void singingBell(){//경적소리를 출력}
     * public void stop(){//멈췄다고 출력}
     * 
     */
    private String number; // 차량번호
    boolean isRoof; // 지붕유무
    String fuelEff; // 연비
    String geearMethod; // 기어방식
    String kind; // 차종
    String color; // 색상
    private int price; // 가격
//    String melody = "빵빵"; // 경적소리
//    boolean isMove; // 주행상태

    public Car()
    {
        super();
    }
    
    // number , price : private 변수 => 캡슐화 필요
    public String getNumber()
    {
        return number;
    }

    public void setNumber(String number)
    {
        this.number = number;
    }

    public void setPrice(int price)
    {
        this.price = price;
    }

    public int getPrice()
    {
        return price;
    }
//    /** 움직이고 있다고 출력 */
//    public void move()
//    {
//        // 주행중 : true
//        isMove = true;
//    }
//
//    /** 멈췄다고 출력 */
//    public void stop()
//    {
//        // 정지 : false
//        isMove = false;
//    }
//
//    /** 주행상태 출력 및 주행상태 반환 */
//    public boolean checkMove()
//    {
//        if(isMove)
//        {
//            System.out.println("주행중 입니다.");
//        }
//        else
//        {
//            System.out.println("멈춘상태 입니다.");
//        }
//        
//        return isMove;
//    }
//    /** 경적소리를 설정 */
//    public void setMelody(String melody)
//    {
//        this.melody = melody;
//    }
//
//    /** 경적소리를 출력 */
//    public void singingBell()
//    {
//        System.out.println(melody);
//    }
}
