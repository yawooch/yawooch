
//5) 기본 이벤트 제거 2
function passwordCheck(){
    let pass1 = document.getElementById('pass1');
    let pass2 = document.getElementById('pass2');

    if(pass1.value !== pass2.value){
        alert('비밀번호가 일치하지 않습니다.');
        pass1.value = '';
        pass2.value = '';

        pass1.focus();

        return false;
    }
    
    return true;
}

window.onload = () => {
    //2) 프로퍼티 방식
    let btn1 = document.getElementById('btn1');

    // btn1.onclick = function(event){//(1).
    btn1.onclick = (event) => {
        // console.log(arguments);//(1).
        console.log(event);
        console.log(event.target);
        // console.log(this);//요소객체를 가리킨다. (1).
        console.log(this);//window 객체를 가리킨다.

        btn1.onclick = null;//이벤트 핸들러 제거
    }
    // 'onchange'이벤트 에서  'on' 을 빼주어야 addEventListener의 값에 넣을수 있다.
    // btn1.addEventListener('change', ()=>{})

    //3) 메소드 방식    
    let btn2 = document.getElementById('btn2');

    btn2.addEventListener('click', function(event) {
        console.log(event);
        console.log(event.target);
        console.log(this);//요소 객체를 가리킨다.
    });
    btn2.addEventListener('click', (event) => {
        console.log('================ 절취선 =====================');
        console.log(event);
        console.log(event.target);
        console.log(this);//window 객체를 가리킨다.
    });

    function clickEventTest(){
        console.log('---------------');
        console.log('clickEventTEst() - 호출');
    }

    btn2.addEventListener('click', clickEventTest);
    btn2.removeEventListener('click', clickEventTest);

    //5) 기본 이벤트 제거 2
    let btnSubmit = document.getElementById('btnSubmit');

    // btnSubmit.onclick = () => {
    //     let pass1 = document.getElementById('pass1');
    //     let pass2 = document.getElementById('pass2');
    
    //     console.log(pass1.value);

    //     if(pass1.value !== pass2.value){
    //         alert('비밀번호가 일치하지 않습니다.');
    //         pass1.value = '';
    //         pass2.value = '';
    
    //         pass1.focus();
    
    //         return false;
    //     }
        
    //     return true;       
    // }
    
    btnSubmit.addEventListener('click' , (event) => {
        let pass1 = document.getElementById('pass1');
        let pass2 = document.getElementById('pass2');
    
        if(pass1.value !== pass2.value){
            alert('비밀번호가 일치하지 않습니다.');
            pass1.value = '';
            pass2.value = '';
            pass1.focus();

            //메소드 방식에서는 아래와 같이 기본 이벤트를 제거히야한
            event.preventDefault();
        }
    });
    
    // let btnSubmit2 = document.getElementById('btnSubmit2');

    // btnSubmit2.addEventListener('click', (event) => {
    //     let userId = document.getElementById('userId');
    //     let regExp = /^[a-zA-Z0-9]{5,12}$/;

    //     console.log(userId.value);

    //     if(!regExp.test(userId.value))
    //     {
    //         alert('아이디를 정상적으로 입력해주세요');

    //         event.preventDefault();
    //     }

    // });
}
function checkId(){
    let userId = document.getElementById('userId');
    console.log(userId.value);

    userId.value.array.forEach(element => {
        console.log(element);
    });

    if(userId.value.length >=5 || userId.value.length <=12){
        alert('영문자, 숫자로만 총 5~ 12자 사이로 입력구다사이~');
        return false;
    }
    
    return false;
    // return true;
}
