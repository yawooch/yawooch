package com.kh.mvc.finance.model.vo;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Finance {
    private int financeId;        // 가계부 ID
    private String memberId;      // 사용자 ID
    private Date financeDate;     // 날짜
    private String category;      // 카테고리 (수입/지출)
    private String subCategory;   // 세부카테고리 (식비, 교통비 등)
    private int amount;           // 금액
    private String memo;          // 메모
    private Date createDate;      // 생성일
    private Date modifyDate;      // 수정일
    private String memoryId;      // Memory 객체와 연동할 ID
} 