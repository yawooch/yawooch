package com.kh.classes.object;

public class Bus extends Vehicle
{
    /*
     * 추상화과정
     * [1] 필요한 데이터 나열
     * 
     * 탑승인원 
     * 버스번호
     * 차량번호
     * 버스종류
     * 버스색상
     * 가격
     * usb충전여부
     * 배차간격
     * 승객수표시
     * 출입문열기()
     * 출입문닫기()
     * 움직이기()
     * 경적을울린다()
     * 현재위치조회()
     * 
     * [2] 불필요한 정보제거
     * usb충전여부
     * 버스색상
     * 차량번호
     * 승객수표시
     * 출입문열기()
     * 출입문닫기()
     * 
     * [3] 변수 및 메소드 정의 
     */
    int passengerNumber;      //탑승인원
    private String busNumber; //버스번호
    String kind;              //차종
    int interval;             //배차간격
//    String melody = "빵빵";   // 경적소리
//    boolean isMove;           // 주행상태
    
    //busNumber 캡슐화
    public String getBusNumber()
    {
        return busNumber;
    }
    public void setBusNumber(String busNumber)
    {
        this.busNumber = busNumber;
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
//    /** 현재위치조회() 
//     *  결과값없이 출력만 => 반환형 : void */
//    public void getCurrLocation()
//    {
//        System.out.println("현재 위치는 종로입니다.");
//    }
}
