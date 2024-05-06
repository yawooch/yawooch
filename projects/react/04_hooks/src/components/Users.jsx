import React from 'react';
import '../../node_modules/bootstrap/dist/css/bootstrap.min.css';
import { useState } from 'react';
import { useEffect } from 'react';
import {Collapse } from 'reactstrap';

const Users = props => {
    const [isOpen, setIsOpen] = useState(true);
    const toggle = () => setIsOpen(!isOpen);


    const [users, setUsers] = useState([]);
    const [loading, setLoading] = useState(false);
    const callApi = () => {
        setLoading(true);
        fetch('https://jsonplaceholder.typicode.com/users')
        .then(response => response.json())
        .then(json => {
            // console.log(json);
            setUsers(json);
            setLoading(false);
        })
    };
    useEffect(() => {
        callApi();
    }, []);
    return (
        <div className='alert alert-warning'>
            <h3>4. 사용자 목록</h3>
            
            <button type="button" className="btn btn-warning" onClick={toggle}>Collapse</button>
            
            <Collapse isOpen={isOpen} {...props}>
                    <table style={{fontSize : '13px'}}>
                        <thead>
                            <tr>
                                <th>이름</th>
                                <th>이메일</th>
                                <th>번호</th>
                            </tr>
                        </thead>
                        <tbody>
                            {users.map((user) => <tr key={user.id}><td>{user.name}</td><td>{user.email}</td><td>{user.phone}</td></tr>)}
                        </tbody>
                    </table>
                </Collapse>
        </div>
    );
};

export default Users;