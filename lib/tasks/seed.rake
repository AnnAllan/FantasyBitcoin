task :seed => :environment do
# require model files
  require 'C:/Sites/FantasyCoin/FantasyBitCoin/app/models/news_post.rb'
  require 'C:/Sites/FantasyCoin/FantasyBitCoin/app/models/portfolio.rb'
  require 'C:/Sites/FantasyCoin/FantasyBitCoin/app/models/stock.rb'
  require 'C:/Sites/FantasyCoin/FantasyBitCoin/app/models/transaction.rb'
  require 'C:/Sites/FantasyCoin/FantasyBitCoin/app/models/user.rb'

# first delete all existing records
  NewsPost.all.delete
  Portfolio.all.delete
  Stocks.all.delete
  Transaction.all.delete
  User.all.delete

# seed database
# 30 stocks
  names = ["Bitcoin", "Ethereum", "Litecoin", "bitcoin Cash", "Ripple", "Nucleus Vision", "Biance Coin", "Tronix", "Ethereum Classic", "EOS", "NEO", "NEM", "DigitalCash", "Monero", "Vechain", "Huobi Token", "ICON Project", "Nano", "Cardano", "IOS token", "Monaco", "ZCash", "Waves", "OmiseGo", "NuBits", "aelf", "Stellar", "IOTA", "Substratum Network", "QTUM"]

  syms = ["BTC", "ETH", "LTC", "BCH", "XRP", "NCASH", "BNB", "TRX", "ETC", "EOS", "NEO", "XEM", "DASH", "XMR", "VEN", "HT", "ICX", "XRB", "ADA", "IOST", "MCO", "ZEC", "WAVES", "OMG", "NBT", "ELF", "XLM", "IOT", "SUB", "QTUM" ]
  x = 0
  30.times do
    Coin.create(name: coins[x],
                sym: syms[x],
                logo: Faker::Avatar.image("my-own-slug", "50x50") )
    x += 1
  end

# 3 News Articles
  3.times do
    NewsPost.create(newsPostURL: Faker::Internet.url)
  end

# 10 Portfolios
  x = 0
  10.times do
    Portfolio.create(cash: Faker::Number.decimal(2),
                     profit: Faker::Number.decimal(1, 5),
                     userID: x)
    x += 1
  end

# 100 Transactions
  100.times do
    Transaction.create(userID: Faker::Number.between(0, 9),
                       symFrom: syms[Faker::Number.between(0, 29)],
                       symTo: syms[Faker::Number.between(0, 29)],
                       price: Faker::Number.decimal(2, 5),
                       quantity: Faker::Number.digit,
                       transBuy: Faker::Boolean.boolean,
                       date: Faker::Date.backward(60))
  end

# 10 Users
  x = 0
  10.times do
    User.create(email: "user#{x}@example.com",
                password: "#{x}idNum",
                portID: x)
  x += 1
  end
end
