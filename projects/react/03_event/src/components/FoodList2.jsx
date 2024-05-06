import React, { useState, useRef } from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';
import { Modal, ModalHeader, ModalBody, ModalFooter, Button } from 'reactstrap';

const FoodList1 = (props) => {
    const { className } = props;
    const toggle = () => setModal(!modal);
    const [modal, setModal] = useState(false);

    const [foods, setFoods] = useState([
        { no: 1, name: '고구마맛탕' },
        { no: 2, name: '고구마밥' },
        { no: 3, name: '짬뽕' },
        { no: 4, name: '볶음밥' }
    ]);

    const [foodName, setFoodName] = useState('김밥');
    const foodNameRef = useRef(null);

    const addFood = (event) => {
        if (event.type === 'keyup' && event.keyCode !== 13) {
            return;
        }
        if (foodName === '') {
            setModal(!modal);

            foodNameRef.current.focus();

            return;
        }
        let nextNo = Math.max(...foods.map((food) => food.no)) + 1;

        setFoods([...foods, { no: nextNo, name: foodName }]);
        setFoodName('');
    };

    const delFood = (event) => {
        if (foodName === '') {
            setModal(!modal);

            foodNameRef.current.focus();

            return;
        }
        let nextNo = Math.max(...foods.map((food) => food.no)) + 1;

        setFoods([...foods, { no: nextNo, name: foodName }]);
        setFoodName('');
    };
    const removeFood = (foodNo) => {
        setFoods(foods.filter((food)=> food.no !== foodNo));
    }


    return (
        <>
            <div className='alert alert-info'>
                <h3>2. 음식 목록</h3>

                <div className="input-group mb-3">
                    <input className="form-control" type='text' placeholder='좋아하는 음식을 입력하세요' value={foodName} onChange={(e) => { setFoodName(e.target.value) }} onKeyUp={addFood} ref={foodNameRef} />
                    <button className='btn btn-info' onClick={addFood}>추가</button>
                    <button className='btn btn-danger' onClick={delFood}>삭제</button>
                </div>
                <ul>
                    {foods.map((food) => <li key={food.no} onDoubleClick={() => removeFood(food.no)}>{food.name}</li>)}
                </ul>
            </div>

            <div>
                <Modal isOpen={modal} toggle={toggle} className={className}>
                    <ModalHeader className='bg-light'>
                        음식 목로오옹ㅇ옼!!!!!!!!
                    </ModalHeader>
                    <ModalBody>
                        음식을 입력해 주세요
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

export default FoodList1;