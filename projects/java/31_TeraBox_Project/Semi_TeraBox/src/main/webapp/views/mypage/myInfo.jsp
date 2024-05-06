<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
    <link rel="stylesheet" href="${path}/views/mypage/css/myinfo.css">    
	<jsp:include page="/views/common/header.jsp" />
    <script src="${path}/js/bookingSeat2.js"></script>    
    <main style="height: 100%;">
    <!-- body중 메뉴바 -->
    <div style="width: 100%; background-color: #f8f8fa;">
        <section style="width: 1100px; margin: 0 auto;">
            <div class="mp-page-util">
                <div class="mp-inner-wrap">
                    <div class="mp-location">
                        <span>home</span>
                        <a href="${path}/mypage" title="마이페이지">
                            나의 테라박스
                        </a>
                        <a href="${path}/mypage" title="나의 예매 내역">회원 정보 수정</a>
                    </div>
                </div>
            </div>    
        </section>
        </div>
        <!-- 왼쪽 메뉴바 -->
        <section class="mp-section">
            <div class="mp-body">
                <div class="mp-left-box">
                    <div class="mp-tera-box">
                        <a href="javascript:void(0);">나의 테라박스</a>
                    </div>
                    <div class="mp-ticketing">
                        <a href="${path}/mypage">나의 예매 내역</a>
                    </div>
                    <div class="mp-question">
                        <a href="${path}/mypage/question">나의 문의 내역</a>
                    </div>
                    <div class="mp-member">
                        <a href="${path}/mypage/myinfo">회원 정보 수정 <img src="${ path }/views/mypage/img/arrow.png" alt="화살표"></a>
                    </div>
                </div>
                
                <!-- 오른쪽 구역  -->
                <div class="mp-right">
                    <h2>회원 정보 수정</h2>
                    <div class="mp-pwd-box">
                        <strong>회원님의 개인정보 보호를 위해 비밀번호를 인증해주세요.</strong>
                        <div class="mp-inner-box">
                            <div class="mp-lb-box">
                                <label for="ip_text">비밀번호</label>
                            </div>
                            <div class="mp-ip-box">
                                <input type="text" id="ip_text" name="ip_text">
                            </div>
                        </div>
                    </div>
                    <div class="mp-btn1-box">
                        <button class="mp-btn1">확인</button>
                    </div>
                </div>
            </div>
        </section>
        </main>
<jsp:include page="/views/common/footer.jsp" />

