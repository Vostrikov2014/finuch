require 'rails_helper'

RSpec.describe CurrenciesController, type: :controller do
  let(:currency) { create(:currency) }

  describe 'GET #index' do
    let(:currencies) { create_list(:currency, 3) }
    before { get :index }

    it 'populates an array of all currencies' do
      expect(assigns(:currencies)).to match_array(currencies)
    end

    it 'render index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    before { get :show, params: { id: currency } }

    it 'assigns the requested currency to @currency' do
      expect(assigns(:currency)).to eq currency
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'assigns a new Currency to @currency' do
      expect(assigns(:currency)).to be_a_new(Currency)
    end

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    before { get :edit, params: { id: currency } }

    it 'assigns the requested question to @question' do
      expect(assigns(:currency)).to eq currency
    end

    it 'renders edit view' do
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    subject { post :create, params: { currency: attributes_for(:currency) } }

    context 'attributes valid' do
      it 'currency saves in database' do
        expect{subject}.to change(Currency, :count).by(1)
      end
      it 'redirects to show view' do
        expect(subject).to redirect_to assigns(:currency)
      end
    end

    context 'attributes invalid' do
      it 'currency not saved' do
        expect { post :create, params: { currency: attributes_for(:currency, :invalid) } }.to_not change(Currency, :count)
      end
      it 're-renders new view' do
        post :create, params: { currency: attributes_for(:currency, :invalid) }
        expect(response).to render_template :new
      end
    end
  end
end
