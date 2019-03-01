import React from 'react';
import Logo from 'images/logo/C3 Logo White Vernon.png';

class Hero extends React.Component {
    render() {
        return (
            <div className="fixed_container">
            <img className="logo centered" src={Logo} />
            </div>
        );
    }
}

export default Hero;