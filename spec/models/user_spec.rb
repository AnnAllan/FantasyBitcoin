require 'rails_helper'
describe User do
  let(:user){ build(:user)}
  it "is valid with default attributes" do
    expect(user).to be_valid
  end

  it "saves with default attributes" do
    expect{user.save!}.to_not raise_error
  end

  it "is not vaild with missing email" do
    user.email = nil
    expect(user.valid?).to eq(false)
  end

  context "when saving multimple users" do
    before do
      user.save!
    end
    it "doesn't allow identical email addresses" do
      new_user = build(:user, email: user.email)
      expect(new_user.valid?).to eq(false)
    end
  end

  it "is not valid with missing password" do
    user.password = nil
    expect(user.valid?).to eq(false)
  end

  it "is not valid with a password fewer than 6 characters" do
    user.password = "passw"
    expect(user.valid?).to eq(false)
  end

  it "is not valid with a password more than 16 characters" do
    user.password = "passwordpassword16"
    expect(user.valid?).to eq(false)
  end
end
