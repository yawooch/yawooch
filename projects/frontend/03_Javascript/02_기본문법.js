//1. 변수
//1) 변수 선언
//전역 변수 선언
str1 = '전역변수';
var str2 = 'var 전역변수';
let str3 = 'let 전역변수';
const str4 = 'const 전역변수';

/* console.log(str1);
console.log(str2);
console.log(str3);
console.log(str4); */

// 전역으로 선언된 함수는 window 객체로 
//내부에 포함된다.
// * window 객체는 this로 사용하는 것보다 window로 사용하는 것이 안전하다.
function add(a, b){
    return a+b;
}

//onload 속성은 자바스크립트에서 페이지가 모두 로드되면 실행될 함수를 구현할때 사용한다.
window.onload = function(){
/*     var h2 = document.getElementById('heading2');
    h2.style.backgroundColor = 'red'; */
    str3 = 'str3-1';
    //전역변수를 사용할때 같은 지역내에 동일한 
    //변수명을 가진 지역변수가 있으면 전역변수를 사용할수 없네...
    /* var str3 = 'str3';
    str3 = 'str3-2'; */
    var str4 = 'var 지역변수';
    str4 = 'str4 지역변수';
    let str5 = 'let 지역변수';
    str6 = '전역변수';
    var str7;



    //전역변수와 동일한 이름의 지역변수를 선언
    //전역변수와 지역변수가 동일한 이름인 경우, 함수 내부에서 사용하면 
    //지역변수가 우선권을 가진다.
    var str2 = 'var 지역변수';

    console.log(str1);
    console.log(str2);
    console.log(str3);
    console.log(str4);
    console.log(str5);
    console.log(str6);
    console.log(str7);
    console.log('----------------------------------------------------');
    
    console.log('//var, let, const(상수)의 차이점');
    console.log('//1) 중복 선언');
    //var, let, const(상수)의 차이점
    //1) 중복 선언
    // var 키워드로 선언된 변수는 중복 선언이 가능하다.
    var num = 0;
    console.log(num);
    
    var num = 10;
    console.log(num);
    
    var num = 20;
    console.log(num);
    console.log('----------------------------------------------------');
    
    console.log('//let, const(상수) 키워드로 선언된 변수');
    //let, const(상수) 키워드로 선언된 변수
    let num2 = 10;
    console.log(num2);
    
    //에러 발생 - 블록 범위 변수 'num2'을(를) 다시 선언할 수 없습니다.
    /* let num2 = 20;
    console.log(num2); */
    
    const num3 =10; //선언과 동시에 초기화 해야한다.
    console.log(num3);
    
    //상수는 값의 재할당이 불가능하다.
    //num3 = 20;//Uncaught TypeError: Assignment to constant variable.
    
    //중복선언 불가능하다.    
    //const num3 =20; //Identifier 'num3' has already been declared
    console.log('----------------------------------------------------');
    console.log('// 2) 유효 범위(스코프)');
    // 2) 유효 범위(스코프)
    // 함수 안에서 var 키워드로 선언된 변수는 함수 내 유효범위를 갖는다.
    if(true){
        var num4 = 10;
        console.log(num4);
    }
    console.log(num4);// 이부분은 실행은 되지만 onload 함수가 종료됨과 함께 변수는 소멸한다.
    
    //함수 안에서 let, const 키워드로 선언된 변수는 블록 내 유효 범위를 갖는다.
    if(true){
        let num5 = 50;
        const num6= 60;
        console.log(num5);
        console.log(num6);
    }
    //console.log(num5);//Uncaught ReferenceError: num5 is not defined
    //console.log(num6);//Uncaught ReferenceError: num6 is not defined
    console.log('----------------------------------------------------');
    console.log('// 3) 호이스팅 동작 방식');
    // 3) 호이스팅 동작 방식
    //var 키워드로 선언한 변수는 변수 호이스팅에 의해 undefined 가 출력된다.
    // 변수의 선언문이 코드의 선두로 끌어 올려진 것처럼 
    // 동작하는 자바스크립트의 고유한 특징을 변수 호이스팅이라고 한다.
    console.log(num7);
    var num7 = 70;
    console.log(num7);
    
    //console.log(num8);
    //let. const 키워드로 선언한 변수는 변수 호이스팅이 발생하지 않는 것처럼 동작한다.
    let num8= 80;
    //console.log(num9);
    const num9 =90;
    
    console.log('----------------------------------------------------');
    console.log('// 4) 전역변수 동작 방식');
    // 4) 전역변수 동작 방식
    // (1) var 키워드로 선언한 전역변수와 키워드를 선언하지 않은 전역 변수는 
    //      window 객체 내부에 포함된다.
    // (2) let, const 선언한 전역 변수는 window 객체에 포함되지 않는다.
    console.log(this.str1);
    console.log(window.str1);
    console.log(this.str2);
    console.log(window.str2);
    console.log(this.str3);
    console.log(window.str3);

};
function typeTest(){
    let name    = '홍길동';
    let age     = 20;
    let height  = 183.5;
    let check   = false;
    let hobbies = ['축구','야구','농구'];
    //함수
    let addFunc = function(x,y){
        return x+y;
    }
    let user = {
        id:'hong123',
        name:'홍길동',
        age: 20,
        height:183.5,
        /* hobbies : ['축구','야구','농구'] */
        /* hobbies : hobbies */
        hobbies,
        addFunc
    };


    let div1 = document.getElementById('div1');

    console.log(hobbies);
    console.log(user);
    console.log(addFunc(10,20));

    div1.innerHTML = '<h4 class="h4style">안녕하세요</h4>'
    div1.innerHTML += `name    : ${name}   , type: ${typeof(name)}<br>`;
    div1.innerHTML += `age     : ${age}    , type: ${typeof(age)}<br>`;
    div1.innerHTML += `height  : ${height} , type: ${typeof(height)}<br>`;
    div1.innerHTML += `check   : ${check}  , type: ${typeof(check)}<br>`;
    div1.innerHTML += `hobbies : ${hobbies}, type: ${typeof(hobbies)}<br>`;
    div1.innerHTML += `user    : ${user}   , type: ${typeof(user)}<br>`;
    div1.innerHTML += `addFunc : ${addFunc}, type: ${typeof(addFunc)}<br>`;
}

function plusTest(){
    let result1 = 7 + 7.0;// 14 
    let result2 = 7 + '7';//'77'
    let result3 = 7 + + 7 + '7';//'147'
    let result4 = '7' + ( 7 + 7);//'714'
    let result5 = 7 * '7';//49
    let result6 = '7' - 3 ;//4
    let result7 = '7' * '7';//49
    let result8 = '7' * 'a';//NaN

    let div2 = document.getElementById('div2');
    div2.innerHTML = '<h4 class="h4style">안녕하세요</h4>';
    div2.innerHTML += `result1: ${result1}, type: ${typeof result1}<br>`;
    div2.innerHTML += `result2: ${result2}, type: ${typeof result2}<br>`;
    div2.innerHTML += `result3: ${result3}, type: ${typeof result3}<br>`;
    div2.innerHTML += `result4: ${result4}, type: ${typeof result4}<br>`;
    div2.innerHTML += `result5: ${result5}, type: ${typeof result5}<br>`;
    div2.innerHTML += `result6: ${result6}, type: ${typeof result6}<br>`;
    div2.innerHTML += `result7: ${result7}, type: ${typeof result7}<br>`;
    div2.innerHTML += `result8: ${result8}, type: ${typeof result8}<br>`;
}

function castingTest(){
    let div3 = document.getElementById('div3');

    // 문자열 -> 숫자
    div3.innerHTML = '<h4 class="h4style"> 안녕하세요.</h4>';
    div3.innerHTML += `// 문자열 -> 숫자<br>`;
    //window 객체에 생성되어있는 형변환 생성자 함수
    div3.innerHTML += `${Number('3')}, type: ${typeof(Number('3'))}<br>`;
    //window 객체에 생성되어있는 형변환 내장 함수
    div3.innerHTML += `${parseInt('4')}, type: ${typeof(parseInt('4'))}<br>`;
    div3.innerHTML += `${parseFloat('5.2')}, type: ${typeof(parseFloat('5.2'))}<br>`;
    
    // 숫자 -> 문자열
    div3.innerHTML += `// 숫자 -> 문자열<br>`;
    //window 객체에 생성되어있는 형변환 생성자 함수
    div3.innerHTML += `${String(3)}, type: ${typeof(String(3))}<br>`;
    div3.innerHTML += `${4 + ''}, type: ${typeof(4 + '')}<br>`;

}

function opTest(){
    let div4 = document.getElementById('div4');

    div4.innerHTML = '<h4 class="h4style">안녕하세요</h4>';
    div4.innerHTML += `5 ==   5  : ${5==   5}<br>`;
    div4.innerHTML += `5 ==  '5' : ${5==  '5'}<br>`;
    div4.innerHTML += `5 ===  5  : ${5===  5}<br>`;
    div4.innerHTML += `5 === '5' : ${5=== '5'}<br>`;
    
    div4.innerHTML += `5 !=   5  : ${5!=   5}<br>`;
    div4.innerHTML += `5 !=  '5' : ${5!=  '5'}<br>`;
    
    div4.innerHTML += `5 !==  5  : ${5!==  5}<br>`;
    div4.innerHTML += `5 !== '5' : ${5!== '5'}<br>`;
    
}
function forTest(){
    let array = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1];
    let user = {
        name :'홍길동',
        age:25,
        height:180.5
    };
    console.log(user);
    let div5 = document.getElementById('div5');

    div5.innerHTML = '<h4 class="h4style">안녕하새오</h4>';   
    div5.innerHTML += 'for(var i = 0; i &lt;array.length; i++){ <br>';   

    for(var i = 0; i <array.length; i++){
        const element = array[i];
        div5.innerHTML += `${element} `;
    }

    //for in 구문
    div5.innerHTML += '<br>for(let i in array)<br>';   
    
    //배열의 경우 반복 변수에 array의 index값을 순서대로 담아서 반복시킨다.
    for(let i in array){
        div5.innerHTML += `${array[i]} `;
    }
    
    div5.innerHTML += '<br>for(let value of  array)<br>';   
    //for of
    //배열의 경우 반복 변수에 array 의 value값을 순서대로 담아서 반복시킨다.
    for(let value of  array){
        div5.innerHTML += `${value} `;
    }
    div5.innerHTML += '<br>';
    div5.innerHTML += "<br>user for in<br>";   
    
    for (const key in user) {
        console.log(user[key]);
        div5.innerHTML += `${key}, type: ${typeof(key)}, value: ${user[key]}<br>`;
    }
    //for of 구문
    div5.innerHTML += "<br>user for of<br>";   
    for(const key of user) {
        console.log(user[key]);
        div5.innerHTML += `${key}, type: ${typeof(key)}, value: ${user[key]}<br>`;
    }

}