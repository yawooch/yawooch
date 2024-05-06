import React, { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import img1 from '../츠어여3.png'

const CommentsPage2 = () => {
    const params = useParams();
    const paramUserId = params.paramUserId;
    const array = useState([]);
    const [comments, setComments] = array;
    const [loading, setLoading] = useState(false);

    const callApi = () => {
        setLoading(true);
        fetch(`https://jsonplaceholder.typicode.com/posts/${paramUserId}/comments`)
            .then(response => response.json())
            .then(json => {
                setLoading(false);
                console.log(json);
                setComments(json);
            });
    }
    useEffect(()=>{
        callApi();
    }, []);

    if(loading){
        return <img src={img1} width="100%"/>
    }

    return (
        <div className='alert alert-info'>
            <h2>{paramUserId}번 게시글 댓글 목록</h2>
            <table className="table">
            <thead>
            <tr><th>댓글 번호</th><th>게시글 번호</th><th>작성자 이메일</th><th>내용</th></tr>
            </thead>
            <tbody>
                {comments.legnth !== 0 ? (
                    comments.map((comment)=> {
                        return (
                        <tr key={comment.id}>
                            <td>{comment.postId}</td>
                            <td>{comment.id}</td>
                            <td>{comment.email}</td>
                            <td>{comment.name}</td>
                        </tr>
                        )
                    })
                ) :
                (
                    <tr>
                        <td colspan="4" >조회된 데이터가 없습니다.</td>
                    </tr>
                )}
            </tbody>
            </table>
        </div>
    );
};

export default CommentsPage2;