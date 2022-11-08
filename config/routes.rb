Rails.application.routes.draw do
  # root to: "stations#index"
  root 'welcome#index'

  match '/about', to: "stations#about", via: :get
  match '/index', to: "stations#index", via: :get
  # match '/show', to: "stations#index", via: :get
  # match '/login', to: "stations#index", via: :get
  get 'sign_up',  to: 'users#new', via: :get
  post 'sign_up', to: 'users#create'
  get 'sign_in',   to: 'sessions#new'
  post 'sign_in',   to: 'sessions#create', as: 'log_in'
  delete '/signout',  to: 'sessions#destroy'
  # get 'password', to: 'passwords#edit', as: 'edit_password'
  # patch 'password', to: 'passwords#update'
  # get 'password/reset', to: 'password_resets#new'
  # post 'password/reset', to: 'password_resets#create'
  # get 'password/reset/edit', to: 'password_resets#edit'
  # patch 'password/reset/edit', to: 'password_resets#update'

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :sessions,   only: [:new, :create, :destroy]


end