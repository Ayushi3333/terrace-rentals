Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :terraces do
    resources :reviews, only: [:new, :create]
    resources :bookings, only: [:show, :new, :create]
  end
  resources :bookings, only: [:index, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
