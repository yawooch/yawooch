package com.kh.security.member.model.vo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
public class Member implements UserDetails
{
    private static final long serialVersionUID = -4376331380920772259L;

    private int no;

    @NonNull
    private String id;

    @NonNull
    private String password;

    private String role;

    @NonNull
    private String name;

    private String phone;

    private String email;

    private String address;

    private String hobby;

    private String status;

    private Date enrollDate;

    private Date modifyDate;

    @Override
    public String getUsername()
    {
        return this.id;
    }
    
    @Override
    public String getPassword() {
        return this.password;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities()
    {
        List<GrantedAuthority> authorities = new ArrayList<>();
        
        authorities.add(new SimpleGrantedAuthority(this.role));
        
        return authorities;
    }

    //계정이 만료되었는지를 반환하는 메소드
    @Override
    public boolean isAccountNonExpired()
    {
        return true;//계정의 만료여부
    }

    //계정 잠김 여부를 반환하는 메소드
    @Override
    public boolean isAccountNonLocked()
    {
        return true;
    }

    //패스워드 만료여부를 반환하는 메소드
    @Override
    public boolean isCredentialsNonExpired()
    {
        return true;
    }

    //계정 활성 여부
    @Override
    public boolean isEnabled()
    {
        return this.status.equals("Y");
    }
    
}
