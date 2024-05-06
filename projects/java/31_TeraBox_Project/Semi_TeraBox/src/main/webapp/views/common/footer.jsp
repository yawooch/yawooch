<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<link rel="stylesheet" href="${path}/views/common/css/footer.css">
<footer id="cm_footer">
    <div class="cm-content">
        <div class="cm-footerContent">
            <span class="cm-footerLogo"><img src="${path}/views/common/img/mainLogo.png" alt=""></span>
            <span>
                <ul>
                    <li>서울 중구 남대문로 120 대일빌딩 2층, 3층</li>
                    <li>대표자명 : 양우찬, 백성연, 손연희, 진병만, 김서하</li>
                    <li>COPY RIGHT ⓒTERRABOX JONGRO-GO, Inc. All Right Reserved</li>
                </ul>
            </span>
            <span>
                <a href="javascript:void(0);"class="cm-footer-findCinema"><i class="cm-ico-footer-search"></i>극장찾기</a>
            </span>
        </div>
    </div>
    <div id="cm_layer_looking_theater" class="cm-layer-looking-theater">
        <div class="cm-looking-wrap">
            <p class="cm-tit">테라박스 극장 찾기</p>
        
            <!-- list -->
            <ul class="cm-list">
                <li>
                    <p class="cm-loca">서울</p>
                    <div class="cm-cont">
                        <a href="${path}/cinema?brchNo=1372" title="강남 상세보기">강남</a>
                        <a href="${path}/cinema?brchNo=0023" title="강남대로(씨티) 상세보기">강남대로(씨티)</a>
                        <a href="${path}/cinema?brchNo=1341" title="강동 상세보기">강동</a>
                        <a href="${path}/cinema?brchNo=1431" title="군자 상세보기">군자</a>
                        <a href="${path}/cinema?brchNo=0041" title="더 부티크 목동현대백화점 상세보기">더 부티크 목동현대백화점</a>
                        <a href="${path}/cinema?brchNo=1003" title="동대문 상세보기">동대문</a>
                        <a href="${path}/cinema?brchNo=1572" title="마곡 상세보기">마곡</a>
                        <a href="${path}/cinema?brchNo=1581" title="목동 상세보기">목동</a>
                        <a href="${path}/cinema?brchNo=1311" title="상봉 상세보기">상봉</a>
                        <a href="${path}/cinema?brchNo=1211" title="상암월드컵경기장 상세보기">상암월드컵경기장</a>
                        <a href="${path}/cinema?brchNo=1331" title="성수 상세보기">성수</a>
                        <a href="${path}/cinema?brchNo=1371" title="센트럴 상세보기">센트럴</a>
                        <a href="${path}/cinema?brchNo=1381" title="송파파크하비오 상세보기">송파파크하비오</a>
                        <a href="${path}/cinema?brchNo=1202" title="신촌 상세보기">신촌</a>
                        <a href="${path}/cinema?brchNo=1561" title="이수 상세보기">이수</a>
                        <a href="${path}/cinema?brchNo=1321" title="창동 상세보기">창동</a>
                        <a href="${path}/cinema?brchNo=1351" title="코엑스 상세보기">코엑스</a>
                        <a href="${path}/cinema?brchNo=1212" title="홍대 상세보기">홍대</a>
                        <a href="${path}/cinema?brchNo=1571" title="화곡 상세보기">화곡</a>
                        <a href="${path}/cinema?brchNo=1562" title="ARTNINE 상세보기">ARTNINE</a>
                    </div>
                </li>
            </ul>
            <!--// list -->
            <button type="button" class="cm-btn-footer-layer-close">테라박스 극장찾기 닫기</button>
        </div>
    </div>
</footer>
<script>
$(document).ready(()=>{
    let findCinema  = $('.cm-footer-findCinema');
    let closeCinema = $('.cm-btn-footer-layer-close');
    //극장찾기 열기/닫기 이벤트
    findCinema.click(function(event){
        event.preventDefault();
        let listCinema = $('#cm_layer_looking_theater');
        if(listCinema.hasClass('on')){
            listCinema.removeClass('on');
        }
        else{
            listCinema.addClass('on');
        }
    });
    //극장찾기 닫기 이벤트
    closeCinema.click(function(event){
        $('#cm_layer_looking_theater').removeClass('on');
    });
});
</script>
</body>
</html>