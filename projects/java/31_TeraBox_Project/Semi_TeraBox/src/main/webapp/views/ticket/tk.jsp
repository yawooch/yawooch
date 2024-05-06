<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/views/common/header.jsp" />
<link rel="stylesheet" href="${path}/views/ticket/css/jquery.mCustomScrollbar.min.css"/>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="${path}/views/common/js/jquery-ui-1.13.2/jquery-ui.css">
<script src="${path}/views/common/js/jquery-ui-1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" href="${path}/views/ticket/css/tk.css">
<script src="${path}/views/ticket/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="${path}/views/ticket/js/tk.js"></script>
    
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
            <!-- innerwrap -->
            <div class="sp-wrap">
                <!-- 빠른예매제목 -->
                <div class="tit-util">
                    <h2>빠른 예매</h2>
                </div>
                <!-- 내부박스 -->
                <div class="sp-wrap-include">
                    <div class="time-schedule">
                        <div class="wrap">
                            <!-- 이전날짜 -->
                            <button type="button" title="이전 날짜 보기" class="btn-prev-date">
                                <i class="iconset ico-cld-pre"></i>
                            </button>
                            <!-- 날짜목록박스 -->
                            <div class="date-list">
                                <!-- 년도월표시 -->
                                <div class="year" style="left: 0px; z-index: 1; opacity: 1;">2024.01</div>
                                <div class="year" style="left: 910px; z-index: 1; opacity: 1;">2024.02</div>
                                <div style="overflow: hidden;">
                                <div class="date-area" id="formDeList">
                                    <div class="wrap" style="position: relative; width: 2100px; border: none; left: 0px;">
                                        <button class="" type="button" date-data="2024.01.18" month="0" tabindex="-1">
                                            <span class="ir">2024년 1월</span>
                                            <em style="pointer-events:none;">18<span style="pointer-events:none;" class="ir">일</span></em>
                                            <span class="day-kr" style="pointer-events:none;display:inline-block">오늘</span>
                                            <span class="day-en" style="pointer-events:none;display:none">Thu</span>
                                        </button>
                                        <button class="" type="button" date-data="2024.01.19" month="0">
                                            <span class="ir">2024년 1월</span>
                                            <em style="pointer-events:none;">19<span style="pointer-events:none;" class="ir">일</span></em>
                                            <span class="day-kr" style="pointer-events:none;display:inline-block">내일</span>
                                            <span class="day-en" style="pointer-events:none;display:none">Fri</span>
                                        </button>
                                        <button class="sat" type="button" date-data="2024.01.20" month="0">
                                            <span class="ir">2024년 1월</span>
                                            <em style="pointer-events:none;">20<span style="pointer-events:none;" class="ir">일</span></em>
                                            <span class="day-kr" style="pointer-events:none;display:inline-block">토</span>
                                            <span class="day-en" style="pointer-events:none;display:none">Sat</span>
                                        </button>
                                        <button class="holi" type="button" date-data="2024.01.21" month="0">
                                            <span class="ir">2024년 1월</span>
                                            <em style="pointer-events:none;">21<span style="pointer-events:none;" class="ir">일</span></em>
                                            <span class="day-kr" style="pointer-events:none;display:inline-block">일</span>
                                            <span class="day-en" style="pointer-events:none;display:none">Sun</span>
                                        </button>
                                        <button class="" type="button" date-data="2024.01.22" month="0">
                                            <span class="ir">2024년 1월</span>
                                            <em style="pointer-events:none;">22<span style="pointer-events:none;" class="ir">일</span></em>
                                            <span class="day-kr" style="pointer-events:none;display:inline-block">월</span>
                                            <span class="day-en" style="pointer-events:none;display:none">Mon</span>
                                        </button>
                                        <button class="" type="button" date-data="2024.01.23" month="0">
                                            <span class="ir">2024년 1월</span>
                                            <em style="pointer-events:none;">23<span style="pointer-events:none;" class="ir">일</span></em>
                                            <span class="day-kr" style="pointer-events:none;display:inline-block">화</span>
                                            <span class="day-en" style="pointer-events:none;display:none">Tue</span>
                                        </button>
                                        <button class="" type="button" date-data="2024.01.24" month="0">
                                            <span class="ir">2024년 1월</span>
                                            <em style="pointer-events:none;">24<span style="pointer-events:none;" class="ir">일</span></em>
                                            <span class="day-kr" style="pointer-events:none;display:inline-block">수</span>
                                            <span class="day-en" style="pointer-events:none;display:none">Wed</span>
                                        </button>
                                        <button class="" type="button" date-data="2024.01.25" month="0">
                                            <span class="ir">2024년 1월</span>
                                            <em style="pointer-events:none;">25<span style="pointer-events:none;" class="ir">일</span></em>
                                            <span class="day-kr" style="pointer-events:none;display:inline-block">목</span>
                                            <span class="day-en" style="pointer-events:none;display:none">Thu</span>
                                        </button>
                                        <button class="" type="button" date-data="2024.01.26" month="0">
                                            <span class="ir">2024년 1월</span>
                                            <em style="pointer-events:none;">26<span style="pointer-events:none;" class="ir">일</span></em>
                                            <span class="day-kr" style="pointer-events:none;display:inline-block">금</span>
                                            <span class="day-en" style="pointer-events:none;display:none">Fri</span>
                                        </button>
                                        <button class="sat" type="button" date-data="2024.01.27" month="0">
                                            <span class="ir">2024년 1월</span>
                                            <em style="pointer-events:none;">27<span style="pointer-events:none;" class="ir">일</span></em>
                                            <span class="day-kr" style="pointer-events:none;display:inline-block">토</span>
                                            <span class="day-en" style="pointer-events:none;display:none">Sat</span>
                                        </button>
                                        <button class="holi" type="button" date-data="2024.01.28" month="0">
                                            <span class="ir">2024년 1월</span>
                                            <em style="pointer-events:none;">28<span style="pointer-events:none;" class="ir">일</span></em>
                                            <span class="day-kr" style="pointer-events:none;display:inline-block">일</span>
                                            <span class="day-en" style="pointer-events:none;display:none">Sun</span>
                                        </button>
                                        <button class="" type="button" date-data="2024.01.29" month="0">
                                            <span class="ir">2024년 1월</span>
                                            <em style="pointer-events:none;">29<span style="pointer-events:none;" class="ir">일</span></em>
                                            <span class="day-kr" style="pointer-events:none;display:inline-block">월</span>
                                            <span class="day-en" style="pointer-events:none;display:none">Mon</span>
                                        </button>
                                        <button class="" type="button" date-data="2024.01.30" month="0">
                                            <span class="ir">2024년 1월</span>
                                            <em style="pointer-events:none;">30<span style="pointer-events:none;" class="ir">일</span></em>
                                            <span class="day-kr" style="pointer-events:none;display:inline-block">화</span>
                                            <span class="day-en" style="pointer-events:none;display:none">Tue</span>
                                        </button>
                                        <button class="on" type="button" date-data="2024.01.31" month="0">
                                            <span class="ir">2024년 1월</span>
                                            <em style="pointer-events:none;">31<span style="pointer-events:none;" class="ir">일</span></em>
                                            <span class="day-kr" style="pointer-events:none;display:inline-block">수</span>
                                            <span class="day-en" style="pointer-events:none;display:none">Wed</span>
                                        </button>
                                        <button class="" type="button" date-data="2024.02.01" month="1">
                                            <span class="ir">2024년 2월</span>
                                            <em style="pointer-events:none;">1<span style="pointer-events:none;" class="ir">일</span></em>
                                            <span class="day-kr" style="pointer-events:none;display:inline-block">목</span>
                                            <span class="day-en" style="pointer-events:none;display:none">Thu</span>
                                        </button>
                                        <button class="disabled" type="button" date-data="2024.02.02" month="1" tabindex="-1">
                                            <span class="ir">2024년 2월</span>
                                            <em style="pointer-events:none;">2<span style="pointer-events:none;" class="ir">일</span></em>
                                            <span class="day-kr" style="pointer-events:none;display:inline-block">금</span>
                                            <span class="day-en" style="pointer-events:none;display:none">Fri</span>
                                        </button>
                                    </div>
                                </div>
                                </div>
                            </div>
                            <!-- 다음날짜 -->
                            <button type="button" title="다음 날짜 보기" class="btn-next-date">
                                <i class="iconset ico-cld-next"></i>
                            </button>
                            <div class="bg-line">
                                <input type="hidden" id="datePicker" value="" class="">
                                <!-- <button type="button" id="calendar" onclick="$('#datePicker').datepicker();" class="btn-calendar-large" title="달력보기"> 달력보기</button> -->
                            </div>
                        </div>
                    </div>

                    <div class="quick-reserve-area">
                        <!-- 영화 선택 : movie-choice -->
                        <div class="movie-choice">
                            <p class="tit">영화</p>

                            <!-- 영화 list-area -->
                            <div class="list-area">
                                <!-- 영화목록전체 -->
                                <div class="all-list">
                                    <button type="button" class="btn-tab on" id="movieAll">전체</button>
                                    <div class="list" style="display: block;">
                                        <div class="scroll m-scroll mCustomScrollbar _mCS_1" id="movieList">
                                            <div id="mCSB_1" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" style="max-height: none;" tabindex="0">
                                                <!-- 영화목록상세 -->
                                                <div id="mCSB_1_container" class="mCSB_container" style="position: relative; top: 0px; left: 0px;" dir="ltr">
                                                    <ul>
                                                        <li> <button type="button" class="btn" movie-nm="엔드 오브 에반게리온"                                            movie-no="23097300" img-path="/views/ticket/img/SPkT9JIvqlfh06XYPy0WihdUI5jgrLm4_150.jpg" movie-popup-at="N" movie-popup-no="0" form-at="Y"><span class="movie-grade small age-19"> 청소년관람불가</span><i class="iconset ico-heart-small">보고싶어 설정안함</i><span class="txt">엔드 오브 에반게리온                                         </span></button> </li>
                                                        <li> <button type="button" class="btn" movie-nm="외계+인 2부"                                                     movie-no="23085100" img-path="/views/ticket/img/9jyGCFBkMW31zk7XRFD3PkdTOdnEvZXd_150.jpg" movie-popup-at="N" movie-popup-no="0" form-at="Y"><span class="movie-grade small age-12"> 12세이상관람가</span><i class="iconset ico-heart-small">보고싶어 설정안함</i><span class="txt">외계+인 2부                                                  </span></button> </li>
                                                        <li> <button type="button" class="btn" movie-nm="시민덕희"                                                        movie-no="23093500" img-path="/views/ticket/img/NWONgIDGBypWUvJSg3RHcUYbpt2sHPW3_150.jpg" movie-popup-at="N" movie-popup-no="0" form-at="Y"><span class="movie-grade small age-15"> 15세이상관람가</span><i class="iconset ico-heart-small">보고싶어 설정안함</i><span class="txt">시민덕희                                                     </span></button> </li>
                                                        <li> <button type="button" class="btn" movie-nm="위시"                                                            movie-no="23094700" img-path="/views/ticket/img/m5crrh1pa4RIS5SIC6u1cJsSAhx4Sjqs_150.jpg" movie-popup-at="N" movie-popup-no="0" form-at="Y"><span class="movie-grade small age-all">전체관람가    </span><i class="iconset ico-heart-small">보고싶어 설정안함</i><span class="txt">위시                                                         </span></button> </li>
                                                        <li> <button type="button" class="btn" movie-nm="덤 머니"                                                         movie-no="23093200" img-path="/views/ticket/img/UCZpTzo6NPIFmkkgBgQRCT9Ja2JmJwKs_150.jpg" movie-popup-at="N" movie-popup-no="0" form-at="Y"><span class="movie-grade small age-15"> 15세이상관람가</span><i class="iconset ico-heart-small">보고싶어 설정안함</i><span class="txt">덤 머니                                                      </span></button> </li>
                                                        <li> <button type="button" class="btn" movie-nm="링팝 : 더 브이알콘서트 카이"                                     movie-no="24001100" img-path="/views/ticket/img/NCQGQ8zw0V6MnZ7DR3lOh0JmdtlMxCV8_150.jpg" movie-popup-at="N" movie-popup-no="0" form-at="N"><span class="movie-grade small age-all">전체관람가    </span><i class="iconset ico-heart-small">보고싶어 설정안함</i><span class="txt">링팝 : 더 브이알콘서트 카이                                  </span></button> </li>
                                                        <li> <button type="button" class="btn" movie-nm="신 에반게리온 극장판"                                            movie-no="24000900" img-path="/views/ticket/img/ZONuSoKkUgUSMk8TmI8WLl8zTA4XmgVZ_150.jpg" movie-popup-at="N" movie-popup-no="0" form-at="Y"><span class="movie-grade small age-15"> 15세이상관람가</span><i class="iconset ico-heart-small">보고싶어 설정안함</i><span class="txt">신 에반게리온 극장판                                         </span></button> </li>
                                                        <li> <button type="button" class="btn" movie-nm="서울의 봄"                                                       movie-no="23081200" img-path="/views/ticket/img/aM1zeiVGySigNObspcjcoH9NaebEPa2f_150.jpg" movie-popup-at="N" movie-popup-no="0" form-at="Y"><span class="movie-grade small age-12"> 12세이상관람가</span><i class="iconset ico-heart-small">보고싶어 설정안함</i><span class="txt">서울의 봄                                                    </span></button> </li>
                                                        <li> <button type="button" class="btn" movie-nm="노량: 죽음의 바다"                                               movie-no="23092700" img-path="/views/ticket/img/lYCj0izHwMOIbNYHsqYj4dZHVYuq5AnW_150.jpg" movie-popup-at="N" movie-popup-no="0" form-at="Y"><span class="movie-grade small age-12"> 12세이상관람가</span><i class="iconset ico-heart-small">보고싶어 설정안함</i><span class="txt">노량: 죽음의 바다                                            </span></button> </li>
                                                        <li> <button type="button" class="btn" movie-nm="에반게리온 신극장판: 서"                                         movie-no="24000200" img-path="/views/ticket/img/yifTio2qStp3RXcHpOPUCVCCm3kbDSWX_150.jpg" movie-popup-at="N" movie-popup-no="0" form-at="Y"><span class="movie-grade small age-12"> 12세이상관람가</span><i class="iconset ico-heart-small">보고싶어 설정안함</i><span class="txt">에반게리온 신극장판: 서                                      </span></button> </li>
                                                        <li> <button type="button" class="btn" movie-nm="스즈메의 문단속"                                                 movie-no="23000600" img-path="/views/ticket/img/jpVJy55iJTCzSxRk3NhLedZQnBo3xtVl_150.jpg" movie-popup-at="N" movie-popup-no="0" form-at="Y"><span class="movie-grade small age-12"> 12세이상관람가</span><i class="iconset ico-heart-small">보고싶어 설정안함</i><span class="txt">스즈메의 문단속                                              </span></button> </li>
                                                        <li> <button type="button" class="btn" movie-nm="에반게리온 신극장판: 파"                                         movie-no="24000300" img-path="/views/ticket/img/dALLH8hgsMQQkOMxH95hRyIdeemZA88E_150.jpg" movie-popup-at="N" movie-popup-no="0" form-at="Y"><span class="movie-grade small age-12"> 12세이상관람가</span><i class="iconset ico-heart-small">보고싶어 설정안함</i><span class="txt">에반게리온 신극장판: 파                                      </span></button> </li>
                                                        <li> <button type="button" class="btn" movie-nm="인투 더 월드"                                                    movie-no="23090000" img-path="/views/ticket/img/OOQa6qfVWaK8JQZLOaNhAL9kXpDxxEuc_150.jpg" movie-popup-at="N" movie-popup-no="0" form-at="Y"><span class="movie-grade small age-all">전체관람가    </span><i class="iconset ico-heart-small">보고싶어 설정안함</i><span class="txt">인투 더 월드                                                 </span></button> </li>
                                                        <li> <button type="button" class="btn" movie-nm="에반게리온 신극장판: Q"                                          movie-no="24000400" img-path="/views/ticket/img/l02Dx9lRIkAz9PxjALLGPtsP8xpLNAOR_150.jpg" movie-popup-at="N" movie-popup-no="0" form-at="Y"><span class="movie-grade small age-15"> 15세이상관람가</span><i class="iconset ico-heart-small">보고싶어 설정안함</i><span class="txt">에반게리온 신극장판: Q                                       </span></button> </li>
                                                        <li> <button type="button" class="btn" movie-nm="더 퍼스트 슬램덩크"                                              movie-no="22103500" img-path="/views/ticket/img/6zcW2RLJPbzHqGE492Nvs6kdwI1xVoC0_150.png" movie-popup-at="N" movie-popup-no="0" form-at="Y"><span class="movie-grade small age-12"> 12세이상관람가</span><i class="iconset ico-heart-small">보고싶어 설정안함</i><span class="txt">더 퍼스트 슬램덩크                                           </span></button> </li>
                                                        <li> <button type="button" class="btn" movie-nm="싱어게인3 파이널 생중계"                                         movie-no="24001900" img-path="/views/ticket/img/BtRCB4xk1PoxYbhJZGZnushf1Jh6hj2h_150.jpg" movie-popup-at="N" movie-popup-no="0" form-at="N"><span class="movie-grade small age-15"> 15세이상관람가</span><i class="iconset ico-heart-small">보고싶어 설정안함</i><span class="txt">싱어게인3 파이널 생중계                                      </span></button> </li>
                                                        <li> <button type="button" class="btn" movie-nm="신차원! 짱구는 못말려 더 무비 초능력 대결전 ~날아라 수제김밥~"   movie-no="23091100" img-path="/views/ticket/img/U0C9k4eB0jQgGUiAWNKu98X8VGfSSSZ8_150.jpg" movie-popup-at="N" movie-popup-no="0" form-at="Y"><span class="movie-grade small age-all">전체관람가    </span><i class="iconset ico-heart-small">보고싶어 설정안함</i><span class="txt">신차원! 짱구는 못말려 더 무비 초능력 대결전 ~날아라 수제김밥~</span></button> </li>
                                                    </ul>
                                                </div>
                                                <!-- 영화목록스크롤 -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                            </div>

                            <!-- view-area -->
                            <div class="view-area">
                                <!-- 영화선택X -->
                                <div class="choice-all" id="choiceMovieNone">
                                    <strong>모든영화</strong>
                                    <span>목록에서 영화를 선택하세요.</span>
                                </div>
                                <!-- 영화 하나라도 선택시 -->
                                <div class="choice-list" id="choiceMovieList" style="display:none;">
                                    <!-- 비어있는 영역 -->
                                    <div class="bg"></div>
                                    <div class="bg"></div>
                                    <div class="bg"></div>
                                </div>
                            </div>
                            <!--// movie-schedule-area : 시간표 출력 영역-->

                        </div>
                        <!-- 극장 선택 : theater-choice -->
                        <div class="theater-choice">
                            <div class="tit-area">
                                <p class="tit">극장</p>
                            </div>
                            <!-- 극장 list-area -->
                            <div class="list-area" id="brchTab">
                                <!-- 극장목록전체 -->
                                <div class="all-list">
                                    <button type="button" class="btn-tab on">전체</button>
                                    <div class="list">
                                        <div class="scroll" id="brchList">
                                            <!-- 극장목록상세 -->
                                            <ul>
                                                <li>
                                                    <button type="button" class="btn on" id="10">
                                                        <span calss="txt">서울(19)</span>
                                                    </button>
                                                    <div class="depth on">
                                                        <div class="detail-list m-scroll area-cd10 mCustomScrollbar _mCS_4">
                                                            <div id="mCSB_4" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" style="max-height: none;" tabindex="0">
                                                                <div id="mCSB_4_container" class="mCSB_container" style="position:relative; top:0; left:0;" dir="ltr">
                                                                    <!-- 서울상세 -->
                                                                    <ul>
                                                                        <li> <button id="btn" type="button" brch-no="1372" brch-nm="강남"                     brch-eng-nm="Gangnam"                                       form-at="Y" area-cd="10" area-cd-nm="서울" spclb-yn="N" brch-bokd-unable-at="N" brch-popup-at="N" brch-popup-no="0"              >강남                    </button> </li>
                                                                        <li> <button id="btn" type="button" brch-no="0023" brch-nm="강남대로(씨티)"           brch-eng-nm="Gangnam-daero (City)"                          form-at="Y" area-cd="10" area-cd-nm="서울" spclb-yn="N" brch-bokd-unable-at="N" brch-popup-at="N" brch-popup-no="0"              >강남대로(씨티)          </button> </li>
                                                                        <li> <button id="btn" type="button" brch-no="1341" brch-nm="강동"                     brch-eng-nm="Gangdong"                                      form-at="Y" area-cd="10" area-cd-nm="서울" spclb-yn="N" brch-bokd-unable-at="N" brch-popup-at="N" brch-popup-no="0"              >강동                    </button> </li>
                                                                        <li> <button id="btn" type="button" brch-no="1431" brch-nm="군자"                     brch-eng-nm="Gunja"                                         form-at="Y" area-cd="10" area-cd-nm="서울" spclb-yn="N" brch-bokd-unable-at="N" brch-popup-at="Y" brch-popup-no="1669"           >군자                    </button> </li>
                                                                        <li> <button id="btn" type="button" brch-no="0041" brch-nm="더 부티크 목동현대백화점" brch-eng-nm="The Boutique Mokdong-Hyundai Department store" form-at="Y" area-cd="10" area-cd-nm="서울" spclb-yn="N" brch-bokd-unable-at="N" brch-popup-at="Y" brch-popup-no="2221"           >더 부티크 목동현대백화점</button> </li>
                                                                        <li> <button id="btn" type="button" brch-no="1003" brch-nm="동대문"                   brch-eng-nm="Dongdaemoon"                                   form-at="Y" area-cd="10" area-cd-nm="서울" spclb-yn="N" brch-bokd-unable-at="N" brch-popup-at="Y" brch-popup-no="962"            >동대문                  </button> </li>
                                                                        <li> <button id="btn" type="button" brch-no="1572" brch-nm="마곡"                     brch-eng-nm="Magok"                                         form-at="Y" area-cd="10" area-cd-nm="서울" spclb-yn="N" brch-bokd-unable-at="N" brch-popup-at="Y" brch-popup-no="936"            >마곡                    </button> </li>
                                                                        <li> <button id="btn" type="button" brch-no="1581" brch-nm="목동"                     brch-eng-nm="Mokdong"                                       form-at="Y" area-cd="10" area-cd-nm="서울" spclb-yn="N" brch-bokd-unable-at="N" brch-popup-at="Y" brch-popup-no="968"            >목동                    </button> </li>
                                                                        <li> <button id="btn" type="button" brch-no="1311" brch-nm="상봉"                     brch-eng-nm="Sangbong"                                      form-at="Y" area-cd="10" area-cd-nm="서울" spclb-yn="N" brch-bokd-unable-at="N" brch-popup-at="Y" brch-popup-no="980"            >상봉                    </button> </li>
                                                                        <li> <button id="btn" type="button" brch-no="1211" brch-nm="상암월드컵경기장"         brch-eng-nm="Sangam-WorldCup Stadium"                       form-at="Y" area-cd="10" area-cd-nm="서울" spclb-yn="N" brch-bokd-unable-at="N" brch-popup-at="Y" brch-popup-no="1001"           >상암월드컵경기장        </button> </li>
                                                                        <li> <button id="btn" type="button" brch-no="1331" brch-nm="성수"                     brch-eng-nm="Seongsu"                                       form-at="Y" area-cd="10" area-cd-nm="서울" spclb-yn="N" brch-bokd-unable-at="N" brch-popup-at="Y" brch-popup-no="1006"           >성수                    </button> </li>
                                                                        <li> <button id="btn" type="button" brch-no="1371" brch-nm="센트럴"                   brch-eng-nm="Central"                                       form-at="Y" area-cd="10" area-cd-nm="서울" spclb-yn="N" brch-bokd-unable-at="N" brch-popup-at="Y" brch-popup-no="1002"           >센트럴                  </button> </li>
                                                                        <li> <button id="btn" type="button" brch-no="1381" brch-nm="송파파크하비오"           brch-eng-nm="Songpa Park Habio"                             form-at="Y" area-cd="10" area-cd-nm="서울" spclb-yn="N" brch-bokd-unable-at="N" brch-popup-at="N" brch-popup-no="0"              >송파파크하비오          </button> </li>
                                                                        <li> <button id="btn" type="button" brch-no="1202" brch-nm="신촌"                     brch-eng-nm="Sinchon"                                       form-at="Y" area-cd="10" area-cd-nm="서울" spclb-yn="N" brch-bokd-unable-at="N" brch-popup-at="N" brch-popup-no="0"              >신촌                    </button> </li>
                                                                        <li> <button id="btn" type="button" brch-no="1561" brch-nm="이수"                     brch-eng-nm="Isu"                                           form-at="Y" area-cd="10" area-cd-nm="서울" spclb-yn="N" brch-bokd-unable-at="N" brch-popup-at="N" brch-popup-no="0"              >이수                    </button> </li>
                                                                        <li> <button id="btn" type="button" brch-no="1321" brch-nm="창동"                     brch-eng-nm="Changdong"                                     form-at="Y" area-cd="10" area-cd-nm="서울" spclb-yn="N" brch-bokd-unable-at="N" brch-popup-at="N" brch-popup-no="0"              >창동                    </button> </li>
                                                                        <li> <button id="btn" type="button" brch-no="1351" brch-nm="코엑스"                   brch-eng-nm="COEX"                                          form-at="Y" area-cd="10" area-cd-nm="서울" spclb-yn="N" brch-bokd-unable-at="N" brch-popup-at="Y" brch-popup-no="954"            >코엑스                  </button> </li>
                                                                        <li> <button id="btn" type="button" brch-no="1212" brch-nm="홍대"                     brch-eng-nm="Hongdae"                                       form-at="Y" area-cd="10" area-cd-nm="서울" spclb-yn="N" brch-bokd-unable-at="N" brch-popup-at="N" brch-popup-no="0"              >홍대                    </button> </li>
                                                                        <li> <button id="btn" type="button" brch-no="1571" brch-nm="화곡"                     brch-eng-nm="Hwagok"                                        form-at="Y" area-cd="10" area-cd-nm="서울" spclb-yn="N" brch-bokd-unable-at="N" brch-popup-at="Y" brch-popup-no="999"            >화곡                    </button> </li>
                                                                        <li> <button id="btn" type="button" brch-no="1562" brch-nm="ARTNINE"                  brch-eng-nm="ARTNINE"                                       form-at="N" area-cd="10" area-cd-nm="서울" spclb-yn="N" brch-bokd-unable-at="N" brch-popup-at="N" brch-popup-no="0"              >ARTNINE                 </button> </li>
                                                                    </ul>
                                                                </div>
                                                                <!-- 스크롤바 -->
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- 극장 view-area -->
                            <div class="view-area">
                                <div class="choice-all" id="choiceBrchNone">
                                    <strong>전체극장</strong>
                                    <span>목록에서 극장을 선택하세요.</span>
                                </div>
                                <div class="choice-list" id="choiceBrchList" style="display: none;">
                                    <div class="bg">
                                    </div>
                                    <div class="bg">
                                    </div>
                                    <div class="bg">
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!--// time-choice : 상영시간표 선택 -->
                        <div class="time-choice">
                            <div class="tit-area">
                                <p class="tit">시간</p>
                                <div class="right legend">
                                    <i class="iconset ico-sun" title="조조"></i> 조조
                                    <i class="iconset ico-brunch" title="브런치"></i> 브런치
                                    <i class="iconset ico-moon" title="심야"></i> 심야
                                </div>
                            </div>
                            <!-- 시간선택영역 -->
                            <div class="hour-schedule">
                                <button type="button" class="btn-prev-time">이전 시간 보기</button>
                                <div class="wrap">
                                    <div class="view" style="position: absolute; width: 1015px; transition: none 0s ease 0s; left: -175px;">
                                        <button type="button" class="hour" style="opacity: 1;">00</button>
                                        <button type="button" class="hour" style="opacity: 1;">01</button>
                                        <button type="button" class="hour" style="opacity: 1;">02</button>
                                        <button type="button" class="hour" style="opacity: 1;">03</button>
                                        <button type="button" class="hour" style="opacity: 1;">04</button>
                                        <button type="button" class="hour" style="opacity: 1;">05</button>
                                        <button type="button" class="hour" style="opacity: 1;">06</button>
                                        <button type="button" class="hour" style="opacity: 1;">07</button>
                                        <button type="button" class="hour" style="opacity: 1;">08</button>
                                        <button type="button" class="hour on" style="opacity: 1;">09</button>
                                        <button type="button" class="hour" style="opacity: 1;">10</button>
                                        <button type="button" class="hour" style="opacity: 1">11</button>
                                        <button type="button" class="hour" style="opacity: 1;">12</button>
                                        <button type="button" class="hour" style="opacity: 1;">13</button>
                                        <button type="button" class="hour" style="opacity: 1;">14</button>
                                        <button type="button" class="hour" style="opacity: 1;">15</button>
                                        <button type="button" class="hour" style="opacity: 1;">16</button>
                                        <button type="button" class="hour" style="opacity: 1;">17</button>
                                        <button type="button" class="hour" style="opacity: 1">18</button>
                                        <button type="button" class="hour" style="opacity: 1;">19</button>
                                        <button type="button" class="hour" style="opacity: 1;">20</button>
                                        <button type="button" class="hour" style="opacity: 1;">21</button>
                                        <button type="button" class="hour" style="opacity: 1;">22</button>
                                        <button type="button" class="hour" style="opacity: 1;">23</button>
                                        <button type="button" class="hour" style="opacity: 1;">24</button>
                                        <button type="button" class="hour" style="opacity: 1;">25</button>
                                        <button type="button" class="hour" style="opacity: 1;">26</button>
                                        <button type="button" class="hour" style="opacity: 1;">27</button>
                                        <button type="button" class="hour" style="opacity: 1;">28</button>
                                    </div>
                                </div>
                                <button type="button" class="btn-next-time">다음 시간 보기</button>
                            </div>
                            <!-- 시간표출력영역 -->
                            <div class="movie-schedule-area">
                                <!-- 영화선택시 -->
                                <div class="result">
                                    <div class="scroll m-scroll mCustomScrollbar _mCS_17" id="playScheduleList">
                                        <div id="mCSB_17" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" style="max-height: none;" tabindex="0">
                                            <div id="mCSB_17_container" class="mCSB_container" style="position:relative; top:0; left:0;" dir="ltr">
                                                <!-- 시간표출력상세 -->
                                                <ul>
                                                    <li>
                                                        <button type="button" class="btn" id="2401181331028" play-start-time="0910" play-de="20240118" play-seq="1" rpst-movie-no="23085107" brch-no="1331" theab-no="03" play-schdl-no="2401181331028" netfnl-adopt-at="N" rest-seat-cnt="274" ctts-ty-div-cd="MVCT01" theab-popup-at="N" theab-popup-no="0">
                                                            <div class="legend">
                                                                <i class="iconset ico-sun" title="조조">조조</i>
                                                            </div>
                                                            <span class="time">
                                                                <strong title="상영 시작">09:10</strong>
                                                                <em title="상영 종료">~11:22</em>
                                                            </span>
                                                            <span class="title">
                                                                <strong title="외계+인 2부">외계+인 2부</strong>
                                                                <em>2D ATMOS</em>
                                                            </span>
                                                            <div class="info">
                                                                <span class="theater" title="극장">성수<br>3관</span>
                                                                <span class="seat">
                                                                    <strong class="now" title="잔여 좌석">197</strong>
                                                                    <span>/</span>
                                                                    <em class="all" title="전체 좌석">232</em>
                                                                </span>
                                                            </div>
                                                        </button>
                                                    </li>
                                                    <li>
                                                        <button type="button" class="btn" id="2401181331048" play-start-time="1030" play-de="20240118" play-seq="1" rpst-movie-no="23085101" brch-no="1331" theab-no="06" play-schdl-no="2401181331048" netfnl-adopt-at="N" rest-seat-cnt="44" ctts-ty-div-cd="MVCT01" theab-popup-at="Y" theab-popup-no="1086">
                                                            <div class="legend"></div>
                                                            <span class="time">
                                                                <strong title="상영 시작">10:30</strong>
                                                                <em title="상영 종료">~12:42</em>
                                                            </span>
                                                            <span class="title">
                                                                <strong title="외계+인 2부">외계+인 2부</strong>
                                                                <em>2D</em>
                                                            </span>
                                                            <div class="info">
                                                                <span class="theater" title="극장">성수<br>더부티크 101호 스위트</span>
                                                                <span class="seat">
                                                                    <strong class="now" title="잔여 좌석">44</strong>
                                                                    <span>/</span>
                                                                    <em class="all" title="전체 좌석">46</em>
                                                                </span>
                                                            </div>
                                                        </button>
                                                    </li>
                                                    <li>
                                                        <button type="button" class="btn" id="2401181331023" play-start-time="1205" play-de="20240118" play-seq="2" rpst-movie-no="23085101" brch-no="1331" theab-no="02" play-schdl-no="2401181331023" netfnl-adopt-at="N" rest-seat-cnt="170" ctts-ty-div-cd="MVCT01" theab-popup-at="N" theab-popup-no="0">
                                                            <div class="legend"></div>
                                                            <span class="time">
                                                                <strong title="상영 시작">12:05</strong>
                                                                <em title="상영 종료">~14:17</em>
                                                            </span>
                                                            <span class="title">
                                                                <strong title="외계+인 2부">외계+인 2부</strong>
                                                                <em>2D</em>
                                                            </span>
                                                            <div class="info">
                                                                <span class="theater" title="극장">성수<br>2관</span>
                                                                <span class="seat">
                                                                    <strong class="now" title="잔여 좌석">170</strong>
                                                                    <span>/</span>
                                                                    <em class="all" title="전체 좌석">170</em>
                                                                </span>
                                                            </div>
                                                        </button>
                                                    </li>
                                                    <li>
                                                        <button type="button" class="btn" id="2401181331039" play-start-time="1330" play-de="20240118" play-seq="2" rpst-movie-no="23085101" brch-no="1331" theab-no="06" play-schdl-no="2401181331039" netfnl-adopt-at="N" rest-seat-cnt="46" ctts-ty-div-cd="MVCT01" theab-popup-at="Y" theab-popup-no="1086">
                                                            <div class="legend"></div>
                                                            <span class="time">
                                                                <strong title="상영 시작">13:30</strong>
                                                                <em title="상영 종료">~15:42</em>
                                                            </span>
                                                            <span class="title">
                                                                <strong title="외계+인 2부">외계+인 2부</strong>
                                                                <em>2D</em>
                                                            </span>
                                                            <div class="info">
                                                                <span class="theater" title="극장">성수<br>더부티크 101호 스위트</span>
                                                                <span class="seat">
                                                                    <strong class="now" title="잔여 좌석">46</strong>
                                                                    <span>/</span>
                                                                    <em class="all" title="전체 좌석">46</em>
                                                                </span>
                                                            </div>
                                                        </button>
                                                    </li>
                                                    <li>
                                                        <button type="button" class="btn" id="2401181331024" play-start-time="1440" play-de="20240118" play-seq="3" rpst-movie-no="23085101" brch-no="1331" theab-no="02" play-schdl-no="2401181331024" netfnl-adopt-at="N" rest-seat-cnt="165" ctts-ty-div-cd="MVCT01" theab-popup-at="N" theab-popup-no="0">
                                                            <div class="legend"></div>
                                                            <span class="time">
                                                                <strong title="상영 시작">14:40</strong>
                                                                <em title="상영 종료">~16:52</em>
                                                            </span>
                                                            <span class="title">
                                                                <strong title="외계+인 2부">외계+인 2부</strong>
                                                                <em>2D</em>
                                                            </span>
                                                            <div class="info">
                                                                <span class="theater" title="극장">성수<br>2관</span>
                                                                <span class="seat">
                                                                    <strong class="now" title="잔여 좌석">165</strong>
                                                                    <span>/</span>
                                                                    <em class="all" title="전체 좌석">170</em>
                                                                </span>
                                                            </div>
                                                        </button>
                                                    </li>
                                                    <li>
                                                        <button type="button" class="btn" id="2401181331047" play-start-time="1630" play-de="20240118" play-seq="3" rpst-movie-no="23085101" brch-no="1331" theab-no="06" play-schdl-no="2401181331047" netfnl-adopt-at="N" rest-seat-cnt="46" ctts-ty-div-cd="MVCT01" theab-popup-at="Y" theab-popup-no="1086">
                                                            <div class="legend"></div>
                                                            <span class="time">
                                                                <strong title="상영 시작">16:30</strong>
                                                                <em title="상영 종료">~18:42</em>
                                                            </span>
                                                            <span class="title">
                                                                <strong title="외계+인 2부">외계+인 2부</strong>
                                                                <em>2D</em>
                                                            </span>
                                                            <div class="info">
                                                                <span class="theater" title="극장">성수<br>더부티크 101호 스위트</span>
                                                                <span class="seat">
                                                                    <strong class="now" title="잔여 좌석">46</strong>
                                                                    <span>/</span>
                                                                    <em class="all" title="전체 좌석">46</em>
                                                                </span>
                                                            </div>
                                                        </button>
                                                    </li>
                                                    <li>
                                                        <button type="button" class="btn" id="2401181331031" play-start-time="1715" play-de="20240118" play-seq="4" rpst-movie-no="23085101" brch-no="1331" theab-no="02" play-schdl-no="2401181331031" netfnl-adopt-at="N" rest-seat-cnt="168" ctts-ty-div-cd="MVCT01" theab-popup-at="N" theab-popup-no="0">
                                                            <div class="legend"></div>
                                                            <span class="time">
                                                                <strong title="상영 시작">17:15</strong>
                                                                <em title="상영 종료">~19:27</em>
                                                            </span>
                                                            <span class="title">
                                                                <strong title="외계+인 2부">외계+인 2부</strong>
                                                                <em>2D</em>
                                                            </span>
                                                            <div class="info">
                                                                <span class="theater" title="극장">성수<br>2관</span>
                                                                <span class="seat">
                                                                    <strong class="now" title="잔여 좌석">168</strong>
                                                                    <span>/</span>
                                                                    <em class="all" title="전체 좌석">170</em>
                                                                </span>
                                                            </div>
                                                        </button>
                                                    </li>
                                                </ul>
                                            </div>
                                            <!-- 스크롤바 -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <form action="${ path }/ticket/seat" id="selectMovieForm"  method="POST"></form>
                    </div>
                </div>
            </div>
        </section>
    </main>
    
    
	<jsp:include page="/views/common/footer.jsp" />