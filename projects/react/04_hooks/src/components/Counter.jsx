import React, { useReducer, useState } from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';
import { Button, Modal, ModalBody, ModalFooter, ModalHeader } from 'reactstrap';

//useReducer
// - 컴포넌트 상황에 따라 상태를 다른 값으로 업데이트해 주고 싶을 때 사용하는 Hook이다

// reducer 함수는 액션값을 받아서 새로운 상태를 반환하는 함수이다.
const reducer = (state, action) => {
    switch (action.type) {
        case 'INCREMENT':
            return { count: state.count + 1 };
        case 'DECREMENT':
            return { count: state.count - 1 };
        default:
            return state;
    }
}



const Counter = (props) => {
    const { className } = props;
    const toggle = () => setModal(!modal);
    const [modal, setModal] = useState(false);
    const [comment, setComment] = useState('입력');

    // const [count, setCount] = useState(1);
    const [state, dispatch] = useReducer(reducer, { count: 0 });


    /* const onClickIncrease = () => {
        setCount(count + 1);
    }
    const onClickDecrease = () => {
        if (count - 1 < 0) {
            setComment('0 보다 작게 입력할수 없습니다.');
            setModal(!modal)
            return;
        }
        setCount(count - 1);
    } */

    return (
        <>
            <div className="alert alert-primary">
                <h3>1. useReducer</h3>
                <p>현재 카운트의 값은 {state.count} 입니다.</p>
                {/* <button className='btn btn-light btn-sm' onClick={onClickIncrease}>+1 증가</button>&nbsp;
                <button className='btn btn-light btn-sm' onClick={onClickDecrease}>-1 감소</button> */}
                {/* dispatch 함수에 파라미터롤 액션값을 넣어주면 reducer 함수가 실행된다 */}
                <button className='btn btn-light btn-sm' onClick={() => dispatch({ type: 'INCREMENT' })}>+1 증가</button>&nbsp;
                <button className='btn btn-light btn-sm' onClick={() => dispatch({ type: 'DECREMENT' })}>-1 감소</button>
            </div>
            <div>
                <Modal isOpen={modal} toggle={toggle} className={className}>
                    <ModalHeader className='bg-light'>
                        알림
                    </ModalHeader>
                    <ModalBody>
                        <h3>{comment}</h3>
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

export default Counter;