import reduxTdd from 'redux-tdd';
import CoinIndex from '../components/CoinIndex';
import * as CoinActions from '../actions/CoinActions';
import {coins} from '../reducers/CoinsReducer';
import Enzyme, {shallow} from 'enzyme';
import React, {Component} from 'react';
import Adapter from 'enzyme-adapter-react-16';
const mockAPIResponse = require('./mockAPIResponse');

Enzyme.configure({ adapter: new Adapter() });

const initial = {
  coins: {
    index: {},
    rootImgUrl: '',
    isFetching: false,
    error: null
  },
};

reduxTdd({coins}, (state) => shallow(
    <CoinIndex 
      coins={state.coins}
      getCoinIndex={CoinActions.getCoinIndex}
    />
  )
)
.it('should load items')
  .action(props => props.getCoinIndex())
  .epic(CoinActions.getCoinIndex, { getJSON: () =>
    // force/mock the API call to return this JSON
    Observable.of(mockAPIResponse)
  })
  .toMatchProps({ coins: 
    {
      rootImgUrl: 'https://www.cryptocompare.com',
      index: {
        "Data": {
          "42": {
          "Id": "4321",
          "Url": "/coins/42/overview",
          "ImageUrl": "/media/12318415/42.png",
          "Name": "42",
          "Symbol": "42",
          "CoinName": "42 Coin",
          "FullName": "42 Coin (42)",
          "Algorithm": "Scrypt",
          "ProofType": "PoW/PoS",
          "FullyPremined": "0",
          "TotalCoinSupply": "42",
          "PreMinedValue": "N/A",
          "TotalCoinsFreeFloat": "N/A",
          "SortOrder": "34",
          "Sponsored": false,
          "IsTrading": true
          },
          "300": {
          "Id": "749869",
          "Url": "/coins/300/overview",
          "ImageUrl": "/media/27010595/300.png",
          "Name": "300",
          "Symbol": "300",
          "CoinName": "300 token",
          "FullName": "300 token (300)",
          "Algorithm": "N/A",
          "ProofType": "N/A",
          "FullyPremined": "0",
          "TotalCoinSupply": "300",
          "PreMinedValue": "N/A",
          "TotalCoinsFreeFloat": "N/A",
          "SortOrder": "2212",
          "Sponsored": false,
          "IsTrading": true
          },
        },
    
      }
    }
  }
);



// // Counter.test.js
// it('should test the arrows going in and out of the VIEW', () => {
//   // input to the view
//   wrapper = shallow(<Counter counter={1} />);
//   expect(wrapper.contains(<span>1</span>)).toBeTruthy();
//   // output of the view
//   wrapper = shallow(<Counter onClick={incrementAction} />);
//   wrapper.find(button).simulate('click');
//   expect(incrementAction).toHaveBeenCalled();
// })
// // reducers.test.js
// it('should test the arrows going in and out of the REDUCER', () => {
//   // input to the reducer
//   const newState = reducer({ count: 0 }, incrementAction())
//   // output of the reducer
//   expect(newState).toEqual({ count: 1 });
// })
// // actions.test.js
// it('should test the arrows going in and out of the ACTION', () => {
//   expect(incrementAction()).toMatchObject({ type: 'INCREMENT' });
// })