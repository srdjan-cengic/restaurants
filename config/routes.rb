RestaurantsBa::Application.routes.draw do

  get 'admin', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'

  namespace :admin do
    get 'dashboard', to: 'dashboard#index'
    get 'profile', to: 'dashboard#profile'
    resources :restaurants
    resources :coupones
    resources :users
  end

  resources :users, only: [:new, :create]


  resources :coupones

  resources :users do
    member do
      get 'confirmation'
    end
  end

  resources :sessions
  root :to => "application#index"

  namespace :api do
    resources :users, except: [:new, :edit], defaults: {format:'json'}
    resources :restaurants, only: :index, defaults: {format:'json'} do
     collection do
        get 'search', 'restaurant_with_owner'
      end
    end
    resources :coupones, defaults:{format: 'json'}
    resources :sessions, only: [:create, :destroy], defaults: {format: 'json'}
    resources :votes, defaults: {format: 'json'}

  end

end
