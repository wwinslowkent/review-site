import 'babel-polyfill';
import 'whatwg-fetch';
import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/App';

$(function() {

  ReactDOM.render(
    <App />,
    document.getElementById('app')
  );

});
