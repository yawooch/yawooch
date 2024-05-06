import React from 'react';
import Student from './Student';
import Product from './Product';

// 부모 컴포넌트에서 전달해 주는 속성은 props 로 받는다.
const PropsComponent = (props) => {

    const product1 ={
        no:1,
        name : '아이폰 12 미니' ,
        amount : 4
    }

    const product2 ={
        no:2,
        name : 'LG V50 ThinkU' ,
        amount : 10
    };

    const products = [
        { no : 4, name : '아일폰 12 미니', amount:4 },
        { no : 5, name : '아이폰 13'     , amount:14 },
        { no : 6, name : '아삼폰 14 미니', amount:24 },
        { no : 7, name : 2     , amount:16 },
        { no : '8', name : '아오폰 16 미니', amount:26 },
        { no : 9, name : '아육폰 17'     , amount:19 },
    ];
    
    return (
        <div>
            <h3>1. Props</h3>
            {/* <p>안녕하세요 제 이름은 {props.name}입니다.</p> */}
            {/* <p>학번은 {props.no}번, 전공은 {props.children} 입니다.</p> */}
            <h4>학생 목록</h4>
            {/* 
                속성 지정 시 잘못된 타입의 데이터를 넘겨주면 
                개발자 도구에서 경고 메시지가 출력된다.
            */}
            <Student no={1} name={'양우찬'} age={30}/>
            <Student/>
            <Student no={2} name={'고길동'} age={45}/>
            <Student no={3} name='대갈공명' age={60}/>
            <Student no={4} name='광우'/>
            {/* 
                필수로 전달해야 하는 속성을 생략하면 
                개발자 도구에서 경고 메시지가 출력된다. 
            */}
            <h4>상품 목록</h4>
            <Product p={product1}/>
            <Product p={product2}/>
            <Product p={{no:3, name:'아이폰 15', amount:26}}/>

            {/* 배열의 요소를 map()을 사용하여 <Product></Product>컴포넌트를 요소로 가지는 배열을 새로 생성한다. */}
            {/* {
                products.map((product)=>{
                    return <><Product p={product}/><Student no={product.no} name={product.name}/></>
                })
            } */}
            {/* 반복해서 컴포넌트를 그릴땐 식별할 수 있는 키를 지정해야 한다 */}
            {
                products.map((product)=> <Product key={product.no} p={product}/>)
            }

        </div>
    );
};

export default PropsComponent;