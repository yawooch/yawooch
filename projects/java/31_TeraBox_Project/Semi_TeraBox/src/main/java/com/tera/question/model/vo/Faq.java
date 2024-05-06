package com.tera.question.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Faq {
	private String faqNo;	// 문의번호
	
	private String faqTitle;	//문의제목
	
	private String faqContent;	//문의내용
		
	private String faqCategory;		//문의필드
	
	private String memberId;	//멤버아이디
}
