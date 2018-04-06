require 'rails_helper'

describe CoinsController do
  describe "GET index" do
    context "with a successful response" do
      it "returns a status code of 200", :vcr do
        get :index
        expect(response).to have_http_status(200)
      end

      it "returns a repsonse with empty coin info if there are no tsyms passed in the request", :vcr do
        get :index
        expect(JSON.parse response.body).to eq({})
      end

      it "returns the sort order for each coin", :vcr do
        get :index, params: { fsyms: "ETH,DOGE" }
        body = JSON.parse response.body
        expect(body["coins"]["ETH"]["SortOrder"]).to eq("2")
        expect(body["coins"]["DOGE"]["SortOrder"]).to eq("8")
      end

      it "returns the symbol for each coin", :vcr do
        get :index, params: { fsyms: "ETH,DOGE" }
        body = JSON.parse response.body
        expect(body["coins"]["ETH"]["Symbol"]).to eq("ETH")
        expect(body["coins"]["DOGE"]["Symbol"]).to eq("DOGE")
      end

      it "returns the coin name for each coin", :vcr do
        get :index, params: { fsyms: "ETH,DOGE" }
        body = JSON.parse response.body
        expect(body["coins"]["ETH"]["CoinName"]).to eq("Ethereum")
        expect(body["coins"]["DOGE"]["CoinName"]).to eq("Dogecoin")
      end

      it "returns the coin image for each coin", :vcr do
        get :index, params: { fsyms: "ETH,DOGE"}
        body = JSON.parse response.body
        expect(body["coins"]["ETH"]["ImageUrl"]).to eq("/media/20646/eth_logo.png")
        expect(body["coins"]["DOGE"]["ImageUrl"]).to eq("/media/19684/doge.png")
      end


      it "returns the marketcap for each coin", :vcr do
        get :index, params: { fsyms: "ETH,DOGE" }
        body = JSON.parse response.body
        expect(body["coins"]["ETH"]["USD"]["marketCap"]).to be_present
        expect(body["coins"]["ETH"]["BTC"]["marketCap"]).to be_present
        expect(body["coins"]["DOGE"]["USD"]["marketCap"]).to be_present
        expect(body["coins"]["DOGE"]["BTC"]["marketCap"]).to be_present
      end

      it "returns the supply for each coin", :vcr do
        get :index, params: { fsyms: "ETH,DOGE" }
        body = JSON.parse response.body
        expect(body["coins"]["ETH"]["USD"]["supply"]).to be_present
        expect(body["coins"]["ETH"]["BTC"]["supply"]).to be_present
        expect(body["coins"]["DOGE"]["USD"]["supply"]).to be_present
        expect(body["coins"]["DOGE"]["BTC"]["supply"]).to be_present
      end

      it "returns the 24HrVolume for each coin", :vcr do
        get :index, params: { fsyms: "ETH,DOGE" }
        body = JSON.parse response.body
        expect(body["coins"]["ETH"]["USD"]["24HrVolume"]).to be_present
        expect(body["coins"]["ETH"]["BTC"]["24HrVolume"]).to be_present
        expect(body["coins"]["DOGE"]["USD"]["24HrVolume"]).to be_present
        expect(body["coins"]["DOGE"]["BTC"]["24HrVolume"]).to be_present
      end

      it "returns the 24HrPctPrice for each coin", :vcr do
        get :index, params: { fsyms: "ETH,DOGE" }
        body = JSON.parse response.body
        expect(body["coins"]["ETH"]["USD"]["24HrPctPrice"]).to be_present
        expect(body["coins"]["ETH"]["BTC"]["24HrPctPrice"]).to be_present
        expect(body["coins"]["DOGE"]["USD"]["24HrPctPrice"]).to be_present
        expect(body["coins"]["DOGE"]["BTC"]["24HrPctPrice"]).to be_present
      end

      it "returns the price for each coin", :vcr do
        get :index, params: { fsyms: "ETH,DOGE" }
        body = JSON.parse response.body
        expect(body["coins"]["ETH"]["USD"]["price"]).to be_present
        expect(body["coins"]["ETH"]["BTC"]["price"]).to be_present
        expect(body["coins"]["DOGE"]["USD"]["price"]).to be_present
        expect(body["coins"]["DOGE"]["BTC"]["price"]).to be_present
      end
    end
  end

  describe "GET exchanges", :vcr do
    it "returns the aggregate fields for the coin pair for the day", :vcr do
      get :exchanges, params: { fsym: "ETH", tsym: "USD", limit: 8}
      body = JSON.parse response.body
      expect(body["aggregated"]["exchange"]).to be_present
      expect(body["aggregated"]["lastUpdated"]).to be_present
      expect(body["aggregated"]["closing"]).to be_present
      expect(body["aggregated"]["high"]).to be_present
      expect(body["aggregated"]["low"]).to be_present
      expect(body["aggregated"]["open"]).to be_present
      expect(body["aggregated"]["volumefrom"]).to be_present
    end

    it "returns the individual fields for each exchange", :vcr do
      get :exchanges, params: { fsym: "ETH", tsym: "USD", limit: 8}
      body = JSON.parse response.body
      expect(body["exchanges"]["0"]["exchange"]).to be_present
      expect(body["exchanges"]["0"]["lastUpdated"]).to be_present
      expect(body["exchanges"]["0"]["closing"]).to be_present
      expect(body["exchanges"]["0"]["high"]).to be_present
      expect(body["exchanges"]["0"]["low"]).to be_present
      expect(body["exchanges"]["0"]["open"]).to be_present
      expect(body["exchanges"]["0"]["volumefrom"]).to be_present
    end
  end

  describe "GET coin_pair_detail" do
    context "with a successful response" do
      it "returns the time field for the coin pair for each day", :vcr do
        get :coin_pair_detail, params: { fsym: "ETH", tsym: "USD", fdate: "2018-03-21", tdate: "2018-03-23", market: "Bitfinex"}
        body = JSON.parse response.body
        expect(body["tsym"]["0"]["time"]).to be_present
        expect(body["tsym"]["1"]["time"]).to be_present
        expect(body["tsym"]["2"]["time"]).to be_present
      end

      it "returns the close field for the coin pair for each day", :vcr do
        get :coin_pair_detail, params: { fsym: "ETH", tsym: "USD", fdate: "2018-03-21", tdate: "2018-03-23", market: "Bitfinex"}
        body = JSON.parse response.body
        expect(body["tsym"]["0"]["close"]).to be_present
        expect(body["tsym"]["1"]["close"]).to be_present
        expect(body["tsym"]["2"]["close"]).to be_present
      end

      it "returns the high field for the coin pair for each day", :vcr do
        get :coin_pair_detail, params: { fsym: "ETH", tsym: "USD", fdate: "2018-03-21", tdate: "2018-03-23", market: "Bitfinex"}
        body = JSON.parse response.body
        expect(body["tsym"]["0"]["high"]).to be_present
        expect(body["tsym"]["1"]["high"]).to be_present
        expect(body["tsym"]["2"]["high"]).to be_present
      end

      it "returns the low field for the coin pair for each day", :vcr do
        get :coin_pair_detail, params: { fsym: "ETH", tsym: "USD", fdate: "2018-03-21", tdate: "2018-03-23", market: "Bitfinex"}
        body = JSON.parse response.body
        expect(body["tsym"]["0"]["low"]).to be_present
        expect(body["tsym"]["1"]["low"]).to be_present
        expect(body["tsym"]["2"]["low"]).to be_present
      end

      it "returns the open field for the coin pair for each day", :vcr do
        get :coin_pair_detail, params: { fsym: "ETH", tsym: "USD", fdate: "2018-03-21", tdate: "2018-03-23", market: "Bitfinex"}
        body = JSON.parse response.body
        expect(body["tsym"]["0"]["open"]).to be_present
        expect(body["tsym"]["1"]["open"]).to be_present
        expect(body["tsym"]["2"]["open"]).to be_present
      end

      it "returns the volumefrom field for the coin pair for each day", :vcr do
        get :coin_pair_detail, params: { fsym: "ETH", tsym: "USD", fdate: "2018-03-21", tdate: "2018-03-23", market: "Bitfinex"}
        body = JSON.parse response.body
        expect(body["tsym"]["0"]["volumefrom"]).to be_present
        expect(body["tsym"]["1"]["volumefrom"]).to be_present
        expect(body["tsym"]["2"]["volumefrom"]).to be_present
      end

      it "returns the volumeto field for the coin pair for each day", :vcr do
        get :coin_pair_detail, params: { fsym: "ETH", tsym: "USD", fdate: "2018-03-21", tdate: "2018-03-23", market: "Bitfinex"}
        body = JSON.parse response.body
        expect(body["tsym"]["0"]["volumeto"]).to be_present
        expect(body["tsym"]["1"]["volumeto"]).to be_present
        expect(body["tsym"]["2"]["volumeto"]).to be_present
      end
    end
  end

end
