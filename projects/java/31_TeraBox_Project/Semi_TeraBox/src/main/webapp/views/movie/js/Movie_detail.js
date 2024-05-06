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
    // https://sisiblog.tistory.com/301
    // https에서만 사용 가능
    $('#mv-link').click(() => {
        alert(location.href);
        // navigator.clipboard.writeText(location.href).then(() => {
        //     alert('복사 성공')
        // }, () => {
        //     alert('복사 실패')
        // });
    });
    
    // 더보기 버튼을 통해서 소개글을 짧게 보거나 전체 보기 기능 
    // + 더보기 버튼 기본 상태 더보기 -> 누르면 닫기로 텍스트 변경
    $('#mv-moreText').click(() => {
        if ($('#mv-moreText').hasClass('off')) {
            $('.mv-small-p').css({
                'height': '100%',
                'overflow': 'visible'
            });
            $('#mv-moreText').html('닫기');
            $('#mv-moreText').removeClass('off');
            $('#mv-moreText').addClass('on');
        } else {
            $('.mv-small-p').css({
                'height': '65px',
                'overflow': 'hidden'
            });
            $('#mv-moreText').html('더보기');
            $('#mv-moreText').removeClass('on');
            $('#mv-moreText').addClass('off');
        } 
    })


    // 더보기 버튼을 통해 스틸컷 개수 늘리기
    // db 조회해서 10개씩 이미지 추가하기 - 기본 10개
    // 이거는 jsp 단계에서 해야 할 듯함
    // 단순히 10개의 게시글을 추가하고 전부 조회되면 버튼이 사라지는 기능 구현

    // 아니라면 overflow: hidden?
    $('#mv-moreImage').click(() => {
        // $('.grid').append(
        //     '<div class="grid-item mv-block"></div>'
        // );
        // $('.grid-item').last().append(
        //     '<img src="https://img.megabox.co.kr/SharedImg/2023/10/25/UEatauRh0hZO3UZSo07PnHebGTskbXCY_1100.jpg"></img>'
        // );
    })


    
});