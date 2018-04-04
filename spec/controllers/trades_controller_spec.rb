require 'rails_helper'

describe TradesController do
  describe 'trades' do
    let(:trade){create(:trade)}

    describe 'GET #show' do
      it "GET #show works as normal" do
        get trade_path(trade)
        expect(response).to be_success
      end
    end
  end
end
