Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  resources :orders
  resources :products
  resource :cart, only: [:show]
  resources :cart_items, only: [:create, :update, :destroy]

  get "up" => "rails/health#show", as: :rails_health_check
  post 'products/add_to_cart/:id', to: 'products#add_to_cart', as: 'add_to_cart'
  root 'home#index'
end
