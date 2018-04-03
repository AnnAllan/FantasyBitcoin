# Cryptocurrency Trading Simulator

A React + Rails SPA for simulating blockchain currency trades with fake money. This app allows a user to find cryptocurrencies to trade, research details on tradeable coin-pairs, select an exchange, execute a trade, review a history of past trades, and see their current portfolio of coins and cash. 

## Documentation
Documentation for the API serving data to the React client is available via Postman: 
https://documenter.getpostman.com/view/2759449/collection/RVnZfx7D

## Tech Stack

- MongoDB
- Mongoid ORM
- Rails
- React
- React-Router
- Redux
- Redux-Thunk

## Wireframes

<img src="https://raw.githubusercontent.com/AnnAllan/FantasyBitcoin/master/docs/wireframes/Coin-Pair%20Detail.png" 
     width="600" alt="Coin-Pair Detail Page">  
**Research Tradeable Coin-Pairs**  
_Select a coin-pair, get aggregated data, select an exchange where the coin-pair is traded, and see historical trading activity for that exchange._  
  
<img src="https://raw.githubusercontent.com/AnnAllan/FantasyBitcoin/master/docs/wireframes/Coins%20Index.png" 
     width="600" alt="Coin Index Page">  
**View A List Of Blockchain Currencies**  
_See data on avaliable cryptocurrency coins with values converted to a government-backed currency or another cryptocurrency._  
  
<img src="https://raw.githubusercontent.com/AnnAllan/FantasyBitcoin/master/docs/wireframes/Trade.png" 
     width="600" alt="Trading Page">  
**Execute Trades of Valid Coin-Pairs**  
_Use the simulated trading page to execute fake cryptocurrency trades. Coin-pair trades are checked for validity against extant exchanges and your portfolio contents._
