import * as CoinActions from '../actions/CoinActions';

const initial = {
  coins: {
    index: {},
    govDisplayCurrency: 'USD',
    cryptoDisplayCurrency: 'BTC',
    currentPage: 1,
    coinsPerPage: 10,
    rootImgUrl: '',
    isFetching: false,
    error: null
  },
};

const spreadIndexData = (coinIndex, newIndexData) => {
  return Object.keys(newIndexData.coins).reduce((coinIndex, coinSymbol) => {
    coinIndex[coinSymbol] = {
      ...coinIndex[coinSymbol],
      ...newIndexData.coins[coinSymbol]
    }
    return coinIndex;
  }, coinIndex);
}
export const coins = (state=initial.coins, action) => {
  switch (action.type) {
    case CoinActions.GET_COIN_INDEX_REQUEST:
    case CoinActions.GET_COIN_INDEX_DATA_REQUEST:
      return {
        ...state,
        isFetching: true,
        error: null
      };
    case CoinActions.GET_COIN_INDEX_SUCCESS:
      return {
        ...state,
        isFetching: false,
        error: null,
        rootImgUrl: action.data.BaseImageUrl,
        index: action.data.Data,
      };
    case CoinActions.GET_COIN_INDEX_DATA_SUCCESS:
      return {
        ...state,
        isFetching: false,
        error: null,
        index: spreadIndexData(state.index, action.data)
      };
    case CoinActions.GET_COIN_INDEX_FAILURE:
    case CoinActions.GET_COIN_INDEX_DATA_FAILURE:
      return {
        ...state,
        isFetching: false,
        error: action.data
      };
    case CoinActions.CHANGE_COINS_PER_PAGE:
      return {
        ...state,
        coinsPerPage: action.data, 
      };
    case CoinActions.CHANGE_PAGE:
      return {
        ...state,
        currentPage: action.data,
      };
    default:
      return state;
  }
};