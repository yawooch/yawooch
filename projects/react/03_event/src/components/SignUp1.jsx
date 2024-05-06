import React, { useRef, useState } from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';
import { Button, Modal, ModalHeader, ModalBody, ModalFooter } from 'reactstrap';
import PropTypes from 'prop-types';


const SignUp1 = (props) => {
    const { className } = props;
    const toggle = () => setModal(!modal);
    const [modal, setModal] = useState(false);
    
    const [id, setId]             = useState('angpang14');
    const [password, setPassword] = useState('dddddd');
    const [name, setName]         = useState('고길동');
    const [address, setAddress]   = useState('서울특별시');
    //리액트에서 id 속성을 사용하는 것을 지양한다.
    //동일한 컴포넌트 사용시 중복
    //리액트에서는 컴포넌트마다 유일한 아이디를 주기 위해서 ref를 사용한다.
    const idRef = useRef(null);

    const onChangeId = (event) =>{
        setId(event.target.value);
    };
    const onChangePassword = (event) =>{
        setPassword(event.target.value);
    };
    const onChangeName = (event) =>{
        setName(event.target.value);
    };
    const onChangeAddress = (event) =>{
        setAddress(event.target.value);
    };
    const printValue = () => {
        /* window.alert(`아이디 : ${id}, 이름 : ${name}, 주소 : ${address}`); */
        setModal(!modal);
        setId(id);
        setPassword(password);
        setName(name);
        setAddress(address);
        //컴포넌트가 여러개 일때 현재 컴포넌트의 ref가 참조하는 요소를 가져온다
        idRef.current.focus();
    };
    const onKeyUpAddress = (event) => {
        if(event.keyCode === 13) printValue();
    }
    return (
        <>
        <div className="alert alert-primary">
            <h3 className='text-primary'>1. 회원가입</h3>
            <input className="form-control" type="text"     placeholder='아이디를 입력하세요'   value={id}       onChange={onChangeId} ref={idRef}/><br/>
            <input className="form-control" type="password" placeholder='비밀번호를 입력하세요' value={password} onChange={onChangePassword}/><br/>
            <input className="form-control" type="text"     placeholder='이름을 입력하세요'     value={name}     onChange={onChangeName}/><br/>
            <input className="form-control" type="text"     placeholder='주소를 입력하세요'     value={address}  onChange={onChangeAddress} onKeyUp={onKeyUpAddress}/><br/><br/>

            <button className='btn btn-primary' onClick={printValue}>회원 가입</button><br/><br/>


        </div>
        
    <div>
        <Modal isOpen={modal} toggle={onKeyUpAddress} className={className}>
            <ModalHeader>
                회원가입
            </ModalHeader>
            <ModalBody>
                <h5>아이디 : {id}</h5>
                <h5>암호   : {password}</h5>
                <h5>이름   : {name}</h5>
                <h5>주소   : {address}</h5>
            </ModalBody>
            <ModalFooter>
                <Button color="primary" onClick={toggle}>
                확인
                </Button>{' '}
                <Button color="secondary" onClick={toggle}>
                취소
                </Button>
            </ModalFooter>
        </Modal>
    </div>
</>
    );
};

SignUp1.propTypes = {
    className: PropTypes.string,
};
export default SignUp1;