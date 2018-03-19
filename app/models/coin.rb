class Coin
  include Mongoid::Document
  field :symbol, type: String
  field :name, type: String
  field :logoURL, type: String
  field :sortOrder, type: Integer
end
