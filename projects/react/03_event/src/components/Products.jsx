import React from 'react';

const Products = ({products, del}) => {
    const styleDefault = {textAlign:'center', width: '100px'};
    const styleRight   = {textAlign:'right' , width: '100px'};
    const styleLeft    = {textAlign:'left'  , width: '100px'};
    return (
        <div>
            <h3>4. 상품목록</h3>
            <table>
                <thead>
                    <tr>
                        <th style={styleDefault}>상품 목록</th>
                        <th style={styleDefault}>상품 이름</th>
                        <th style={styleDefault}>상품 가격</th>
                        <th style={styleDefault}>삭제</th>
                    </tr>
                </thead>
                <tbody>
                    {products.map((product)=> {
                        return (
                        <tr  key={product.code}>
                            <td style={styleDefault}>{product.code}</td>
                            <td style={styleLeft}>{product.name}</td>
                            <td style={styleRight}>{product.price}</td>
                            <td style={styleDefault}>
                                <button className="btn btn-sm btn-danger" 
                                        onClick={() => {del(product.code)}}>
                                    삭제
                                </button>
                            </td>
                        </tr>
                        )
                    })}
                </tbody>
            </table>
        </div>
    );
};

export default Products;<h3>4. 상품목록</h3>
