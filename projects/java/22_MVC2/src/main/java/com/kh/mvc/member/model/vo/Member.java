package com.kh.mvc.member.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member
{
    private int    no;           //회원번호
    private String id;           //회원아이디
    private String password;     //회원비밀번호
    private String role;         //회원타입
    private String name;         //회원명
    private String phone;        //전화번호
    private String email;        //이메일
    private String address;      //주소
    private String hobby;        //취미
    private String status;       //상태값(Y/N)
    private Date   enrollDate;   //회원가입일
    private Date   modifyDate;   //정보수정일
}
