<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
    <link rel="stylesheet" href="${path}/views/common/css/log.css">
    <main>
        <section class="cm-loginform">
            <!-- 로그인창 -->
            <div class="cm-login-box-out">   
                <!--로그인창 헤더  -->
                <div class="cm-layer-header">
                    <h4>로그인</h4>
                    <button type="button" class="cm-login-close-btn"></button>
                </div>
                <!-- 로그인창 내부 테두리 -->
                <div class="cm-login-box-inner">
                    <!-- 왼쪽 -->
                    <!-- ID/PW 입력 -->
                    <div class="cm-col-left">
                        <div class="cm-id-intput-area">
                            <!-- 아이디 -->
                            <input type="text" class="cm-input-text" id="cm_id" autocomplete="off" required placeholder="로그인" maxlength="20">
                            <!-- 비밀번호 -->
                            <input type="password" class="cm-input-text" id="cm_pw" autocomplete="off" required placeholder="비밀번호" maxlength="20">
                            <!-- 아이디저장  -->
                            <div class="cm-ckboxline">
                                <input id="cm_ckidsave" type="checkbox">
                                <label for="ckidsave">아이디 저장</label>
                            </div>
                            <div class="cm-btn-area">
                                <button type="submit" id="cm_btnlogin" class="cm-btnred" disabled="disabled">로그인</button>
                            </div>
                        </div>
                    </div>
                    <!-- 오른쪽 -->
                    <!-- 배너광고 -->
                    <div class="cm-col-right">
                        <div class="cm-login-ad">
                            <a href="https://direct.hi.co.kr/service.do?m=3293e8e708&HDMS1=banner&HDMS2=megabox&HDMS3=%EB%A1%9C%EA%B7%B8%EC%9D%B8%ED%8C%9D%EC%97%85
                                    _%EC%9A%B0%EC%B8%A1&HDMS4=%EC%A3%BC%ED%96%89%EA%B1%B0%EB%A6%AC_%ED%99%94%EC%9D%B4%ED%8A%B8&utm_source=megabox&utm_medium=display&utm
                                    _campaign=%EB%A1%9C%EA%B7%B8%EC%9D%B8%ED%8C%9D%EC%97%85_%EC%9A%B0%EC%B8%A1&utm_content=%EC%A3%BC%ED%96%89%EA%B1%B0%EB%A6%AC_%ED%99%94%EC%9D%B4%ED%8A%B8">       
                                <img id="cm_banner" src="https://mlink-cdn.netinsight.co.kr/2023/07/03/c4dd80cdcc9039419686f47cf702d96c.png" alt="테라박스 현대해상">
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
    
