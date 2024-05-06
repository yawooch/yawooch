import React from 'react';
import { Link } from 'react-router-dom';
import 'bootstrap/dist/css/bootstrap.min.css';

const Homepage = () => {
    return (
        <>
            <div className='alert alert-primary'>
                <h2>홈 페이지</h2>
                <p>가장 먼저 보여주는 페이지 입니다.</p>
                <div className='card card-body'>
                    <ul className='list-group'>
                        <li className='list-group-item list-group-item-action'><Link to="/about">소개</Link></li>
                        <li className='list-group-item list-group-item-action list-group-item-success'><Link to="/myPage">Not Found</Link></li>
                        <li className='list-group-item list-group-item-action list-group-item-secondary'><Link to="/comments">댓글 목록</Link></li>
                        <li className='list-group-item list-group-item-action list-group-item-info'><Link to="/board/1">1번 게시글</Link></li>
                        <li className='list-group-item list-group-item-action list-group-item-info'><Link to="/board/2">2번 게시글</Link></li>
                        <li className='list-group-item list-group-item-action list-group-item-info'><Link to="/board/3">3번 게시글</Link></li>
                        <li className='list-group-item list-group-item-action list-group-item-info'><Link to="/board/4">4번 게시글</Link></li>
                        <li className='list-group-item list-group-item-action list-group-item-warning'><Link to="/profile/1">1번 사용자 프로필</Link></li>
                        <li className='list-group-item list-group-item-action list-group-item-warning'><Link to="/profile/2">2번 사용자 프로필</Link></li>
                        <li className='list-group-item list-group-item-action list-group-item-warning'><Link to="/profile/3">3번 사용자 프로필</Link></li>
                        <li className='list-group-item list-group-item-action list-group-item-warning'><Link to="/profile/11">11번 사용자 프로필</Link></li>
                        <li className='list-group-item list-group-item-action list-group-item-danger'><Link to="/comments?postId=1">1번 게시글 댓글조회</Link></li>
                        <li className='list-group-item list-group-item-action list-group-item-danger'><Link to="/comments?postId=2">2번 게시글 댓글조회</Link></li>
                    </ul>
                </div>
            </div>
        </>
    );
};

export default Homepage;