RestaurantsBa::Application.routes.draw do

  namespace :admin do
    get 'dashboard', to: 'dashboard#index'
    get 'profile', to: 'dashboard#profile'
    resources :restaurants
    resources :coupones
    resources :users

    get '/', to: 'sessions#new'
    get 'logout', to: 'sessions#destroy'
    resources :sessions
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
    resources :restaurants, defaults: {format:'json'} do
      collection do
        get 'search', 'restaurant_with_owner'
      end
      member do
        get 'by_owner_id'
        get 'restaurant_with_owner'
      end

    end
    resources :coupones, defaults:{format: 'json'} do 
      collection do
        get 'search', 'find_by_restaurant'
      end
    end
    resources :sessions, only: [:create, :destroy], defaults: {format: 'json'}
    resources :votes, defaults: {format: 'json'} do
      member do
        get 'numberOfVotes'
      end
    end# api/votes(POST)

  end

end
