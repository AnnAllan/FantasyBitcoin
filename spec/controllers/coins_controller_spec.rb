require 'rails_helper'

describe CoinsController do
  context "with a successful response" do
    it "returns a status code of 200" do
      get :index
      expect(response).to have_http_status(200)
    end

    it "returns a repsonse with empty coin info if there are no tsyms passed in the request" do
      get :index
      expect(JSON.parse response.body).to eq({})
    end

    it "returns the symbol for each coin" do
      get :index, params: { fsyms: "ETH,DOGE" }
      body = JSON.parse response.body
      expect(body["coins"]["ETH"].class).to eq(Hash)
      expect(body["coins"]["DOGE"].class).to eq(Hash)
    end

    it "returns the marketcap for each coin" do
      get :index, params: { fsyms: "ETH,DOGE" }
      body = JSON.parse response.body
      expect(body["coins"]["ETH"]["USD"]["marketCap"]).to be_present
      expect(body["coins"]["ETH"]["BTC"]["marketCap"]).to be_present
      expect(body["coins"]["DOGE"]["USD"]["marketCap"]).to be_present
      expect(body["coins"]["DOGE"]["BTC"]["marketCap"]).to be_present
    end

    it "returns the price for each coin" do
      get :index, params: { fsyms: "ETH,DOGE" }
      body = JSON.parse response.body
      expect(body["coins"]["ETH"]["USD"]["price"]).to be_present
      expect(body["coins"]["ETH"]["BTC"]["price"]).to be_present
      expect(body["coins"]["DOGE"]["USD"]["price"]).to be_present
      expect(body["coins"]["DOGE"]["BTC"]["price"]).to be_present
    end
  end
end
