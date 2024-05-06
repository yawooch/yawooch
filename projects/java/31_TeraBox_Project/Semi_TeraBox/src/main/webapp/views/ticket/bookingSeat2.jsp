<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="${path}/views/question/img/TeraBox.ico">
    <title>LIFE THEATER, 테라박스</title>
    <link rel="stylesheet" href="${path}/views/ticket/css/bookingSeat2.css">
    <jsp:include page="/views/common/header.jsp" />
    <script src="${path}/views/ticket/js/bookingSeat2.js"></script>
    <main>
        <!-- body중 메뉴바 -->
        <section>
            <div class="tk-page-util">
                <div class="tk-inner-wrap">
                    <div class="tk-location">
                        <span>home</span>
                        <a href="javascript:void(0);" title="예매 페이지로 이동">
                            예매
                            </a>
                        <a href="javascript:void(0);" title="빠른예매 페이지로 이동">빠른예매</a>
                    </div>
                </div>
            </div>    
        </section>
    
    <!-- body 왼쪽 좌석 박스으으  -->
    <section>
        <div class="tk-inner-wrap" style="padding-top:40px; padding-bottom:100px;">
            <div class="tk-quick-reserve">
                <h2 class="tk-tit">빠른예매</h2>   
            </div>
            <div class="tk-seat-select-section">
                <div class="tk-seat-section">
                    <div class="tk-tit-util">
                        <h3 class="tk-tit tk-small"> 관람인원선택</h3>
                        <div class="tk-right">
                            <button type="reset" class="tk-button tk-gray-line small" id="seatMemberCntInit">
                                <i class="tk-iconset tk-ico-reset-small"></i> 초기화
                            </button>
                        </div>
                    </div>
                    
                    <div class="tk-seat-area">
                        <div class="tk-seat-count">
                            <div class="tk-cell">
                                <p class="tk-txt">성인</p>
                                <div class="tk-counter-group adult">
                                    <button class="tk-btn-minus tk_btn_minus" id="tk_btn_minus" >-</button>
                                    <div class="tk-counter"><span id="tk_now_adult">0</span></div>
                                    <button class="tk-btn-plus tk_btn_plus" id="tk_btn_plus">+</button>
                                </div>
                            </div>
                            <div class="tk-cell">
                                <p class="tk-txt">청소년</p>
                                <div class="tk-counter-group junior">
                                    <button class="tk-btn-minus tk_btn_minus" id="tk_btn_minus2">-</button>
                                    <div class="tk-counter"><span id="tk_now_junior">0</span></div>
                                    <button class="tk-btn-plus  tk_btn_plus" id="tk_btn_plus2">+</button>
                                </div>
                            </div>
                            <div class="tk-cell">
                                <p class="tk-txt">경로</p>
                                <div class="tk-counter-group senior">
                                    <button class="tk-btn-minus tk_btn_minus" id="tk_btn_minus3">-</button>
                                    <div class="tk-counter"><span id="tk_now_senior">0</span></div>
                                    <button class="tk-btn-plus tk_btn_plus" id="tk_btn_plus3">+</button>
                                </div>
                            </div>
                        </div>
                        <!-- 스크린 안에 좌석 -->
                        <div class="tk-seat-body">
                            <span class="tk-screen-span">    
                                <img src="${path}/views/ticket/img/img-theater-screen.png" alt="screen" class="tk-screen_img">
                            </span>
                            <div class="tk-seat-container">
                                <div class="tk-seat"> 
                                    <div class="tk-line">A</div>
                                    <button class="tk-seat-click" cord="A1">1</button>
                                    <button class="tk-seat-click" cord="A2">2</button>
                                    <button class="tk-seat-click" cord="A3">3</button>
                                    <button class="tk-seat-click" cord="A4" style="margin-right: 23px;">4</button>
                                    <button class="tk-seat-click" cord="A5">5</button>
                                    <button class="tk-seat-click" cord="A6">6</button>
                                    <button class="tk-seat-click" cord="A7">7</button>
                                    <button class="tk-seat-click" cord="A8" style="margin-right: 23px;">8</button>
                                    <button class="tk-seat-click" cord="A9">9</button>
                                    <button class="tk-seat-click" cord="A10">10</button>
                                    <button class="tk-seat-click" cord="A11">11</button>
                                    <button class="tk-seat-click" cord="A12">12</button>
                                </div>
                                <div class="tk-seat"> 
                                    <div class="tk-line">B</div>
                                    <button class="tk-seat-click" cord="B1">1</button>
                                    <button class="tk-seat-click" cord="B2">2</button>
                                    <button class="tk-seat-click" cord="B3">3</button>
                                    <button class="tk-seat-click" cord="Bs" style="margin-right: 23px;">4</button>
                                    <button class="tk-seat-click" cord="B5">5</button>
                                    <button class="tk-seat-click" cord="B6">6</button>
                                    <button class="tk-seat-click" cord="B7">7</button>
                                    <button class="tk-seat-click" cord="B8" style="margin-right: 23px;">8</button>
                                    <button class="tk-seat-click" cord="B9">9</button>
                                    <button class="tk-seat-click" cord="B10">10</button>
                                    <button class="tk-seat-click" cord="B11">11</button>
                                    <button class="tk-seat-click" cord="B12">12</button>
                                </div>
                                <div class="tk-seat"> 
                                    <div class="tk-line">C</div>
                                    <button class="tk-seat-click" cord="C1">1</button>
                                    <button class="tk-seat-click" cord="C2">2</button>
                                    <button class="tk-seat-click" cord="C3">3</button>
                                    <button class="tk-seat-click" cord="C4" style="margin-right: 23px;">4</button>
                                    <button class="tk-seat-click" cord="C5">5</button>
                                    <button class="tk-seat-click" cord="C6">6</button>
                                    <button class="tk-seat-click" cord="C7">7</button>
                                    <button class="tk-seat-click" cord="C8" style="margin-right: 23px;">8</button>
                                    <button class="tk-seat-click" cord="C9">9</button>
                                    <button class="tk-seat-click" cord="C10">10</button>
                                    <button class="tk-seat-click" cord="C11">11</button>
                                    <button class="tk-seat-click" cord="C12">12</button>
                                </div>
                                <div class="tk-seat"> 
                                    <div class="tk-line">D</div>
                                    <button class="tk-seat-click" cord="D1">1</button>
                                    <button class="tk-seat-click" cord="D2">2</button>
                                    <button class="tk-seat-click" cord="D3">3</button>
                                    <button class="tk-seat-click" cord="D4" style="margin-right: 23px;">4</button>
                                    <button class="tk-seat-click" cord="D5">5</button>
                                    <button class="tk-seat-click" cord="D6">6</button>
                                    <button class="tk-seat-click" cord="D7">7</button>
                                    <button class="tk-seat-click" cord="D8" style="margin-right: 23px;">8</button>
                                    <button class="tk-seat-click" cord="D9">9</button>
                                    <button class="tk-seat-click" cord="D10">10</button>
                                    <button class="tk-seat-click" cord="D11">11</button>
                                    <button class="tk-seat-click" cord="D12">12</button>
                                </div>
                                <div class="tk-seat"> 
                                    <div class="tk-line">E</div>
                                    <button class="tk-seat-click" cord="E1">1</button>
                                    <button class="tk-seat-click" cord="E2">2</button>
                                    <button class="tk-seat-click" cord="E3">3</button>
                                    <button class="tk-seat-click" cord="E4" style="margin-right: 23px;">4</button>
                                    <button class="tk-seat-click" cord="E5">5</button>
                                    <button class="tk-seat-click" cord="E6">6</button>
                                    <button class="tk-seat-click" cord="E7">7</button>
                                    <button class="tk-seat-click" cord="E8" style="margin-right: 23px;">8</button>
                                    <button class="tk-seat-click" cord="E9">9</button>
                                    <button class="tk-seat-click" cord="E10">10</button>
                                    <button class="tk-seat-click" cord="E11">11</button>
                                    <button class="tk-seat-click" cord="E12">12</button>
                                </div>
                                <div class="tk-seat"> 
                                    <div class="tk-line">F</div>
                                    <button class="tk-seat-click" cord="F1">1</button>
                                    <button class="tk-seat-click" cord="F2">2</button>
                                    <button class="tk-seat-click" cord="F3">3</button>
                                    <button class="tk-seat-click" cord="F4" style="margin-right: 23px;">4</button>
                                    <button class="tk-seat-click" cord="F5">5</button>
                                    <button class="tk-seat-click" cord="F6">6</button>
                                    <button class="tk-seat-click" cord="F7">7</button>
                                    <button class="tk-seat-click" cord="F8" style="margin-right: 23px;">8</button>
                                    <button class="tk-seat-click" cord="F9">9</button>
                                    <button class="tk-seat-click" cord="F10">10</button>
                                    <button class="tk-seat-click" cord="F11">11</button>
                                    <button class="tk-seat-click" cord="F12">12</button>
                                </div>
                                <div class="tk-seat"> 
                                    <div class="tk-line">G</div>
                                    <button class="tk-seat-click" cord="G1">1</button>
                                    <button class="tk-seat-click" cord="G2">2</button>
                                    <button class="tk-seat-click" cord="G3">3</button>
                                    <button class="tk-seat-click" cord="G4" style="margin-right: 23px;">4</button>
                                    <button class="tk-seat-click" cord="G5">5</button>
                                    <button class="tk-seat-click" cord="G6">6</button>
                                    <button class="tk-seat-click" cord="G7">7</button>
                                    <button class="tk-seat-click" cord="G8" style="margin-right: 23px;">8</button>
                                    <button class="tk-seat-click" cord="G9">9</button>
                                    <button class="tk-seat-click" cord="G10">10</button>
                                    <button class="tk-seat-click" cord="G11">11</button>
                                    <button class="tk-seat-click" cord="G12">12</button>
                                </div>
                                <div class="tk-seat"> 
                                    <div class="tk-line">H</div>
                                    <button class="tk-seat-click" cord="H1">1</button>
                                    <button class="tk-seat-click" cord="H2">2</button>
                                    <button class="tk-seat-click" cord="H3">3</button>
                                    <button class="tk-seat-click" cord="H4" style="margin-right: 23px;">4</button>
                                    <button class="tk-seat-click" cord="H5">5</button>
                                    <button class="tk-seat-click" cord="H6">6</button>
                                    <button class="tk-seat-click" cord="H7">7</button>
                                    <button class="tk-seat-click" cord="H8" style="margin-right: 23px;">8</button>
                                    <button class="tk-seat-click" cord="H9">9</button>
                                    <button class="tk-seat-click" cord="H10">10</button>
                                    <button class="tk-seat-click" cord="H11">11</button>
                                    <button class="tk-seat-click" cord="H12">12</button>
                                </div>
                                <div class="tk-seat"> 
                                    <div class="tk-line">I</div>
                                    <button class="tk-seat-click" cord="I1">1</button>
                                    <button class="tk-seat-click" cord="I2">2</button>
                                    <button class="tk-seat-click" cord="I3">3</button>
                                    <button class="tk-seat-click" cord="I4" style="margin-right: 23px;">4</button>
                                    <button class="tk-seat-click" cord="I5">5</button>
                                    <button class="tk-seat-click" cord="I6">6</button>
                                    <button class="tk-seat-click" cord="I7">7</button>
                                    <button class="tk-seat-click" cord="I8" style="margin-right: 23px;">8</button>
                                    <button class="tk-seat-click" cord="I9">9</button>
                                    <button class="tk-seat-click" cord="I10">10</button>
                                    <button class="tk-seat-click" cord="I11">11</button>
                                    <button class="tk-seat-click" cord="I12">12</button>
                                </div>
                                <div class="tk-seat"> 
                                    <div class="tk-line">J</div>
                                    <button class="tk-seat-click" cord="J1">1</button>
                                    <button class="tk-seat-click" cord="J2">2</button>
                                    <button class="tk-seat-click" cord="J3">3</button>
                                    <button class="tk-seat-click test" cord="J4" style="margin-right: 23px;">4</button>
                                    <button class="tk-seat-click" cord="J5">5</button>
                                    <button class="tk-seat-click" cord="J6">6</button>
                                    <button class="tk-seat-click" cord="J7">7</button>
                                    <button class="tk-seat-click" cord="J8" style="margin-right: 23px;">8</button>
                                    <button class="tk-seat-click" cord="J9">9</button>
                                    <button class="tk-seat-click" cord="J10">10</button>
                                    <button class="tk-seat-click" cord="J11">11</button>
                                    <button class="tk-seat-click" cord="J12">12</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 오른쪽 검은색 박스  -->
                <div class="tk-black-box">
                    <div class="tk-choice-box">                        
                        <div class="tk-bb-title">
                            <div class="tk-tit-age-img"></div>
                            <div class="tk-title">${movie.korName}</div>
                            <div class="tk-sub-title">2D</div>
                        </div>
                        <div class="tk-bb-info">
                            <div class="tk-info-one">${timeTable.cinemaName}</div>
<%--                             <div class="tk-poster"><img src="${movie.poster}/views/ticket/img/aM1zeiVGySigNObspcjcoH9NaebEPa2f_150.jpg" alt="포스터"></div> --%>
                            <div class="tk-poster"><img src="${movie.poster}" alt="포스터"></div>
                            <div class="tk-info-two">${timeTable.theaterName}</div>
                            
                            <fmt:parseDate value="${timeTable.scrnStrDt}" var="scrnDateparse" pattern="yyyy-MM-dd" />
                            
                            <div class="tk-info-three"><fmt:formatDate value="${scrnDateparse}" pattern="yyyy-MM-dd(E)" /></div>
                            <select name="tk-time" class="tk-time" 
                            style="background-color: #333; color: #fff; border:none;margin-top: 10px; margin-left: -4px;"> 
                                <option selected>${timeTable.scrnStrDttm}~${timeTable.scrnEndDttm}</option>
                                <option value="tk-time-1">09:40~12:10</option>
                                <option value="tk-time-2">11:40~14:10</option>
                                <option value="tk-time-3">16:40~19:10</option>
                            </select>
                        </div>
                        <div class="tk-choice-seat">
                            <div class="tk-choice-seat-left">
                                <div class="tk-seat-type">
                                    <img src="${path}/views/ticket/img/bg-seat-choice.png" alt="선택">
                                    <div>선택</div>
                                </div>
                                <div class="tk-seat-type">
                                    <img src="${path}/views/ticket/img/bg-seat-finish.png" alt="선택">
                                    <div>예매완료</div>
                                </div>
                                <div class="tk-seat-type">
                                    <img src="${path}/views/ticket/img/bg-seat-impossible.png" alt="선택">
                                    <div>선택불가</div>
                                </div>
                                <div class="tk-seat-type">
                                    <img src="${path}/views/ticket/img/bg-seat-common.png" alt="선택">
                                    <div>일반</div>
                                </div>
                            </div>
                            <div class="tk-choice-seat-right">
                                <div class="tk-select-seat">선택좌석</div>
                                <form action="${path}/ticket/reserve" method="POST" id="ticketForm">
                                <input type="hidden" name="scrnNo" value="${timeTable.scrnNo}"/>
                                <div class="tk-my-seat">
                                    <div class="tk-choice-seat-now" name="a">-</div>
                                    <div class="tk-choice-seat-now" name="a">-</div>
                                    <div class="tk-choice-seat-now" name="a">-</div>
                                    <div class="tk-choice-seat-now" name="a">-</div>
                                    <div class="tk-choice-seat-now" name="a">-</div>
                                    <div class="tk-choice-seat-now" name="a">-</div>
                                    <div class="tk-choice-seat-now" name="a">-</div>
                                    <div class="tk-choice-seat-now" name="a">-</div>                                
                                    <input type="submit" style="display : none;" id="formSubmit">
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="tk-titleImg" id="tk_titleImg">
                        <div class="tk-titleText">약관 필수 동의</div>
                    </div>
                    <div class="tk-box">
                        <div class="tk-boxText">개인정보 수집 및 개인정보 제공</div>
                        <a href="javascript:void(0);">내용보기</a>
                    </div>
                    <div class="tk-btn-group" id="test">
                        <div class="tk-previous-page">이전</div>
                        <div class="tk-next-page" id="tk_next_page">예매</div>
                    
                    </div>
                </div>
            </div>
        </section>
        </main>
<jsp:include page="/views/common/footer.jsp" />