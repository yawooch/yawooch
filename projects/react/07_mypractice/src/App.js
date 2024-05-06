import { Routes, Route, Link, useNavigate } from "react-router-dom";
import "bootstrap/dist/css/bootstrap.min.css";
import "./index.css";
import { useReducer, useState } from "react";

const HomePage = () => {
  return <h2>홈페이지</h2>;
};

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
const Counter = () => {

  
  const [state, dispatch] = useReducer(reducer, { count: 0 });
  return (
    <>
      <h2>카운터</h2>
      <p>현재 카운트의 값은 {state.count} 입니다.</p>
      {/* <button className='btn btn-light btn-sm' onClick={onClickIncrease}>+1 증가</button>&nbsp;
    <button className='btn btn-light btn-sm' onClick={onClickDecrease}>-1 감소</button> */}
      {/* dispatch 함수에 파라미터롤 액션값을 넣어주면 reducer 함수가 실행된다 */}
      <button
        className="btn btn-light btn-sm"
        onClick={() => dispatch({ type: "INCREMENT" })}
      >
        +1 증가
      </button>
      &nbsp;
      <button
        className="btn btn-light btn-sm"
        onClick={() => dispatch({ type: "DECREMENT" })}
      >
        -1 감소
      </button>
    </>
  );
};

const BookList = ({ books, del }) => {
  const navigate = useNavigate();

  const onClickAddBookPage = () => {
    navigate("/addBookPage");
  };

  return (
    <>
      <h2>도서 목록</h2>
      <table className="table">
        <thead>
          <tr>
            <th>No.</th>
            <th>도서 제목</th>
            <th>도서 저자</th>
            <th>삭제</th>
          </tr>
        </thead>

        <tbody>
          {books.map((book) => {
            return (
              <tr key={book.no}>
                <td>{book.no}</td>
                <td>{book.title}</td>
                <td>{book.author}</td>
                <td>
                  <button
                    className="btn btn-danger btn-sm"
                    onClick={() => {
                      del(book.no);
                    }}
                  >
                    삭제
                  </button>
                </td>
              </tr>
            );
          })}
        </tbody>
      </table>
      <button className="btn btn-primary btn-sm" onClick={onClickAddBookPage}>
        등록하기
      </button>
    </>
  );
};
const AddBookPage = ({ add }) => {
  const [form, setForm] = useState({
    no: 4,
    title: "누가 내 머리에 똥쌌어",
    author: "베르너 홀즈워스",
  });
  const { no, title, author } = form;

  const onChangeForm = (event) => {
    setForm({
      ...form,
      [event.target.name]: event.target.value,
    });
  };
  const onClickReset = () => {
    setForm({
      no: "",
      title: "",
      author: "",
    });
  };

  const onSubmitForm = (event) => {
    event.preventDefault();
    add(form);
  };

  return (
    <>
      <h2>도서 등록</h2>
      <form onSubmit={onSubmitForm}>
        <input
          type="text"
          className="form-control"
          placeholder="도서 번호를 입력하세요"
          name="no"
          value={no}
          onChange={onChangeForm}
        />
        <br />
        <input
          type="text"
          className="form-control"
          placeholder="도서 제목을 입력하세요"
          name="title"
          value={title}
          onChange={onChangeForm}
        />
        <br />
        <input
          type="text"
          className="form-control"
          placeholder="도서 저자를 입력하세요"
          name="author"
          value={author}
          onChange={onChangeForm}
        />
        <br />
        <br />
        <button className="btn btn-primary btn-sm">등록하기</button>&nbsp;
        <button
          className="btn btn-danger btn-sm"
          type="reset"
          onClick={onClickReset}
        >
          다시입력
        </button>
      </form>
    </>
  );
};

function App() {
  const navigate = useNavigate();

  const [books, setBooks] = useState([
    { no: 1, title: "홍길동전", author: "홍길동" },
    { no: 2, title: "자바의정석", author: "남궁성" },
    { no: 3, title: "파피용", author: "베르나르베르베르" },
  ]);

  const deleteBook = (bookNo) => {
    if (window.confirm(`${bookNo}번 책을 삭제합니다? `)) {
      setBooks(books.filter((book) => book.no !== bookNo));
    }
  };
  const addBook = (book) => {
    if (window.confirm(`${book.no}번 책을 등록합니다? `)) {
      if (book.no !== "") {
        setBooks([...books, book]);
        navigate("/books");
      } else alert("책 정보를 입력해주세요");
    }
  };
  return (
    <>
      <nav>
      <header className="container nav nav-bar nav-dark">
        <div className="box">
          <Link to="/">홈으로</Link>
        </div>
        <div className="box">
          <Link to="/counter">카운터</Link>
        </div>
        <div className="box">
          <Link to="/books">도서</Link>
        </div>
        <div className="box">
          
        <a href="#">FRONT</a>
                <ul>
                    <li><a href="#">HTML5</a></li>
                    <li><a href="#">CSS3</a></li>
                    <li><a href="#">JAVASCRIPT</a></li>
                    <li><a href="#">JQUERY</a></li>
                    <li><a href="#">REACT</a></li>
                </ul>
        </div>
      </header>
      </nav>
      <div class="bodyContainer">
      <Routes >
        <Route path="/" element={<HomePage />}></Route>
        <Route path="/counter" element={<Counter />}></Route>
        <Route
          path="/books"
          element={<BookList books={books} del={deleteBook} />}
        ></Route>
        <Route
          path="/addBookPage"
          element={<AddBookPage add={addBook} />}
        ></Route>
      </Routes>
      </div>
    </>
  );
}
export default App;
