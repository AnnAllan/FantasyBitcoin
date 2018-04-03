class Transaction
  include Mongoid::Document
  belongs_to :user

  field :price, type: Float
  field :symFrom, type: String
  field :symTo, type: String
  field :quantity, type: Integer
  field :date, type: Date
end
