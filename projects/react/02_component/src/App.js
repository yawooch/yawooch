import React from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';
import FirstComponent from './components/FirstComponent';
import PropsComponent from './components/PropsComponent';
import StateComponent from './components/StateComponent';
import { Alert } from 'bootstrap';

const App = (props) => {
  return (
    <div>
      <FirstComponent/>
      {/* 숫자값을 넘길때는 중괄호를 사용한다. */}
      <PropsComponent no={1} name={'홍길동'}>컴퓨터 공학과</PropsComponent>
      <StateComponent/>
      <button color="primary" class="btn btn-dark">카운터</button>
    </div>
  );
};

export default App;