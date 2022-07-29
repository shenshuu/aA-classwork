import React from "react";
import ReactDOM from 'react-dom';
import Clock from './clock';
import Tab from './tabs';

window.addEventListener('DOMContentLoaded', () => {

    const root = document.querySelector('#root');

    function Components() {
        return (
            <div>
                <Clock/>
                <Tab/>
            </div>
        )
    }

    ReactDOM.render(Components(), root);
});