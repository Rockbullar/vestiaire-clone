Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :items, only: [:index, :show, :destroy, :create]

  resources :users do
    resources :items, only: [:edit, :update, :new, :create]
    resources :carts, only: [:create]
    get '/carts/history', to: 'carts#history'
    get '/cart', to: 'carts#active'
  end

  post '/carts/:id/checkout', to: 'carts#checkout', as: 'checkout_cart' # change cart status to purchased, create new cart, update user's cart to new cart
  post '/cart_item/:id', to: 'cart_item#create', as: 'create_cart_item' # no redirect, just flash a message
  delete '/cart_item/:id', to: 'cart_item#destroy', as: 'destroy_cart_item' # redirect back to cart show



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
