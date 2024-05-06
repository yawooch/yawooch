import './App.css';
import { Link, Route, Routes, useNavigate } from 'react-router-dom';
import 'bootstrap/dist/css/bootstrap.min.css';   
import { useState } from 'react';

function App() {
  const navigate = useNavigate();
  const [books, setBooks] = useState([
    {no: 1, title: '홍길동전', author:'홍길동'},
    {no: 2, title: '자바의정석', author:'남궁성'},
    {no: 3, title: '파피용', author:'베르나르베르베르'}
  ])

  const deleteBook = (bookNo) =>{
    if(window.confirm(`${bookNo}번 책을 삭제하시겠습니다.`)){
      setBooks(books.filter((book)=>{return book.no !== bookNo}));
      console.log('삭.완');
    }
    else console.log('삭.취');
  }

  const addBook = (book) =>{
    if(window.confirm(`${book.no}번 책을 등록하시겠습니다.`)){
      setBooks([...books,book]);
      alert('등.완');
      navigate('/books');
    }
    else console.log('등.취');
  }

  return (
    <>
    <header>
      <div className='container'>
        <div className='box btn btn-light'><Link to="/">홈으로</Link></div>
        <div className='box btn btn-light'><Link to="/books">도서 목록</Link></div>
        <div className='box btn btn-light'><Link to="/addBook">도서 등록</Link></div>
      </div>
    </header>

    <Routes>
      <Route path="/" element={<HomePage/>}/>
      <Route path="/books" element={<BookListPage booksProps={books} del={deleteBook}/>}/>
      <Route path="/addBook" element={<AddBookPage add={addBook}/>}/>
    </Routes>
    </>
  );
}

const HomePage = () =>{
  return(
    <main>
      <h2 className="bg-light">Home</h2>
    </main>
  )
}

const BookListPage = ({booksProps, del})=>{
  const books = booksProps;
  console.log(books);

  return(
    <main>
      <h2 className='bg-light'>도서 목록</h2>

      <table className='table'>
        <thead>
          <tr>
            <th>No.</th>
            <th>도서제목</th>
            <th>도서저자</th>
            <th>삭제</th>
          </tr>
        </thead>
        
        <tbody>
          {books.map((book)=>{
            return (
              <tr key={book.no}>
                <td>{book.no}</td>
                <td>{book.title}</td>
                <td>{book.author}</td>
                <td><button className='btn btn-danger btn-xs' onClick={()=> del(book.no)} >삭제</button></td>
              </tr>
            )
          })}
        </tbody>
      </table>
    </main>
  )
}
const AddBookPage = ({add})=>{
  const [form, setForm] = useState({
    no : 4,
    title : '누가 내머리에 똥쌌어',
    author : '베르너홀츠바르트'
  });
  const {no, title, author} = form;
  
  const onChangeForm = (event)=>{
    setForm({...form,
    [event.target.name]:event.target.value})
  }

  const onSubmit = (event) =>{
    event.preventDefault();
    console.log(event.target);
    console.log(form);
    add(form);
  }

  return(
    <main>
      <h2 className='bg-light'>도서 등록</h2>

      <form onSubmit={onSubmit}>
        <input type='text' className='form-control' name='no'     value={no}     onChange={onChangeForm} placeholder='도서 번호를 입력해 주세요'/><br/>
        <input type='text' className='form-control' name='title'  value={title}  onChange={onChangeForm} placeholder='도서 제목을 입력해 주세요'/><br/>
        <input type='text' className='form-control' name='author' value={author} onChange={onChangeForm} placeholder='도서 저자를 입력해 주세요'/><br/><br/>
        <button className='btn btn-primary btn-xs'>등록하기</button>&nbsp;
        <button className='btn btn-danger btn-xs'>다시입력</button>
      </form>
    </main>
  )
}

export default App;
