class CurrenciesController < ApplicationController
  # gem Decent exposure, so no index, show, new.  https://github.com/hashrocket/decent_exposure
  expose :currencies, ->{ Currency.all }
  expose :currency
end
