package com.tera.ticket.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TimeTable {
	private String scrnNo;       /* 상영번호 */
	private String scrnStrDt;  /* 상영시작일 */
	private String scrnStrDttm;  /* 상영시작시간 */
	private String scrnEndDttm;  /* 상영종료시간 */
	private String movieNo;      /* 영화번호 */
	private String mvKorName;    /* 영화제목 */
	private String theaterNo;    /* 상영관번호 */
	private String theaterName;  /* 상영관이름 */
	private String cinemaId;     /* 극장아이디 */
	private String cinemaName;   /* 극장이름 */
	private String discountDv;   /* 할인여부(조조/심야) */
}
