//문제 1
function checkLength(){
    let inputStr = document.getElementsByTagName('input')[0].value;
    let outputStr = `보기의 문자열의 길이는 ${inputStr.length}글자입니다.`;
    
    document.getElementById('lengthOutput').innerHTML = outputStr;
}

//문제 2
function devideWord(){
    let inputStr  = document.getElementsByTagName('label')[0].innerText;
    let words     = inputStr.split(',');
    let outputStr = '';

    for(let i =0; i < words.length; i++)        
    {
        outputStr += (i+1) + '. ' + words[i] +'<br>';
    }
    document.getElementById('wordOutput').innerHTML = outputStr;
}
//문제 3
function miniCalc(op){
    let inputCalc1  = Number(document.getElementById('calcInput1').value);
    let inputCalc2  = Number(document.getElementById('calcInput2').value);
    let outputStr   = '';

    //input[type="number"]에서 넘어온 값이 숫자가 아닐때 *1 해주거나 Number로 쌓을때는 0으로 변경해주는데,
    //parseInt()는 NaN을 출력한다.

    switch (op) {
        case '+' :
            // 실행 코드
            outputStr = inputCalc1 + inputCalc2;
            break;
        case '-' :
            // 실행 코드
            outputStr = inputCalc1 - inputCalc2;
            break;
        case 'x' :
            // 실행 코드
            outputStr = inputCalc1 * inputCalc2;
            break;
        case '/' :
            // 실행 코드
            if(!isFinite(inputCalc1 / inputCalc2))
            {
                document.getElementById('outputCalc').innerHTML = '0으로 나눌 수 없습니다.';
                return;
            }
            outputStr = inputCalc1 / inputCalc2;
            break;
        case '%' :
            // 실행 코드
            if(isNaN(inputCalc1 % inputCalc2))
            {
                document.getElementById('outputCalc').innerHTML = '0으로 나눌 수 없습니다.';
                return;
            }
            outputStr = inputCalc1 % inputCalc2;
            break;
        default:
            // 실행 코드
            outputStr = '올바르지 않은 버튼을 클릭하셨습니다.';
            break;
    }
    document.getElementById('outputCalc').innerHTML = outputStr;
}