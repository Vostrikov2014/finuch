class WalletsController < ApplicationController
  # gem Decent exposure, so no index, show, new.  https://github.com/hashrocket/decent_exposure
  expose :wallets, ->{ Wallet.all }
  expose :wallet
end
