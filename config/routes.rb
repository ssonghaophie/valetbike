Rails.application.routes.draw do
  root to: "stations#index"

  match '/about', to: "stations#about", via: :get
  match '/index', to: "stations#index", via: :get
  # match '/show', to: "stations#index", via: :get
  # match '/login', to: "stations#index", via: :get
  match '/signup',  to: 'users#new', via: :get
  match '/signin',  to: 'sessions#new', via: :post
  match '/signout', to: 'sessions#destroy', via: :delete

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :sessions,   only: [:new, :create, :destroy]


end