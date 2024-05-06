package com.tera.movie.model.vo;


import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class MovieComment {

	private String ticketNo;
	private int rowNum;
	private int score;
	private String comment;
	private Date createDate;
	private String point;
	private int movieNo;
}
