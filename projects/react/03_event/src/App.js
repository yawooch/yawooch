/* import SignUp from './components/SignUp1'; */
import SignUp from './components/SignUp2';
import './App.css';
import 'bootstrap/dist/css/bootstrap.min.css';
/* import FoodList from './components/FoodList1'; */
import FoodList from './components/FoodList2';
import ProductList from './components/ProductList';

function App() {
  return (
    <>
      <h2>이벤트 실습</h2>
      <SignUp/>
      <FoodList/>
      <ProductList/>
    </>
  );
}

export default App;
