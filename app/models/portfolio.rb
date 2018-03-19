class Portfolio
  include Mongoid::Document
  field :cashInvested, type: Float
  field :profit, type: Float
  belongs_to :user
end
