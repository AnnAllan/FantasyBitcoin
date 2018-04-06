FactoryGirl.define do
  factory :trade do
    user {FactoryGirl.build(:user)}
    user_id "1"
    date Date.new
    exchange "Coinbase"
    fsym "ETH"
    fquantity "1"
    tsym "USD"
    tquantity "1000"
  end
end
