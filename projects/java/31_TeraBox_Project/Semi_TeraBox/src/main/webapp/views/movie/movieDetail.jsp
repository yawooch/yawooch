<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="${path}/views/question/img/TeraBox.ico">
    <title>영화 주요정보</title>
    <link rel="stylesheet" href="${path}/views/movie/css/Movie_detail.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
    <jsp:include page="/views/common/header.jsp" />
    <script src="${path}/views/js/jquery-3.7.1.js"></script>

</head>
<body>
    <main>
        <!-- 포스터 있는 검은 부분 -->
        <section class="mv-movie-detail">
            <div class="mv-div-black">
                <div class="mv-div1">
                    <h2 class="mv-kr-name">${ movie.korName }</h2>
                    <br>
                    <p class="mv-eng-name">${ movie.engName }</p>
                    <div class="mv-btn-util">
                        <button class="mv-btn-black" id="mv-like">
                            <img src="${path}/views/movie/image/heart.png" class="mv-icon heart" id="mv-like-image">
                            <span class="mv-span-likescore">0</span>
                        </button>
                        <button class="mv-btn-black" id="mv-link">
                            <img src="${path}/views/movie/image/share.png" class="mv-icon share" id="mv-link-image">
                            <span>공유하기</span>
                        </button>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th>
                                    실관람 평점
                                </th>
                                <th>예매율</th>
                                <th>누적 관객수</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <img src="https://img.megabox.co.kr/static/pc/images/common/ico/ico-megabox.png">
                                    <em>-</em>
                                </td> 
                                <td>
                                    <img src="https://img.megabox.co.kr/static/pc/images/common/ico/ico-ticket-gray.png">
                                    <em>-</em>
                                    위(-%)
                                </td>
                                <td>
                                    <img src="https://img.megabox.co.kr/static/pc/images/common/ico/ico-person.png">
                                    <em>-</em>
                                    명
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                
                <div class="mv-div2">
                    <div class="mv-poster">
                        <img src="${ movie.poster }">
                        <div class="mv-movie-age">
                            <img src="${path}/views/movie/image/Movie_age.png" >  <!-- 바꿔야함 -->
                        </div>
                        <div class="mv-download-poster">
                            <img src="${path}/views/movie/image/download_poster.png">
                        </div>
                    </div>
                    <button class="mv-ticketing">예매</button>
                </div>
            </div>
        </section>

        <!-- 주요 정보 -->
        <section class="mv-sec1">
            <nav>
                <ul>
                    <li class="mv-first"><a href="${path}/movie/detail?no=${ movie.no }">주요정보/예고편/스틸컷</a></li>
                    <li class="mv-second"><a href="${path}/movie/comment?no=${ movie.no }">실관람평</a></li>
                    <li class="mv-last"><a href="${path}/movie/post?no=${ movie.no }">무비포스트</a></li>
                </ul>

            </nav>
            <!-- 바꿔야 함 ${ movie.synopsis } --> 
            <p class="mv-large-p"></p>
            <p class="mv-small-p">
                ${ movie.synopsis }
            </p>

            <button class="mv-btn-more off" id="mv-moreText">더보기</button>
            <div>
                <p>상영타입 : ${ movie.type }</p>
                <div class="mv-movie-info">
                    <p>감독 : ${ movie.director }   </p>
                    <p>장르 : ${ movie.genre }</p>
                    <p>등급 : ${ movie.grade }</p>
                    <p>개봉일 : ${movie.openDate }</p>
                </div>
                <p>출연진 : ${ movie.actors }
                </p>
            </div>
        </section>
        

        <!-- 동영상 -->
        <section class="mv-sec2">
            <div class="mv-movie-videotag">
                <p>예고편(-)</p>
                <p>스틸컷(-)</p>
            </div>
            <hr class="mv-bold-hr">
            <p class="mv-video-name">론칭 예고편</p>
            <hr class="mv-thin-hr">

            <div style="--swiper-navigation-color: #444; --swiper-pagination-color: #fff" class="swiper mySwiper2">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <video src="${path}/views/movie/video/3fced0d0c26ac3a9a9dc23601914cdbb_W.mp4" controls 
                        poster="https://img.megabox.co.kr/SharedImg/2023/11/22/0LoVKKwlxoU0L0cznl1MHynAtZ5KT96O_380.jpg"></video>
                    </div>
                    <div class="swiper-slide">
                        <video src="https://s3550.smartucc.kr/encodeFile/3550/2023/11/22/c65f68824965934d22e879a5c7e2c028_W.mp4"
                        poster="https://img.megabox.co.kr/SharedImg/2023/11/22/UdRXOPVrOYf56zPNZn4sqid5RkQxn7ri_1100.jpg" controls></video>
                    </div>
                    <div class="swiper-slide">
                        <video src="${path}/views/movie/video/3fced0d0c26ac3a9a9dc23601914cdbb_W.mp4" controls></video>
                    </div>
                    <div class="swiper-slide">
                        <video src="${path}/views/movie/video/3fced0d0c26ac3a9a9dc23601914cdbb_W.mp4" controls 
                        poster="https://img.megabox.co.kr/SharedImg/2023/11/22/0LoVKKwlxoU0L0cznl1MHynAtZ5KT96O_380.jpg"></video>
                    </div>
                    <div class="swiper-slide">
                        <video src="https://s3550.smartucc.kr/encodeFile/3550/2023/11/22/c65f68824965934d22e879a5c7e2c028_W.mp4"
                        poster="https://img.megabox.co.kr/SharedImg/2023/11/22/UdRXOPVrOYf56zPNZn4sqid5RkQxn7ri_1100.jpg" controls></video>
                    </div>
                    <div class="swiper-slide">
                        <video src="${path}/views/movie/video/3fced0d0c26ac3a9a9dc23601914cdbb_W.mp4" controls></video>
                    </div>
                    <div class="swiper-slide">
                        <video src="${path}/views/movie/video/3fced0d0c26ac3a9a9dc23601914cdbb_W.mp4" controls 
                        poster="https://img.megabox.co.kr/SharedImg/2023/11/22/0LoVKKwlxoU0L0cznl1MHynAtZ5KT96O_380.jpg"></video>
                    </div>
                    <div class="swiper-slide">
                        <video src="https://s3550.smartucc.kr/encodeFile/3550/2023/11/22/c65f68824965934d22e879a5c7e2c028_W.mp4"
                        poster="https://img.megabox.co.kr/SharedImg/2023/11/22/UdRXOPVrOYf56zPNZn4sqid5RkQxn7ri_1100.jpg" controls></video>
                    </div>
                    <div class="swiper-slide">
                        <video src="${path}/views/movie/video/3fced0d0c26ac3a9a9dc23601914cdbb_W.mp4" controls></video>
                    </div>
                    
                </div>
                <div class="swiper-button-prev" style="width: 10%">
                    <img src="${path}/views/movie/image/이전 영상 아이콘.png" alt="">
                    <span>이전 영상</span>
                </div>
                <div class="swiper-button-next" style="width: 10%">
                    <img src="${path}/views/movie/image/다음 영상 아이콘.png">
                    <span>다음 영상</span>
                </div>
            </div>

            <div thumbsSlider="" class="swiper mySwiper" style="padding-top: 10px;">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <div>
                            <img src="https://img.megabox.co.kr/SharedImg/2023/11/22/0LoVKKwlxoU0L0cznl1MHynAtZ5KT96O_380.jpg">
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div>
                            <img src="https://img.megabox.co.kr/SharedImg/2023/11/22/UdRXOPVrOYf56zPNZn4sqid5RkQxn7ri_1100.jpg">
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div>
                            <img src="https://img.megabox.co.kr/SharedImg/2023/11/22/0LoVKKwlxoU0L0cznl1MHynAtZ5KT96O_380.jpg">
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div>
                            <img src="https://img.megabox.co.kr/SharedImg/2023/11/22/0LoVKKwlxoU0L0cznl1MHynAtZ5KT96O_380.jpg">
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div>
                            <img src="https://img.megabox.co.kr/SharedImg/2023/11/22/UdRXOPVrOYf56zPNZn4sqid5RkQxn7ri_1100.jpg">
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div>
                            <img src="https://img.megabox.co.kr/SharedImg/2023/11/22/0LoVKKwlxoU0L0cznl1MHynAtZ5KT96O_380.jpg">
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div>
                            <img src="https://img.megabox.co.kr/SharedImg/2023/11/22/0LoVKKwlxoU0L0cznl1MHynAtZ5KT96O_380.jpg">
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div>
                            <img src="https://img.megabox.co.kr/SharedImg/2023/11/22/UdRXOPVrOYf56zPNZn4sqid5RkQxn7ri_1100.jpg">
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div>
                            <img src="https://img.megabox.co.kr/SharedImg/2023/11/22/0LoVKKwlxoU0L0cznl1MHynAtZ5KT96O_380.jpg">
                        </div>
                    </div>
                    
                </div>
            </div>
            
            
        </section>
        <!-- 스틸컷 -->
        <section class="mv-sec3">
            <h2>${ movie.korName }에 대한 <span>-</span>개의 스틸컷이 있어요!</h2>
            <hr class="mv-thin-hr">

            <!-- masonry 라이브러리 사용 -->
            <!-- 버튼 누를 때마다 20개의 이미지 출력 -->
            <!-- 기본값 20개 -->
            <div class="grid mv-container">
                <div class="grid-item mv-block">
                    <img src="${path}/views/movie/image/메인포스터_절찬_대표포스터.jpg">
                </div>
                <div class="grid-item mv-block">
                    <img src="https://img.megabox.co.kr/SharedImg/2023/11/22/0LoVKKwlxoU0L0cznl1MHynAtZ5KT96O_380.jpg">
                </div>
                <div class="grid-item mv-block">
                    <img src="https://img.megabox.co.kr/SharedImg/2023/10/25/UEatauRh0hZO3UZSo07PnHebGTskbXCY_1100.jpg">
                </div>
                <div class="grid-item mv-block">
                    <img src="${path}/views/movie/image/메인포스터_절찬_대표포스터.jpg">
                </div>
                <div class="grid-item mv-block">
                    <img src="https://img.megabox.co.kr/SharedImg/2023/11/22/0LoVKKwlxoU0L0cznl1MHynAtZ5KT96O_380.jpg">
                </div>
                <div class="grid-item mv-block">
                    <img src="https://img.megabox.co.kr/SharedImg/2023/10/25/UEatauRh0hZO3UZSo07PnHebGTskbXCY_1100.jpg">
                </div>
                <div class="grid-item mv-block">
                    <img src="${path}/views/movie/image/메인포스터_절찬_대표포스터.jpg">
                </div>
                <div class="grid-item mv-block">
                    <img src="https://img.megabox.co.kr/SharedImg/2023/11/22/0LoVKKwlxoU0L0cznl1MHynAtZ5KT96O_380.jpg">
                </div>
                <div class="grid-item mv-block">
                    <img src="https://img.megabox.co.kr/SharedImg/2023/10/25/UEatauRh0hZO3UZSo07PnHebGTskbXCY_1100.jpg">
                </div>
                <div class="grid-item mv-block">
                    <img src="${path}/views/movie/image/메인포스터_절찬_대표포스터.jpg">
                </div>
                <div class="grid-item mv-block">
                    <img src="https://img.megabox.co.kr/SharedImg/2023/11/22/0LoVKKwlxoU0L0cznl1MHynAtZ5KT96O_380.jpg">
                </div>
                <div class="grid-item mv-block">
                    <img src="https://img.megabox.co.kr/SharedImg/2023/10/25/UEatauRh0hZO3UZSo07PnHebGTskbXCY_1100.jpg">
                </div>
                
            </div>
            
            <!-- 더보기 버튼 -->
            <button class="mv-btn-more" id="mv-moreImage">더보기</button>
        </section>
    </main>

    <script src="${path}/views/movie/js/Movie_detail.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
    <script>
        var swiper = new Swiper(".mySwiper", {
            spaceBetween: 10,
            slidesPerView: 4,
            freeMode: true,
            watchSlidesProgress: true,
        });
        var swiper2 = new Swiper(".mySwiper2", {
            spaceBetween: 10,
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            thumbs: {
                swiper: swiper,
            },
        });

        $('.grid').masonry({
            // options
            itemSelector: '.grid-item',
            columnWidth: 270
        });
        
        
    </script>
</body>
<jsp:include page="/views/common/footer.jsp" />
</html>