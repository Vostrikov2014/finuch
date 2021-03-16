require 'rails_helper'

RSpec.describe CashFlowsController, type: :controller do

  describe 'POST #create' do
    context 'attributes valid' do
      it 'Cash flow saves in database' do
        expect { post :create, params: { cash_flow: attributes_for(:cash_flow) } }.to change(CashFlow, :count).by(1)
      end

      it 'redirects to show view' do
        post :create, params: { cash_flow: attributes_for(:cash_flow) }
        expect(response).to redirect_to assigns(:cash_flow)
      end
    end

    context 'attributes invalid' do
      it 'Cash flow not saved' do
        expect { post :create, params: { cash_flow: attributes_for(:cash_flow, :invalid) } }.to_not change(CashFlow, :count)
      end

      it 're-renders new view' do
        post :create, params: { cash_flow: attributes_for(:cash_flow, :invalid) }
        expect(response).to render_template :new
      end
    end
  end

end
