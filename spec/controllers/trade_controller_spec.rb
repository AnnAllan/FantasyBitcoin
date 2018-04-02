require 'rails_helper'

describe TradeController do
  describe "POST trade" do
    context "with a successful response" do
      it "returns a status code of 200", :vcr do
        post :trade
        expect(response).to have_http_status(200)
      end

      # it "returns a repsonse with empty coin info if there are no tsyms passed in the request", :vcr do
      #   get :index
      #   expect(JSON.parse response.body).to eq({})
      # end
      #
      #
      # it "returns the sort order for each coin", :vcr do
      #   get :index, params: { fsyms: "ETH,DOGE" }
      #   body = JSON.parse response.body
      #   expect(body["coins"]["ETH"]["SortOrder"]).to eq("2")
      #   expect(body["coins"]["DOGE"]["SortOrder"]).to eq("8")
      # end

    end
  end

  # describe "GET coin" do
  #   context "with a successful response" do
  #     it "returns the time field for the coin for each day", :vcr do
  #       get :coin, params: { fsym: "ETH", tsym: "USD", fdate: "2018-03-21", tdate: "2018-03-23"}
  #       body = JSON.parse response.body
  #       expect(body["tsym"]["0"]["time"]).to eq(1521590400)
  #       expect(body["tsym"]["1"]["time"]).to eq(1521676800)
  #       expect(body["tsym"]["2"]["time"]).to eq(1521763200)
  #     end
  #
  #   end
  # end

end
