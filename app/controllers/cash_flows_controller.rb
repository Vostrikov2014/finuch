class CashFlowsController < ApplicationController
  # gem Decent exposure, so no index, show, new.  https://github.com/hashrocket/decent_exposure
  expose :cash_flows, ->{ CashFlow.all }
  expose :cash_flow

  def create
    if cash_flow.save
      redirect_to cash_flow_path(cash_flow), notice: 'Your cash flow successfully created.'
    else
      render :new
    end
  end

  private

  def cash_flow_params
    params.require(:cash_flow).permit(:transact_type, :wallet_id, :transact_at, :cash, :comment)
  end
end
