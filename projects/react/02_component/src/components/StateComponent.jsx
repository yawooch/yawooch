import React from 'react';
import Counter from './Counter';
import 'bootstrap/dist/css/bootstrap.min.css';
import { Alert } from 'bootstrap';

const StateComponent = () => {

    return (
        <div>
            <h3>2. State</h3>
            <h4>카운터</h4>
            <Counter/>
        </div>
    );
};

export default StateComponent;