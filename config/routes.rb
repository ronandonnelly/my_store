Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  resources :orders
  resources :products
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  post 'products/add_to_cart/:id', to: 'products#add_to_cart', as: 'add_to_cart'
  root 'home#index'
  get 'cart', to: 'cart#show', as: 'cart'
  # Defines the root path route ("/")
  # root "posts#index"
end
