import React from 'react';
import Table, 
  { TableBody, TableCell, TableHead, TableRow, TableFooter, TablePagination } 
    from 'material-ui/Table';
import { withStyles } from 'material-ui/styles';
import Paper from 'material-ui/Paper';
import DisplayCurrencySelect from './DisplayCurrencySelect';
import filterSymbolsOnDisplay from '../services/filterSymbolsOnDisplayService';

const styles = theme => ({
  root: {
    width: '100%',
    marginTop: theme.spacing.unit * 3,
    overflowX: 'auto',
  },
  table: {
    minWidth: '100%',
    logoImgHeight: 40,
    fontSize: 18

  },
  loadingMsg: {
    fontSize: 13
  }
});

let CoinIndex = ({classes, coins, changeCoinsPerPage, changePage, displayCurrency, onDisplayCurrencyChange, }) => {
  const {index, govDisplayCurrency, cryptoDisplayCurrency, currentPage, coinsPerPage, rootImgUrl, isFetching} = coins;
  const header = 
    <TableHead>
      <TableRow>
        <TableCell>Symbol</TableCell>
        <TableCell>Logo</TableCell>
        <TableCell>Name</TableCell>
        <TableCell>Price</TableCell>
        <TableCell>Market Cap</TableCell>
      </TableRow>
    </TableHead>;
  const symbolsOnDisplay = filterSymbolsOnDisplay(index, currentPage, coinsPerPage);
  const coinsMap = symbolsOnDisplay.map(symbol => {
    let thisCoin = index[symbol];
    let thisCoinData = thisCoin[displayCurrency];
    return (
      <TableRow  key={thisCoin.Name}>
        <TableCell>{thisCoin.Name}</TableCell>
        <TableCell>
          <img 
            src={`${rootImgUrl}/${thisCoin.ImageUrl}`} 
            alt={thisCoin.Name}
            height={40}
          />
        </TableCell>
        <TableCell>{thisCoin.CoinName}</TableCell>
        <TableCell>
          {thisCoinData ? thisCoinData.price : <em>Choose a currency</em>}
        </TableCell>
        <TableCell>
          {thisCoinData ? +(thisCoinData.marketCap).toFixed(2) : <em>Choose a currency</em>}
        </TableCell>
     </TableRow>
    );
  });
  const pagination = 
  <TableFooter>
    <TableRow>
      <TablePagination
        colSpan={6}
        count={Object.keys(index).length}
        rowsPerPage={coinsPerPage}
        page={currentPage-1}
        backIconButtonProps={{
          'aria-label': 'Previous Page',
        }}
        nextIconButtonProps={{
          'aria-label': 'Next Page',
        }}
        onChangePage={changePage}
        onChangeRowsPerPage={changeCoinsPerPage}
        rowsPerPageOptions={[10,25,50]}
      />
    </TableRow>
  </TableFooter>;
  const coinsTable = 
    <Table className={classes.table}>
      {header}
      <TableBody>
      {isFetching 
        ? <p className={classes.loadingMsg}>Loading...</p> 
        : coinsMap}
      </TableBody>
      {pagination}
    </Table>;
  return (
    <Paper className={classes.root}>
      <DisplayCurrencySelect  
        className={classes.select}
        displayCurrency={displayCurrency}
        onDisplayCurrencyChange={onDisplayCurrencyChange}
        govDisplayCurrency={govDisplayCurrency}
        cryptoDisplayCurrency={cryptoDisplayCurrency}
      />
      {coinsTable}
    </Paper>
  );
}

CoinIndex = withStyles(styles, { withTheme: true })(CoinIndex);


export default CoinIndex;