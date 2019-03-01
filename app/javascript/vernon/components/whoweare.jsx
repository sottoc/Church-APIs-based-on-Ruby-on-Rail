import React from 'react';
import ScrollableAnchor from 'react-scrollable-anchor'
import LeadPastor from 'images/pastors.png';
import C3Global from 'images/phil-and-chris-v3.jpg'
import { configureAnchors } from 'react-scrollable-anchor'

// Offset all anchors by -60 to account for a fixed header
// and scroll more quickly than the default 400ms
configureAnchors({ offset: -50, scrollDuration: 800 })

class WhoWeAre extends React.Component {
    render() {
        return (
            <ScrollableAnchor id={'whoweare'}>
                <div className='whoweare'>
                    <div className='row'>
                        <div className='photo'>
                            <img className="leadpastor" src={LeadPastor} />
                        </div>
                        <div className="identityblock">
                            <div className='title'>
                                Pastors Dave & Kim
                                <span>Lead Pastors (Kelowna/Vernon/Revelstoke)</span>
                            </div>
                            <div className='bio'>
                                As lead pastors, Dave & Kim Olson have a passion to see those who are out of church find a reason to 'come and become who they were born to be.'
                                In 1990, with a passion for people and a strong sense of family and community, the Olsons - with their 4 kids under 6 - moved to Revelstoke to take over an existing mountain church.
                               That church is now our Revelstoke location and those 4 kids are now four married adults all involved in church somehow, somewhere.
                               Those years helped establish their core values of inclusiveness and longevity. In 2005 Dave & Kim started a second location in Kelowna.
                               They commuted every Sunday between Revelstoke and Kelowna until about 3 years ago when Josiah and Kimberly Olson were sent as location pastors to Revelstoke to free Dave and Kim to start a morning service in Kelowna.
                               Now it's time for a Vernon location. Over those years there have been so many lives changed.
                               So many who had no previous experience with church and many who had essentially given up on church. We know that there are probably hundreds of people in Vernon who have given up on church, or maybe don't see the point.
                               That's why we are starting a Vernon location.  For YOU!
                    </div>
                        </div>
                    </div>

                    <div className="row">
                        <div className="title">
                            ABOUT C3 CHURCH
                            </div>
                        
                        <div className="title dropped">
                            <span>
                                WHO WE ARE
                                </span>
                                </div>
                        
                        <div className="bio">
                            Our movement is committed to healthy relationships and connection between ministers and churches. As an international family our members are able to walk into any of our C3 Churches around the world and know they’re home. We are united with Christ in His vision, and therefore our mission, to save the lost, make disciples and build His church.
                        </div>

                        <div className="title dropped">
                        <span>
                            WHERE WE’VE COME FROM
                            </span>
                            </div>
                        <div className="bio">
                        With a passion for Jesus and desire to see this world won for Christ, Phil and Chris Pringle came to Sydney in 1980 to start a church. With just 12 people attending an Easter service, Christian Centre Northside began and the C3 Church movement as we now know was birthed. This church grew to over 400 in 4 years and soon began planting within Sydney and beyond to cities and countries outside of Australia.
                        </div>
                        <div className="title dropped">
                            <span>
                        WHERE WE ARE GOING
                        </span>
                        </div>
                        <div class='bio'>
                        With over 500 churches in 64 countries, we are rapidly moving towards the 2020 Vision of 1,000 Locations planted by the year 2020.
                        </div>
                        
    </div>

                    <div className='row'>
                        <div className='photo'>
                            <img className="philchris" src={C3Global} />
                        </div>
                        <div className="identityblock2">
                            <div className='title'>
                                Pastors Phil & Chris
                                <span>Founders and C3 Global Directors</span>
                            </div>
                            <div className='bio'>
                                Pastor Phil is passionate about building faith-filled, anointed churches that are motivated to reach the lost and make disciples.
                                His heart is to see local churches thrive in their community through functioning in the power of the Holy Spirit and feeding on the Word of God.
                                Mama Chris, as she is affectionately known, brings life, revelation, healing and joy.
                                Everyone who experiences her ministry will find themselves inspired, encouraged and changed.
                    </div>
                        </div>
                    </div>
                </div>
            </ScrollableAnchor>
        );
    }
}

export default WhoWeAre;