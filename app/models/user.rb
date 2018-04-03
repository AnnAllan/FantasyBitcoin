class User
  include Mongoid::Document
  has_one :portfolio
  has_many :transactions

  field :email, type: String
  field :password, type: String

  validates :email, presence: true
  validates :email, uniqueness: true

  validates :password, presence: true
  validates :password, length: {minimum: 6, maximum: 16}
end
