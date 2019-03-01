import React from 'react'
import ReactDOM from 'react-dom'
import App from './components/App'
import WebFont from 'webfontloader';

WebFont.load({
  typekit: {
    id: 'fch6vdb'
  }
});

const vernon = document.querySelector('#main')
ReactDOM.render(<App />, vernon)