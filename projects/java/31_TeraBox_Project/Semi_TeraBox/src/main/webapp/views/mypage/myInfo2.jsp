<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
    <link rel="stylesheet" href="./css/myInfo2.css">
<jsp:include page="/views/common/header.jsp" />
    <main>
    <!-- body중 메뉴바 -->
    <div style="width: 100%; background-color: #f8f8fa;">
        <section style="width: 1100px; margin: 0 auto;">
            <div class="mp-page-util">
                <div class="mp-inner-wrap">
                    <div class="mp-location">
                        <span>home</span>
                        <a href="javascript:void(0);" title="마이페이지">
                            나의 테라박스
                        </a>
                        <a href="javascript:void(0);" title="나의 예매 내역">회원 정보 수정</a>
                    </div>
                </div>
            </div>    
        </section>
    </div>
    < <!-- 왼쪽 메뉴바 -->
    <section class="mp-section">
        <div class="mp-body">
            <div class="mp-left-box">
                <div class="mp-tera-box">
                    <a href="javascript:void(0);">나의 테라박스</a>
                </div>
                <div class="mp-ticketing">
                    <a href="javascript:void(0);">나의 예매 내역</a>
                </div>
                <div class="mp-question">
                    <a href="javascript:void(0);">나의 문의 내역</a>
                </div>
                <div class="mp-member">
                    <a href="javascript:void(0);">회원 정보 수정 <img src="./img/arrow.png" alt="화살표"></a>
                </div>
            </div>
            
            <!-- 오른쪽 구역  -->
            <div class="mp-right">
                <h2>회원 정보 수정</h2>
                <ul class="right-ul">
                    <li>회원님의 정보를 정확히 입력해주세요.</li>
                </ul>
                <div class="tb-wrap">
                    <table>
                        <colgroup>
                            <col style="width:180px;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row" class="tb-th">아이디</th>
                                <td class="tb-td">ismoon <span><button class="tb-btn1">회원탈퇴</button></span></td>
                            </tr>
                    </table>
                </div>
                <div class="mp-tit-box">
                    <h3>기본정보</h3>
                    <p class="mp-pp"><span class="font-orange">* </span>필수</p>
                </div>
                <div class="tb-wrap-box">
                    <table class="mp-tb">
                        <colgroup>
                        <col style="width: 180px;">
                        <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row">이름 <span class="font-orange">*</span></th>
                                <td><input type="text" id="inputName" class="ipt" placeholder="변경할 이름을 입력해 주세요. "></td>
                            </tr>
                            <tr>
                                <th scope="row"> 생년월일 <span class="font-orange">*</span></th>
                                <td><input type="text" id="inputNumber" class="ipt" placeholder="변경할 생년월일을 입력해 주세요. "></td>
                            </tr>
                            <tr>
                                <th scope="row"> 휴대폰 <span class="font-orange">*</span></th>
                                <td><input type="text" id="inputPhone" class="ipt" placeholder="변경할 전화번호를 입력해 주세요. "></td>
                            </tr>
                            <tr>
                                <th scope="row"> 이메일 <span class="font-orange">*</span></th>
                                <td><input type="email" id="inputEmail" class="ipt" placeholder="변경할 이메일을 입력해 주세요. "></td>
                            </tr>
                            <tr>
                                <th scope="row"> 비밀번호 <span class="font-orange">*</span></th>
                                <td><input type="text" id="inputPwd" class="ipt" placeholder="변경할 패스워드를 입력해 주세요. "></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="mp-buttonBox">
                    <button class="mp-button-1">취소</button>
                    <button class="mp-button-2">수정</button>
                </div>
            </div> 
        </div>
    </section>
        </div>
    </main>
<jsp:include page="/views/common/footer.jsp" />
