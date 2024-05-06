import { Fragment } from 'react';
import './App.css';

//함수형 컴포넌트
//컴포넌트를 렌더링하면 함수에서 반환하고 있는 내용을 나타낸다
//반환하는 내용을 보면 HTML 같지만, HTML 문자열이 아닌 JSX라고 부른다.
let App = () => {

  const name = '홍길동';
  const nickName = '의적';
  const hello = <h2>리액트 시작2</h2>;
  const helloStyle = {
    backgroundColor : 'black',
    color:'white',
    fontSize: '2em',
    fontWeight: 'bold'
  }
  return (
    //<div><h2>리액트 시작1</h2><h2>리액트 시작2</h2><p>hello world!</p></div>
    //컴포넌트에 여러요소가 있다면 반드시 부모요소 하나로 감싸야 한다.
    //<Fragment></Fragment> = <></>
      <>
        {/* JSX 내부에 주석을 작성하는 방법 */}
          <h2>리액트 시작1</h2>
          {hello}
          {/* JSX 인라인 스타일 */}
          {/* 스타일 객체를 미리 선언후 지정하는 방법 */}
          <p style= {helloStyle}>hello world! object style</p>

          {/* 스타일 객체를 바로 지정하는 방법 */}
          <p style= {
            {backgroundColor:'black', 
            color: 'white', 
            fontSize:'1.5em',
            fontWeight:'bold',
            padding:'15px'}
          }>hello world! inline Style</p>
          {/* 아래와 같이 class 로 설정해도 스타일이 적용된다. */}
          {/* 단, 개발자 도구로 확인하면 경고가 나타난다. */}
          {/* <p class="heading2">hello world! class</p> */}
          <p className="heading2">hello world! className</p>

          <p>hello {name}</p>
          {/* 삼항연산자 사용 */}
          {name === '홍길동' ? (<p><b>관리자</b>님 안녕하세요</p>): (<p><b>{name}</b>님 안녕하세요</p>)}
          {/* && 연산자 사용 */}
          {name === '홍길동' && nickName + ' ' + name + ' '}
          {/* || 연산자 사용 */}
          {console.log('헬로, ' + nickName)}
          {nickName || <h3>별명이 없습니다.</h3>}
          {/* JSX에서 닫는 태그가 없으면 에러가 발생한다. */}
      </>
    );
}

export default App;
