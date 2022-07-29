import React from 'react';

class Tab extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            selectedTabIndex: 0
        }
        this.tabData = [
            {title: "Victor", content: "Stoic"},
            {title: "Michael", content: "Shen"},
            {title: "Mohammad", content: "Riz"},
            {title: "David", content: "Hong"}
        ]

    }

    render() {
        return (
            <div>
                <ul>
                    {this.tabData.map((obj, idx) => {
                        return <h1 key={idx+obj}>{obj.title}</h1>
                    })}
                </ul>
            </div>
        )
    }
    
}

export default Tab