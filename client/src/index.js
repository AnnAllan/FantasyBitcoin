import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import 'bootstrap/dist/css/bootstrap.css';
import {createStore, applyMiddleware, compose} from 'redux';
import {Provider} from 'react-redux';
import thunk from 'redux-thunk';
import reducers from './reducers/reducers';
import App from './components/App';
import registerServiceWorker from './registerServiceWorker';

var store = createStore(reducers, compose(
  applyMiddleware(thunk),
  window.__REDUX_DEVTOOLS_EXTENSION__ &&
  window.__REDUX_DEVTOOLS_EXTENSION__())
);

ReactDOM.render(
  <Provider store={store}>
    <App />
  </Provider>,  
  document.getElementById('root')
);
registerServiceWorker();
