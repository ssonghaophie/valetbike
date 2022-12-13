Rails.application.routes.draw do
  # root to: "stations#index"
  root 'welcome#index'
  get 'GeoJSON', to: 'stations#GeoJSON'
  get 'checkout/:id', to: 'checkouts#show', as: 'checkout'
  post 'create-checkout-session', to: 'checkouts#create'
  get 'cancel.html.erb', to: 'checkouts#cancel'
  get 'success.html.erb', to: 'checkouts#success'

  get 'success.html.erb', to: 'membership#success'

  get 'membership', to: 'membership#show'
  #user profile
  get 'membership', to: 'users#membership'
  get 'mytrip', to: 'users#trips'
  get 'billing', to: 'users#billing'
  post 'billing_portal_create', to: 'billing_portal#create'
  resources :customer_portal_sessions, only: [:create]

  get 'template', to:'users#template'
  get 'checkout', to: 'checkouts#show'
  #successfully purchase the product
  #get 'checkout/success', to: 'checkouts#success' 
  # match '/billing', to:'billing#show'
  
  
  # post 'billing_portal/create', to: 'billing_portal#create', as: 'billing_portal_create'

  resources :billing_portal, only: [:create]

  match '/about', to: "welcome#about", via: :get
  match '/index', to: "welcome#index", via: :get
  match '/service', to: "welcome#service", via: :get
  match '/stations/:identifier', to: "stations#show", via: :get, as: 'station'
  get 'sign_up',  to: 'users#new', via: :get
  post 'sign_up', to: 'users#create'
  get 'sign_in',   to: 'sessions#new'
  post 'sign_in',   to: 'sessions#create', as: 'log_in'
  get 'logout',  to: 'sessions#destroy'
  match '/trips/:id',  to: 'trips#show', as: 'trip' , via: :get
  post 'trips', to: 'trips#create'
  get 'trips/:id/edit', to: 'trips#edit', as: 'edit_trip' 
  patch 'trips/:id', to: 'trips#update' 

  
  # authenticate :user, lambda { |u| u.admin? } do
  #   mount Sidekiq::Web => '/sidekiq'
  # end

  get 'stations', to: 'stations#index'


  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :trips do
    member do
      get :following, :followers
    end
  end
  # resources :trips 
  resources :sessions,   only: [:new, :create, :destroy]
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]

end