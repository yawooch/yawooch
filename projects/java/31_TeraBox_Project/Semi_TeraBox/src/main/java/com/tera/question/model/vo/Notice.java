package com.tera.question.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Notice {
	private String noticeNo;	// 공지번호
	
	private String noticeTitle;	// 공지제목
	
	private String noticeContent;	// 공지 내용
	
	private String noticeType;	// 공지 구분
	
	private Date noticeRegDate;	// 공지등록일
	
	private String cinemaId;	// 극장아이디
	
	private String cinemaArea;	// 극장 
}
