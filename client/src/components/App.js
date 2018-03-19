import React, { Component } from 'react';
import '../App.css';
import MainNav from './MainNav';
import { BrowserRouter as Router } from 'react-router-dom';

class App extends Component {
  render() {
    return (
      <Router>
        <div>
          <MainNav />
        </div>
      </Router>
    );
  }
}

export default App;
