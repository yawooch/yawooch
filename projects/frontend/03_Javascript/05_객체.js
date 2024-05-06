//생성자 함수
function Student(name, java, oracle){
    //속성 정의
    this.name   = name;
    this.java   = java;
    this.oracle = oracle;

    //메소드 정의
    // this.getSum = function(){
    //     return this.java + this.oracle;
    // }
    // this.getAverage = function(){
    //     return this.getSum() / 2;
    // }
}

//JavaScript 는 흔히 프로토타입 기반 언어(prototype-based Language) 라 불립니다.
// 모든 객체들이 메소드와 속성들을 상속 받기 위해 프로토 타입 객체를 가집니다.
// - 모든 객체들은 하나의 프로토타입을 갖는다 그리고 모든 프로토타입은 
//      생성자 함수와 연결되어 있다.

//프로토타입은 어떤 객체의 상위 객체의 역할을 하는 객체로 공유 속성과 메소드를 제공한다.
//즉, 프로토타입을 상속 받은 상위 객체는 상위객체의 속성과 메소드를 자신의 것처럼 자유롭게 사용할수 있다.
Student.prototype.getSum = function(){
    return this.java + this.oracle;
}
Student.prototype.getAverage = function(){
    return this.getSum() / 2;
}

// 참고, ES6 이후에는 아래와 같이 작성도 가능하다
// class User{
//     constructor(name, age){
//         this.name = name;
//         this.age = age;
//     }
//     getName() {
//         return this.name;
//     }
//     getAge(){
//         return this.age;
//     }
// }


//7. 캡슐화
function IdolGroup(n, m){
    let name    = n;
    let members = m;    

    this.getGroupName = function(){
        return name ;
    }

    this.setGroupName = function(n){
        name = n;
    }

    this.getGroupMembers = function(){
        return members;
    }
    this.setGroupMembers = function(m){
        members = m;
    }
    this.getGroupMemberCount = function() {
        return members.length;
    }
}

window.onload = () => {
    //2. 프로퍼티
    let div1 = document.getElementById('div1');
    let btn1 = document.getElementById('btn1');

    btn1.addEventListener('click',() => {
        let product = {
            //'pName' : '아이폰 12 미니'//프로퍼티 명은 따옴표(')를 해주어야한다.
            pName : '아이폰 12 미니',//특정한 규칙이 있다면 따옴표(')를 생략가능
            '0' : '배열 흉내',
            price : 950000,
            brand : '삼성',
            brand : '애플',//중복 선언하게 되면 마지막에 선언된 프로퍼티가 덮어쓴다
            spec:['OLED', '8 Inch', '화이트']
        };
        console.log(product);
        //속성명을 제시할 떄 공백이나 특수문자가 들어가야하는 경우
        // '', ""묶어줘야한다.
        let user = {
            'user name' : '홍길동',
            user_age : 25

        }

        //객체의 속성에 접근하는 방법

        div1.innerHTML = 'product["속성명"]으로 접근하는 방법<br>';
        div1.innerHTML += `product["pName"] : ${product['pName']}<br>`;
        div1.innerHTML += `product[0] : ${product[0]}<br>`;//숫자형태의 프로퍼티명은 따옴표를 생략해도 된다.
        div1.innerHTML += `product["price"] : ${product["price"]}<br>`;
        div1.innerHTML += `product["brand"] : ${product["brand"]}<br>`;
        div1.innerHTML += `product["spec"] : ${product["spec"]}<br>`;
        div1.innerHTML += `product["spec"][2] : ${product["spec"][2]}<br><br>`;
        
        div1.innerHTML += `product.속성명으로 접근하는 방법<br>`;
        //div1.innerHTML += `product.0 : ${product.0}<br>`;
        div1.innerHTML += `product.pName : ${product.pName}<br>`;
        div1.innerHTML += `product.price : ${product.price}<br>`;
        div1.innerHTML += `product.brand : ${product.brand}<br>`;
        div1.innerHTML += `product.spec : ${product.spec}<br>`;
        div1.innerHTML += `product.spec[0] : ${product.spec[0]}<br>`;

        //공백이나 특수문자가 속성명에 있는경우
        // 대괄호를 사용해서 값을 가져와야한다.
        // div1.innerHTML += `user.'user name' : ${user.'user name'}<br>`;
        div1.innerHTML += `user['user name'] : ${user['user name']}<br>`;
        div1.innerHTML += `user['user-age'] : ${user['user-age']}<br>`;
    });
    //3. 메소드
    let btn2 = document.getElementById('btn2');

    btn2.addEventListener('click', () => {
        let dog = {
            name : '백구',
            kind : '진돗개',
            // eat: (food) => {
            eat: function(food){
                console.log(this);
                // 메소드엣서 객체 내부의 속성에 접근하기 위해서는
                // this.속성명으로 작성해야 한다.
                console.log(`${this.kind} ${this.name}가(이) ${food}를(을) 먹고있네요`);
            }
        };
        dog.eat('사료');
    });
    
    //4. 객체에 속성 추가 / 삭제
    let btn3 = document.getElementById('btn3');

    btn3.addEventListener('click', () => {
        //빈 객체 생성
        let student = {};

        // 객체에 속성 추가
        student.name = '양우찬';
        student['age'] = 25;
        
        // 객체에 메소드 추가
        student.whoAreYou = function(){
            return `${this.name}, ${this.age}`;
        };
        console.log(student);
        console.log(student.whoAreYou());

        // 객체에 속성 삭제
        delete(student['name']);
        delete(student.age);
        console.log(student);

        // 객체에 메소드 삭제
        delete(student.whoAreYou);
        console.log(student);

    });
    //Spread 연산자
    //1) 객체의 복사
    //let student = {name:'양우찬', age:20};
    //let studentCopy = {...student}
    //studentCopy.school = '서울대학교'
    
    //2) 객체를 복사하고 새로운 속성 추가
    //let student = {name:'양우찬', age:20};
    //let studentCopy = {...student, major:'컴퓨터과학과'}

    //3) 객체를 복사하고 기존 속성 추가
    // let student = {name: '홍길동', age:20}
    // let studentCopy = {...student, age:25}

    //구조 분해 할당
    //https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment
    // 구조 분해 할당 구문은 배열이나 객체의 속성을 해체하여 
    //그 값을 개별 변수에 담을 수 있게 하는 JavaScript 표현식

    //1) 배열의 구조 분해 할당
    //let array = [10, 20];
    //let [x, y ] = array;

    //2) 객체의 구조 분해 할당
    //let student = {name:'양우찬', age:20,school : '서울대학교' };
    //student.whoAreYou = function(){return `${this.name}, ${this.age}`;};
    //let {...student} = {name:10, age:20, school:30, whoAreYou:40}    

    // 5. 객체 배열
    let btn4 = document.getElementById('btn4');

    btn4.addEventListener('click', () => {

        let div2 = document.getElementById('div2');
        //배열을 사용하지 않았을 경우
        // let student1 = {name: '고길동', java:100, oracle:100};
        // let student2 = {name: '이몽룡', java:80 , oracle:90};
        // let student3 = {name: '백구'  , java:80 , oracle:80};
        // let student4 = {name: '누렁이', java:85 , oracle:70};
        // let student5 = {name: '임꺽정', java:50 , oracle:50};

        //배열 선언 및 초기화
        let students = [
            {name: '고길동', java:100, oracle:100},
            {name: '이몽룡', java:80 , oracle:90},
            {name: '백구'  , java:80 , oracle:80}
        ];

        //배열 요소 추가
        students.push({name: '누렁이', java:85 , oracle:70});
        students.push({name: '임꺽정', java:50 , oracle:50});

        //배열에 담겨있는 모든 객체에 메소드를 추가
        // students.forEach((student) => {
        //     student.getSum = function (){
        //         return this.java + this.oracle;
        //     };
        //     students.getAverage = function(){
        //         return this.getSum()/2;
        //     };
        // });

        for(let i = 0; i < students.length; i++) {
            students[i].getSum = function (){
                return this.java + this.oracle;
            };
            students[i].getAverage = function(){
                return this.getSum()/2;
            };
        };

        console.log(students);

        //모든 학생의 정보가 담기 배열을 출력(이름, 총점, 평균)
        // for(const student of students){
        //     div2.innerHTML += `${student.name}, ${student.getSum()}, ${student.getAverage()}<br>    `;
        // }
    });
    //6. 생성자 함수
    let btn5 = document.getElementById('btn5');

    btn5.addEventListener('click',() =>{
        let div3 = document.getElementById('div3');

        let students = [
            new Student('홍길동', 100, 100),
            new Student('둘리', 90, 90),
            new Student('고길동', 80, 85)
        ];
        students.push(new Student('누런이', 70, 70));
        students.push(new Student('성춘향', 60, 60));

        console.log(students);
        // 생성자 함수로 만들어진 객체의 경우 해당 객체가 어떤
        // 생성자 함수로 생성되었는지 intanceof 연산자로 검사할 수 있다.
        console.log(students instanceof Array);
        console.log(students[0] instanceof Student);
        console.log(students[5] instanceof Student);
        div3.innerHTML = '안녕하세요<br>';

        //모든 학생정보 출력(이름, 총점, 평균)
        students.forEach((student) => {
            div3.innerHTML += `${student.name}, ${student.getSum()}, ${student.getAverage()}<br>`;
        });
        
        //생성자함수 - prototype
        // 재정의가 가능하네..
        // Student.prototype.getSum = function(){
        //     return this.java + this.oracle + ' 이요~~';
        // }
    });

    // 7. 캡슐화
    let btn6 = document.getElementById('btn6');

    btn6.addEventListener('click', () => {
        let div4 = document.getElementById('div4');

        let idol = new IdolGroup('BTS', ['지민', '뷔', 'RM', '슈가']);

        console.log(idol);
        console.log(idol.getGroupName());
        console.log(idol.getGroupMembers());
        console.log(idol.getGroupMemberCount());

        // idol.setGroupMembers([...idol.getGroupMembers(), '정국']);

        let members = idol.getGroupMembers();
        idol.setGroupMembers([...members, '정국']);
        
        console.log(idol.getGroupMembers());

        div4.innerHTML  = '안녕하세요<br>';
        div4.innerHTML += `그룹명 : ${idol.getGroupName()}<br>` + 
                            `멤버 : ${idol.getGroupMembers()}<br>` + 
                            `멤버수 : ${idol.getGroupMemberCount()}<br>`;
    });

    // 8. Date 객체
    let btn7 = document.getElementById('btn7');

    btn7.addEventListener('click', () => {
        let div5 = document.getElementById('div5');

        // Date 객체를 생성하는 방법
        let now = new Date();
        let date1 = new Date(10000);
        let date2 = new Date('2023-12-11');
        let date3 = new Date('2023-12-11T17:20:30');
        let date4 = new Date(2023, 11, 25, 12, 30, 30);//월은 0부터 시작한다.


        div5.innerHTML  = '<h4>Date 객체</h4>';
        div5.innerHTML += `now : ${now}<br>`;
        div5.innerHTML += `date1 : ${date1}<br>`;
        div5.innerHTML += `date2 : ${date2}<br>`;
        div5.innerHTML += `date3 : ${date3}<br>`;
        div5.innerHTML += `date4 : ${date4}<br><br>`;
        
        //Date 객체의 메소드 호출
        div5.innerHTML += `now.getFullYear() : ${now.getFullYear()}<br>`;
        div5.innerHTML += `now.getMonth() + 1 : ${now.getMonth() + 1}<br>`;
        div5.innerHTML += `now.getDate() : ${now.getDate()}<br>`;
        div5.innerHTML += `now.getDay() : ${now.getDay()}<br>`;//일요일은 0부터 시작한다.
        div5.innerHTML += `now.getHours() : ${now.getHours()}<br>`;
        div5.innerHTML += `now.getMinutes() : ${now.getMinutes()}<br>`;
        div5.innerHTML += `now.getSeconds() : ${now.getSeconds()}<br>`;
        div5.innerHTML += `now.getMilliseconds() : ${now.getMilliseconds()}<br>`;
        //1970년 1월1일 00시 를 기준으로 현재 시간에 대한 milliSeconds값을 반환
        div5.innerHTML += `now.getTime() : ${now.getTime()}<br>`;
        div5.innerHTML += `now.toDateString() : ${now.toDateString()}<br>`;
        div5.innerHTML += `now.toTimeString() : ${now.toTimeString()}<br>`;
        div5.innerHTML += `now.toUTCString() : ${now.toUTCString()}<br>`;
        div5.innerHTML += `now.toISOString() : ${now.toISOString()}<br>`;
        div5.innerHTML += `now.toLocaleString() : ${now.toLocaleString()}<br>`;
        div5.innerHTML += `now.toLocaleDateString() : ${now.toLocaleDateString()}<br>`;
        div5.innerHTML += `now.toLocaleTimeString() : ${now.toLocaleTimeString()}<br>`;


    });
}