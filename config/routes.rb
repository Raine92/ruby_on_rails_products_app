Rails.application.routes.draw do
  # Touched: 2025-11-13 - ensure routes file shows activity in git
  resource :session
  resources :passwords, param: :token
  # ...
  root "products#index"
  resources :products
end
