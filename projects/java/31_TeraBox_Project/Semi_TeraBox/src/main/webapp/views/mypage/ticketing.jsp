<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head> 
    <meta charset="UTF-8">
    <link rel="icon" href="${path}/views/question/img/TeraBox.ico">
    <title>LIFE THEATER, 테라박스</title>
    <link rel="stylesheet" href="${ path }/views/mypage/css/Ticketing.css">
    <jsp:include page="/views/common/header.jsp" />
<body>
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
                    <a href="${path}/mypage" title="나의 예매 내역">나의 예매 내역</a>
                </div>
            </div>
        </div>    
    </section>
    </div>
    <main style="width: 1100px; margin: 0 auto; overflow: auto;">
        <div class="mp-div">
        <!-- 왼쪽 메뉴바  -->
        <section class="mp-section">
            <div class="mp-body-all">
                <div class="mp-left-box">
                    <div class="mp-tera-box">
                        <a href="javascript:void(0);">나의 테라박스</a>
                    </div>
                    <div class="mp-ticketing">
                        <a href="${path}/mypage">나의 예매 내역  <img src="${path}/views/mypage/img/arrow.png" alt="화살표"></a>
                    </div>
                    <div class="mp-question">
                        <a href="${path}/mypage/question">나의 문의 내역</a>
                    </div>
                    <div class="mp-member">
                        <a href="${path}/mypage/myinfo">회원 정보 수정</a>
                    </div>
                    <!-- 클릭! 화살표 표시 한다!  -->
                </div>
                <div class="mp-right-box mp-section">
                <h2>나의 예매 내역 </h2>
                <div class="mp-box1">
                    <table>
                        <th>구분</th>
                        <td>
                            <input type="radio" id="mp_now" name="mp_list" value="mp_now" checked="checked">
                            <label for="mp_now" class="mp-now">예매내역</label>
                            <input type="radio" id="mp_before" name="mp_list" value="mp_before">
                            <label for="mp_before" class="mp-before">지난내역</label>
                            <!-- 지난 내역 체크했을 때 select box disabled 빼기  -->
                            <div class="mp-dropDown-box">
                                <select class="mp-dropDown" name="mp-dropDown" id="mp_dropDown" disabled>
                                    <option name="202401" >2024년 1월</option>
                                    <option name="202312" >2023년 12월</option>
                                    <option name="202311" >2023년 11월</option>
                                    <option name="202310" >2023년 10월</option>
                                    <option name="202309" >2023년 9월</option>
                                    <option name="202308" >2023년 8월</option>
                                    <option name="202307" >2023년 7월</option>
                                    <option name="202306" >2023년 6월</option>
                                    <option name="202305" >2023년 5월</option>
                                    <option name="202304" >2023년 4월</option>
                                    <option name="202303" >2023년 3월</option>
                                    <option name="202302" >2023년 2월</option>
                                </select>
                            </div>
                            <button type="button" class="mp-dropDown-btn" ><div>&nbsp; &nbsp; 조회</div></button>
                        </td>
                    </table>
                </div>
                <div class="mp-status">
                    <!--  예매 내역 시작  -->
                    <p class="mp-small-tit">
                        총 <span>1</span>건
                    </p>

                    <div class="mp-round">  
                        <a href="영화상세페이지로..?">
                            <img src="${ path }/views/mypage/img/movie.jpg" alt="movie">
                        </a>            
                        <div class="mp-round-right">
                            <table>
                                <colgroup>
                                    <col style="width:75px;">
                                    <col style="width:150px;">
                                    <col style="width:80px;">
                                    <col>
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row" class="mp-th">예매번호</th>
                                        <td colspan="3">
                                            <p class="mp-num" style="color: #AF2D2D;">9334-392-32052</p>	
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="mp-th">영화명</th>
                                        <td colspan="3" class="mp-td">
                                            <span mp-movie>서울의 봄</span>
                                            <span>2D</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="mp-th">극장/상영관</th>
                                        <td colspan="3" class="mp-td">이수 / 2관</td>
                                        <th scope="row">관람인원</th>
                                        <td class="mp-td">성인 1명</td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="mp-th">관람일시</th>
                                        <td colspan="3" class="mp-td">
                                            2023.05.24 (수) 15:40
                                        </td>
                                        <th scope="row">관람좌석</th>
                                        <td class="mp-td">M열 9</td>
                                    </tr>
                                </tbody>
                            </table>
                            <button class="mp-cancel-btn">예매 취소 </button>
                        </div>
                    </div>
                    <div class="cancel-tit">예약취소내역 </div>
                    <p class="cancel-tit2">&#183; 상영일 기준 7일간 취소내역을 확인하실 수 있습니다.</p>
                </div>
                <div class="cancel-table">
                    <table class="board-list" summary="취소일시, 영화명, 극장, 상영일시, 취소금액 항목을 가진 취소내역 목록 표">
                        <colgroup>
                            <col style="width:160px;">
                            <col>
                            <col style="width:130px;">
                            <col style="width:188px;">
                        </colgroup>
                        <thead>
                            <tr>
                                <th scope="col">취소일시</th>
                                <th scope="col">영화명</th>
                                <th scope="col">극장</th>
                                <th scope="col">상영일시</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                            <td class="cancel-td">2023.12.27</td>
                            <td class="cancel-td">서울의 봄</td>
                            <td class="cancel-td">이수</td>
                            <td class="cancel-td">2023.12.28</td>
                        </tr>
                    </tbody>
                    </table>
                </div>
                <div class="cancel-page-div">
                    <button class="cancel-page"> 1 </button>
                </div>
                <button type="button" class="btn-toggle">
                        이용안내
                    <img src="${path}/views/mypage/img/ico-arr-toggle-down.png" alt="화살표">
                </button>
                <!-- 토클로 보이게 안보이게 하기 -->
                <div class="mp-count">
                    <strong>[예매 안내]</strong>
                    <ul class="dot-list">
                        <li>만 4세(48개월) 이상부터는 영화티켓을 반드시 구매하셔야 입장 가능합니다.</li>
                        <li>예매 변경은 불가능하며, 취소 후 재 예매를 하셔야만 합니다.</li>
                        <li>메가박스 모바일앱을 이용할 경우 티켓출력없이 모바일티켓을 통해 바로 입장하실 수 있습니다.</li>
                    </ul>
                    <strong>[티켓교환 안내]</strong>
                    <ul class="dot-list">
                        <li>극장의 무인발권기(KIOSK)를 통해 예매번호 또는 고객확인번호(생년월일+휴대폰번호)를 입력하여 편리하게 티켓을 발권하실 수 있습니다.</li>
                        <li>무인발권기 이용이 어려우신경우, 티켓교환권을 출력하여 매표소에 방문하시면 티켓을 발권하실 수 있습니다.</li>
                        <li>(티켓교환권 출력이 어려운경우 예매번호와 신분증을 지참하여 매표소에 방문하시면 티켓을 발권하실 수 있습니다)</li>
                    </ul>
                    <strong>[예매취소 안내]</strong>
                    <ul class="dot-list">
                        <li>온라인(홈페이지/모바일) 예매 취소는 상영시간 20분전까지 입니다.</li>
                        <li>위탁 예매 사이트 이용 시 취소 및 환불 규정은 해당 사이트 규정을 따릅니다.</li>
                        <li>LIVE 공연 콘텐트는 취소 기준은 아래와 같습니다.
                            <ul class="dash-list">
                                <li class="dash-li">&nbsp;관람 4일전 : 취소 가능</li>
                                <li class="dash-li">&nbsp;관람 3일 ~ 1일전 : 취소 수수료 부담 후 취소 가능</li>
                                <li class="dash-li">&nbsp;관람 당일 : 취소 및 환불 불가</li>
                            </ul>
                        </li>
                        <li>공연 관람시 시작 시간 이후에는 입장이 제한 됩니다.</li>
                        <li>발권된 티켓은 상영시간 전까지 현장 방문 시에만 취소가 가능합니다.</li>
                    </ul>
                </div>
            </div>
            </div>
        </div>
        </section>
        </div>
    </main>
<jsp:include page="/views/common/footer.jsp" />