import React from 'react';
import Hero from './hero';
import NavBar from './navbar';
import WhoWeAre from './whoweare';
import './vernon';




class App extends React.Component {

    render() {
        return (
            <div>
            <div>
            < NavBar />
            < Hero />
            </div>
             < WhoWeAre />
             </div>
       );
    }

}

export default App;