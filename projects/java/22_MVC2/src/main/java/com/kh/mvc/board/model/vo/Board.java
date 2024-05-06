package com.kh.mvc.board.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Board
{
//    private int    no               ;  //게시글번호
//    private int    writerNo         ;  //게시글작성자
//    private String title            ;  //게시글제목
//    private String content          ;  //게시글내용
//    private String originalFilename ;  //첨부파일원래이름
//    private String renamedFilename  ;  //첨부파일변경이름
//    private int    readcount        ;  //조회수
//    private String status           ;  //상태값(Y/N)
//    private Date   createDate       ;  //게시글올린날짜
//    private Date   modifyDate       ;  //게시글수정날짜
    private int rowNum;
    private int writerNo;
    private String writerId;
    private String title;
    private String content;
    private String originalFilename;
    private String renamedFilename;
    private int readCount;
    private String status;
    private Date createDate;
    private Date modifyDate;
}
