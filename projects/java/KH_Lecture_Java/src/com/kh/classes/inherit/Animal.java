package com.kh.classes.inherit;

//부모클래스
public class Animal
{
    /*
     * 추상화과정
     * [1]
     * 식성(육식, 초식, 잡식)
     * 털 유/무
     * 보행타입(이족/사족/??)
     * 울음소리
     * 색상
     * 위험성
     * 서식지
     * 운다
     * 먹는다
     * 싼다
     * 잔다
     * 걷는다
     * 죽인다
     * 찢는다
     * 
     *  [2] 
     *  털유/무
     * 찢는다
     * 죽인다
     * 싼다
     * 서식지
     * 잔다
     * 보행타입
     *  [3] 변수와 메소드 정의
     */
    String eatType;           // 식성(육식/잡식/초식)
    String crySound;          // 울음소리
    String color;             // 색상
    boolean isDanger;         // 위험여부 (T: 위험하다, F : 안전하다)
    
    //운다, 먹는다, 걷는다
    //메소드 정의
    /*
     * 접근제한자 [예약어] 반환형 메소드명(매개변수, ...){}
     */
    //[1] 울음소리를 전달받아서 출력하는 기능(전달받은 값은 멤버 변수에 저장)
    //전달받은 값이 없을경우(빈 값) 기본값으로 "ㅜ_ㅜ"출력
    public void setCrySound(String crySound)
    {
        if(crySound == null || crySound.isEmpty())
        {
            this.crySound = "T_T";
        }
        else
        {
            this.crySound = crySound;
        }
    }
    //[1`] 울음소리를 출력
    public void showCrySound()
    {
        System.out.println(this.crySound);
    }
    
    
    //[2] 먹은음식(무엇이든) 전달받아서"{전달받은임식} 먹었습니다" 라고 출력
    public void eatenFood(String food)
    {
        System.out.println(food + " 먹었습니다");
    }
    
    //[3] 위험여부를 결과로 돌려주는 기능
    public String showDanger()
    {
        //위험여부 (T: 위험하다, F : 안전하다)
        return (isDanger)?"위험":"안전";
    }
}
