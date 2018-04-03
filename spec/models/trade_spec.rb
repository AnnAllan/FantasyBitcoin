require 'rails_helper'
describe Trade do
  let(:trade){ FactoryGirl.build(:trade)}
  it "is valid with default attributes" do
    expect(trade).to be_valid
  end

  it "saves with default attributes" do
    expect{trade.save!}.to_not raise_error
  end

  it "is not vaild without user_id" do
    trade.user_id = nil
    expect(trade.valid?).to eq(false)
  end

  it "is not vaild without date" do
    trade.date = nil
    expect(trade.valid?).to eq(false)
  end

  it "is not vaild without exchange" do
    trade.exchange = nil
    expect(trade.valid?).to eq(false)
  end

  it "is not vaild without fsym" do
    trade.fsym = nil
    expect(trade.valid?).to eq(false)
  end

  it "is not vaild without fquantity" do
    trade.fquantity = nil
    expect(trade.valid?).to eq(false)
  end
  it "is not vaild with fquantity not an integer" do
    trade.fquantity = 1.5
    expect(trade.valid?).to eq(false)
  end


  it "is not vaild without tsym" do
    trade.tsym = nil
    expect(trade.valid?).to eq(false)
  end

  it "is not vaild without tquantity" do
    trade.tquantity = nil
    expect(trade.valid?).to eq(false)
  end
  it "is not vaild with tquantity not an integer" do
    trade.tquantity = 1.5
    expect(trade.valid?).to eq(false)
  end
end
