RestaurantsBa::Application.routes.draw do

  resources :restaurants

  get 'admin', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'

  namespace :admin do
    get 'dashboard', to: 'dashboard#index'
    get 'profile', to: 'dashboard#profile'
    get 'coupons', to: 'dashboard#coupons'
    resources :users
  end

  resources :users, only: [:new, :create]

  resources :users do
    member do
      get 'confirmation'
    end
  end

  resources :sessions
  root :to => "home#index"
end
