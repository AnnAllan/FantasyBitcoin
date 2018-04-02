class Trade
  include Mongoid::Document
  belongs_to :user

  field :user_id, type: Integer
  field :date, type: Date
  field :exchange, type: String
  field :fsym, type: String
  field :fquantity, type: Integer
  field :tsym, type: String
  field :tquantity, type: Integer

  validates :user_id, presence: true

  validates :date, presence: true

  validates :exchange, presence: true

  validates :fsym, presence: true

  validates :fquantity, presence: true
  validates :fquantity, numericality: {only_integer: true}

  validates :tsym, presence: true

  validates :tquantity, presence: true
  validates :tquantity, numericality: {only_integer: true}





end
