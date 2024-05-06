package com.tera.cinema.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Theater {
	private String theaterNo;     /* 상영관번호 */
	private String cinemaId;      /* 극장아이디 */
	private String theaterType;   /* 상영관타입 */
	private String specialYn;     /* 특별관여부 */
	private String videoQuality;  /* 상영화질 */
}
