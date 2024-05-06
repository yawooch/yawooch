$(document).ready(() => {
    //1. Content 설정
    // 1) html()
    $('#content2').html($('#content1').html());
    $('#content1>a').attr('href', 'https://www.naver.com');
    $('#content2').find('a').prop('href', 'https://www.naver.com');


    // $('.content').html();
    // $('.content').html('ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ');

    $('.content').html(function(index, content){
        console.log(index, content);
        return `<h1>인덱스: ${index}, 내용: ${content}</h1>`;
    });

    //2) text() 메소드
    $('#content4').text($('#content1').text())
    $('.content2').text(function(index, content){
        console.log(index, content);
        return `<h1>인덱스: ${index}, 내용: ${content}</h1>`;
    });

    // 2. 요소 추가
    // 1) 요소 생성
    let p1 = $('<p>').text('제이쿼리로 요소 생성 1');
    let p2 = $('<p>제이쿼리로 요소 생성 2</p>');
    $('#div1').append(p1);
    $('#div1').append(p2);
    // $('#div1').html('<p>제이쿼리로 요소 생성 3</p>');
    $('#div1').append('<p>제이쿼리로 요소 생성 3</p>');
    $('#div1').addClass('bg-success');
    $('#div1').addClass('text-light');


    //2) 요소 추가 1
    //$(A).append(B)
    $('#add1').append('<span>B</span>');
    //$(A).prepend(B)
    $('#add2').prepend('<span>B</span>');
    //$(A).after(B)
    $('#add3').after('<span>B</span>');
    //$(A).before(B)
    $('#add4').before('<span>B</span>');
    
    
    //3) 요소 추가 2
    //$(A).appendTo(B)
    // $('<span>B</span>').appendTo('#add5');
    $('<span>B</span>').appendTo($('#add5'));
    //$(A).prependTo(B)
    $('<span>B</span>').prependTo('#add6');
    //$(A).insertAfter(B)
    $('<span>B</span>').insertAfter('#add7');
    //$(A).insertBefore(B)
    $('<span>B</span>').insertBefore('#add8');

    //3. 요소복제
    //1) 복제할 요소에 이벤트 핸들러 추가
    // $('#item1').hover(
        // (event) => $(event.target).addClass('bg-hotpink').text('왘ㅋ'),
        // (event) => $(event.target).removeClass('bg-hotpink').text('굳ㅋ')
    // );
    $('#item1').hover(
        (event) => $(event.target).toggleClass('bg-hotpink')
        // (event) => $('#item1').toggleClass('bg-hotpink')
        //복제를 이용하여 ID 값이 같을경우 한 요소만
        //이벤트가 적용될수 있다.
    );

    //2)버튼 클릭시 요소를 복제
    $('#btnClone').click(() => {
        let item1 = $('#item1').clone(true);//복제를 안하면 이동된다.

        console.log();
        $('#cloneResult').append(item1);
    });

    //4. 요소삭제
    // 1) 삭제할 요소에 이벤트 핸들러 추가
    $('#item2').hover(
        (event) => $(event.target).toggleClass('bg-hotpink')
    );
    
    //2) remove() 테스트
    $('#btnRemove').click(() => {
        let item2 = $('#item2').remove();

        $('#removeResult').append(item2);
    });

    //3) detach 테스트
    $('#btnDetach').click(() => {
        let item2 = $('#item2').detach();

        console.log(item2);

        $('#removeResult').append(item2);
    });
    
    //4) empty 테스트
    $('#btnEmpty').click(() => {
        $('#removeResult').empty();
    });

    //5. 배열 관리
    $('#eachTest>h4').each((index,element) => {
        console.log(index, element);

        $(element).addClass('bg-hotpink');
    });
});