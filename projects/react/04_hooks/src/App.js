import 'bootstrap/dist/css/bootstrap.min.css';
import './App.css';
import Counter from './components/Counter';
import Info from './components/Info';
import Average from './components/Average';
import Users from './components/Users';


function App() {
  return (
    <>
      <h2><mark>Hooks</mark></h2>
        <Counter/>
        <Info/>
        <Average/>
        <Users/>
    </>
  );
}

export default App;
