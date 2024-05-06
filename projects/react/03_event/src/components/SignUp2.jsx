import React, {useState, useRef} from 'react';
import {Modal, ModalHeader, ModalBody, ModalFooter, Button } from 'reactstrap';

const SignUp2 = (props) => {
    // 네개의 입력을 한번에 처리하기위해서
    // useState()의 초깃값으로 객체를 지정한다.
    const { className } = props;
    const toggle = () => setModal(!modal);
    const [modal, setModal] = useState(false);

    const [form, setForm] = useState({
        id : 'Dooli',
        password : '123456',
        name : '고길동',
        address : '서울특별시'
    });

    const {id, password, name, address} = form;
    const idRef = useRef(null);

    const onChangeForm = (event) => {
        //기존form 을 복사한 뒤 원하는 값을 덮어 씌운다.
        // 객체 안에서 key를 []로 감싸면 그 안에 넣은 실제 속성 값이 key 값으로 사용된다.
        setForm({...form, [event.target.name]:event.target.value});
    };

    const printValue = (event) => {
        /* window.alert(`아이디 : ${id}, 이름 : ${name}, 주소 : ${address}`); */
        setModal(!modal);
        if(event.target.getAttribute('namy') === 'reset'){
            setForm({
                id : '',
                password : '',
                name : '',
                address : ''
            })
        };

        console.log(idRef);

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
            <input className="form-control" type="text"     placeholder='아이디를 입력하세요'   value={id}       name="id"       onChange={onChangeForm} ref={idRef}/><br/>
            <input className="form-control" type="password" placeholder='비밀번호를 입력하세요' value={password} name="password" onChange={onChangeForm} /><br/>
            <input className="form-control" type="text"     placeholder='이름을 입력하세요'     value={name}     name="name"     onChange={onChangeForm} /><br/>
            <input className="form-control" type="text"     placeholder='주소를 입력하세요'     value={address}  name="address"  onChange={onChangeForm} onKeyUp={onKeyUpAddress}/><br/><br/>
            <button className='btn btn-primary' onClick={printValue} namy="submit">회원 가입</button>&nbsp;<button className='btn btn-danger' onClick={printValue} namy="reset">초기화</button><br/><br/>
        </div>
        <div>
            <Modal isOpen={modal} toggle={onKeyUpAddress} className={className}>
                <ModalHeader className='bg-light'>
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

export default SignUp2;