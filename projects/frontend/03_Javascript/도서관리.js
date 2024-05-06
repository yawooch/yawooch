window.onload = ()=>{
    let btnSubmit = document.getElementById('btnSubmit');
    let btnReset = document.getElementById('btnReset');

    btnReset.addEventListener('click', (event) => {
        let inputs = document.getElementsByClassName('input-form');
        console.log(inputs[0]);
        for(let i = 0;i < 6; i ++ )
        {
            inputs[i].setAttribute('value', '');
        }
    });
    btnSubmit.addEventListener('click', (event) => {
        event.preventDefault();

        let inputs    = document.getElementsByClassName('input-form');
        let resultDiv = document.getElementsByClassName('resultDiv')[0];

        resultDiv.innerHTML = `<h3>도서정보</h3>`;
        resultDiv.innerHTML += `도서명   : ${inputs[0].value}<br>`;
        resultDiv.innerHTML += `분류     : ${inputs[1].value}<br>`;
        resultDiv.innerHTML += `ISBN     : ${inputs[2].value}<br>`;
        resultDiv.innerHTML += `발행일자 : ${inputs[3].value}<br>`;
        resultDiv.innerHTML += `쪽수     : ${inputs[4].value}<br>`;
        resultDiv.innerHTML += `재고     : ${inputs[5].value}<br>`;
    });
}
