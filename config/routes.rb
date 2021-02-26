Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'cash_flows#index'
  resources :currencies
  resources :wallets
  resources :cash_flows
end
