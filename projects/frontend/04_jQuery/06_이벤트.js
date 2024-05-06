$(document).ready(() => {
    //1. 이벤트 연결
    //1) on(), off()
    // $('#div1').on('mouseenter', (event) => {
    //     let element = event.target;
    //     element.style.backgroundColor = 'green';
    //     element.style.color = 'white';
    //     element.innerText = '마우스 올라감';
    // });
    // $('#div1').on('mouseleave', (event) => {
    //     $(event.target).css({backgroundColor: 'red', color : 'white'}).text('마우스 내려감');
    // });
    // $('#div1').on('click', (event) => {
    //     $(event.target).css({backgroundColor: 'white', color : 'black'}).text('')
    //     // .off('mouseenter').off('mouseleave').off('click');
    //     .off('mouseenter mouseleave click');
    // });

    // $('#div1').on('mouseenter mouseleave click', (event) => {
    //     console.log(event.type);
    //     if(event.type === 'mouseenter'){
    //         $(event.target).css({backgroundColor: 'green', color : 'white'}).text('마우스 올라감');
    //     }
    //     else if(event.type === 'mouseleave'){
    //         $(event.target).css({backgroundColor: 'red', color : 'white'}).text('마우스 내려감');
    //     }
    //     else if(event.type === 'click'){
    //     $(event.target).css({backgroundColor: 'white', color : 'black'}).text('')
    //     .off('mouseenter mouseleave click');
    //     }
    // });

    $('#div1').on({
        mouseenter:(event)=> {
            $(event.target).css({backgroundColor: 'green', color : 'white'}).text('마우스 올라감');
        },
        mouseleave:(event)=> {
            $(event.target).css({backgroundColor: 'red', color : 'white'}).text('마우스 내려감');
        },
        click:(event)=> {
            $(event.target).css({backgroundColor: 'white', color : 'black'}).text('')
            .off('mouseenter mouseleave click');
        }
    });

    //2). one() 메소드 
    $('#div2').one('mouseenter mouseleave click', (event) => {
        if(event.type === 'mouseenter'){
            $(event.target).css({backgroundColor: 'green', color : 'white'}).text('마우스 올라감');
        }
        else if(event.type === 'mouseleave'){
            $(event.target).css({backgroundColor: 'red', color : 'white'}).text('마우스 내려감');
        }
        else if(event.type === 'click'){
            $(event.target).css({backgroundColor: 'white', color : 'black'}).text('처음이자 마지막으로 이벤트 핸드러 실행')
            .off('mouseenter mouseleave click');
        }
    });


    // 2. 키보드 이벤트
    // 1) keydown, keypress, keyup
    // 키보드 눌려질때
    $('#textarea1').keydown((event) => {
        console.log(`keydown : ${event.key}, ${event.keyCode}`);
    });
    // 글자가 입력될때 발생하는 이벤트(한글, 기능키, 펑션기 사용못함)
    $('#textarea1').keypress((event) => {
        console.log(`keypress : ${event.key}, ${event.keyCode}`);
    });
    //키보드가 떼어질때
    $('#textarea1').keyup((event) => {
        console.log(`keyup : ${event.key}, ${event.keyCode}`);
    });

    //2) 동적으로 글자수 세기
    $('#textarea2').keyup((event) => {
        // console.log(event.key);
        let target = $(event.target);
        let currentLength = target.val().length;
        let maxLength = parseInt($('#maxLength').text());

        console.log(currentLength , maxLength);
        if(currentLength > maxLength){
            target.val(target.val().substr(0,maxLength));
        }
        else{
            $('#currentLength').text(currentLength);
        }
    });
    // 3) 동적으로 아이디 조건 확인
    $('#userId').keyup((event) => {
        let userId = event.target.value;
        let regExp = /^[a-z][a-zA-Z0-9]{3,11}$/;

        if(userId === null || userId === ''){
            $('#idCheck').text('').removeClass('text-info text-danger');
        }
        else if(regExp.test(userId)){
            $('#idCheck').text('사용 가능한 아이디입니다.').addClass('text-info').removeClass('text-danger');
        }
        else{
            $('#idCheck').text('사용 불가능한 아이디입니다.').addClass('text-danger').removeClass('text-info');
        }
        console.log(userId);
    });
    
    // 3) 동적으로 아이디 조건 확인
    $('#div3').click((event) => $(event.target).toggleClass('bg-hotpink'));
    $('#btn1').click((event) => $('#div3').trigger('click'));
});