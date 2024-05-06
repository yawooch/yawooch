<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<link rel="stylesheet" href="${path}/css/index_notice.css">

    <section id="main_noticeSection">
        <h2 class="main-tit">테라박스 안내</h2>
        <div class="main-info-notice">
            <div class="main-notice-wrap">
                <p class="main-tit">메가박스</p>
                <p class="main-link">
                    <a href="${path}/question" title="공지사항 상세보기">
                    <strong>
                    [공지]
                    </strong>
                    서울페이(서울사랑상품권) 서비스 종료 안내 (1/31)
                    </a>
                </p>
                <p class="main-date">2024.01.11</p>
                <p class="main-more">
                    <a href="${path}/question" title="전체공지 더보기">더보기 <i class="main-iconset main-ico-arr-right-gray"></i></a>
                </p>
            </div>
        </div>

        <div class="main-info-link">
            <div class="main-table">
                <div class="main-cell">
                    <a href="${path}/question" title="고객센터 페이지로 이동">
                        <i class="main-iconset main-ico-main-customer"></i>
                        <span>고객센터</span>
                    </a>
                </div>

                <div class="main-cell">
                    <a href="${path}/question/faq" title="자주 묻는 질문 페이지로 이동">
                        <i class="main-iconset main-ico-main-faq"></i>
                        <span>자주 묻는 질문</span>
                    </a>
                </div>

                <div class="main-cell">
                    <a href="${path}/question/writeview" title="1:1 문의 페이지로 이동">
                        <i class="main-iconset main-ico-main-qna"></i>
                        <span>1:1 문의</span>
                    </a>
                </div>

                <div class="main-cell">
                    <a href="${path}/question/writerentview" title="단체/대관문의 페이지로 이동">
                        <i class="main-iconset main-ico-main-group"></i>
                        <span>단체/대관문의</span>
                    </a>
                </div>

                <div class="main-cell">
                    <a href="${path}/question/lost" title="분실물 문의/접수 페이지로 이동">
                        <i class="main-iconset main-ico-main-lost"></i>
                        <span>분실물 문의/접수</span>
                    </a>
                </div>

                <div class="main-cell">
                    <a href="${path}/cinema/special" title="더 부티크 프라이빗 대관예매 페이지로 이동">
                        <i class="main-iconset main-ico-main-boutique"></i>
                        <span>특별관</span>
                    </a>
                </div>
            </div>
        </div>

    </section>