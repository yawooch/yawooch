import React from 'react';

const Product = (props) => {
    console.log(props);
    const {no, name, amount} = props.p;

    return (
        <p>
            {/* 상품 번호 : {props.p.no},  상품명 : {props.p.name}, 재고 : {props.p.amount} */}
            상품 번호 : {no},  상품명 : {name}, 재고 : {amount}
        </p>
    );
};


export default Product;