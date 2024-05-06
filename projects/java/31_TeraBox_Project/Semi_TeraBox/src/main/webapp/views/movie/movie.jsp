<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="${path}/views/question/img/TeraBox.ico">
    <title>전체 영화</title>
    <link rel="stylesheet" href="${path}/views/movie/css/Movie_main.css">
    <jsp:include page="/views/common/header.jsp" />
    <script src="${path}/views/movie/js/jquery-3.7.1.js"></script>
</head>
<body>
    <main>
        <nav class="mv-main-nav">
            <div class="mv-main-navbox">
                <img src="https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-home.png" alt="">
                <span>
                    <img src="https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-arr.png" alt="">
                    <a href="javascript:void(0);">영화</a>
                </span>
                <span>
                    <img src="https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-arr.png" alt="">
                    <a href="javascript:void(0);">전체 영화</a>
                </span>
            </div>
        </nav>
        <section>
            <h2>전체 영화</h2>
            <nav class="mv-main-menu">
                <ul>
                    <li class="mv-menu-first"><a href="${path}/movie">박스오피스</a></li>
                    <li class="mv-menu-second"><a href="javascript:void(0);">상영예정작</a></li>
                    <li class="mv-menu-hidden"></li>
                </ul>
            </nav>
            <div class="mv-main-wrap-top">
                <div class="mv-main-result">
                    <button>
                        <img src="${path}/views/movie/image/개봉작만off.png" alt="">
                        <span>개봉작만</span>
                    </button>
                    <span><b>${ list.size() }</b>개의 영화가 검색되었습니다.</span>
                </div>
                <div class="mv-main-search">
                    <form action="">
                        <input type="text" placeholder="영화명 검색">
                        <button class="mv-main-btnSearch">
                            <img src="${path}/views/movie/image/movieSearch.png" alt="">
                        </button>
                    </form>
                </div>
            </div>
            <ul class="mv-main-ul">
                
                <!-- 반복 -->
                <c:if test="${ not empty list }">
                	<c:forEach var="movie" items="${ list }">
		                <li class="mv-main-mvlist">
		                    <div class="mv-main-mv-poster"  style="overflow: hidden">
		                        <img src="${ movie.poster }" alt="">
		                        <div class="mv-main-poster-bg">
		                            <a href="${path}/movie/detail?no=${ movie.no }" class="mv-main-poster-a">
		                                <div class="mv-main-poster-ex">
		                                    <span>
		                                        ${ movie.synopsis.replaceAll("<br>" , " ") }
		                                    </span>
		                                </div>
		                                <div class="mv-main-poster-score">
		                                    <div>
		                                        <span>평점</span>
		                                    </div>
		                                </div>
		                            </a>
		                        </div>
		                    </div>
		                    <div class="mv-main-mv-name">
		                        <img src="${path}/views/movie/image/Movie_age.png" alt="">
		                        <span>${ movie.korName }</span>
		                    </div>
		                    <div class="mv-main-mv-info">
		                        <span class="mv-main-mv-tk">예매율 -%</span>
		                        <span class="mv-main-mv-op">개봉일 ${ movie.openDate }</span>
		                    </div>
		                    <div class="mv-main-mv-btn">
		                        <button class="mv-main-btn-like">
		                            <img src="${path}/views/movie/image/heartGray.png" alt="">
		                            <span>0</span>
		                        </button>
		                        <a href="${ path }/ticket">
			                        <button class="mv-main-btn-tk" >
			                            <span>예매</span>
			                        </button>
		                        </a>
		                    </div>
		                </li>
                	</c:forEach>
                </c:if>
                <!-- 반복 -->
                
            </ul>


            <button class="mv-btn-more" id="mv-moreImage">더보기</button>
        </section>
    </main>
</body>
<jsp:include page="/views/common/footer.jsp" />
</html>