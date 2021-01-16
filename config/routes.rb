Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'
  get '/bookings/:id/confirmation', to: 'bookings#confirmation', as: :confirmation
  resources :terraces do
    resources :reviews, only: [:new, :create]
    resources :bookings, only: [:show, :new, :create]
  end
  resources :bookings do
    resources :charges, only: [:new, :create]
  end

  mount StripeEvent::Engine, at: '/stripe-webhooks'
end
