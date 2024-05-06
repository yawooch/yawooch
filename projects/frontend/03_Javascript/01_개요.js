
var btn2 = document.getElementById('btn2');

/* btn2.onclick = function(e){
    console.log('"' + btn2.textContent + '" 버튼 클릭!!');
    console.log(btn2.textContent + ' textContent');
    console.log(btn2.innerText + ' innerText');
    console.log(btn2.innerHTML + ' innerHTML');
}; */
/* 
btn2.addEventListener('click',function(e){
    console.log(btn2);
    console.log(btn2.textContent + ' textContent');
    console.log(btn2.innerText + ' innerText');
    console.log(btn2.innerHTML + ' innerHTML');
}); */

function consolePrint(){
    console.log('"' + btn2.textContent + '" 버튼 클릭!!');
}

btn2.onclick = consolePrint; // 함수의 대입
/* consolePrint();//함수의 호출 */