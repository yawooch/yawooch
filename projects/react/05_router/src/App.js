import './App.css';
import { Route, Routes } from 'react-router-dom'
import Homepage from './components/Homepage';
import AboutPage from './components/AboutPage';
import ProfilePage from './components/ProfilePage';
import CommentsPage from './components/CommentsPage';
import NotFoundPage from './components/NotFoundPage';
import Layout from './components/Layout';
import BoardPage from './components/BoardPage';
import CommentsPage2 from './components/CommentsPage2';

function App() {
  return (
    <Routes>
      {/* 공통 레이아웃 컴포넌트 */}
      <Route element={<Layout/>}>
        {/* <Route path='/' element={<Homepage/>}/> */}
        <Route index element={<Homepage/>}/>
        <Route path='/about' element={<AboutPage/>}/>
        <Route path='/profile/:userId' element={<ProfilePage/>}/>
        <Route path='/comments' element={<CommentsPage/>}/>
        <Route path='/board/:paramUserId' element={<BoardPage/>}/>
        <Route path='/board/:paramUserId/comments' element={<CommentsPage2/>}/>
        <Route path='/*' element={<NotFoundPage/>}/>
      </Route>
    </Routes>
  );
}

export default App;
