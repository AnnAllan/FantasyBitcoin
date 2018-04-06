require 'rails_helper'

describe TradesController do
  describe 'trades' do
    let(:trade){FactoryGirl.create(:trade)}

    describe 'GET #index' do
      it "GET #index works as normal" do
        get :index
        expect(response).to be_success
      end
    end

    describe 'GET #show' do
      it "GET #show works as normal" do
        get :show
        expect(response).to be_success
      end
    end

    describe 'GET #edit' do
      it "GET #edit works as normal" do
        get :edit
        expect(response).to be_success
      end
    end

  end
end
