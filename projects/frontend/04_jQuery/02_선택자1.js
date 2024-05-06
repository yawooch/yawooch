$(document).ready(function(){
// $(() => {
    //1. 태그 선택자
    // p 태그들을 조회해서 글자색은 흰색, 배경색은 빨간색으로 변경
    $('p').css('color', 'white');
    $('p, h5').css('background-color', 'red');

    // 2. 아이디 선택자
    // 1) 자바스크립트
    document.getElementById('heading1').style.color = 'red';
    //2) jQuery
    $('#heading2').css('color', 'deeppink');

    //3. 클래스 선택자
    // 클래스 속성의 값이
    // item인 요소들을 찾아서 글자색은 흰색, 배경색은 녹색으로 변경
    // 1) 자바스크립트
    let items = document.getElementsByClassName('item');

    for(const item of items){
        item.style.color = 'white';
        item.style.backgroundColor = 'yellowgreen';
    }

    // items.array.forEach(element => {
    //     console.log(element);
        // element.style.color = 'white';
        // element.style.backgroundColor = 'green';
    // });

    //2) jQuery
    $('.item').css({color:'red', backgroundColor : 'green'});
    
});