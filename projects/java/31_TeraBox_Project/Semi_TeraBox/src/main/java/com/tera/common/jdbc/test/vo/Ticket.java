package com.tera.common.jdbc.test.vo;

import java.util.Date;

public class Ticket
{
    private String ticketNo;           //예매번호                                 TICKET_NO
    private String memberId2;          //멤버아이디                               MEMBER_ID2
    private String scrnNo;             //상영시간표번호                           SCRN_NO
    private String ticketDv;           //예매자구분(성인/ 장애인 / 우대 / 청소년) TICKET_DV
    private String seatNo;             //좌석번호(ex) A열1번)                     SEAT_NO
    private Date   ticketCnclDttm;     //예매취소일시                             TICKET_CNCL_DTTM
}