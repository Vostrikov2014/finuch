class RatesController < ApplicationController

  before_action :load_rate, only: [:show, :edit, :update, :destroy]

  def index
    @rates = Rate.all
  end

  def show
  end

  def new
    @rate = Rate.new
  end

  def edit
  end

  def create
    @rate = Rate.new(rate_params)

    if @rate.save
      redirect_to @rate
    else
      render :new
    end
  end

  def update
    if @rate.update(rate_params)
      redirect_to @rate
    else
      render :edit
    end
  end

  def destroy
    @rate.destroy
    redirect_to rates_path
  end

  private

  def load_rate
    @rate = Rate.find(params[:id])
  end

  def rate_params
    params.require(:rate).permit(:period, :currency_id, :rate, :multiplicity)
  end
end
