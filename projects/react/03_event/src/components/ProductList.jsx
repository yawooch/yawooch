import React, { useRef, useState } from 'react';
import { Button, Modal, ModalBody, ModalFooter, ModalHeader } from 'reactstrap';
import Products from './Products';

const ProductList = (props) => {
    const { className } = props;
    const toggle = () => setModal(!modal);
    const [modal, setModal] = useState(false);

    const [products, setProducts] = useState([
        {code: 1, name : '냉장고', price : 3000000},
        {code: 2, name : '세탁기', price : 2500000},
        {code: 3, name : '컴퓨터', price : 1500000},
    ]);

    const [form, setForm] = useState({
        code: '',
        name: '',
        price: ''
    });

    const {code, name, price} = form;
    const nameRef = useRef(null);

    const onChangeForm = (e)=> {
        setForm({...form, [e.target.name] : e.target.value});
    }
    const onSubmit = (e) => {
        e.preventDefault();
        console.log(e);

        if(window.confirm('상품을 등록할까요?')){
            setProducts([...products, form]);
            setForm({
                code:parseInt(code)+1,
                name: '',
                price:''
            });
            nameRef.current.focus();
        }
        // setModal(!modal);
    }

    const onReset = (e)=>{
        e.preventDefault();
        setForm({
            ...form,
            name : '',
            price: ''
        });
        nameRef.current.fucus();
    }

    const onDelete = (code)=>{
        
        if(window.confirm(`${code} 번 상품을 삭제할까요?`)){
            setProducts(products.filter(product => product.code !== code));
        }
    };

    return (
        <>
        <div className='alert alert-success'>
            <h3>3. 상품 등록</h3>
            <form onSubmit={onSubmit}>
                <input className="form-control" type="text" placeholder='상품 코드를 입력하세요' value={code}  onChange={onChangeForm} name="code"  ref={nameRef} /><br/>
                <input className="form-control" type="text" placeholder='상품 이름을 입력하세요' value={name}  onChange={onChangeForm} name="name" /><br/>
                <input className="form-control" type="text" placeholder='상품 가격을 입력하세요' value={price} onChange={onChangeForm} name="price"/><br/><br/>
                <input className="btn btn-success" type="submit" value='상품등록'/>&nbsp;
                <input className="btn btn-danger" type="reset" value='다시입력' onClick={onReset}/><br/>
            </form>
            <Products products={products} del={onDelete}></Products>
        </div>
        
        <div>
        <Modal isOpen={modal} toggle={toggle} className={className}>
            <ModalHeader className='bg-light'>
                상품 등로오옹ㅇ옼!!!!!!!!
            </ModalHeader>
            <ModalBody>
                <h4>{code}</h4>
                <h4>{name}</h4>
                <h4>{price}</h4>
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

export default ProductList;