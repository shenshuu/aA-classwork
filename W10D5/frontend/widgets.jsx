import React from "react";
import ReactDOM from 'react-dom';
import Clock from './clock';

window.addEventListener('DOMContentLoaded', () => {

    const root = document.querySelector('#root');
    
    const hello = React.createElement('h1', null, ["Hello from react"]);

    ReactDOM.render(<Clock name={"glocky"}/>, root);
});