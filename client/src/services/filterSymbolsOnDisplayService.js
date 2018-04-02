const filterSymbolsOnDisplay = (coinIndex, currentPage, coinsPerPage) => {
  const startIndex = (currentPage - 1) * coinsPerPage;
  const endIndex = (currentPage) * coinsPerPage;
  const thisCoin = (symbol) => coinIndex[symbol];
  return Object.keys(coinIndex)
    .filter(symbol => {
      return (
        +thisCoin(symbol).SortOrder > startIndex 
        &&
        +thisCoin(symbol).SortOrder <= endIndex
      );
    })
    .sort((symbolA, symbolB) => +thisCoin(symbolA).SortOrder > +thisCoin(symbolB).SortOrder);
};

export default filterSymbolsOnDisplay;