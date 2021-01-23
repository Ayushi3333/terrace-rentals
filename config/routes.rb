Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'
  get '/bookings/:id/confirmation', to: 'bookings#confirmation', as: :confirmation
  get 'bookings/:id/accepted', to: 'bookings#accepted', as: :accepted
  resources :terraces do
    resources :reviews, only: :create
    resources :bookings, only: [:show, :new, :create]
  end
  resources :bookings do
    resources :charges, only: [:new, :create]
  end

  mount StripeEvent::Engine, at: '/stripe-webhooks'
  resources :users, only: [:show, :edit, :update]
end
