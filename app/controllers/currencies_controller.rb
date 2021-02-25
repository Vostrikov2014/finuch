class CurrenciesController < ApplicationController
  # gem Decent exposure, so no index, show, new.  https://github.com/hashrocket/decent_exposure
  #expose :currencies, ->{ Currency.all }
  #expose :currency

  before_action :load_currency, only: [:show, :edit, :update, :destroy]

  def index
    @currencies = Currency.all
  end

  def show
  end

  def new
    @currency = Currency.new
  end

  def edit
  end

  def create
    @currency = Currency.new(currency_params)

    if @currency.save
      redirect_to @currency
    else
      render :new
    end
  end

  #gem Decent exposure
  #def create
  #  if currency.save
  #    redirect_to currency_path(currency), notice: 'Your currency successfully created.'
  #  else
  #    render :new
  #  end
  #end

  def update
    if @currency.update(currency_params)
      redirect_to @currency
    else
      render :edit
    end
  end

  def destroy
    @currency.destroy
    redirect_to currencies_path
  end

  private

  def load_currency
    @currency = Currency.find(params[:id])
  end

  def currency_params
    params.require(:currency).permit(:name, :rate, :multiplicity)
  end
end
