$(document).ready(() => {
    //1. Filtering 메소드

    // 선택된 요소들 중 첫 번째 요소의 스타일 변경
    // $('h4').first().css('font-size', '2em');
    // $('h4:first').css('font-size', '2em');
    $('h4').filter(':first').css('font-size', '2em');

    // 선택된 요소들 중 마지막 요소의 스타일 변경
    // $('h4').last().css('font-size', '2em');
    $('h4').filter(':last').css('font-size', '2em');

    // 선택된 요소들 중 다섯번째 요소의 텍스트 변경
    // $('h4').eq(4).text('eq()에 의해서 선택되었습니다.');
    // $('h4:eq(4)').text('eq()에 의해서 선택되었습니다.');
    $('h4').filter(':eq(4)').text('eq()에 의해서 선택되었습니다.');

    //선택된 요소들 중 홀수 인덱스 요소들의 스타일 변경
    // $('.test').odd().css({backgroundColor: 'pink'});
    // $('.test:odd').css({backgroundColor: 'pink'});
    $('.test').filter(':odd').css({backgroundColor: 'pink', color: 'white'});
    
    //선택된 요소들 중 짝수 인덱스 요소들의 스타일 변경
    // $('.test').even().css({backgroundColor: 'yellowgreen', color: 'white'});
    // $('.test:even').css({backgroundColor: 'yellowgreen', color: 'white'});
    $('.test').filter(':even').css({backgroundColor: 'yellowgreen', color: 'white'});
    

    //선택된 요소들 중 특정 요소가 아닌 요소들의 스타일변경
    // $('h4').not('.test').css({backgroundColor : 'red',color :'green'});
    // $('h4:not(.test)').css({backgroundColor : 'red',color :'green'});
    $('h4').filter(':not(.test)').css({backgroundColor : 'red',color :'green'});


    // 선택된 요소들 중 특정 요소가 존재하는지 확인후 스타일변경
    //$('h4').is(':not(.test)');//있으면 true , 없으면 false를 반환
    // $('h4').filter((index,element)=>{
    //     // return index %3 ===0
    //     return $(element).is(':not(.test)');
    // }).css('font-size' ,'3em');

    //2. Ancestors 메소드
    /// span 요소의 부모요소를 선택
    // $('span').parent().css({color:'red',border:'2px solid'});
    // $('li').parents().css({color:'blue'});
    // $('li').parentsUntil().css({border:'2px solid'});
    // $('li').parents('div').css('border','2px dotted');


    // span 요소부터 div 요소 이전까지의 상위 요소를 선택
    // $('span').parentsUntil('div').css('background-color','lightgreen');

    //3. Descendats메소드
    let style1 = {color: 'red',border:'2px solid'};
    let style2 = {color: 'blue',border:'2px solid'};
    let style3 = {color: 'green',border:'2px solid'};
    let style4 = {color: 'purple',border:'2px solid'};
    let style5 = {color: 'coral',border:'2px solid'};

    //클래스 속성값이 wrap인 요소의 자식 요소들을 선택
    // $('.wrap').children().css(style1);
    //클래스 속성값이 wrap 요소의 자식의 자식 요소들을 선택
    // $('.wrap').children().children().css(style2);
    //클래스 속성값이 wrap 요소의 자식의 자식 요소중 ul 요소를 선택
    // $('.wrap').children().children('ul').css(style3);
    //클래스 속성값이 wrap 요소의 자식의 자식의 자식 요소중 li 요소를 선택
    // $('.wrap').children().children().children('li').css(style4);
    //클래스 속성값이 wrap인 요소의 모든 하위 요소 중 li 요소를 선택
    // $('.wrap').find('li').css(style4);

    //클래스 속성값이 wrap인 요소의 모든 하위 요소중 span 요소를 선택
    // $('.wrap').find('span').css(style5);

    //4. Sideways 메소드
    //h2 요소의 모든 형제 요소들을 선택
    $('.wrap>h2').siblings().css(style1);

    //h2 요소의 형제 요소 중 p 요소들을 선택
    $('.wrap>h2').siblings('p').css(style2);

    //h2 요소의 다음 요소를 선택
    $('.wrap>h2').next().css(style3);

    //h2 요소의 다음에 오는 모든 형제 요소들을 선택
    $('.wrap>h2').nextAll().css('backgroundColor', 'pink');
    $('.wrap>h2').nextUntil().css('font-size', '3em');
    
    //h2 요소이후부터 p 요소 이전에 모든 형제 요소들을 선택
    $('.wrap>h2').nextUntil('p').css('border-style', 'dashed');

    //h2  이전 형제 요소를 선택
    $('.wrap>h2').prev().css(style4);

    //h2  요소의 이전에 오는 모든 형제 요소들을 선택
    $('.wrap>h2').prevAll().css('backgroundColor', 'orange');
    $('.wrap>h2').prevAll().css('font-size', '3em');
    
    
    //h3 요소이전부터 p 요소 이후까지 모든 형제 요소들을 선택
    $('.wrap>h3').prevUntil('p').css('border-style', 'dotted');



});