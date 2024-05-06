package com.tera.ticket.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Ticket {
	private String ticketNo;  // 예매 번호
	
	private String meberId2;  // 멤버 아이디
	
	private String scrnNo;    // 상영 시간표 번호
	
	private String ticketDV;  //예매자 구분
	
	private String seatNo;    //좌석번호
	
	private Date ticketCnclDttm;	//예매취소일시
	
	
}
