class CashFlowsController < ApplicationController
  # gem Decent exposure, so no index, show, new.  https://github.com/hashrocket/decent_exposure
  #expose :cash_flows, ->{ CashFlow.all }
  #expose :cash_flow

  before_action :authenticate_user!
  before_action :load_cash_flow, only: [:show, :edit, :update, :destroy]

  def index
    @cash_flows = CashFlow.all
  end

  def show
  end

  def new
    @cash_flow = CashFlow.new
  end

  def edit
  end

  def create
    @cash_flow = CashFlow.new(cash_flow_params)

    if @cash_flow.save
      redirect_to @cash_flow
    else
      render :new
    end
  end

  #def create
  #  if cash_flow.save
  #    redirect_to cash_flow_path(cash_flow), notice: 'Your cash flow successfully created.'
  #  else
  #    render :new
  #  end
  #end

  def update
    if @cash_flow.update(cash_flow_params)
      redirect_to @cash_flow
    else
      render :edit
    end
  end

  def destroy
    @cash_flow.destroy
    redirect_to cash_flows_path
  end

  private

  def load_cash_flow
    @cash_flow = CashFlow.find(params[:id])
  end

  def cash_flow_params
    params.require(:cash_flow).permit(:transact_type, :wallet_id, :transact_at, :cash, :comment)
  end
end
