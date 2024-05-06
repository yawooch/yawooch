package com.tera.common.jdbc.test.vo;

import java.util.Date;

public class TimeTable
{
    private String scrnNo;           //상영시간표번호      SCRN_NO
    private Date   scrnStrDttm;      //상영시작일시        SCRN_STR_DTTM
    private String movieNo;          //영화번호            MOVIE_NO
    private String theaterNo;        //상영관번호          THEATER_NO
    private Date   scrnEndDttm;      //상영종료일시        SCRN_END_DTTM
    private String discountDv;       //할인구분(조조/심야) DISCOUNT_DV
}