import React, { useState } from 'react';
import '../../node_modules/bootstrap/dist/css/bootstrap.min.css';
import { Modal, ModalHeader, ModalBody, ModalFooter, Button, Collapse, CardBody, Card } from 'reactstrap';
import { useRef } from 'react';
import { useMemo } from 'react';

const getAverage = (numbers) => {
    console.log('평균값 계산중...');
    if(numbers.length === 0) return 0;

    return (numbers.reduce((a, b)=> a + b) / numbers.length);
};

//useMemo 
// - 렌더링 하는 과정에 특정 값이 바뀌었을 때만 
//  연산을 수행하고 싶을 때 사용하는 Hook이다.
const Average = props => {
    const { className } = props;
    const { modal, setModal } = useState(false);
    const modalToggle = () => { setModal(!modal) };
    const [isOpen, setIsOpen] = useState(false);

    const toggle = () => setIsOpen(!isOpen);

    const [list, setList] = useState([]);
    const [number, setNumber] = useState('');
    const numberRef = useRef(null);
    const onChangeNumber = (event) => {
        setNumber(event.target.value);
    }

    const onInsert = (event) => {
        setList([...list, parseInt(number)]);
        setNumber('');
        numberRef.current.focus();
    }
    // 매번 화면이 렌더링 될때마다 평균값을 구하는 함수를 호출하지 않고
    // 값이 변경될 때마다 평균값을 구하는 함수를 호출하도록한다.
    const avg = useMemo(()=> getAverage(list), [list]);

    return (
        <>
            <div className="alert alert-success">
                <h3>3. useMemo</h3>
                <div className='input-group'>
                    <input className="form-control" type="number" placeholder='숫자를 입력하세요' value={number} onChange={onChangeNumber} ref={numberRef}/><br />
                    <button className="btn btn-success" onClick={onInsert}>등록</button>
                    <button type="button" className="btn btn-primary" onClick={toggle}>Collapse</button>
                </div>
                <Collapse isOpen={isOpen} {...props}>
                    <ul>
                        {list.map((number, index) => <li key={index}>{number}</li>)}
                    </ul>
                    <p>평균값 : {avg}</p>
                </Collapse>
            </div>

            <Modal isOpen={modal} toggle={modalToggle} className={className}>
                <ModalHeader>

                </ModalHeader>
                <ModalBody>

                </ModalBody>

                <ModalFooter>
                    <Button color="primary" onClick={toggle}>
                        Do Something
                    </Button>{' '}
                    <Button color="secondary" onClick={toggle}>
                        Cancel
                    </Button>
                </ModalFooter>
            </Modal>
        </>
    );
};
export default Average;