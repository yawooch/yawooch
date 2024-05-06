import React, { useEffect, useState } from 'react';
import { Link, useLocation, useNavigate, useSearchParams } from 'react-router-dom';

const CommentsPage = () => {
    //?page=1&keyword=react
    // useLocation Hook 은 location 객체를 반환한다.
    const location = useLocation();
    const [searchParams, setSearchParams] = useSearchParams();
    const page = searchParams.get('page');
    const keyword = searchParams.get('keyword');
    const postId = searchParams.get('postId');
    const [comments, setComments] = useState([]);
    const [loading, setLoading] = useState(false);

    // console.log(postId);
    const callApi = () => {
        setLoading(true);
        fetch(`https://jsonplaceholder.typicode.com/comments?postId=${postId}`)
            .then(response => response.json())
            .then(json => {
                console.log(json);
                setComments(json);
                setLoading(false);
            })
    }
    useEffect(()=>{
        callApi();
    }, [postId]);

    if(loading){

        <div class="spinner-border text-warning"></div>
    }

    return (
        <>
            <div className='alert alert-warning'>
                <h2>댓글목록</h2>
                <div className='card'>
                    <div className='card-header'>
                        <p>location  : {location.search}</p>
                        <p>postId  : {postId}</p>
                        <p>page  : {page}</p>
                        <p>keyword : {keyword}</p>
                        <button className='btn btn-warning btn-sm' onClick={() => setSearchParams({ page: '2', keyword: 'react-router-dom' })}>쿼리스트링 변경</button>
                    </div>
                    <div className='card-body'>
                        <table className='table'>
                            <thead><tr><td>댓글 번호</td><td>게시글 번호</td><td>작성자 이메일</td><td>내용</td></tr></thead>
                            <tbody>
                                    {comments.length !== 0? comments.map((comment)=>{
                                        return (
                                            <tr key={comment.id}>
                                            <td>{comment.id}</td>
                                            <td>{comment.postId}</td>
                                            <td>{comment.email}</td>
                                            <td>{comment.body}</td></tr>
                                        )
                                    })
                                    :
                                    <tr><td colspan='4'align='center'>조회된 데이터가 없습니다.</td></tr>
                                    }
                                
                            </tbody>
                        </table>
                    </div>
                    <div className='card-footer'>
                        <ul class="pagination">
                        <li class="page-item"><Link className="page-link" to="/comments?postId=101">Previous</Link></li>
                        <li class="page-item"><Link className="page-link" to="/comments?postId=1">1</Link></li>
                        <li class="page-item"><Link className="page-link" to="/comments?postId=2">2</Link></li>
                        <li class="page-item"><Link className="page-link" to="/comments?postId=3">3</Link></li>
                        <li class="page-item"><Link className="page-link" to="/comments?postId=101">Next</Link></li>
                        </ul>
                        <Link to='/' className="flex">홈으로</Link>
                    </div>
                </div>
            </div>
        </>
    );
};

export default CommentsPage;