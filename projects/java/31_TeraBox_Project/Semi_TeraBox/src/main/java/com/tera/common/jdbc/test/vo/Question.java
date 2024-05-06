package com.tera.common.jdbc.test.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@RequiredArgsConstructor
public class Question

{
	
    private String questNo;                //문의번호                         QUEST_NO
    private String questTitle;             //문의제목                         QUEST_TITLE
    private String questContent;           //문의내용                         QUEST_CONTENT
    private String questPassNo;            //문의글비밀번호                   QUEST_PASS_NO
    private String questPhone;             //휴대전화번호                     QUEST_PHONE
    private String questName;              //이름                             QUEST_NAME
    private String questDivision;          //문의구분(분실물 / 일대일 / 대관) QUEST_DIVISION
    private String questEmail;             //분실물문의용컬럼                 QUEST_EMAIL
    private String questType;              //일대일문의용컬럼                 QUEST_TYPE
    private String pictrFile;              //일대일문의용컬럼                 PICTR_FILE
    private int    visitNum;               //대관문의용컬럼                   VISIT_NUM
    private String rentalDate;             //대관일(대관문의용컬럼)           RENTAL_Date
    private String rentalTime;             //대관시간(대관문의용)             RENTAL_TIME
    private String memberId;               //등록아이디                       MEMBER_ID
    private String lostCinemaId;           //극장아이디                       LOST_CINEMA_ID
    private String cinemaId;               //극장아이디                       CINEMA_ID
    private String answContent;            //답변내용                         ANSW_CONTENT
    private Date   answRegDttm;            //답변등록일시                     ANSW_REG_DTTM
    private String answMemberId;           //답변아이디                       ANSW_MEMBER_ID
}