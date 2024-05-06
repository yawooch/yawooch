import React from 'react';
import { Link } from 'react-router-dom';

const AboutPage = () => {

    return (
        <>
        <div className='alert alert-primary'>

            <h2>소개 페이지</h2>
            <p>리액트 라우터를 사용하는 프로젝트입니다.</p>
            <div className='card card-body'>
            <ul>
                <li><Link to="/">홈으로</Link></li>
                <li><Link to="/about">소개</Link></li>
            </ul>
            </div>
        </div>
        </>
    );
};

export default AboutPage;