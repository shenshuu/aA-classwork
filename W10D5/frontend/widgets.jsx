import React from "react";
import ReactDOM from 'react-dom';
// debugger;
window.addEventListener('DOMContentLoaded', () => {
    // debugger;
    const root = document.querySelector('#root');
    
    const hello = React.createElement('h1', null, ["Hello from react"]);
    
    ReactDOM.render(hello, root);
});