class CoinsController < ApplicationController
  def index
    syms = params["fsyms"]

    if syms
      # Static information on coins
      response1 = getApiResponse("https://min-api.cryptocompare.com/data/all/coinlist?fsyms=#{syms}")

      # Dynamic information on coins
      response2 = getApiResponse("https://min-api.cryptocompare.com/data/pricemultifull?fsyms=#{syms}&tsyms=BTC,USD")

      api_data1 = JSON.parse response1.read_body
      api_data2 = JSON.parse response2.read_body

      sym_array = syms.split(',')

      client_response = { response1: JSON.parse(response1.read_body), response2: JSON.parse(response2.read_body) }

      client_response = {}
      client_response["coins"] = {}

      sym_array.each do |sym|
        client_response["coins"][sym] = {}
        client_response["coins"][sym]["USD"] = {}
        client_response["coins"][sym]["BTC"] = {}

        client_response["coins"][sym]["SortOrder"] = api_data1["Data"][sym]["SortOrder"]
        client_response["coins"][sym]["Symbol"] = api_data1["Data"][sym]["Symbol"]
        client_response["coins"][sym]["CoinName"] = api_data1["Data"][sym]["CoinName"]
        client_response["coins"][sym]["ImageUrl"] = api_data1["Data"][sym]["ImageUrl"]

        client_response["coins"][sym]["USD"]["marketCap"] = api_data2["RAW"][sym]["USD"]["MKTCAP"]
        client_response["coins"][sym]["BTC"]["marketCap"] = api_data2["RAW"][sym]["BTC"]["MKTCAP"]
        client_response["coins"][sym]["USD"]["supply"] = api_data2["RAW"][sym]["USD"]["SUPPLY"]
        client_response["coins"][sym]["BTC"]["supply"] = api_data2["RAW"][sym]["BTC"]["SUPPLY"]
        client_response["coins"][sym]["USD"]["24HrVolume"] = api_data2["RAW"][sym]["USD"]["TOTALVOLUME24HTO"]
        client_response["coins"][sym]["BTC"]["24HrVolume"] = api_data2["RAW"][sym]["BTC"]["TOTALVOLUME24HTO"]
        client_response["coins"][sym]["USD"]["24HrPctPrice"] = api_data2["RAW"][sym]["USD"]["CHANGEPCT24HOUR"]
        client_response["coins"][sym]["BTC"]["24HrPctPrice"] = api_data2["RAW"][sym]["BTC"]["CHANGEPCT24HOUR"]
        client_response["coins"][sym]["USD"]["price"] = api_data2["RAW"][sym]["USD"]["PRICE"]
        client_response["coins"][sym]["BTC"]["price"] = api_data2["RAW"][sym]["BTC"]["PRICE"]
      end
    end
    json_response(client_response || {})
  end

  def exchanges
    fsym = params["fsym"]
    tsym = params["tsym"]
    limit = params["limit"]

    response = getApiResponse("https://min-api.cryptocompare.com/data/top/exchanges/full?fsym=#{fsym}&tsym=#{tsym}")
    api_data = JSON.parse response.read_body

    client_response = {}
    client_response["aggregated"] = {}
    client_response["aggregated"]["exchange"] = "aggregated"
    client_response["aggregated"]["lastUpdated"] = api_data["Data"]["AggregatedData"]["LASTUPDATE"]
    client_response["aggregated"]["closing"] = api_data["Data"]["AggregatedData"]["PRICE"]
    client_response["aggregated"]["high"] = api_data["Data"]["AggregatedData"]["HIGH24HOUR"]
    client_response["aggregated"]["low"] = api_data["Data"]["AggregatedData"]["LOW24HOUR"]
    client_response["aggregated"]["open"] = api_data["Data"]["AggregatedData"]["OPEN24HOUR"]
    client_response["aggregated"]["volumefrom"] = api_data["Data"]["AggregatedData"]["VOLUME24HOURTO"]

    client_response["exchanges"] = {}
    api_data["Data"]["Exchanges"].each_index do |index|
      client_response["exchanges"][index] = {}
      client_response["exchanges"][index]["exchange"] = api_data["Data"]["Exchanges"][index]["MARKET"]
      client_response["exchanges"][index]["lastUpdated"] = api_data["Data"]["Exchanges"][index]["LASTUPDATE"]
      client_response["exchanges"][index]["closing"] = api_data["Data"]["Exchanges"][index]["PRICE"]
      client_response["exchanges"][index]["high"] = api_data["Data"]["Exchanges"][index]["HIGH24HOUR"]
      client_response["exchanges"][index]["low"] = api_data["Data"]["Exchanges"][index]["LOW24HOUR"]
      client_response["exchanges"][index]["open"] = api_data["Data"]["Exchanges"][index]["OPEN24HOUR"]
      client_response["exchanges"][index]["volumefrom"] = api_data["Data"]["Exchanges"][index]["VOLUME24HOURTO"]
    end
     json_response(client_response || {})
  end

  def coin_pair_detail
    fsym = params["fsym"]
    tsym = params["tsym"]
    fdate_string = params["fdate"]
    tdate_string = params["tdate"]
    market = params["market"]

    fdate = fdate_string.to_date
    tdate = tdate_string.to_date
    limit = calcLimit(fdate)
    time_arr = calcTime(fdate, tdate)

    response = getApiResponse("https://min-api.cryptocompare.com/data/histoday?fsym=#{fsym}&tsym=#{tsym}&limit=#{limit}&e=#{market}")
    api_data = JSON.parse response.read_body

    client_response = {}
    client_response["tsym"] = {}
    time_arr.each do |time|
      client_response["tsym"][time] = {}
      client_response["tsym"][time]["close"] = api_data["Data"][time]["close"]
      client_response["tsym"][time]["time"] = api_data["Data"][time]["time"]
      client_response["tsym"][time]["high"] = api_data["Data"][time]["high"]
      client_response["tsym"][time]["low"] = api_data["Data"][time]["low"]
      client_response["tsym"][time]["open"] = api_data["Data"][time]["open"]
      client_response["tsym"][time]["volumefrom"] = api_data["Data"][time]["volumefrom"]
      client_response["tsym"][time]["volumeto"] = api_data["Data"][time]["volumeto"]
    end
    json_response(client_response || {})
  end


  private

  def getApiResponse(apiUrl)
    url = URI.parse(apiUrl)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(url.to_s)
    response = http.request(request)
  end

  def calcLimit(fdate)
    today = Time.now.gmtime.to_date
    return (today - fdate).to_i
  end

  def calcTime(fdate, tdate)
    arr = []
    timeLength = (tdate - fdate).to_i
    x = 0
    until x > timeLength do
      arr << x
      x +=1
    end
    return arr
  end

end
