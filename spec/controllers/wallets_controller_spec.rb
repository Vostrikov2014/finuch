require 'rails_helper'

RSpec.describe WalletsController, type: :controller do
  let(:currency) { create(:currency) }
  let(:wallet) { create(:wallet, currency: currency) }

  describe 'GET #index' do
    let(:wallets) { create_list(:wallet, 3, currency: currency) }
    before { get :index }

    it 'populates an array of all wallets' do
      expect(assigns(:wallets)).to match_array(wallets)
    end

    it 'render index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    before { get :show, params: { id: wallet } }

    it 'assigns the requested wallet to @wallet' do
      expect(assigns(:wallet)).to eq wallet
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'assigns a new Wallet to @wallet' do
      expect(assigns(:wallet)).to be_a_new(Wallet)
    end

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    before { get :edit, params: { id: wallet } }

    it 'assigns the requested question to @question' do
      expect(assigns(:wallet)).to eq wallet
    end

    it 'renders edit view' do
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context 'attributes valid' do
      it 'wallet saves in database' do
        expect { post :create, params: { wallet: attributes_for(:wallet), currency_id: currency } }.to change(Wallet, :count).by(1)
      end

      it 'redirects to show view' do
        post :create, params: { wallet: attributes_for(:wallet) }
        expect(response).to redirect_to assigns(:wallet)
      end
    end

    context 'attributes invalid' do
      it 'currency not saved' do
        expect { post :create, params: { wallet: attributes_for(:wallet, :invalid) } }.to_not change(Wallet, :count)
      end

      it 're-renders new view' do
        post :create, params: { wallet: attributes_for(:wallet, :invalid) }
        expect(response).to render_template :new
      end
    end
  end
end
