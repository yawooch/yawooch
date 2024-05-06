$(document).ready(function() {
    //좋아요 버튼 호버하면 색 들어간 이미지로 변경
    $('#mv-like').hover(
        // 올라갔을 때 full
        () => $('#mv-like-image').attr('src', '/views/movie/image/heartFull.png'),
        // 내려갔을 때 db에 y이면 full, n이면 빈 이미지
        () => {
            if ($('#mv-like').hasClass('on')) {
                $('#mv-like-image').attr('src', '/views/movie/image/heartFull.png');
            } else {
                $('#mv-like-image').attr('src', '/views/movie/image/heart.png');
            }
        }
    );
    //좋아요 버튼 클릭하면 on 클래스 추가
    $('#mv-like').on('click', () => {
		let og_point = parseInt($('.mv-span-likescore').html());
		
        if ($('#mv-like').hasClass('on')) {
            $('#mv-like').removeClass('on');
            $('.mv-span-likescore').html(og_point - 1);
        } else {
            $('#mv-like').addClass('on');
            $('.mv-span-likescore').html(og_point + 1);
        }
    });
    
    // 공유 버튼 호버하면 색 들어간 이미지로 변경
    $('#mv-link').hover(
        () => $('#mv-link-image').attr('src', '/views/movie/image/shareFull.png'),
        () => $('#mv-link-image').attr('src', '/views/movie/image/share.png')
    );

    // 공유 버튼 클릭하면 현재 페이지의 링크 복사
    // https에서만 사용 가능
    $('#mv-link').click(() => {
        alert(location.href);
    });

    // 실관람평 분류 기준 선택하면 on 클래스 추가 / 나머지는 on 삭제
    $('#mv-com-btnRecent').click(() => {
        $('#mv-com-btnRecent').addClass('on');
        $('#mv-com-btnLike').removeClass('on');
        $('#mv-com-btnScore').removeClass('on');
    });
    $('#mv-com-btnLike').click(() => {
        $('#mv-com-btnRecent').removeClass('on');
        $('#mv-com-btnLike').addClass('on');
        $('#mv-com-btnScore').removeClass('on');
    });
    $('#mv-com-btnScore').click(() => {
        $('#mv-com-btnRecent').removeClass('on');
        $('#mv-com-btnLike').removeClass('on');
        $('#mv-com-btnScore').addClass('on');
    });

    // point <!-- 1. 연출 2. 스토리 3. 영상미 4. 배우 5. ost --> 순으로
    // 3개 이상이면 순위 높은거 하나 출력 + n
    
    // 체크박스로 




    // 실관람평 좋아요 누르면 색상 변경 및 좋아요 1 상승 / 한번 더 누르면 취소
    // 현재 클래스 속성으로 만들어서 모든 버튼이 활성화되는데
    // 백엔드 들어가면 회원의 id 값에 따라 다르게 만들것.
    $('.mv-com-main-btn').click(() => {
        let like = parseInt($('.mv-com-like-count').html());
        if ($('.mv-com-main-btn').hasClass('on')) {
            $('.mv-com-main-btn').removeClass('on');
            $('.mv-com-like-img').attr('src', 'https://img.megabox.co.kr/static/pc/images/common/ico/ico-like-g.png')
            like = like - 1;
            $('.mv-com-like-count').html(like);
        } else {
            $('.mv-com-main-btn').addClass('on');
            $('.mv-com-like-img').attr('src', '/views/movie/image/likeFull.png')
            like += 1;
            $('.mv-com-like-count').html(like);
        }
    });


    // 선택된 버튼 색상 변경 및 커서 기본으로 변경
    $('.mv-com-btnlist').children('.on').css({
        'border': '1px solid #AF2D2D',
        'background-color': '#AF2D2D',
        'color': 'white',
        'cursor': 'auto'
    });


    // 관람평 쓰기 버튼을 누르면 body에 overflow:hidden 속성 주기
    $('.mv-com-btn-write').on('click', () => {
        $('.mv-com-write-bg').css('display', 'block')
        $('body').attr('')
    });

    $('.mv-com-write-btn-cancle').on('click', () => {
        $('.mv-com-write-bg').css('display', 'none')
    });

	// 등록 버튼을 누르면 별점과 textarea의 innerHTML의 값과 관람포인트의 값들의 문자열이 Post 방식으로
	// 서버에 넘어감
    $('.mv-com-write-btn-submit').on('click', () => {
//        alert($('#mv-com-write-textarea').val());
//        alert($('#score').val());
//		alert($('#movie-no').html());
        let comment = $('#mv-com-write-textarea').val();
        let ele = '';
        let score = $('#score').val();
        let movieNo = $('#movie-no').html();
        if ($('#mv-com-write-point-btn-ele1').css('background-color') == 'rgb(175, 45, 45)' ) {
            ele += $('#mv-com-write-point-btn-ele1').html();
        }
        if ($('#mv-com-write-point-btn-ele2').css('background-color') == 'rgb(175, 45, 45)' ) {
            ele += ` ${$('#mv-com-write-point-btn-ele2').html()}`;
        }

        if ($('#mv-com-write-point-btn-ele3').css('background-color') == 'rgb(175, 45, 45)' ) {
            ele += ` ${$('#mv-com-write-point-btn-ele3').html()}`;
        }
        if ($('#mv-com-write-point-btn-ele4').css('background-color') == 'rgb(175, 45, 45)' ) {
            ele += ` ${$('#mv-com-write-point-btn-ele4').html()}`;
        }
        if ($('#mv-com-write-point-btn-ele5').css('background-color') == 'rgb(175, 45, 45)' ) {
            ele += ` ${$('#mv-com-write-point-btn-ele5').html()}`;
        }

        // ele는 요소+공백+요소 형태
        // console.log(ele);


        $.ajax ({
            type: 'post',
            url: '/movie/comment',
            data: {
                comment,
                ele,
                score,
                movieNo
            },
            success: (data) => {
                console.log(data);
            },
            error: function (error) {
                console.log(`status: ${error.status}`);
            }

        });

        $('.mv-com-write-bg').css('display', 'none')
    });

    // 별점 버튼 클릭하면 색 칠해지고 점수 나타내기


    // 관람포인트 클릭하면 색상 변경
    $('#mv-com-write-point-btn-ele1').on('click', () => {
        if ( $('#mv-com-write-point-btn-ele1').css('background-color') == 'rgb(235, 235, 235)' ) {
            $('#mv-com-write-point-btn-ele1').css({
                'background-color': 'rgb(175, 45, 45)',
                'color': 'white'
            })
            
        } else {
            $('#mv-com-write-point-btn-ele1').css({
                'background-color': 'rgb(235, 235, 235)',
                'color': 'black'
            })
        }
    });
    $('#mv-com-write-point-btn-ele2').on('click', () => {
        if ( $('#mv-com-write-point-btn-ele2').css('background-color') == 'rgb(235, 235, 235)' ) {
            $('#mv-com-write-point-btn-ele2').css({
                'background-color': 'rgb(175, 45, 45)',
                'color': 'white'
            })
        } else {
            $('#mv-com-write-point-btn-ele2').css({
                'background-color': 'rgb(235, 235, 235)',
                'color': 'black'
            })
        }
    });
    $('#mv-com-write-point-btn-ele3').on('click', () => {
        if ( $('#mv-com-write-point-btn-ele3').css('background-color') == 'rgb(235, 235, 235)' ) {
            $('#mv-com-write-point-btn-ele3').css({
                'background-color': 'rgb(175, 45, 45)',
                'color': 'white'
            })
        } else {
            $('#mv-com-write-point-btn-ele3').css({
                'background-color': 'rgb(235, 235, 235)',
                'color': 'black'
            })
        }
    });
    $('#mv-com-write-point-btn-ele4').on('click', () => {
        if ( $('#mv-com-write-point-btn-ele4').css('background-color') == 'rgb(235, 235, 235)' ) {
            $('#mv-com-write-point-btn-ele4').css({
                'background-color': 'rgb(175, 45, 45)',
                'color': 'white'
            })
        } else {
            $('#mv-com-write-point-btn-ele4').css({
                'background-color': 'rgb(235, 235, 235)',
                'color': 'black'
            })
        }
    });
    $('#mv-com-write-point-btn-ele5').on('click', () => {
        if ( $('#mv-com-write-point-btn-ele5').css('background-color') == 'rgb(235, 235, 235)' ) {
            $('#mv-com-write-point-btn-ele5').css({
                'background-color': 'rgb(175, 45, 45)',
                'color': 'white'
            })
        } else {
            $('#mv-com-write-point-btn-ele5').css({
                'background-color': 'rgb(235, 235, 235)',
                'color': 'black'
            })
        }
    });




});


