import React from 'react';
import FontAwesomeIcon from '@fortawesome/react-fontawesome'
import faBars from '@fortawesome/fontawesome-free-solid/faBars'



class NavBar extends React.Component {


    burgerToggle() {
        let linksEl = document.querySelector('.narrowLinks');
        if (linksEl.style.display === 'block') {
            linksEl.style.display = 'none';
        } else {
            linksEl.style.display = 'block';
        }
    }
    render() {
    var interestMeeting = "https://www.facebook.com/events/1727083980721343/";
        return (
            <nav className='sticky'>
                <div className="navWide">
                    <div className="wideDiv">
                        <a href="#whoweare">Who We Are</a>
                        <a href={ interestMeeting }>Interest Meeting</a>
                        <a href="https://myc3church.elvanto.eu/form/65192445-1004-4ec1-806b-e1feb9bf3e3e">Join The Team</a>
                        <a href="https://tithe.ly/give?c=304197">Give</a>
                    </div>
                </div>
                <div className="navNarrow">
                    <span onClick={this.burgerToggle}>
                <FontAwesomeIcon icon={faBars} size="2x" color='white' />
                </span>
                    <i className="fas fa-bars fa-2x" onClick={this.burgerToggle}></i>
                    <div className="narrowLinks">
                        <a href="#whoweare" onClick={this.burgerToggle}>Who We Are</a>
                        <a href={ interestMeeting } onClick={this.burgerToggle}>Interest Meeting</a>
                        <a href="https://myc3church.elvanto.eu/form/65192445-1004-4ec1-806b-e1feb9bf3e3e" onClick={this.burgerToggle}>Join The Team</a>
                        <a href="https://tithe.ly/give?c=304197" onClick={this.burgerToggle}>Give</a>
                    </div>
                </div>
            </nav>
        );
    }
}

export default NavBar;