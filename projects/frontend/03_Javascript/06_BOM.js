let timerId = 0;
window.onload = function(){
    
    //1. window 객체
    //1) window.open();
    let btn1 = document.getElementById('btn1');
    btn1.addEventListener('click', ()=>{
        //window.open('URL', '창이름', '특성');
        // window.open();
        // window.open('www.naver.com', 'naver');
        //'특성'의 경우에 브라우저마다 다르게 동작하기 때문에 
        // 정상적으로 동작하는지 꼭 확인해야한다
        window.open('https://www.naver.com', 'naver', 'width=1000px,height=300px');
    });

    //2) 타이머(Timer)
    //window.setTimeout()
    let btn2 = document.getElementById('btn2');
    btn2.addEventListener('click', () => {
        let newWindow = window.open();
        //일정 시간 후에 콜백 함수를 한번 실행한다.
        // newWindow.alert('창을 닫으면 3초 후에 폭파됩니다.');
        // window.setTimeout(() => {
        //     newWindow.alert('펑!!');
        //     newWindow.close();
        // }, 3000);
        let timerid = window.setTimeout(() => {newWindow.close();},2000);
        //타이머 ID를 clearTimeout()에 전달하면 해당 ID의 타이머를 취소할수 있다.
        window.clearTimeout(timerid);

        //새 창에서 부모창에 접근하는 방법
        // newWindow.document.body.innerHTML = '<h1>제목</h1>';
        //let opener= window.opener;
        //let h2 = opener.document.body.getElementByTagName('h2');
        // h2.innerHTML = '새창에서 값 변경'
        
    });
    
    //window.setInterval()
    let btn3 = document.getElementById('btn3');
    let btnStart = document.getElementById('btnStart');
    let btnStop = document.getElementById('btnStop');


    btnStart.addEventListener('click', () => {
        let div1 = document.getElementById('div1');
        
        timerId = window.setInterval(() => {
            let now = new Date();
            div1.innerHTML = `${now.getHours()} : ${now.getMinutes()} : <span id="seconds">${now.getSeconds()}</span> : <span id="milliseconds">${now.getMilliseconds()}</span>`;
        }, 1);

    });
    btnStop.addEventListener('click', () => {
        //타이머 ID를 전달하면 해당 ID 의 타이머를 취소할수 있다.
        window.clearInterval(timerId);
    });

    btn3.addEventListener('click', () => {
        let div1 = document.getElementById('div1');
        
        timerId = window.setInterval(() => {
            let now = new Date();
            div1.innerHTML = `${now.getHours()} : ${now.getMinutes()} : <span id="seconds">${now.getSeconds()}</span> : <div id="milliseconds">${now.getMilliseconds()}</div>`;
        }, 1);
    });
    
    timerId = window.setInterval(() => {
        let now = new Date();
        div1.innerHTML = `${now.getHours()} : ${now.getMinutes()} : <span id="seconds">${now.getSeconds()}</span> : <div id="milliseconds">${now.getMilliseconds()}</div>`;
    }, 1);
}
