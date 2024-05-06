package com.tera.member.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor //모든인자가들어가는 생성자
@NoArgsConstructor  //인자가없는생성자

public class Member {
	
	private String memberId;
	
	private String password;
	
	private String memberName;
	
	private String birth;
	
	private String memPhone;
	
	private String memEmail;
	
	private String memSsn;
	
	private String mktAgreeYn;
	
	private String bnftsMedia;
	
	private String managerYn;
	
	private Date   joinDttm;
}
