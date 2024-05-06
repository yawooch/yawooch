import React from 'react';
import PropTypes from "prop-types";

const Student = ({no, name, age}) => {
/* const Student = (props) => { */
    /* console.log(props); */

    /* const {no, name, age} = props; */
    
    const helloStyle = {
        backgroundColor : 'black',
        color:'white',
        fontSize: '0.8em',
        fontWeight: 'bold'
    }
    return (
        <p style={helloStyle}>
            안녕하세요 저의 이름은  {name} 이고, 학번은 {no}번 이며,  나이는 {age} 살입니다.
        </p>
    );
};
Student.defaultProps = {
    no:0,
    name :'아무개',
    age:15
}
Student.propTypes  = {
    no:PropTypes.number.isRequired,
    name:PropTypes.string.isRequired,
    age:PropTypes.number
}
export default Student;