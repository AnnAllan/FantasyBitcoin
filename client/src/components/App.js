import React, { Component } from 'react';
import { connect } from 'react-redux';
import '../App.css';
import MainNav from './MainNav';
import { BrowserRouter as Router } from 'react-router-dom';

const mapStateToProps = (state) => {
  return {};
}
const mapDispatchToProps = dispatch => {
  return {
    
  };
}
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

export default connect(mapStateToProps, mapDispatchToProps)(App);
