import handleApiCall from '../services/handleApiCallCervice';
import filterSymbolsOnDisplay from '../services/filterSymbolsOnDisplayService';
export const GET_COIN_INDEX_REQUEST = "GET_COIN_INDEX_REQUEST";
export const GET_COIN_INDEX_SUCCESS = "GET_COIN_INDEX_SUCCESS";
export const GET_COIN_INDEX_FAILURE = "GET_COIN_INDEX_FAILURE";

export const GET_COIN_INDEX_DATA_REQUEST = "GET_COIN_INDEX_DATA_REQUEST";
export const GET_COIN_INDEX_DATA_SUCCESS = "GET_COIN_INDEX_DATA_SUCCESS";
export const GET_COIN_INDEX_DATA_FAILURE = "GET_COIN_INDEX_DATA_FAILURE";

export const CHANGE_COINS_PER_PAGE = "CHANGE_COINS_PER_PAGE";
export const CHANGE_PAGE = "CHANGE_PAGE";

const apiCoinIndexUrl = 'https://min-api.cryptocompare.com/data/all/coinlist';
const apiCoinIndexDataUrl = '/coins';


export const getCoinIndexThenData = () => {
  return async (dispatch, getState) => {
    await dispatch(getCoinIndex());
    const {index, currentPage, coinsPerPage, govDisplayCurrency, cryptoDisplayCurrency} = getState().coins;
    const symbolsOnDisplay = filterSymbolsOnDisplay(index, currentPage, coinsPerPage);
    await dispatch(getCoinIndexData(symbolsOnDisplay, govDisplayCurrency, cryptoDisplayCurrency));
  };
};

export const getCoinIndex = () => {
  return handleApiCall(
    apiCoinIndexUrl,
    'GET',
    {},
    getCoinIndexRequest,
    getCoinIndexSuccess,
    getCoinIndexFailure
  );
};

export const getCoinIndexData = (symbolsOnDisplay, govDisplayCurrency, cryptoDisplayCurrency) => {
  const fsyms = symbolsOnDisplay.toString();
  const tsyms = [govDisplayCurrency, cryptoDisplayCurrency].toString();
  return handleApiCall(
    `${apiCoinIndexDataUrl}/?fsyms=${fsyms}&tsyms=${tsyms}`,
    'GET',
    {},
    getCoinIndexDataRequest,
    getCoinIndexDataSuccess,
    getCoinIndexDataFailure
  );
};

export const getCoinIndexRequest = () => {
  return {
    type: GET_COIN_INDEX_REQUEST,
  };
};
export const getCoinIndexSuccess = (data) => {
  return {
    type: GET_COIN_INDEX_SUCCESS,
    data: data
  };
};
export const getCoinIndexFailure = (error) => {
  return {
    type: GET_COIN_INDEX_FAILURE,
    data: error
  };
};

export const getCoinIndexDataRequest = () => {
  return {
    type: GET_COIN_INDEX_DATA_REQUEST,
  };
};
export const getCoinIndexDataSuccess = (data) => {
  return {
    type: GET_COIN_INDEX_DATA_SUCCESS,
    data: data
  };
};
export const getCoinIndexDataFailure = (error) => {
  return {
    type: GET_COIN_INDEX_DATA_FAILURE,
    data: error
  };
};

export const changeCoinsPerPage = (data) => {
  return {
    type: CHANGE_COINS_PER_PAGE,
    data: data
  };
};
export const changePage = (data) => {
  return {
    type: CHANGE_PAGE,
    data: data
  };
};
