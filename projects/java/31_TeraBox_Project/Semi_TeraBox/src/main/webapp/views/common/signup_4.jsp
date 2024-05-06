<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
    <link rel="stylesheet" href="${path}/views/common/css/signup_4.css">
    
 <main>

    <section class="signup4">
    <form action="/">
        <div class="member-wrap">
            <!-- 로고 -->
            <div class="logo"><a href="https://megabox.co.kr/main" id="logo">Megabox lifetheather</a>
            </div>
            <!-- 상단바 -->
            <div class="col-wrap">
                <!--step1 본인인증, step2 약관동의, step3 정보입력, step4 가입완료 
                    단계 중 step3 본인인증 단계-->
                <div class="step-member">
                    <ol>
                        <li>
                            <p class="step">
                                <span>STEP1.본인인증</span>
                            </p>
                        </li>
                        <li>
                            <p class="step">
                                <span>STEP2.약관동의</span>
                            </p>
                        </li>
                        <li>
                            <p class="step">
                                <span>STEP3.정보입력</span>
                            </p>
                        </li>
                        <li>
                            <p class="step on">
                                <span>STEP4.가입완료</span>
                            </p>
                        </li>
                    </ol>
                </div>
                <!-- 회원가입 완료 -->
                <div class="join-complete">
                    <i class="icon-complete"></i>
                    <p class="name">${member.memberName}님 테라박스 가입을 환영합니다.</p>
                    <p class="txt">확인을 누르시면 메인페이지로 이동합니다.</p>
                </div>
                <!-- 신규혜택 버튼 -->
                <div class="agree-btn-bottom">
                    <button id="btnagreebottom" type="submit" class="button red">확인</button>
                    <!-- <a href="/"><button id="btnagreebottom" type="submit" class="button red">확인</button></a>  -->
                </div>
            </div>
        </div>
        </form>
    </section>
</main>