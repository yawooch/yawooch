import React, { useEffect, useState } from 'react';
import { Link, useParams } from 'react-router-dom';
import 'bootstrap/dist/css/bootstrap.min.css';

const ProfilePage = () => {
    // const params = useParams();
    // const id = params.id;
    const { userId } = useParams();
    const [users, setUsers] = useState({});
    const { id, name, email, phone, company } = users;
    // const companyName = company.name;
    const [loading, setLoading] = useState(false);

    console.log(company);

    const callApi = () => {
        setLoading(true);
        fetch(`https://jsonplaceholder.typicode.com/users/${userId}`)
            .then(response => response.json())
            .then(json => {
                console.log(json);
                setUsers(json);
                setLoading(false);
            })
    };
    useEffect(() => {
        callApi();
    }, []);

    const alignRight = { textAlign: 'right' };
    const alignLeft = { textAlign: 'left' };

    // console.log(params);
    console.log(id);
    // console.log(users);

    if (loading) {
        return <h2>로딩중 입니다.</h2>
    }

    return (
        <>
        <div className='alert alert-primary'>
            <h2>사용자 프로필</h2>
            <div className='card'>
                <div className='card-body'>
                    {
                    id ?
                    (
                    <table>
                    <tbody>
                        <tr><th style={alignRight}>사용자 번호 : </th><td style={alignLeft}>{id}</td></tr>
                        <tr><th style={alignRight}>이름 :        </th><td style={alignLeft}>{name}</td></tr>
                        <tr><th style={alignRight}>이메일 :      </th><td style={alignLeft}>{email}</td></tr>
                        <tr><th style={alignRight}>전화번호 :    </th><td style={alignLeft}>{phone}</td></tr>
                        <tr><th style={alignRight}>회사명 :      </th><td style={alignLeft}>{company ? company.name : ''}</td></tr>
                    </tbody>
                    </table>
                    )
                    :
                    (<div>
                        <p>회원 정보가 없는 프로필입니다.</p>
                    </div>
                    )
                    }
                </div>
            </div>
            <ul>
                <li><Link to="/">홈으로</Link></li>
            </ul>
        </div>
        </>
    );
};

export default ProfilePage;