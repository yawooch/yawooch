import React, { useState } from 'react';
/* import 'bootstrap/dist/css/bootstrap.min.css'; */

const Counter = () => {
    // let count = 0;
    let [count, setCount] = useState(10);
    let [color, setColor] = useState('black');
    const onIncrease = () => {
        setCount(count + 1);
        setColor('green');
    }
    const onDecrease = () => {
        setCount(count - 1);
        setColor('red');
    }
    const onReset = () => {
        setCount(0);
        setColor('black');
    }
    const onRandom = () => {
        let random = parseInt(Math.random() * 100 +1);
        setCount(random)
        if(random%3===0 && setColor('red'));
        if(random%3===1 && setColor('green'));
        if(random%3===2 && setColor('blue'));
    }
    return (
        <div>
            <p>number : <span style={{color:color,fontWeight:'bold'}}>{count}</span></p>
            <button onClick={onIncrease} color="primary" class="btn btn-primary">증가</button>
            <button onClick={onDecrease} color="danger" class="btn btn-danger">감소</button>
            <button onClick={onReset} color="danger" class="btn btn-light">초기화</button>
            <button onClick={onRandom} color="danger" class="btn btn-secondary">랜덤</button>
        </div>
    );
};

export default Counter;