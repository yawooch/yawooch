package com.tera.question.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class Question {

	private String no;    //문의번호
	private String title; //문의제목
	private String content;//문의내용
	private int    passNo; //문의글비밀번호
	private String phone;  //휴대전화번호
	private String name;   //이름
	private String division;//문의구문(분실물/일대일/대관)
	private String email;  //이메일
	private String type;   //문의유형
	private String file;  // 첨부파일
	private int num;       // 대관인원
	private String rentDate;  //극장대관일
	private String rentTime;  //극장 대관시간
	private String id;         //등록한 아이디 
	private String check;      //답변등록확인
	private String cinemaId;    //극장아이디
	private String answContent;  //답변내용
	private Date answRegDttm;    //답변등록일시
	private String answMemberId;   //답변아이디 
	private String questMoive;    //영화이름
	private String lostPlace;    //분실장소
	private String delYn;
	

}
