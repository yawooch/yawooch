import React from 'react';
import { Link } from 'react-router-dom';

const NotFoundPage = () => {

    //

    return (
        <>
            <div>
                <h2>404</h2>
                <p>페이지를 찾을수 없습니다.</p>
                <div class="spinner-border text-muted"></div>
                <div class="spinner-border text-primary"></div>
                <div class="spinner-border text-success"></div>
                <div class="spinner-border text-info"></div>
                <div class="spinner-border text-warning"></div>
                <div class="spinner-border text-danger"></div>
                <div class="spinner-border text-secondary"></div>
                <div class="spinner-border text-dark"></div>
                <div class="spinner-border text-light"></div><br/>
                <Link to='/' className='btn btn-danger btn-lg'>홈으로</Link>
            </div>
        </>
    );
};

export default NotFoundPage;