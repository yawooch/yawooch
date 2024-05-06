<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />

<body>

<jsp:include page="/views/common/header.jsp" />
<link rel="stylesheet" href="${path}/views/cinema/css/special.css">
<main class="container">
    <!-- body중 메뉴바 -->
    <div class="page-util">
            <div class="inner-wrap">
                    <div class="location">
                            <span>home</span>
                            <a href="${path}/cinema"         title="극장 페이지로 이동">극장</a>
                            <a href="${path}/cinema/special" title="특별관 페이지로 이동">특별관</a>
                    </div>
            </div>
    </div>
    <!-- content -->
    <div id="tk_contents">
        <!-- theater special 테라박스 특별관을 소개합니다. -->
        <div class="theater-special-main bg"></div>
        <div class="theater-special-main">
            <div class="inner-wrap">
                <div class="brn-link">
                    <div class="cell tit-area">
                        <p class="tit"><p class="slogun">MEET PLAY SHARE</p></p>
                        <p class="txt">테라박스<br> 특별관을<br> 소개합니다. </p>
                    </div>
                    <div class="cell link-boutique">
                        <a href="javascript:void(0);" title="THE BOUTIQUE 페이지로 이동">
                            <div class="link-txt">
                                <p class="tit">THE BOUTIQUE</p>
                                <p class="txt">부티크 호텔의 개성을 더한<br>테라박스만의 프리미엄 시네마</p>
                            </div>
                            <div class="hover">THE BOUTIQUE</div>
                        </a>
                    </div>
                    <div class="cell link-db">
                        <a href="javascript:void(0);">
                            <div class="link-txt">
                                <p class="tit">DOLBY CINEMA</p>
                                <p class="txt">국내 최초로 테라박스가 선보이는<br>세계 최고 기술력의 몰입 시네마</p>
                            </div>

                            <div class="hover">TERABOXTM MX THE TRUE SOUND</div>
                        </a>
                    </div>
                    <div class="cell link-mx">
                        <a href="javascript:void(0);" title="DOLBYATMOS 페이지로 이동">
                            <div class="link-txt">
                                <p class="tit">DOLBY ATMOS</p>
                                <p class="txt">몰입감 넘치는 사운드 특별관</p>
                            </div>
                            <div class="hover">TERABOXTM MX THE TRUE SOUND</div>
                        </a>
                    </div>
                    <div class="cell link-kids">
                        <a href="javascript:void(0);" title="TERAGA KIDS 페이지로 이동">
                            <div class="link-txt">
                                <p class="tit">TERABOX KIDS</p>
                                <p class="txt">아이와 가족이 함께 머물며<br>삶의 소중한 가치를 배우는<br>더 행복한 놀이공간</p>
                            </div>
                            <div class="hover">TERABOX KIDS</div>
                        </a>
                    </div>
                    <div class="cell link-comfort">
                        <a href="javascript:void(0);" title="COMFORT 페이지로 이동">
                            <div class="link-txt">
                                <p class="tit">COMFORT</p>
                                <p class="txt">더욱 편안한 영화 관람을 위한<br>다양한 여유 공간</p>
                            </div>
                            <div class="hover">COMFORT</div>
                        </a>
                    </div>
                    <div class="cell link-private">
                        <a href="javascript:void(0);" title="THE BOUTIQUE PRIVATE 페이지로 이동">
                            <div class="link-txt">
                                <p class="tit">THE BOUTIQUE PRIVATE</p>
                                <p class="txt">당신의 특별한 순간을 빛나게 해줄<br>프리미엄 어메니티와 룸서비스</p>
                            </div>
                            <div class="hover">THE BOUTIQUE PRIVATE</div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<jsp:include page="/views/common/footer.jsp" />
</body>

</html>