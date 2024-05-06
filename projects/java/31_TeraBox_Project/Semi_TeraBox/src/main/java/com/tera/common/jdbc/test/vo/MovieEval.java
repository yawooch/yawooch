package com.tera.common.jdbc.test.vo;

import java.util.Date;

public class MovieEval
{
    private String ticketNo;              //예매번호                                           TICKET_NO
    private int    evalPoint;             //평가점수                                           EVAL_POINT
    private String evalComment;           //평가설명                                           EVAL_COMMENT
    private Date   evalRegDttm;           //평가등록일                                         EVAL_REG_DTTM
    private String viwPntContent;         //관람포인트(연출  / 스토리 / 영상미 / 배우 / OST)   VIW_PNT_CONTENT
    private String movieNo;               //영화번호                                           MOVIE_NO
}