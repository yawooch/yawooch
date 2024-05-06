import React from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';

const FoodList1 = (props) => {

    /* const foods = ['고구마맛탕', '고구마밥', '짬뽕', '볶음밥']; */
    const foods = [
        {no:1, name : '고구마맛탕'},
        {no:2, name : '고구마밥'},
        {no:3, name : '짬뽕'},
        {no:4, name : '볶음밥'}
    ];

    return (
        <>
            <div className='alert alert-info'>
                <h3>2. 음식 목록</h3>
                <ul>
                    {/* 배열의 요소를 map()메소드를 사용하여 jsx 코드로 된 배열을 새로 생성한다. zhemfh ehls qodufdfm tofh todtjdgksek. */}
                    {/* 배열을 반복해서 컴포넌트를 그릴때는 식별할 수 있는 키를 지정해야한다. */}
                    {/* {foods.map((food, index)=><li key={index}>{food}</li>)} */}
                    {/* index 값을 사용하는 것보다 고유한 값을 만들어서 key 를 지정하는 것이 더 효율적이다. */}
                    {foods.map((food)=><li key={food.no}>{food.name}</li>)}
                </ul>
            </div>
        </>
    );
};

export default FoodList1;