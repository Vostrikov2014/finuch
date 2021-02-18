require 'rails_helper'

RSpec.describe WalletsController, type: :controller do
  describe 'GET #index' do
    let(:currency) { create(:currency) }
    let(:wallets) { create(:wallet, currency: currency) }
    before { get :index }

    it 'populates an array of all currencies' do
      expect(assigns(:wallets)).to match_array(wallets)
    end

    it 'render index view' do
      expect(response).to render_template :index
    end
  end
end
