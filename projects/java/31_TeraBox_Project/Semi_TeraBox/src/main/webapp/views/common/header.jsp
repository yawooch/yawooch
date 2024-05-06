<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="${path}/views/common/img/TeraBox.ico">
	<link rel="stylesheet" href="${path}/views/common/css/header.css">
    <title>LIFE THEATER, 테라박스</title>
	<script src="${path}/views/js/jquery-3.7.1.min.js"></script>
	<script src="${path}/views/common/js/header.js"></script>

<body>
<div class="cm-modal" style="display: none;">
    <section class="cm-modalSection">
    <!-- 모달창 -->
    <div class="cm-modal-box-out">   
        <!--모달창 헤더  -->
        <div class="cm-modal-layer-header">
            <h4>알림</h4>
            <button type="button" class="cm-close-btn"></button>
        </div>
        <!-- 모달창 내부 테두리 -->
        <div class="cm-modal-box-inner">
            <div class="cm-modal-col">
                <div class="cm-modal-intput-area">
                    <p id="modalText"></p>
                </div>
                <div class="cm-modalBtn-area">
                    <button type="button" id="cm_btnCancel"  class="cm-btnwhite">취소</button>
                    <button type="button" id="cm_btnConfirm" class="cm-btnred">확인</button>
                </div>
            </div>
        </div>
    </div>
    </section>
</div>
<div class="cm-login-modal" style="display: none;">
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
                    <form id="loginForm" action="${path}/login" method="POST">
                    <!-- 아이디 -->
                    <input type="text" class="cm-input-text" id="user_id" name="user_id" autocomplete="off" required placeholder="로그인" maxlength="20" value="${cookie.saveId.value}">
                    <!-- 비밀번호 -->
                    <input type="password" class="cm-input-text" id="user_pw" name="user_pw" autocomplete="off" required placeholder="비밀번호" maxlength="20">
                    <!-- 아이디저장  -->
                    <div class="cm-ckboxline">
                        <input type="checkbox" id="saveId" name="saveId" ${empty cookie.saveId.value ? '' : 'checked'}>
                        <label for="saveId">아이디 저장</label>
                    </div>
                    <div class="cm-btn-area">
                        <button type="submit" id="cm_btnlogin" class="cm-btnred" disabled="disabled" >로그인</button>
                    </div>
                    </form>
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
</div>
<header id="cm_header">
    <div class="cm-content">
        <div class="cm-mainLogo"><img src="${path }/views/common/img/mainLogo.png" alt=""></div>
        <div class="cm-login-link">
            <c:if test="${empty loginMember}">
                <a href="javascript:void(0);" class="cm-btn-modal-open">로그인</a>
                <a href="${path}/member/confirm">회원가입</a>
            </c:if>
            <c:if test="${not empty loginMember}">
                <a href="${path}/logout">로그아웃</a>
            </c:if>
            <a href="${path}/ticket">빠른예매</a>
        </div>
        <div class="cm-header-link-left">
            <a href="javascript:void(0);" class="cm-link-area-sitemap"></a>
            <a href="javascript:" class="cm-link-area-movie"></a>
            <div>
                <a href="${path}/movie"  class="cm-link-text-movie">영화</a>
                <a href="${path}/ticket" class="cm-link-text-ticket">예매</a>
            </div>
        </div>
        <div class="cm-header-link-right">
            <div>
                <a href="${path}/cinema"   class="cm-link-text-cinema">극장</a>
                <a href="${path}/question" class="cm-link-text-question">고객센터</a>
            </div>
            <a href="${path}/ticket" class="cm-link-area-ticket"></a>
            <a href="javascript:" class="cm-link-area-mypage"></a>
        </div>
    </div>
    <nav class="cm-header-nav" style="display:none;">
        <div class="cm-header-nav-sub">
            <div class="cm-gnb-depth2" style="display:none;">
                <ul>
                    <li><a href="${path}/movie" class="cm-movieBar"  title="전체영화">전체영화</a></li>
                    <li><a href="${path}/movie/post"                 title="무비포스트">무비포스트</a></li>
                </ul>
            </div>
            <div class="cm-gnb-depth2" style="display:none;">
                <ul>
                    <li><a href="${path}/ticket" class="cm-ticketBar" title="빠른예매">빠른예매</a></li>
                </ul>
            </div>
            <div class="cm-gnb-depth2" style="display:none;">
                <ul>
                    <li><a href="${path}/cinema"         title="전체극장">전체극장</a></li>
                    <li><a href="${path}/cinema/special" title="특별관">특별관</a></li>
                </ul>
            </div>
            <div class="cm-gnb-depth2" style="display:none;">
                <ul>
                    <li><a href="${path}/question/announcement"  title="고객센터 홈"   >공지사항</a></li>
                    <li><a href="${path}/question/faq"           title="자주묻는 질문" >자주묻는 질문</a></li>
                    <li><a href="${path}/question/writeview"     title="1:1문의"       >1:1 문의</a></li>
                    <li><a href="${path}/question/writerentview" title="단체/대관 문의">단체/대관 문의</a></li>
                    <li><a href="${path}/question/lost"          title="분실물 문의"   >분실물 문의</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div id="cm_layer_sitemap" class="cm-header-layer cm-layer-sitemap" style="display:none;">
        <!-- wrap -->
        <div class="cm-layer-sitemap-wrap">
            <p class="cm-tit">SITEMAP</p>

            <div class="cm-list cm-position-1">
                <p class="cm-tit-depth">영화</p>

                <ul class="cm-list-depth">
                    <li><a href="${path}/movie"           title="전체영화">전체영화</a></li>
                    <li><a href="${path}/movie/post"      title="무비포스트">무비포스트</a></li>
                </ul>
            </div>

            <div class="cm-list cm-position-2">
                <p class="cm-tit-depth">예매</p>

                <ul class="cm-list-depth">
                    <li><a href="${path}/ticket"           title="빠른예매">빠른예매</a></li>
                </ul>
            </div>

            <div class="cm-list cm-position-3">
                <p class="cm-tit-depth">극장</p>

                <ul class="cm-list-depth">
                    <li><a href="${path}/cinema"         title="전체극장">전체극장</a></li>
                    <li><a href="${path}/cinema/special" title="특별관">특별관</a></li>
                </ul>
            </div>

            <div class="cm-list cm-position-4">
                <p class="cm-tit-depth">고객센터</p>

                <ul class="cm-list-depth">
                    <li><a href="${path}/question"                title="고객센터 홈"   >고객센터 홈</a></li>
                    <li><a href="${path}/question/announcement"   title="고객센터 홈"   >공지사항</a></li>
                    <li><a href="${path}/question/faq"            title="자주묻는 질문" >자주묻는 질문</a></li>
                    <li><a href="${path}/question/writeview"      title="1:1문의"       >1:1 문의</a></li>
                    <li><a href="${path}/question/writerentview"  title="단체/대관 문의">단체/대관 문의</a></li>
                    <li><a href="${path}/question/lost"           title="분실물 문의"   >분실물 문의</a></li>
                </ul>
            </div>
        </div>
        <!--// wrap -->
    </div>
    <div id="cm_layer_movie" class="cm-header-layer cm-layer-header-search cm-appendHtml" style="display:none;">
        <div class="cm-header-search-wrap">
            <div class="cm-tab-rank cm-tab-layer">
                <ul>
                    <li class="on"><button type="button" class="cm-header-search-btn">예매율 순</button></li>
                </ul>
            </div>
            <div class="cm-rank-cont">
                <p class="cm-img">
                    <img src="https://img.megabox.co.kr/SharedImg/2023/12/18/9jyGCFBkMW31zk7XRFD3PkdTOdnEvZXd_316.jpg" alt="외계+인 2부">
                </p>
                <div class="cm-list">
                    <ol>
                        <li><em>1</em> <a href="javascript:gfn_moveDetail('23085100')" data-imgsrc="https://img.megabox.co.kr/SharedImg/2023/12/18/9jyGCFBkMW31zk7XRFD3PkdTOdnEvZXd_316.jpg">외계+인 2부</a></li>
                        <li><em>2</em> <a href="javascript:gfn_moveDetail('23097300')" data-imgsrc="https://img.megabox.co.kr/SharedImg/2023/12/29/SPkT9JIvqlfh06XYPy0WihdUI5jgrLm4_316.jpg">엔드 오브 에반게리온</a></li>
                        <li><em>3</em> <a href="javascript:gfn_moveDetail('23093500')" data-imgsrc="https://img.megabox.co.kr/SharedImg/2023/12/15/NWONgIDGBypWUvJSg3RHcUYbpt2sHPW3_316.jpg">시민덕희</a></li>
                        <li><em>4</em> <a href="javascript:gfn_moveDetail('23081200')" data-imgsrc="https://img.megabox.co.kr/SharedImg/2023/11/22/aM1zeiVGySigNObspcjcoH9NaebEPa2f_316.jpg">서울의 봄</a></li>
                        <li><em>5</em> <a href="javascript:gfn_moveDetail('23094700')" data-imgsrc="https://img.megabox.co.kr/SharedImg/2023/12/20/m5crrh1pa4RIS5SIC6u1cJsSAhx4Sjqs_316.jpg">위시</a></li>
                    </ol>
                </div>
            </div>
            <div class="cm-header-search-area">
                <input type="text"    id="cm_headerMovieName" title="영화명을 검색해 주세요" placeholder="영화를 검색하세요" class="cm-input-text">
                <button type="button" id="cm_btnHeaderSearch" class="cm-btn-search">검색</button>
            </div>
			<form name="cm_headerBoxoForm" id="cm_headerBoxoForm" method="post">
				<input type="hidden" name="cm_searchText" id="cm_searchText">
			</form>
        </div>
    </div>
    <div id="cm_layer_mypage" class="cm-header-layer cm-layer-mypage">
        <!-- wrap-->
        <div class="cm-mypage-wrap" >
            <c:if test="${not empty loginMember}">
                <!-- 로그인 후 -->
            <div class="cm-login-after">
                <div class="cm-inner">
                    <div class="cm-box">
                        <div class="cm-mbimg"><img src="https://img.megabox.co.kr/static/pc/images/2023/01/member_WELCOME_2.png" alt="WELCOME"></div>
                        <div class="cm-name">${loginMember.memberId}<span> 님</span></div>
    
                        <a href="${path}/mypage" class="cm-linkBtn" title="나의  테라박스">나의  테라박스</a>
                    </div>
                    <div class="cm-box cm-reserve">
                        <div class="cm-tit">
                            <a class="cm-linkA" href="${path}/mypage" title="예매내역"><span>예매</span></a>
                        </div>
    
                        <div title="예매 수" class="cm-count"><div class="cm-txt">예매내역이 없어요!</div></div>
                    </div>
                </div>
            </div>
            </c:if>
            
            <c:if test="${empty loginMember}">
            <!-- 로그인 전 -->
            <div class="cm-login-before">
                <div class="cm-txt">영화를 사랑하는 당신을 위한 꼭 맞는 혜택까지 확인해 보세요!</div>
                <div class="cm-linkBox">
                    <a href="javascript:void(0);"   class="cm-btn-modal-open" title="로그인" id="cm_moveLogin"  >로그인</a>
                    <a href="${path}/member/enroll" class="cm-link"           title="혹시 아직 회원이 아니신가요?">혹시 아직 회원이 아니신가요?</a>
                </div>
            </div>
            </c:if>
        </div>
    </div>
</header>