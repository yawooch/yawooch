import React from 'react';
import { Link, Outlet, useNavigate } from 'react-router-dom';

const Layout = () => {
    //Link 컴포넌트를 사용하지 않고 다른페이지로 이동해야하는 상황에서 사용하는 Hook이다.
    let navigate = useNavigate();

    return (
        <>
            <header>
                <nav className="navbar navbar-expand-sm bg-danger navbar-dark">
                    <div className="container-fluid">
                        <a className="navbar-brand" href="#">
                            <Link className="nav-link active" to="/"><h2>Header 영역</h2></Link>
                        </a>
                        <button className="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
                            <span className="navbar-toggler-icon"></span>
                        </button>
                        <div className="collapse navbar-collapse" id="collapsibleNavbar">
                            <ul className="navbar-nav">
                                <li className="nav-item">
                                    {/* 파라미터가 숫자 타입이라면 앞으로 가거나 뒤로 이동한다. */}
                                    <button className="nav-link" onClick={()=>{navigate(-1)}}>뒤로가기</button>
                                    {/* <a className="nav-link" href="#">뒤로가기</ㅠa> */}
                                </li>
                                <li className="nav-item">
                                    {/* {replace:true}는 페이지 이동시 기록을 남기지 않는다. */}
                                    <button className="nav-link" onClick={()=>{navigate('/about', {replace:true})}}>소개</button>
                                </li>
                                <li className="nav-item">
                                    <a className="nav-link" href="#">Link</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </header>
            <main>
                <Outlet>
                    
                </Outlet>
            </main>
            <footer>
                <nav className="navbar navbar-expand-sm bg-secondary navbar-dark">
                    <div className="container-fluid">
                        <ul className="navbar-nav">
                            <li className="nav-item">
                                <Link className="nav-link active" to="/"><h2>Footer 영역</h2></Link>
                            </li>
                        </ul>
                    </div>
                </nav>
            </footer>
        </>
    );
};

export default Layout;