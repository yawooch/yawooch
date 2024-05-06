import React, { useState } from 'react';
import '../../node_modules/bootstrap/dist/css/bootstrap.min.css'
import { useEffect } from 'react';


// useEffect
// - 컴포넌트가 렌더링 될때마다 특정 작업을 수행하도록 설정할수 있는 Hook이다.
const Info = props => {
    const [forms, setForms] = useState({
        name: '홍길동',
        nickName: '의적'
    });

    const { name, nickName } = forms;

    const onChangeForm = (event) => {
        setForms({
            ...forms,
            [event.target.name]: event.target.value
        });
    }
    //컴포넌트가 렌더링 될때마다 실행된다.
    useEffect(()=>{
        /* console.log('렌더링이 완료되었습니다'); */
        /* console.log({name, nickName}); */
    });
    /* useEffect(()=>{
        console.log('맨처음 렌더링 될때만 실행됩니다.');}, []); */
    //name 값이 변경될때마다 실행된다.
    useEffect(()=>{
        console.log({name, nickName});
        return () => {
            //name 값이 업데이트 되기 전에 값을 출력한다.
            // console.log({name});
        }
    }, [name]);

    return (
        <>
            <div className='alert alert-info'>
                <h3>2. useEffect</h3>
                <div>
                    <input className='form-control' type="text" placeholder='이름을 입력하세요' value={name} name="name" onChange={onChangeForm} /><br></br>
                    <input className='form-control' type="text" placeholder='별명을 입력하세요' value={nickName} name="nickName" onChange={onChangeForm} /><br></br>

                </div>
                <h4>이름 : {name}</h4>
                <h4>별명 : {nickName}</h4>
            </div>

        </>
    );
};

export default Info;