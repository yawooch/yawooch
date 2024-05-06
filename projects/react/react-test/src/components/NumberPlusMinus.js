import React, { useState } from 'react';

const NumberPlusMinus = () => {
    const [count, setCount] = useState(0);

    const onClickMinus = (event)=>{
        setCount(count - 1);
    }
    const onClickPlus = (event)=>{
        setCount(count + 1);
    }
    return (
        <div>
            <button class='btn-minus' onClick={()=>{onClickMinus()}}>-</button>
            <span>{count}</span>
            <button class='btn-plus' onClick={()=>{onClickPlus()}}>+</button>
        </div>
    );
};

export default NumberPlusMinus;