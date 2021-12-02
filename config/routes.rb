Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  # item routes
  resources :items
  get "/user_items", to: "items#userlistings", as: 'user_items' #search for user's own listings

  # cart routes
  resources :carts, only: [:create]
  get '/carts/history', to: 'carts#history'
  get '/cart', to: 'carts#active'
  post '/carts/:id/checkout', to: 'carts#checkout', as: 'checkout_cart' # change cart status to purchased, create new cart, update user's cart to new cart

  # cart_item routes
  delete '/cart_item/:id', to: 'cart_item#destroy', as: 'destroy_cart_item' # redirect back to cart show
  post '/cart_item', to: 'cart_item#create', as: 'create_cart_item' # no redirect, just flash a message
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
