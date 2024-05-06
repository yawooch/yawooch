<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <c:set var="path" value="${ pageContext.request.contextPath }" />

        <body>

            <jsp:include page="/views/common/header.jsp" />
            
            <link rel="stylesheet" href="${path}/views/cinema/css/theater.css">
            <main class="container">
                <!-- body중 메뉴바 -->
                <div class="page-util">
                    <div class="inner-wrap">
                        <div class="location">
                            <span>home</span>
                            <a href="javascript:void(0);" title="극장 페이지로 이동">극장</a>
                        </div>
                    </div>
                </div>
                <!-- content -->
                <div id="tk_contents">
                    <!-- theater main 메가박스 새로운 지점을 소개합니다. -->
                    <div class="theater-main">
                        <div class="inner-wrap">
                            <div class="left">
                                <p class="slogun">terrabox</p>
                                <p class="txt">테라박스<br>새로운 지점을<br>소개합니다.</p>
                                <!-- swiper-control -->
                                <div class="swiper-control">
                                    <div class="theater-pagination swiper-pagination-bullets"><span
                                            class="swiper-pagination-bullet swiper-pagination-bullet-active"></span>
                                    </div>
                                    <div class="theater-util">
                                        <button type="button" class="theater-prev swiper-button-disabled" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true">이전 이벤트 보기</button>
                                        <button type="button" class="theater-next swiper-button-disabled" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true">다음 이벤트 보기</button>
                                        <button type="button" class="pause on">일시정지</button>
                                        <button type="button" class="play">자동재생</button>
                                    </div>
                                    <div class="theater-count">
                                        <span title="현재 페이지" class="active">1</span> /
                                        <span title="전체 페이지" class="total">1</span>
                                    </div>
                                </div>
                            </div>
                            <div class="theater-swiper swiper-container-initialized swiper-container-horizontal">
                                <div class="swiper-wrapper" style="transform: translate3d(0px, 0px, 0px);">
                                    <div class="cell swiper-slide swiper-slide-active" tabindex="0"
                                        style="width: 245px; margin-right: 40px;">
                                        <a href="javascript:void(0);" class="eventBtn" data-no="14675" data-netfunnel=""
                                            title="[수원인계] 2023.12.15 GRAND OPENING 상세보기">
                                            <div class="img new"></div>
                                            <div class="cont new">
                                                <p class="label">신규오픈</p>
                                                <p class="local"></p>
                                                <p class="name">수원인계</p>
                                                <p class="date">2023.12.15</p>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="inner-wrap">
                        <h2 class="tit new">전체극장</h2>
                        <div class="theater-box">
                            <div class="theater-place">
                                <ul>
                                    <li class="on">
                                        <button type="button" class="sel-city">서울</button>
                                        <div class="theater-list">
                                            <ul>
                                                <li data-brch-no="1372"> <a href="${path}/theater?brchNo=1372"
                                                        title="강남 상세보기">강남</a> </li>
                                                <li data-brch-no="0023"> <a href="${path}/theater?brchNo=0023"
                                                        title="강남대로(씨티) 상세보기">강남대로(씨티)</a> </li>
                                                <li data-brch-no="1341"> <a href="${path}/theater?brchNo=1341"
                                                        title="강동 상세보기">강동</a> </li>
                                                <li data-brch-no="1431"> <a href="${path}/theater?brchNo=1431"
                                                        title="군자 상세보기">군자</a> </li>
                                                <li data-brch-no="0041"> <a href="${path}/theater?brchNo=0041"
                                                        title="더 부티크 목동현대백화점 상세보기">더 부티크 목동현대백화점</a> </li>
                                                <li data-brch-no="1003"> <a href="${path}/theater?brchNo=1003"
                                                        title="동대문 상세보기">동대문</a> </li>
                                                <li data-brch-no="1572"> <a href="${path}/theater?brchNo=1572"
                                                        title="마곡 상세보기">마곡</a> </li>
                                                <li data-brch-no="1581"> <a href="${path}/theater?brchNo=1581"
                                                        title="목동 상세보기">목동</a> </li>
                                                <li data-brch-no="1311"> <a href="${path}/theater?brchNo=1311"
                                                        title="상봉 상세보기">상봉</a> </li>
                                                <li data-brch-no="1211"> <a href="${path}/theater?brchNo=1211"
                                                        title="상암월드컵경기장 상세보기">상암월드컵경기장</a> </li>
                                                <li data-brch-no="1331"> <a href="${path}/theater?brchNo=1331"
                                                        title="성수 상세보기">성수</a> </li>
                                                <li data-brch-no="1371"> <a href="${path}/theater?brchNo=1371"
                                                        title="센트럴 상세보기">센트럴</a> </li>
                                                <li data-brch-no="1381"> <a href="${path}/theater?brchNo=1381"
                                                        title="송파파크하비오 상세보기">송파파크하비오</a> </li>
                                                <li data-brch-no="1202"> <a href="${path}/theater?brchNo=1202"
                                                        title="신촌 상세보기">신촌</a> </li>
                                                <li data-brch-no="1561"> <a href="${path}/theater?brchNo=1561"
                                                        title="이수 상세보기">이수</a> </li>
                                                <li data-brch-no="1321"> <a href="${path}/theater?brchNo=1321"
                                                        title="창동 상세보기">창동</a> </li>
                                                <li data-brch-no="1351"> <a href="${path}/theater?brchNo=1351"
                                                        title="코엑스 상세보기">코엑스</a> </li>
                                                <li data-brch-no="1212"> <a href="${path}/theater?brchNo=1212"
                                                        title="홍대 상세보기">홍대</a> </li>
                                                <li data-brch-no="1571"> <a href="${path}/theater?brchNo=1571"
                                                        title="화곡 상세보기">화곡</a> </li>
                                                <li data-brch-no="1562"> <a href="${path}/theater?brchNo=1562"
                                                        title="ARTNINE 상세보기">ARTNINE</a> </li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li>
                                        <button type="button" class="sel-city">경기
                                        </button>
                                        <div class="theater-list">
                                            <ul>
                                                <li data-brch-no="4121"> <a href="${path}/theater?brchNo=4121"
                                                        title="고양스타필드 상세보기">고양스타필드</a> </li>
                                                <li data-brch-no="0029"> <a href="${path}/theater?brchNo=0029"
                                                        title="광명AK플라자 상세보기">광명AK플라자</a> </li>
                                                <li data-brch-no="0053"> <a href="${path}/theater?brchNo=0053"
                                                        title="광명소하 상세보기">광명소하</a> </li>
                                                <li data-brch-no="0035"> <a href="${path}/theater?brchNo=0035"
                                                        title="금정AK플라자 상세보기">금정AK플라자</a> </li>
                                                <li data-brch-no="4152"> <a href="${path}/theater?brchNo=4152"
                                                        title="김포한강신도시 상세보기">김포한강신도시</a> </li>
                                                <li data-brch-no="0039"> <a href="${path}/theater?brchNo=0039"
                                                        title="남양주 상세보기">남양주</a> </li>
                                                <li data-brch-no="0019"> <a href="${path}/theater?brchNo=0019"
                                                        title="남양주현대아울렛 스페이스원 상세보기">남양주현대아울렛 스페이스원</a> </li>
                                                <li data-brch-no="4451"> <a href="${path}/theater?brchNo=4451"
                                                        title="동탄 상세보기">동탄</a> </li>
                                                <li data-brch-no="4652"> <a href="${path}/theater?brchNo=4652"
                                                        title="미사강변 상세보기">미사강변</a> </li>
                                                <li data-brch-no="4104"> <a href="${path}/theater?brchNo=4104"
                                                        title="백석벨라시타 상세보기">백석벨라시타</a> </li>
                                                <li data-brch-no="4722"> <a href="${path}/theater?brchNo=4722"
                                                        title="별내 상세보기">별내</a> </li>
                                                <li data-brch-no="4221"> <a href="${path}/theater?brchNo=4221"
                                                        title="부천스타필드시티 상세보기">부천스타필드시티</a> </li>
                                                <li data-brch-no="4631"> <a href="${path}/theater?brchNo=4631"
                                                        title="분당 상세보기">분당</a> </li>
                                                <li data-brch-no="0030"> <a href="${path}/theater?brchNo=0030"
                                                        title="수원 상세보기">수원</a> </li>
                                                <li data-brch-no="0052"> <a href="${path}/theater?brchNo=0052"
                                                        title="수원AK플라자 상세보기">수원AK플라자</a> </li>
                                                <li data-brch-no="0042"> <a href="${path}/theater?brchNo=0042"
                                                        title="수원남문 상세보기">수원남문</a> </li>
                                                <li data-brch-no="0062"> <a href="${path}/theater?brchNo=0062"
                                                        title="수원스타필드 상세보기">수원스타필드</a> <i
                                                        class="iconset ico-theater-open"></i> </li>
                                                <li data-brch-no="0060"> <a href="${path}/theater?brchNo=0060"
                                                        title="수원인계 상세보기">수원인계</a> <i
                                                        class="iconset ico-theater-new"></i> </li>
                                                <li data-brch-no="0036"> <a href="${path}/theater?brchNo=0036"
                                                        title="수원호매실 상세보기">수원호매실</a> </li>
                                                <li data-brch-no="4291"> <a href="${path}/theater?brchNo=4291"
                                                        title="시흥배곧 상세보기">시흥배곧</a> </li>
                                                <li data-brch-no="4253"> <a href="${path}/theater?brchNo=4253"
                                                        title="안산중앙 상세보기">안산중앙</a> </li>
                                                <li data-brch-no="0020"> <a href="${path}/theater?brchNo=0020"
                                                        title="안성스타필드 상세보기">안성스타필드</a> </li>
                                                <li data-brch-no="4821"> <a href="${path}/theater?brchNo=4821"
                                                        title="양주 상세보기">양주</a> </li>
                                                <li data-brch-no="4431"> <a href="${path}/theater?brchNo=4431"
                                                        title="영통 상세보기">영통</a> </li>
                                                <li data-brch-no="0012"> <a href="${path}/theater?brchNo=0012"
                                                        title="용인기흥 상세보기">용인기흥</a> </li>
                                                <li data-brch-no="4462"> <a href="${path}/theater?brchNo=4462"
                                                        title="용인테크노밸리 상세보기">용인테크노밸리</a> </li>
                                                <li data-brch-no="4804"> <a href="${path}/theater?brchNo=4804"
                                                        title="의정부민락 상세보기">의정부민락</a> </li>
                                                <li data-brch-no="4111"> <a href="${path}/theater?brchNo=4111"
                                                        title="일산 상세보기">일산</a> </li>
                                                <li data-brch-no="4112"> <a href="${path}/theater?brchNo=4112"
                                                        title="킨텍스 상세보기">킨텍스</a> </li>
                                                <li data-brch-no="4132"> <a href="${path}/theater?brchNo=4132"
                                                        title="파주금촌 상세보기">파주금촌</a> </li>
                                                <li data-brch-no="4115"> <a href="${path}/theater?brchNo=4115"
                                                        title="파주운정 상세보기">파주운정</a> </li>
                                                <li data-brch-no="4131"> <a href="${path}/theater?brchNo=4131"
                                                        title="파주출판도시 상세보기">파주출판도시</a> </li>
                                                <li data-brch-no="0064"> <a href="${path}/theater?brchNo=0064"
                                                        title="평택비전 상세보기">평택비전</a> <i
                                                        class="iconset ico-theater-open"></i> </li>
                                                <li data-brch-no="4651"> <a href="${path}/theater?brchNo=4651"
                                                        title="하남스타필드 상세보기">하남스타필드</a> </li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li></li>
                                    <li></li>
                                    <li></li>
                                    <li></li>
                                    <li></li>
                                    <li></li>
                                </ul>
                            </div>
                            <div class="user-theater">
                                <div>
                                    <i class="iconset ico-favo-theater"></i> 나의 선호영화관 정보
                                    <a href="javascript:void(0);" class="button small ml10" id="moveLogin" title="로그인하기">로그인하기</a>
                                </div>
                                <div style="display:none;">
                                    <i class="iconset ico-favo-theater"></i>
                                    <span class="font-gblue">양우찬</span>님의 선호영화관
                                    <ul class="theater-circle">
                                        <li>
                                            <a href="${path}/theater?areaCd=10&amp;brchNo=1561" title="이수 상세보기">이수</a>
                                        </li>
                                    </ul>
                                    <a href="javascript:void(0);" class="button small float-r" title="선호영화관 관리"> <i
                                            class="iconset ico-edit"></i> 선호영화관 관리</a>
                                </div>
                            </div>
                        </div>
                        <div class="tit-util">
                            <h3 class="tit">극장 공지사항</h3>
                            <a href="${path}/question/announcementSeoul" class="more" title="극장 공지사항 더보기">더보기 <i
                                    class="iconset ico-arr-right-gray"></i></a>
                        </div>
                        <div class="table-wrap">
                            <table class="board-list">
                                <colgroup>
                                    <col style="width:150px;">
                                    <col>
                                    <col style="width:150px;">
                                    <col style="width:120px;">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="col">극장</th>
                                        <th scope="col">제목</th>
                                        <th scope="col">지역</th>
                                        <th scope="col">등록일</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>코엑스</td>
                                        <th scope="row">
                                            <a href="${path}/question/announcementSeoul"
                                                title="[코엑스]시사회 진행에 따른 고객 안내 (1/18) 상세보기">
                                                [코엑스]시사회 진행에 따른 고객 안내 (1/18)
                                            </a>
                                        </th>
                                        <td>서울</td>
                                        <td>2024.01.15</td>
                                    </tr>
                                    <tr>
                                        <td>하남스타필드</td>
                                        <th scope="row">
                                            <a href="${path}/question/announcementSeoul"
                                                title="[하남스타필드]상영관 명칭 변경 안내 상세보기">
                                                [하남스타필드]상영관 명칭 변경 안내
                                            </a>
                                        </th>
                                        <td>경기</td>
                                        <td>2024.01.08</td>
                                    </tr>
                                    <tr>
                                        <td>검단</td>
                                        <th scope="row">
                                            <a href="${path}/question/announcementSeoul"
                                                title="[검단] 상영관 리클라이너 좌석 교체 및 리뉴얼 공사 일정 안내(1/8~2/29) 상세보기">
                                                [검단] 상영관 리클라이너 좌석 교체 및 리뉴얼 공사 일정 안내(1/8~2/29)
                                            </a>
                                        </th>
                                        <td>인천</td>
                                        <td>2024.01.08</td>
                                    </tr>
                                    <tr>
                                        <td>의정부민락</td>
                                        <th scope="row">
                                            <a href="${path}/question/announcementSeoul"
                                                title="[의정부민락]주차장(송양하나로마트) 제휴 종료 안내 상세보기">
                                                [의정부민락]주차장(송양하나로마트) 제휴 종료 안내
                                            </a>
                                        </th>
                                        <td>경기</td>
                                        <td>2024.01.08</td>
                                    </tr>
                                    <tr>
                                        <td>이수</td>
                                        <th scope="row">
                                            <a href="${path}/question/announcementSeoul"
                                                title="이수지점 <[Live] 2024 빈 필하모닉 신년음악회> 상영불가로 인한 센트럴지점 재예매 요청 상세보기">
                                                이수지점 &lt;[Live] 2024 빈 필하모닉 신년음악회&gt; 상영불가로 인한 센트럴지점 재예매 요청
                                            </a>
                                        </th>
                                        <td>서울</td>
                                        <td>2023.12.29</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </main>

            <jsp:include page="/views/common/footer.jsp" />
        </body>
        </html>