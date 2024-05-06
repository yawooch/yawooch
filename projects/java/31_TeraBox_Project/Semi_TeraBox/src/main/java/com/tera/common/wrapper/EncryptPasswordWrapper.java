package com.tera.common.wrapper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import com.tera.common.util.EncryptUtil;

public class EncryptPasswordWrapper extends HttpServletRequestWrapper
{

    public EncryptPasswordWrapper(HttpServletRequest request)
    {
        super(request);
    }

    //HttpServletRequest에서 재정의 하고 싶은 메소드를 작성한다.
    @Override
    public String getParameter(String name)
    {
        // 클라이언트가 전달하는 값 중에 userPwd 값만
        // 암호화 처리하여 반환한다
        if(name.equals("userPwd")) {
            return EncryptUtil.oneWayEnc(super.getParameter(name), "SHA-256");
        }
        
        return super.getParameter(name);
    }
    
    
}