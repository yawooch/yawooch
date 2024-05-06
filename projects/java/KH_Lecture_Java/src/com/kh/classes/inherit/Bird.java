package com.kh.classes.inherit;

public class Bird extends Animal
{
    /*
     * 변수: (7) = 
     *       (3) featherCount,type, maxHeight
     *       (4) eatType , crySound , color , isDanger
     * 기능  (3) = setCrySound , eatenFood , showDanger
     */
    
    //데이터 : 부리, 날개, 깃털개수, 번식종류, 잡식
    //기능 : 날아다닌다 어느 높이까지 날수있는가
    
    //제거 항목 : 부리, 날개 , 잡식, 날아다닌다
    
    int featherCount; //깃털개수
    String type;      //번식종류
    double maxHeight; //최대높이
    
    //날수 있는 최대 높이(최대 높이 값을 전달)
    public double getMaxHeight()
    {
        return maxHeight;
    }
    
    // 새의색상을 출력하는 기능(printColor)
    // Animal 멤버변수 사용: color
    public void printColor()
    {
        System.out.println("이 조류의 색상은 " + color + "입니다.");
    }
    
    
    // 울음소리를 출력하는데 값이 없을경우 "짹짹"이라고 출력
    // 메소드명 : setCrySound
    public void setCrySound(String crySound)
    {
        if(crySound == null || crySound.isEmpty())
        {
            this.crySound = "짹짹";
        }
        else
        {
            super.setCrySound(crySound);
        }
    }
}
