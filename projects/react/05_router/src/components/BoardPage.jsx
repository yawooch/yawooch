import React, { useEffect, useState } from 'react';
import { Link, useParams } from 'react-router-dom';
import { Collapse, Button, CardBody, Card, Toast, ToastHeader, ToastBody } from 'reactstrap';

const BoardPage = (args) => {
    const { paramUserId } = useParams();
    const [board, setBoard] = useState([]);
    const { userId, id, title, body } = board;
    const [loading, setLoading] = useState(false);

    const [comments, setComments] = useState([]);

    const colors = [
        'danger'
        ,'info'
        ,'success'
        ,'warning'
        ,'primary'
    ];
    const setColor = (index) => {
        return colors[parseInt(index)%5]
    }

    const [isOpen, setIsOpen] = useState(false);

    const callApi = () => {
        setLoading(true);
        fetch(`https://jsonplaceholder.typicode.com/posts/${paramUserId}`)
            .then(response => response.json())
            .then(json => {
                setLoading(false);
                console.log(json);
                setBoard(json);
            });
    }

    const callApiComment = () => {
        setLoading(true);
        fetch(`https://jsonplaceholder.typicode.com/posts/${id}/comments`)
            .then(response => response.json())
            .then(json => {
                setLoading(false);
                console.log(json);
                setComments(json);
            });
    }
    
    useEffect(() => {
        callApi();
    }, []);

    const toggle = () => {
        // navigate(`/comments?postId=${id}`)
        if (!isOpen) {
            callApiComment();
        }
        setIsOpen(!isOpen);
    }

    return (
        <div className='alert alert-danger'>
            <h2>게 시판</h2>
            <p>게시글번호 : {id}</p>
            <p>제목 : {title}</p>
            <p>작성자 ID : {userId}</p>
            <p>내용 : {body}</p>
            <button className='btn btn-danger btn-large' onClick={toggle}>댓글목록 조회</button>
            <Link className='btn btn-danger btn-large' to={`/board/${paramUserId}/comments`}>댓글목록 조회2</Link>

            <Collapse isOpen={isOpen} {...args}>
                <Card>
                    <CardBody>
                        {comments.map((comment) => {
                            return (
                                <Toast key={comment.id}>
                                    <ToastHeader icon={setColor(comment.id)}>
                                    {comment.postId} / {comment.id} {comment.email}
                                    </ToastHeader>
                                    <ToastBody>
                                    <div><h5>name : </h5>{comment.name}</div>
                                    <div><h5>body : </h5>{comment.body}</div>
                                    </ToastBody>
                                </Toast>
                            )
                        })}
                    </CardBody>
                </Card>
            </Collapse>
        </div>
    );
};

export default BoardPage;