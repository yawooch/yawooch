package com.tera.cinema.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cinema {
	private String cinemaId       ; /* 극장개점일 */
	private String cinemaArea     ; /* 극장지점명 */
	private String cinemaName     ; /* 극장지역 */
	private String cinemaOpenDate ; /* 극장아이디 */
}
