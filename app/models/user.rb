class User
  include Mongoid::Document
  has_one :portfolio
  has_many :transactions

  field :email, type: String
  field :password, type: String
end
