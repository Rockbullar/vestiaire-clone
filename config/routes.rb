Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :items, only: [:index, :show, :delete, :create]

  resources :users do
    resources :items, only: [:edit, :update, :new]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
