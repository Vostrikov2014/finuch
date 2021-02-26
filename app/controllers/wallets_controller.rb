class WalletsController < ApplicationController
  # gem Decent exposure, so no index, show, new.  https://github.com/hashrocket/decent_exposure
  #expose :wallets, ->{ Wallet.all }
  #expose :wallet

  before_action :load_wallet, only: [:show, :edit, :update, :destroy]

  def index
    @wallets = Wallet.all
  end

  def show
  end

  def new
    @wallet = Wallet.new
  end

  def edit
  end

  def create
    @wallet = Wallet.new(wallet_params)

    if @wallet.save
      redirect_to @wallet
    else
      render :new
    end
  end

  #def create
  #  if wallet.save
  #    redirect_to wallet_path(wallet), notice: 'Your currency successfully created.'
  #  else
  #    render :new
  # end
  #end

  def update
    if @wallet.update(wallet_params)
      redirect_to @wallet
    else
      render :edit
    end
  end

  def destroy
    @wallet.destroy
    redirect_to wallets_path
  end

  private

  def load_wallet
    @wallet = Wallet.find(params[:id])
  end

  def wallet_params
    params.require(:wallet).permit(:name, :currency_id)
  end
end
